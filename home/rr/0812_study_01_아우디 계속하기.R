library(ggplot2)
library(dplyr)
#install.packages("reshape")
library(reshape)

Audi =read.csv("D:/kjw_data/00_R/data/audi.csv")

summary(as.factor(Audi$transmission))/nrow(Audi)

#======/  퍼센트를 볼수 있음 아우디 전체 갯수를 나눔/=======

#summary((Audi$transmission == "Automatic")/nrow(Audi))

#=======/내일 해봄//=================================

Table = xtabs(~Audi$fuelType + Audi$transmission)
Table
# ======== / xtabs 는 퓨엘타입과 트랜스 미션만 알아봄/=====

Table[1,1]/colSums(Table)["Automatic"]   

# ==========/ 이항 분포 해보기/================

Audi_NonHybrid = Audi %>% 
  filter(fuelType != "Hybrid")

ggplot(Audi_NonHybrid)+ geom_bar(aes(x=fuelType, y=(..count..)/sum(..count..),
                                     fill = fuelType))+
  theme_bw()+
  ylab("퍼센트:%")


# ======/ 하이브리드만 뺀것을 보겠다/=====
# ======/ ggplot은 바타입이고 x좌표는 퓨엘타입 y 좌표는 전체를 갯수로 나눈것====
# ==== fill = fuelType 옆에 퓨엘타입을 넣어줌, 테마는 BW/ 라벨은 Perc=====


ggplot(Audi)+ 
  geom_bar(aes(x=fuelType, y=(..count..)/sum(..count..),
                                     fill = fuelType))+
  theme_bw()+
  ylab("퍼센트:%")

# ==================/다항에 대한 식이다 /=====================


ggplot(Audi_NonHybrid, aes(x=fuelType, y=(..count..)/sum(..count..), fill=fuelType))  +
  facet_grid(facets=.~Origin)



123

Audi_NonHybrid %>% 
  ggplot(aes(x=fuelType, y=(..count..)/sum(..count..), fill=fuelType)) + 
  geom_bar(position = "fill") +
  coord_polar(theta = "y")




library(dplyr)


k1=c()
p1=c()

for (k in seq(-15,15,by=0.01)) {
  p=dnorm(x=k, mean = 0, sd =3)
  k1= c(k1,k)
  p1 = c(p1,p)
}


k2=c()
p2=c()

for (k in seq(-15,15,by=0.01)) {
  p=dnorm(x=k, mean = 0, sd =5)
  k2= c(k2,k)
  p2 = c(p2,p)
}

DF = data.frame(
  k= k1,
  p1= p1,
  p2= p2
)


DF %>% 
  melt(id.vars = c("k")) %>% 
  ggplot() +
  geom_line(aes(x=k, y=value, col=as.factor(variable)))+
  geom_vline(xintercept = 0, linetype = 'dashed')+
  theme_bw()+
  theme(legend.position = 'none') +
  xlab("") + ylab("")+
  scale_y_continuous(expand=c(0,0))




# ======정규분포를 적은것이다. =======


#========카이제곱분포 : 분산의 특징을 나타내는 확율분포=======

z1= rnorm(n =500, mean =0, sd=1)
z1_2 = z1^2


ggplot(NULL) +
  geom_density(aes(x=z1_2, y=..density..))+
  xlab("")+ylab("")+
  theme_bw()

# ==============/카이제곱분포 그림그리기/======================