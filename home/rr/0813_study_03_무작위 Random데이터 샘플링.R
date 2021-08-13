# # 무작위 데이터 추출
# 데이터 샘플링


Audi = read.csv("D:/kjw_data/00_R/data/audi.csv")
View(Audi)
library(dplyr)
library(ggplot2)
summary(Audi$year)


set.seed(123)
Audi17 = Audi %>% 
  sample_n(size =5)

Audi17

# =====섞어주기=======

set.seed(123)
Audi18 = Audi %>% 
  sample_frac(size =0.5)

Audi18
# =====전체데이터 중에서 무작위 5%만 무작위로 샘플링해줌=====

set.seed(1234)
Audi19 = Audi %>% 
  mutate(Unique_key = 1:nrow(Audi)) %>% 
  sample_frac(size = 1.5, replace = TRUE)

Audi19

dim(Audi)
dim(Audi19)
View(Audi19)
# ==================중복데이터 확장 데이터 만들기===========
#   
#   중복 데이터 확인해 보기
# 중복데이터가 몇개인지 확인해 보는것것
sum(duplicated(Audi19$Unique_key))


# 중복데이터 행을 제거하기 

Audi20 = Audi19[!duplicated(Audi19$Unique_key),]
dim(Audi20)


# 중복키가 2개 이상일때 

set.seed(1234)
Audi21 = Audi %>% 
  mutate(Unique_key = 1:nrow(Audi),
         Unique_key2= nrow(Audi):1) %>% 
  sample_frac(size = 1.5, replace = TRUE)

head(Audi21)
dim(Audi21)


#중복된 행의 수 확인
sum(duplicated(Audi21[,c("Unique_key","Unique_key2")]))


#중복된 행을 제거해버림

Audi22 = Audi21[!duplicated(Audi21[,c("Unique_key","Unique_key2")]),]
dim(Audi22)
