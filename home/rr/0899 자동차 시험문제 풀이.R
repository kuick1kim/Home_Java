

audi = read.csv("D:/kjw_data/01_R/data/audi.csv")
bmw  = read.csv("D:/kjw_data/01_R/data/bmw.csv")
ford  = read.csv("D:/kjw_data/01_R/data/ford.csv")
hyundi  = read.csv("D:/kjw_data/01_R/data/hyundi.csv")
merc  = read.csv("D:/kjw_data/01_R/data/merc.csv")
skoda  = read.csv("D:/kjw_data/01_R/data/skoda.csv")
toyota  = read.csv("D:/kjw_data/01_R/data/toyota.csv")



a = rbind(audi,bmw)


b = rbind(ford,hyundi)


c = rbind(merc,skoda)




d = rbind(c,skoda)

e= rbind(a,b)

f= rbind(c,toyota)

g = rbind(e,f)

table = g

library(dplyr)
library(ggplot2)


qplot(table$year)
a = summary(table$year)
a

View(table)


이상치 찾아보기

outlier <- data.frame(table$year)
outlier
table(outlier)

table$year <- ifelse(table$year == 2060, NA, table$year)

table$year <- ifelse(table$year == 2060, NA, table$year)

이상치 제거
table(table$year)
boxplot(table$year)

table(is.na(table))

car= table

# 테이블을 카로바꿈꿈
# 테이블과 테이블 명령어가 헷갈리기에 
car <-  car %>% filter(complete.cases(car))


table(is.na(car))
View(car)

# 카에서 결측치를 테이블로 알아봄봄
# 박스플롯으로 전체를 보니 이상치가 생겨서 

# 이상치를 na 제거하고, 
# 전체행을 지워버림

car2 <- data.frame(car$year)
table(car2)

# 잠깐 이름으로 바꿔줌줌

2010년까지 모두 지워줌

car$year <- ifelse(car$year == 1970, NA, car$year)
table(car$year)

car$year <- ifelse(car$year == 1996, NA, car$year)
car$year <- ifelse(car$year == 1997, NA, car$year)
car$year <- ifelse(car$year == 1998, NA, car$year)
car$year <- ifelse(car$year == 1999, NA, car$year)
car$year <- ifelse(car$year == 2000, NA, car$year)
table(car$year)

# 결측치를 한번 알아봄
table(is.na(car$year))

# 결측행을 제거해 버림
car <-  car %>% filter(complete.cases(car))

# 결측치를 한번 알아봄
table(is.na(car$year))

boxplot(car$year)
# 그림이 잘 그려졌는지 확인해봄

# 2005년까지 데이터를 지워버림림
car$year <- ifelse(car$year == 2001, NA, car$year)
car$year <- ifelse(car$year == 2002, NA, car$year)
car$year <- ifelse(car$year == 2003, NA, car$year)
car$year <- ifelse(car$year == 2004, NA, car$year)
car$year <- ifelse(car$year == 2005, NA, car$year)

table(is.na(car$year))
car <-  car %>% filter(complete.cases(car))
table(is.na(car$year))
# 
# 70208개로 데이터를 그려보려고함
boxplot(car$year)


View(car)




