
library(ggplot2)
library(dplyr)

Audi=read.csv("D:/01R/data/audi.csv")

View(Audi)

ggplot(Audi, aes(x=price)) +
  geom_histogram()+
  theme_classic()


ggplot(Audi, aes(x=price))+
  geom_histogram(bins = 100)+
  theme_classic()
#색 축 수정을 하려면 다양한 범위가 있는 트랜스미션별로 나누면 됨되



ggplot(Audi, aes(x=price, fill=transmission))+
  geom_histogram(bins = 100)+
  theme_classic()




ggplot(Audi, aes(x=price, fill=transmission))+
  geom_histogram(bins = 100)+
  theme_classic()+
  scale_x_continuous(expand = c(0,0))+
  scale_y_continuous(expand = c(0,0))


# # 산점도 해보기
# 산점도는 두가지축이 있어야 한다. 

ggplot(Audi, aes(x=mpg,y=price))+
  geom_point()+
  theme_classic()

색을 넣어줌

# =========히스토그램은 fill로 채우나
#        산점도는 col로 넣어본다
ggplot(Audi, aes(x=mpg,y=price, col= fuelType))+
  geom_point()+
  theme_classic()

ggplot(Audi, aes(x=mpg,y=price, col= transmission))+
  geom_point()+
  theme_classic()


# ================산점도와 회귀선을 넣어봄=============
# 회귀를선을 넣어 본다. 
ggplot(Audi, aes(x=mpg,y=price))+
  geom_point()+
  geom_smooth()+
  theme_classic()

ggplot(Audi, aes(x=mpg,y=price))+
  geom_point()+
  geom_smooth(method = 'lm')+
  theme_classic()



# ======================================

ggplot(Audi, aes(x=year,y=price))+
  geom_point()+
  geom_smooth()+
  theme_classic()
# =========이것은 연도와 가격에 대한 산포도와 회귀귀이다. =====

# =======박스 플롯을 해보자========
# ======4분위 표가 박스 플롯이다 summarise()====
ggplot(Audi, aes(x=fuelType,y=price))+
  geom_boxplot(outlier.color = "red")+
  theme_classic()



ggplot(Audi, aes(x=fuelType,y=price , fill=transmission))+
  geom_boxplot(outlier.color = "red")+
  theme_classic()



# ============트랜스 미션별로 분류하면 색이 나눠진다====

선그래프의 오류를 알아보자


ggplot(Audi, aes(x=year, y=price))+
  geom_line()+
  theme_classic()

# ======선그래프가 오류가 나오는 것는=================== 
# ======연도별로 빈도가 나오는 것이 아니기 때문이다. ===


year_DF = Audi %>% 
  group_by(year) %>% 
  summarise(price = mean(price))
y
# 
# 연도별 평균값을 만들어 주면 
# 연도와 평균값을 라인으로 볼 수가 있다
# 일반적으로 산점도로 봐야 하며
# 구지 보고자 한다면 평균값을 봐야한다. 


ggplot(year_DF, aes(x=year,y=price))+
  geom_line()+
  geom_point()+
  theme_bw()




year_DF1 = Audi %>% 
  group_by(year, fuelType) %>% 
  summarise(price = mean(price))
year_DF1

ggplot(year_DF1, aes(x=year,y=price, col =fuelType))+
  geom_line()+
  geom_point()+
  theme_bw()

# ======연도와 가격을 나눌때 퓨엘종류별로 나눠봄=====

# 
# 데이터를 구조를 변화해 보자
# 행열 변환을 해보자
# # 
# =======/ melt와 cast가 있다. / reshape가 있다. =======
#   cast:  길게간다
#   melt: 아래로 간다
#   =====================================================
  
  


library(dplyr)
library(reshape)


Audi_s= Audi %>% 
  group_by(model, year) %>% 
  summarise(count =n())

head(Audi_s)

Audi_Cast = Audi_s %>% 
  cast(model~year, fill=0, value = "count")

head(Audi_Cast)  
  # =============모델별로 옆으로 보임========
  
  
Audi_Melt =Audi_Cast %>% 
  melt(id.vars = c("model"))

Audi_Melt
  
  
  


