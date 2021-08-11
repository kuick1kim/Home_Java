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


   
