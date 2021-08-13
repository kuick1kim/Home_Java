# 대표적인 유사도 측정
# 유클리디안 거리 // 코사인 유사도

library(dplyr)
library(ggplot2)
library(reshape)

Audi= read.csv("D:/kjw_data/00_R/data/audi.csv")

# View(Audi)



# ==========정규화 함수 만드는 것=========
Normalization = function(x){
  y=(x-min(x))/(max(x)-min(x))
  return(y)
}


# =========================================
Audi$mileage_Norm = Normalization(Audi$mileage)
Audi$mpg_Norm= Normalization(Audi$mpg)
# Audi$김민상 = Audi$year+Audi$price
# ===============정규화에 데이터를 넣는것=============
# ========열을 만드는것은 매우 간단하다 위처럼 한다 ==========

# =============정규화 하는것 ======
# View(Audi)


# ==========유클리디안 거리========= 
# 거리에 대한 펑션

Dist_Fun = function(x1,x2){
  
  y1= (x1-x2)^2
  y2= sum(y1)
  y3= sqrt(y2)
  return(y3)
}

Dist_Fun(x1 = Audi[1, c("mileage_Norm", "mpg_Norm")],
         x2 = Audi[2, c("mileage_Norm", "mpg_Norm")])



# 
# 회귀분성에서는 자동으로 가변수를 생성하지만
# 여기서는 직접 변수를 생성 하도록 함

Audi$transmission_Manual = ifelse(Audi$transmission == "Manual", 1,0)
Audi$transmission_Automatic = ifelse(Audi$transmission == "Automatic", 1,0)

Audi$fuelType_Petrol = ifelse(Audi$fuelType == "Petrol", 1, 0)
Audi$fuelType_Diesel = ifelse(Audi$fuelType == "Diesel", 1, 0)

# ==========종류를 1과 0으로 만들어 주는 것은 ==============
#   ========유클리디안 거리를 보기위해서 이다. ================


Audi2 = Audi %>% 
  select(year, price, mileage, tax,mpg,
         engineSize, transmission_Manual, transmission_Automatic,
         fuelType_Petrol, fuelType_Diesel)

Audi2 = apply(Audi2, MARGIN=2, FUN = Normalization)

#==== 10개의 데이터를 뽑아 한번에 유사도 분석을 진행해봄봄=====

Dist_Fun2= function(x){
  Matrix = matrix(data = 0,
                  nrow = nrow(x),
                  ncol = nrow(x)  )
  for(k in 1:nrow(x)){
    for(i in k:nrow(x)){
      
      y1 = (x[k,]-x[i,])^2
      y2 = sum(y1)
      y3 = sqrt(y2)
      
      Matrix[k,i] = y3
      Matrix[i,k] = y3
    }
  } 
  return(Matrix)
}




# =======================================================




# =======================================================


Dist_Matrix = Dist_Fun2(x = Audi2[1:10,])
Dist_Matrix






Dist_Matrix %>%
  as.data.frame() %>%
  mutate(Row = 1:10) %>%
  melt(id.vars = c("Row")) %>%
  ggplot() +
  geom_tile(aes(x = as.factor(Row), y = as.factor(variable), fill = value), alpha = 0.9) +
  geom_vline(xintercept = seq(0.5,10,by = 1), linetype = "dashed") +
  geom_hline(yintercept = seq(0.5,10,by = 1), linetype = "dashed") +
  geom_text(aes(label = round(vaule,1)))
  scale_y_discrete(expand = c(0,0)) +
  scale_x_discrete(expand = c(0,0)) +
  xlab("") + ylab("") + ggtitle("Euclidean") +
  guides(fill = "none") +
  theme_bw()  

  
  
  
  
  
  CosSim2 = function(x){
    
    xy = x %*% t(x) 
    x2 = sqrt(rowSums(x^2))
    y2 = t(sqrt(rowSums(x^2)))
    
    Sim = xy/(x2 %*% y2)
    
    return(Sim)
    
  }

Cosine_Matrix = CosSim2(x = Audi2[1:10,])


Cosine_Matrix
  
  
  
  
Cosine_Matrix %>%
    as.data.frame() %>%
    mutate(Row = 1:10) %>%
    melt(id.vars = c("Row")) %>%
    ggplot() +
    geom_tile(aes(x = as.factor(Row), y = as.factor(variable), fill = value), alpha = 0.9) +
    geom_vline(xintercept = seq(0.5,10,by = 1), linetype = "dashed") +
    geom_hline(yintercept = seq(0.5,10,by = 1), linetype = "dashed") +
    scale_y_discrete(expand = c(0,0)) +
    scale_x_discrete(expand = c(0,0)) +
    xlab("") + ylab("") + ggtitle("김민상 Cosine Similarity") +
    guides(fill = FALSE) +
    theme_gray()



# 계층적 군집 분석


library(cluster)
Cluster1= hclust(as.dist(Dist_Matrix), method = 'ward.D')

# 시각화
plot(Cluster1, main = "Euclidean Distance Clustering",
        ylab="", xlab="", yaxt = "n")
  

View(Audi2)

# 계층적 군집 분석 에 대하여 거리 가 가까운것은 이런것이다. 




Cluster2 = hclust(as.dist(Cosine_Matrix),method = "ward.D")

plot(Cluster2, main = "Cosine Similarity Clustering",
     ylab = "", xlab = "", yaxt = "n")

