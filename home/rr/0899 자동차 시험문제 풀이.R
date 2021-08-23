

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


# 이상치 찾아보기

이상치 <- data.frame(table$year)
table(이상치)

# 이상치를 제거하기기
table$year <- ifelse(table$year == 2060, NA, table$year)

table$year <- ifelse(table$year == 2060, NA, table$year)

# 이상치 제거
table(table$year)

boxplot(table$year)

# 테이블이라는 당어를 사용하다보니 테이블이라는 명령어가 겹쳐서
# car 라는 명령어를 쓰기로 마음먹음
car= table

# 박스플롯을 해보니 2010년 이하 데이터는 모두 이상치로 생각합
# 2005년 까지 지우기로 마음먹음
car$year <- ifelse(car$year == 1970, NA, car$year)
car$year <- ifelse(car$year == 1996, NA, car$year)
car$year <- ifelse(car$year == 1997, NA, car$year)
car$year <- ifelse(car$year == 1998, NA, car$year)
car$year <- ifelse(car$year == 1999, NA, car$year)
car$year <- ifelse(car$year == 2000, NA, car$year)
car$year <- ifelse(car$year == 2001, NA, car$year)
car$year <- ifelse(car$year == 2002, NA, car$year)
car$year <- ifelse(car$year == 2003, NA, car$year)
car$year <- ifelse(car$year == 2004, NA, car$year)
car$year <- ifelse(car$year == 2005, NA, car$year)
# 박스플롯을 해봄봄
boxplot(car$year)
# 빈도를 알아봄봄
qplot(car$year)
#결측치가 있는지 알아봄봄
table(is.na(car))
# 결측치가 있는 행을 완전히 제거해 버림림

car <-  car %>% filter(complete.cases(car))
table(is.na(car))

# 다시한번 데이터 프레임을 검색해봄

이상치 <- data.frame(car$year)
table(이상치)


전체데이터에서 어떤회사가 있는지 빈도를 봄
회사 <- data.frame(car$com)
table(회사)
qplot(car$com)
# 포드가 제일 많음 빈도수로는 



모델 <- data.frame(car$model)
table(모델)

boxplot(car$price)
qplot(car$price)



트랜스 <- data.frame(car$transmission)
table(트랜스)
qplot(car$transmission)
# other는 지워버리기로함 나와있지도 않기에에
car$transmission <- ifelse(car$transmission == "Other", NA, car$transmission)
table(is.na(car$transmission))
# 결측치가 있는 행을 완전히 제거해 버림림
car <-  car %>% filter(complete.cases(car$transmission))
# other라는 이상치는 지워버림 6개는 지워버려도 관계없음음


qplot(car$mileage)
boxplot(car$mileage)
summary(car$mileage)
# 사분위 값을 한번 찍어봄봄


# 연료 fuelType에는 뭐가 있는지 알아봄봄
연료 <- data.frame(car$fuelType)
table(연료)
빈도를 알아봄
qplot(car$fuelType)
# 그림을 그리고보니 Oter와 electric이 너무 작아서 지워버리기로함함
car$fuelType <- ifelse(car$fuelType == "Other", NA, car$fuelType)
car$fuelType <- ifelse(car$fuelType == "Electric", NA, car$fuelType)

결측치로 변경됨
그것을 지워버림
car <-  car %>% filter(complete.cases(car$fuelType))
qplot(car$fuelType)

table(is.na(car))
갯수을 알아봄

summary(car$tax)
택스평균을 알아봄
boxplot(car$tax)
이상치 빈도가 많음 이것은 건드리지 않기로함


마력수를 알아봄
summary(car$mpg)
boxplot(car$mpg)
이상치가 맘에 안들어서 100마력 이상은 모두 지워버리기로 마음먹음

car$mpg <- ifelse(car$mpg >= 100, NA, car$mpg)
table(is.na(car$mpg))
 # 426개는 지워버림림


