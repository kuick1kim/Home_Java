eng = c(90,80,60,70)
eng

math = c(50,60,100,20)
math

df_midterm = data.frame(eng,math)
df_midterm

class = c(1,1,2,2)

df_midterm = data.frame(eng,math, class)
df_midterm

수학평균
mean(df_midterm$math)
mean(df_midterm$eng)
mean(df_midterm$class)
#필드를 처리할때는 달러








df = data.frame(  eng = c(90,80,60,70),
  math = c(50,60,100,20),
  class = c(1,1,2,2))
dfㅑㅜ



install.packages("readxl")
library(readxl)


df_exam = read_excel("ee.xlsx")
df_exam


mean(df_exam$math)
mean(df_exam$english)
mean(df_exam$science:english)

df_e=read_excel("notitle.xlsx", col_names = F)
df_e

#한방에 만들기기/

#3 번째 시트를 사용할 경우
df_e=read_excel("notitle.xlsx", sheet = 3)
df_e

df_csv = read.csv("exl.csv")
df_csv
#R 파일로 저장하기
saveRDS(df_csv, file='df_csv2.rds')

읽어오기
df_rere = readRDS('df_csv2.rds')
tail(df_rere,5)
dim(df_rere)
summary(df_rere)

View(df_rere)
str(df_rere)
