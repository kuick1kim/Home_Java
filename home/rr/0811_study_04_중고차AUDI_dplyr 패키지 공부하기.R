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

dplyr 패키기 공부하기















