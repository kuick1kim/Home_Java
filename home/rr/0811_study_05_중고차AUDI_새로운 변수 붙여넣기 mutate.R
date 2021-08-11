# 중고차 데이터를 활용한 데이터 전처리

audi = read.csv("D:/kjw_data/00_R/data/audi.csv")
audi

dim(audi)
View(audi)

# 데이터 연산 동시에 처리하는 방법
Normalization = function(x){
  y=(x-min(x))/(max(x)-min(x))
  return(y)
}
v=1:10
Normalization(v)

#정규화하는방법
# 0과 1사이의 값으로 만드는것


# 여러개의 값을 사용하면 계산 결과가 나올 수 있다다
audi_s = audi[,c("year","price","mileage","mpg")]
audi_s2 = Normalization(audi_s)
audi_s2
summary(audi_s2)

# 올바른 계산을 위해서는 Matrix사용해야 한다. 


R_Matrix = matrix(data = 0,
                  nrow = nrow(audi_s),
                  ncol = ncol(audi_s))

# 매트릭스를 이용하여 포문으로 돌려준다다/

for (k in 1:ncol(audi_s2)) {
  R_Matrix[,k] = Normalization(audi_s[,k])
}

R_DF= as.data.frame(R_Matrix)
summary(R_DF)

# 
# 매트릭스로 다시 세팅을 한다. 
# 
# 하나를 정규화 하기 위해 정규화를 해야한다. 



#====================/  apply 함수 /===================
# 간결하게 연산해보자자
# 그냥 간결하게 정규화가 가능하다

R_DF2= apply(audi_s2,MARGIN = 2, FUN = Normalization)

# apply를 이용하여 정규화 Normalization 0에서 1까지 숫자로 변경해봄
summary(R_DF2)

#===================================================



# lapply()는 apply의 결과를 list() 형태로 변환가능하다다

lapply(audi_s2, Normalization)

R_DF3 = as.data.frame(lapply(audi_s2, Normalization))
R_DF3
summary(R_DF3)
#==================== 더 간결하게 / 쉽게  ===============

# dplyr 패키기 공부하기
# 파이프 연산자를 사용할 수 있다 %>% 
library(dplyr)

colMeans(filter(.data=audi, year < 2016)[,c("price","tax","mpg","engineSize")])

colMeans(filter(.data=audi, year > 2016)[,c("price","tax","mpg","engineSize")])
# 한방에 평균을 구할 수 있다. colom 의 평균값 mean을 구할 수 있다다

# 위의 내용을 파이프 연산자로 해보자

Audi %>% 
  filter(year>2016) %>% 
  select(tax,mpg,engineSize) %>% 
  colMeans()

Audi %>% 
  filter(year<2016) %>% 
  select(price,tax,mpg,engineSize, mileage) %>% 
  colMeans()



# =======================/ mutate    /=====================
# =========데이터 세트에 새로운 변수를 추가해봄봄=========

audi2=audi %>% 
  mutate(tax2 = ifelse(tax > 100, 1,0),
         engineSize2 = round(engineSize))
head(audi2)

#=== mutate 로 텍스2를 만들어서 100이상만 찾아보고=========
#=== 엔진 사이즈를 round 정수만 짜서 새로운 행을 만듦======

# =======audi2는 엔진사이즈와 텍스를 붙인 자료======


audi3= audi %>% 
  group_by(transmission) %>% 
  summarise(count=n())
audi3

#=======audi3 =아우디를 트랜스 미션별로 나눠 봄=======

#============/평균과 표준편차 알아보자  /==============

audi4= audi %>% 
  group_by(transmission) %>% 
  summarise(count=n(),
            price_Mean = mean(price),
            Price_sd = sd(price))
audi4
#======/audi4 는 평균 가격과 표준편자에 대해 나옴 /===


#======/audi5 는 그룹 변수를 2개일때/=======



audi5= audi %>% 
  group_by(transmission, year) %>% 
  summarise(count=n(),
            price_Mean = mean(price))



audi5= audi %>% 
  group_by(transmission, year) %>% 
  summarise(count=n(),
            price_Mean = mean(price))

audi5

#======/연도별로 변속기 종류의 평균가격이 얼마인지 알아봄/=======

#================= 그룹간에 비율을 계산해 보자자=================


audi6= audi %>% 
  group_by(transmission, year) %>% 
  summarise(count=n(),
            price_Mean = mean(price)) %>% 
  mutate(Perc = count/sum(count))

audi6




#=========/count = n 이고        /================
#=========/가격평균은 = 전제가가격의 평균이고 /================
#=========/perc 는 전체더한 수를 카운트 수로 나눈것        /================
#=========/count = n 이고        /================
