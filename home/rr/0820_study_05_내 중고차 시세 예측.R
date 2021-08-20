

iris

data()

View(AirPassengers)
AirPassengers
head(AirPassengers, 20)



Audi= read.csv("D:/kjw_data/01_R/data/audi.csv")

install.packages("fBasics")

library(fBasics)

skewness(Audi$price)

외도

첨도

kurtosis(Audi$price)
library(ggplot2)

ggplot(Audi) +
    geom_point(aes(x=price, y=log(price)))+theme_bw()

# 일반빈도도
ggplot(Audi) +
  geom_histogram(aes(x=price))+theme_bw()


ggplot(Audi) +
  geom_histogram(aes(x=log(price)))+theme_bw()

# 로그로 그려주어서 
# 조금더 좋게 보게 해줌


# QQ플롯을 적용하게되면, 선에 맞춰진다. 


qqnorm(Audi$price)

# qq플롯 그리는 방법


qqnorm(log(Audi$price))


# 귀무가설과 대립가설설
# 
# 귀무가설 : 특대는 무게 10kg
# 
# 기준이 필요하다
# 이전에 판매되었던 또는 지금 판매중인 100개를 표본조사를 해서 기준을 정하는 것이다. 

# 대립가설 : 8kg
# 
# 신뢰도 95프로로 
# 평균 9.5 kg이 나오면 문제가 없다. 
# 평균이 9kg이 나오면 문제가 있다. 
# 

# 
# 대립가설 8kg일때
# 
# 1종오류: 귀무가설이 사실일때 귀무가설을 기각하는것이
# 1종오류이다. 
# 
#   
# 2종오류: 귀무가설이 사실이 아닌데 귀무가설을 
#   기각하지 않는것이 2종오류이다. 




# 신뢰구간이 중요하다. 

set.seed(1234)
SL= sample(1:nrow(Audi), nrow(Audi)*0.7, replace = FALSE)

# 70프로 무작위로 추출한다. 

# View(SL)

Sample = Audi[SL,]


평균 표준편차, 분위수 계산

Mean =mean(log(Sample$price))
Sd = sd(log(Sample$price))

n = nrow(Sample)

t0025 = qt(p=0.025, df = n-1)
t0975 = qt(p=0.975, df = n-1)

# 
# 신뢰구간 95% 
# 
# 구간
# 9.915~9.937

Lower = Mean + t0025*Sd/sqrt(n)
Lower
Upper = Mean + t0975*Sd/sqrt(n)
Upper


mean(log(Audi$price))
# 프라이스가 9.928 신뢰구간안에 있다 



# 분산 분석

ANOVA = aov(log(Audi$price)~ Audi$fuelType)
summary(ANOVA)

ANOVA = aov(log(Audi$price) ~ Audi$fuelType)

summary(ANOVA)

# install.packages("ggpubr")
library(ggpubr)

my_comparisons = list(c("Petrol", "Hybrid"),
                      c("Petrol", "Diesel"),
                      c("Diesel", "Hybrid")
                      )

dev.off()
library(ggplot2)
Audi %>% 
  mutate(log_price = log(price)) %>%
  
  ggboxplot(x= "fuelType", y="log_price", 
  bxp.errorbar = TRUE, color = "fuelType", palette = "jco",
  fill = "fuelType")

  + stat_boxplot(geom = "errorbar",
                 
  aes(x = fuelType, y= log_price)) +
  stat_compare_means(comparisons = my_comparisons)











ANOVA = aov(log(Audi$price) ~ Audi$fuelType)

summary(ANOVA)



install.packages("ggpubr")

library(ggpubr)



my_comparisons = list(c("Petrol", "Hybrid"),
                      
                      c("Petrol", "Diesel"),
                      
                      c("Diesel", "Hybrid"))

Audi %>% 
  mutate(log_price = log(price)) %>% 
  ggboxplot(x = "fuelType", y="log_price",
            bxp.errorbar = TRUE, color ="fuelType", palette = "jco", fill = "fuelType") +
  stat_boxplot(geom = "errorbar", aes(x = fuelType, y = log_price)) +
  stat_compare_means(comparisons = my_comparisons)














# 교호효과 

# 두집단끼리 연관이 있을 경우 발생하는 효과과




ANOVA2 = aov(log(Audi$price)~ Audi$fuelType * Audi$transmission)
summary(ANOVA2)

library(dplyr)


Audi %>% 
  group_by(fuelType, transmission) %>% 
  summarise(Mean = mean(log(price))) %>% 
  ggplot()+
  geom_point(aes(x=fuelType, y = Mean, col = transmission,
                 shape = transmission, size = Mean), alpha = 0.7) +
  geom_line(aes(x=fuelType, y = Mean, col = transmission,
                 group = transmission), size = 1.3, alpha = 0.2) +
  scale_size_area(max_size = 8)+
  guides(size =FALSE) +
  theme_bw()+
  theme(legend.position = "bottom")











# 상관행열 그래프 corrplot()


Audi$transmission_Manual = ifelse(Audi$transmission == "Manual", 1, 0)
Audi$transmission_Automatic = ifelse(Audi$transmission == "Automatic", 1, 0)

Audi$fuelType_petrol = ifelse(Audi$fuelType == "Petrol", 1, 0)
Audi$fuelType_Diesel = ifelse(Audi$fuelType == "Diesel", 1, 0)

Audi2= Audi %>% 
  select(year, price, mileage, tax, mpg,
         engineSize, transmission_Manual, transmission_Automatic,
         fuelType_petrol, fuelType_Diesel)

View(Audi)

install.packages("corrplot")
library(corrplot)

Coor_mat= cor(Audi2)



corrplot(Corr_mat, method = "color", outline = T, addgrid.col = "darkgray",   
         order = "hclust", addrect = 4, rect.col = "black",
         rect.lwd = 5, cl.pos = "b", tl.col = "indianred4",
         tl.cex = 0.5, cl.cex = 0.5, addCoef.col = "white",
         number.digits = 2, number.cex = 0.8,
         col = colorRampPalette(c("darkred", "white", "midnightblue"))(100))










# 주성분 분석석

install.packages("FactoMineR")
library(FactoMineR)

install.packages("factoextra")
library(factoextra)
Audi3

Audi3 = as.data.frame(Audi2[1:100,])
Principal_Componet = PCA(Audi3,graph = FALSE)

Principal_Componet$eig

Principal_Componet$var$coord



fviz_pca_var(Principal_Componet, col.var="contrib",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE #Avoid text over lapping
)


fviz_pca_biplot(Principal_Componet, repel = FALSE)



