car$mpg <- ifelse(car$mpg <= 12, NA, car$mpg)

table(is.na(car$mpg))
# 12마력이하도 지워버림림
# 결측치로 변경됨
# 그것을 지워버림
car <-  car %>% filter(complete.cases(car$mpg))

table(is.na(car$mpg))

# 테이블에 69579 개가남음

엔진사이즈를 봄

summary(car$engineSize)



# View(car)
boxplot(car$engineSize)


나머지는 건드리 않기로 함

전체 테이블을 한번 봄
# View(car)
# 카에서 결측치를 테이블로 알아봄봄
# 박스플롯으로 전체를 보니 이상치가 생겨서 

library(dplyr)

colMeans(filter(.data=car, year < 2016 & year <2017)[,c("price","tax","mpg","engineSize")])

colMeans(filter(.data=car, year > 2018)[,c("price","tax","mpg","engineSize")])

정열해 보기 얼마이상은 얼마인지 평균적으로 


car %>% 
  filter(year<2016 & com == "audi") %>% 
  select(price,tax,mpg,engineSize, mileage) %>% 
  colMeans()



car3= car %>% 
  group_by(transmission) %>% 
  summarise(count=n())
car3

car4= car %>% 
  group_by(transmission) %>% 
  summarise(count=n(),
            price_Mean = mean(price),
            Price_sd = sd(price))
car4

car4_1= car %>% 
  filter(year >= 2019) %>% 
  group_by(transmission) %>% 
  summarise(count=n(),
            price_Mean = mean(price),
            Price_sd = sd(price))
car4_1

car4_2= car %>% 
  filter(engineSize <= 2.1 , year >=2019) %>% 
  group_by(com) %>% 
  summarise(count=n(),
            price_Mean = mean(price),
            Price_sd = sd(price))
car4_2

car4_2= car %>% 
  filter(engineSize <= 2.1 & year >=2019) %>% 
  group_by(com, transmission) %>% 
  summarise(count=n(),
            price_Mean = mean(price),
            Price_sd = sd(price))
car4_2



car5= car %>% 
  group_by(transmission, year) %>% 
  summarise(count=n(),
            price_Mean = mean(price))
car5
# View(car5)

car5_1= car %>% 
  group_by(com, transmission) %>% 
  summarise(count=n(),
            price_Mean = mean(price))
car5_1


# 평균가격을 내봄
# 필터를 걸어봄
car5_2= car %>% 
  filter(year >= 2019) %>% 
  group_by(com, transmission) %>% 
  summarise(count=n(),
            price_Mean = mean(price))
car5_2




# 퍼센트 알아보기 몇년도가 많은지

car6= car %>% 
  group_by(transmission, year) %>% 
  summarise(count=n(),
            price_Mean = mean(price)) %>% 
  mutate(Perc = count/sum(count))

car6

# 전체에서 몇프로가 되는지 알아보기
car6_1= car %>% 
  group_by(transmission, com) %>% 
  summarise(count=n(),
            price_Mean = mean(price)) %>% 
  mutate(Perc = round(count/sum(count),3)) %>% 
  arrange(com)

car6_1
# View(car6_1)



qplot(car6_1$Perc)

트랜스 미션별 종류에 따라 몇 개인지 개수를 봅니다. 
summary(as.factor(car$transmission))

round(summary(as.factor(car$transmission))/nrow(car)*100,2)

summary(as.factor(car$fuelType))/nrow(car)

round(summary(as.factor(car$com))/nrow(car)*100,2)

회사별 빈도

엑스 테이블 해보기

Table = xtabs(~car$fuelType + car$transmission)
Table

# 빈도수를 알아봄\\
# 
# 테이블 2에서는 회사별과 연도별 빈도를 알아봄

Table = xtabs(~car$year + car$com)
Table




car19= car %>% 
  arrange(-price) %>% 
  top_n(n=5, wt=price)

car19


