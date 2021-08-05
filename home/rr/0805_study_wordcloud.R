
install.packages("remotes")

#KoNLP 는 현재 cran에서 지워져 이렇게 설치를 해야함.

remotes::install_github('haven-jeon/KoNLP',upgrade = "never", INSTALL_opts=c("--no-multiarch"))

library(KoNLP)
txt = "문장에 대한 이해가 필요하다"
extractNoun(txt)


txt = readLines("rom.txt")
head(txt)

#install.packages("stringr")
library(stringr)

# 특수문자만 제거하는 것
txt = str_replace_all(txt, "\\W", " ")
head(txt)
tail(txt, 10)
#명사리스트를 문자열 벡터로 변환환
library(KoNLP)
nouns= extractNoun(txt)
nouns
# 단어별 빈도표 생성
wordcount= table(unlist((nouns)))

# 데이터 프레임으로 변환

df_word = as.data.frame(wordcount, stringsAsFactors = F)
df_word
library(dplyr)
# 변수명 수정
df_word = rename(df_word,
                 word=Var1,
                 freq = Freq)

# 두글자 이상 단어 추출
df_word = filter(df_word, nchar(word)>=2)
df_word

top20 = df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)


top20
# 워드 클라우드 패키지 설치및 로드
#install.packages("wordcloud")
#library(wordcloud)
#library(RColorBrewer)
# 색상지정

pal = brewer.pal(8,"RdBu")
# 워드 클라우드 만들기

set.seed(13)
wordcloud(words = df_word$word, #단어
          freq = df_word$freq, #빈도
          min.freq = 2,       #최소단어빈도
          max.words = 200,    #표현 단어수
          random.order = F,   # 고빈도 단어 중앙에 
          rot.per = .5,       #회전단어 비율  
          scale = c(7, 0.5),
          colors = pal)
