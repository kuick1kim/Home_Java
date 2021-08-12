# 아우디 파일 불러오기기
#데이터 정열

Audi =read.csv("D:/01R/data/audi.csv")
View(Audi)
head(Audi, 3)

# 환경설정부터 시작하기기
library(dplyr)
library(ggplot2)

Audi17= Audi %>% 
  arrange(price)
Audi17
# ======내립차순으로 정열======


Audi18= Audi %>% 
  arrange(-price)
Audi18
# ========오름차순으로 정열========

Audi19= Audi %>% 
  arrange(-price) %>% 
  top_n(n=5, wt=price)

Audi19

# ===========오름차순으로 가격을 정열한이후에 
# 가격을 5개만 보여줘라 =======


# =======필터 해보기======

Audi21= Audi %>% 
  filter(year >2016)
Audi21
# ===========필터 2016년 이상인걸로 보여줘라========

모델이 A 모델이며 
연도가 2016년만 찾아봄


Audi22= Audi %>% 
  group_by(model) %>% 
  summarise(count =n()) %>% 
  filter(model == "A1")
  

Audi22
# 
# ==============/year G 변수를 만듦 /=========================
# ============연도별로 변수를 만듦 2000년 이전 데이터를 따로 만듦
# ===== 1. count 만들기 2. mean_price 만들기 3. median_price 만들기 ===
#   ==perc = 퍼센트로 카운드를 비율로 만듦=======

qplot(Audi$year)



P1 = Audi %>% 
  mutate(year_G= ifelse(year <2000, 1990,
                        ifelse(year <2010, 2000, 2010))) %>%
  group_by(year_G, transmission) %>% 
  summarise(count =n(),
         Mean_price = mean(price),
         Medida_price = median(price)) %>% 
         mutate(perc =count/sum(count))  %>% 
        arrange(year_G, -Mean_price)
P1
qplot(P1)

# ====== price에 대해 분위수 90% 이상에 대한 데이터만 추출====
# ==model 을 그룹으로 새로운 변수로 지정함
# ==Mean_price, Mean_mileage, Mean_TAx 변수를 추가함

P2 = Audi %>% 
  filter(price > quantile(price,probs =c(0.9))) %>% 
  group_by(model) %>% 
  summarise(Mean_price= mean(price),
            Mean_mileage= mean(mileage),
            Mean_Tat= mean())
  