car19_1= car %>% 
  arrange(price) %>% 
  top_n(n=5, wt=-price)

car19_1

# ======================/분류를 나눠봄/=================
ggplot(car)+ geom_bar(aes(x=fuelType, y=(..count..)/sum(..count..),
                                    fill = fuelType))+
  theme_bw()+  ylab("퍼센트:%") +coord_polar()

전체데이터를 분류로 나눠봄
circle <- table(car$fuelType)
# 테이블을 써클이라고 부른다다

pct <- round(circle/sum(circle)*100,2)
# 서클 전체를 더한것을 라운드 라고 부른다다

label <- paste(names(circle), "\n", pct, "%")
# 이름을 붙인다. 
pie(circle, labels=label , radius=0.99, clockwise=T, init.angle=90)


# 기준선 변경(init.angle)
pie(circle, init.angle=90 , radius=0.99, clockwise=T)


회사별로 나눠보기
ggplot(car)+ geom_bar(aes(x=com, y=(..count..)/sum(..count..),
                          fill = com))+
  theme_bw()+  ylab("퍼센트:%") +coord_polar()


전체데이터를 분류로 나눠봄
circle <- table(car$com)
# 테이블을 써클이라고 부른다다

pct <- round(circle/sum(circle)*100,2)
# 서클 전체를 더한것을 라운드 라고 부른다다

label <- paste(names(circle), "\n", pct, "%")
# 이름을 붙인다. 
pie(circle, labels=label , radius=0.99, clockwise=T, init.angle=90)









ggplot(car, aes(x=price))+
  geom_histogram(bins = 500)+
  theme_classic()

빈도에 대한 그래프 그리기

ggplot(car, aes(x=price, fill=transmission))+
  geom_histogram(bins =300)+
  theme_classic()

ggplot(car, aes(x=price, fill=com))+
  geom_histogram(bins =300)+
  theme_classic()


ggplot(car, aes(x=price, fill=fuelType))+
  geom_histogram(bins =300)+
  theme_classic()

ggplot(car, aes(x=year, fill=fuelType))+
  geom_histogram(bins =300)+
  theme_classic()


ggplot(car, aes(x=mileage, fill=fuelType))+
  geom_histogram(bins =300)+
  theme_classic()


ggplot(car, aes(x=price, fill=fuelType))+
  geom_histogram(bins =300)+
  theme_classic()


ggplot(car, aes(x=price, fill=fuelType))+
  geom_histogram(bins =300)+
  theme_classic()+
  scale_x_continuous(expand = c(0,0))+
  scale_y_continuous(expand = c(0,0))







점으로 두변수 알아보기
연ㄷ별로 가격

ggplot(car, aes(x=year,y=price))+
  geom_point()+
  theme_classic()




ggplot(car, aes(x=price ,y=mileage))+
  geom_point()+
  theme_classic()

summary(car$mileage)

30만 이상을 죽여버림

car$mileage <- ifelse(car$mileage >= 200000, NA, car$mileage)
table(is.na(car$mileage))

결측치로 변경됨
그것을 지워버림
car <-  car %>% filter(complete.cases(car$mileage))
qplot(car$fuelType)



ggplot(car, aes(x=price ,y=mileage))+
  geom_point()+
  theme_classic()

summary(car$mileage)
qplot(car$mileage)
boxplot(car$mileage)
# 글씨로 보면 안보입니다. 그래서 
summary(car$mileage)
# 한번더 숫자로 정열합니다. 
# 가격이 낮으면서도 많이 타지않은 차들도 많습니다

가격과 연도별
ggplot(car, aes(x=price ,y=year))+
  geom_point()+
  theme_classic()


가격과 엔진사이즈

ggplot(car, aes(x=price ,y=engineSize))+
  geom_point()+
  theme_bw()

엔진이 4정도일때 가격이 높음

가격이 비쌀수록 텍스가 높은지
ggplot(car, aes(x=price ,y=tax))+
  geom_point()+
  theme_bw()

