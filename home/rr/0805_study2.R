df= data.frame(sex=c("M", "F", NAㄴㅇㄻㄴㅇㄹ, "M", "F")
               , score=c(5,4,3,4, ))
df

#결측치 확인
is.na(df)

table(is.na(df))



table(is.na(df$sex)) #성별 결측치치

is.na(df$sex) #성별 결측치치

mean(df$score) # 평균산출 - 산출안됨

sum(df$score)# 합계산출 -산출 안됨


# 결측치 행을 제거해 버림


df %>% 
  filter(is.na(score))

df_n = df %>% filter(!is.na(score))
df_n
mean(df_n$score)
sum(df_n$score)

#한꺼번에 처리
df_n = df %>% filter (!is.na(score) & !is.na(sex))
df_n



library(ggplot2)
library(hrbrthemes)


ggplot(data=mpg, aes(x=displ, y=hwy),alpha=33) + geom_point(size=3, color="#6933a2")

ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point()+ xlim(0,7.5)+ ylim(12,40)


ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point()+ xlim(0,7.5)+ ylim(12,40)





library(ggplot2)
library(hrbrthemes)
library(dplyr)


df_mpg = mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))

df_mpg

ggplot(data=df_mpg, aes(x=drv, y=mean_hwy))+ geom_col()

# 내림차순 정열
ggplot(data=df_mpg, aes(x=reorder(drv,-mean_hwy), y=mean_hwy))+ geom_col()



#빈도 막대 그래프 : 값수 빈도로 길이표현

ggplot(data=mpg, aes(x=hwy)) +geom_bar()

ggplot(data=mpg, aes(x=drv)) +geom_bar()
ggplot(data=mpg, aes(x=cty)) +geom_bar()


ggplot(data=economics, aes(x= date,y= unemploy)) +geom_line()

economics


mpg$drv
mpg

# 선그래프 시간에 따른 데이터 변환

# Transparency
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, alpha=Species)) + 
  geom_point(size=6, color="#69b3a2") +
  theme_ipsum()

# Shape
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, shape=Species)) + 
  geom_point(size=6) +
  theme_ipsum()

# Size
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, shape=Species)) + 
  geom_point(size=6) +
  theme_ipsum()