#인터렉티브 그래프


#install.packages("plotly")

library(plotly)

library(ggplot2)

# ggplot을 이용하여 조절을 할 수 있음
p = ggplot(data = mpg,
           aes(x=displ, y=hwy, col=drv)) + geom_point()
ggplotly(p)

p = ggplot(data = diamonds, aes(x=cut, fill=clarity)) + geom_bar(position = "dodge")
ggplotly(p)

#미국의 economics 미국의 고용 실업 저축율 을 분석해봄

View(economics)

install.packages("dygraphs")
library(dygraphs)

economics = ggplot2::economics
head(economics)
table(economics)
str(economics)
#갯수가 몇개인지
dim(economics)
summary(economics$unemploy)

#시계열 데이터를 볼때 사용함
library(xts)

eco= xts(economics$unemploy, order.by = economics$date)
head(eco)

dygraph(eco)

#저축율
eco_a= xts(economics$psavert, order.by = economics$date)
dygraph(eco_a)

# 실업자수

eco_b= xts(economics$unemploy/1000, order.by = economics$date)
dygraph(eco_b)

#저축율과 실업자수의 관계를 비교해보자
#두개를 합치기
eco2= cbind(eco_a, eco_b)
#이름 붙이기
colnames(eco2) = c("psavert","unemploy")
# 데이터 찍어보기
head(eco2)

dygraph(eco2) %>% dyRangeSelector()


#통계학 T검정

mpg

mpg = as.data.frame(ggplot2::mpg)

library(dplyr)


# 도시에서 경차와 suv를 탈때 연비가 차이가 나는지 확인해 보는것

mpg_diff = mpg %>% 
  select(class, cty) %>% 
  filter(class %in% c("compact", "suv"))

head(mpg_diff)

table(mpg_diff$class)

dim(mpg_diff)

t.test(data=mpg_diff, cty ~ class, var.equal=T)


#일반휘발류와 고급휘발류 사용 T분포
#Reqular-Premium


mpg_diff2= mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c("r","p"))

table(mpg_diff2)

t.test(data=mpg_diff2, cty ~fl, var.equal =T)

#결론 0.28로 0.05보다 크기 때문에 유의 하지 않다

# 실업자수와 개인 소비지출의 상관관계


View(mpg)




economics = as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)

View(economics)
dim(economics)

head(mtcars)

car_cor = cor(mtcars)
car_cor
#양이 많이 나오는데

round(car_cor,3)
#round를 써서 소수점 3자리만 나오게함


install.packages("corrplot")
library(corrplot)


corrplot(car_cor)
corrplot(car_cor, method = "number")

col =colorRampPalette(c("#BB4444", "#ee9933","#BBddaa", "#ee3333","#BB0044", "#aa99aa"))

corrplot(car_cor,
         method = "color",  #색상
         #col = col(200),    #색상은 200개를 선정
         #type= "lower",     # 왼쪽 아래 행렬만 표시
         order="hclust",    # 유사한 상관 계수끼리 군집화
         addCoef.col = "black",  # 상관계수 색상
         tl.col = "black",    # 변수명 색상
         tl.srt = 45,        # 변수명 45
         diag = F             # 대각 행렬 제외외
         )