# ==============================================================================================
# 가격이 높을때 텍스가 높은것도 있으나
# 가격이 낮은차도
# 텍스가 높은차들이 있다
# 텍스가 높은차들이 어떤지 알아보고자 따로 뽑아본다. 

taxz = car %>% 
  filter(tax >= 400) 
View(taxz)
# 왜 텍스가 높은지 알아봄

갯수보기
dim(taxz)
회사별로 빈도 보기


circle <- table(taxz$com)
# 테이블을 써클이라고 부른다다

pct <- round(circle/sum(circle)*100,2)
# 서클 전체를 더한것을 라운드 라고 부른다다

label <- paste(names(circle), "\n", pct, "%")
# 이름을 붙인다. 
pie(circle, labels=label , radius=0.99, clockwise=T, init.angle=90)



텍스짱들의 엔진때문인지 본다

ggplot(taxz, aes(x=tax ,y=engineSize))+
  geom_point()+
  theme_bw()


ggplot(taxz, aes(x=tax ,y=mpg))+
  geom_point()+
  theme_bw()


# 맨위에것 상위만 알아봄봄

# ========================================================================
다시 원론으로 들어온다. 
평균가격을 내본다. 
ggplot(car, aes(x=mpg,y=price, col= fuelType))+
  geom_point()+
  theme_classic()

가격이 높은것은 휘발류 차이고
하이브리드는 mpg가 평균 60이다

hyb = car %>% 
  filter(fuelType == "Hybrid")
summary(hyb$mpg)

# 최저가 40이고 최고가 94이고 평균이 73이다
qplot(hyb$mpg)
# 하이브리드의 가격의 중간값을 알아보자
summary(hyb$price)
# 연식을 알아보자
summary(hyb$year)
# 어디 회사가 많은지 알아보자

circle <- table(hyb$com)
# 테이블을 써클이라고 부른다다
pct <- round(circle/sum(circle)*100,2)
# 서클 전체를 더한것을 라운드 라고 부른다다
label <- paste(names(circle), "\n", pct, "%")
# 이름을 붙인다. 
pie(circle, labels=label , radius=0.99, clockwise=T, init.angle=90)

토요타 하이브리드가 많다. 

다시 식으로 만들어 보고 싶다. 
회사 <- data.frame(hyb$com)
table(회사)

qplot(hyb$com)

hyb_p = hyb %>% 
  group_by(com) %>% 
  summarise(count = n()) %>% 
  mutate(Perc = round(count/sum(count)*100,1))%>% 
  arrange(-Perc)
  
hyb_p

qplot(hyb_p)

# View(hyb)

하이브리드는 몇
hyb_p1 = hyb %>% 
  group_by(com, model) %>% 
  summarise(count = n()) %>% 
  arrange(-count)

hyb_p1

# 토요타가 제품이 많다는 것을 알 수 있다. 
car25 = car %>% 
  filter(year >= 2018 , com == "hyundi") %>% 
  group_by(com, model) %>% 
  summarise(count = n()) %>% 
  arrange(-count) %>% 
  top_n(n=10)
  
head(car25, 11)


# 2018년 이후 제품을 알아봄

# 전체중에서 찾아봄
car25_1 = car%>% 
  filter(year >= 2016 ) %>% 
  group_by(com, model) %>% 
  summarise(count = n()) %>% 
  arrange(-count) %>% 
  top_n(n=10)


car25_1

View(car25_1)

ggplot(car, aes(x=year,y=price, col= transmission))+
  geom_point()+
  theme_classic()


# 가격에 비한 연도별별
ggplot(car, aes(x=year,y=price))+
  geom_point()+
  geom_smooth()+
  theme_classic()


ggplot(car, aes(x=year,y=mpg))+
  geom_point()+
  geom_smooth()+
  theme_classic()
# mpg가 점점떨어졌다. 

ggplot(car, aes(x=year,y=tax))+
  geom_point()+
  geom_smooth()+
  theme_classic()
# 텍스가 낮아지다가 잠깐 올라갔다가 다시 내려간다다

ggplot(car, aes(x=year,y=mileage))+
  geom_point()+
  geom_smooth()+
  theme_classic()

# 시간이 갈수록 마일이 줄어든다. 평균 줄어든다다
ggplot(car, aes(x=year,y=engineSize))+
  geom_point()+
  geom_smooth()+
  theme_classic()



ggplot(car, aes(x=year,y=price))+
  geom_point()+
  geom_smooth(method = 'lm')+
  theme_classic()


ggplot(car, aes(x=fuelType,y=price))+
  geom_boxplot(fill='yellow',color='darkslategrey',width=0.5, 
               outlier.color = "pink" , alpha=0.05)+
  theme_classic()

ggplot(car, aes(x=com,y=price))+
  geom_boxplot(fill='yellow',color='darkslategrey',width=0.7, 
               outlier.color = "pink" , alpha=0.05)+
  theme_classic()


ggplot(car, aes(x=fuelType,y=price , fill=transmission))+
  geom_boxplot(outlier.color = "red" ,alpha= 0.5)+
  theme_classic()


회사별 기어에 따른 가격수준
ggplot(car, aes(x=com ,y=price , fill=transmission))+
  geom_boxplot(outlier.color = "red" ,alpha= 0.5)+
  theme_classic()

트랜스미션별 가격

ggplot(car, aes(x=transmission ,y=price , fill=com))+
  geom_boxplot(outlier.color = "red" ,alpha= 0.5)+
  theme_classic()


퓨엘타입별 가격
ggplot(car, aes(x=fuelType ,y=price , fill=com))+
  geom_boxplot(outlier.color = "red" ,alpha= 0.5)+
  theme_classic()





연도별 평균가격을 그려봄
year_DF = car %>%
  filter(com =="bmw") %>% 
  group_by(year) %>% 
  summarise(price = mean(price))
year_DF

# 연도별로 가격 평균을 내봄
# 평균가격을 그래프와 점과 선으로 봄봄

ggplot(year_DF, aes(x=year,y=price))+
  geom_line()+
  geom_point()+
  theme_bw()




year_DF1 = car %>% 
  group_by(year, com) %>% 
  summarise(price = mean(price))
year_DF1

ggplot(year_DF1, aes(x=year,y=price, col =com))+
  geom_line()+
  geom_point()+
  theme_bw()



year_DF1 = car %>% 
  group_by(year, transmission) %>% 
  summarise(price = mean(price))
year_DF1

ggplot(year_DF1, aes(x=year,y=price, col =transmission))+
  geom_line()+
  geom_point()+
  theme_bw()




car12= car %>% 
  group_by(com) %>% 
  summarise(Count=n()) %>% 
  filter(com %in% c("hyundi","ford","skoda","toyota"))

head(car12)

car12= car %>% 
  group_by(com) %>% 
  summarise(Count=n()) %>% 
  filter(com %in% c("hyundi","ford","skoda","toyota"))

head(car12)


car12_1 = car %>% 
  group_by(com) %>% 
  summarise(count = n()) %>% 
  filter(com %in% c("hyundi","ford","skoda","toyota")) %>% 
  mutate(Perc = round(count/sum(count)*100,1))%>% 
  arrange(-Perc)
car12_1

car12_2 = car %>% 
  group_by(com) %>% 
  summarise(count = n()) %>% 
  mutate(Perc = round(count/sum(count)*100,1))%>% 
  arrange(-Perc)
car12_2

View(car)


Audi14= car %>% 
  group_by(model) %>% 
  summarise(Mean= mean(price)) %>% 
  filter(model %in% c(" Fiesta"," focus", " C Class", " A Class"," Kuga",
                      " 3 Series"," Yaris", " Aygo", " E Class"," 1 Series"))

Audi14