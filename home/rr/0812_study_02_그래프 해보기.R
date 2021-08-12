# 
# 시각화 해보기 
# 1. 도화지 만들기
# 2. 축그리기
# 3. 그래프를 그림
# 4. 테마를 설정함
# 5. 축과 색조정하기

library(ggplot2)
library(dplyr)

Audi = read.csv("D:/01R/data/audi.csv")

# =======  1. 도화지를 그려봄  ====
ggplot()

# ======2.x 축을 연도로 그려봄 축을 그려봄======
ggplot(Audi, aes(x=year))

# =====3.어떤 그림을 그릴지=======
# 그냥 연도별로 바를 그려보니 빈도가 나옴옴
ggplot(Audi, aes(x=year))+ geom_bar()


# ====4.이번에는 테마 설정을 해봄====== 
ggplot(Audi, aes(x=year))+
  geom_bar()+
  theme_classic()

====5.  


ggplot(Audi, aes(x=year ))+
  geom_bar()+
  theme_classic()+
theme(axis.text.x = element_text(size = 15, face = "bold"),
axis.text.y = element_text(size = 15, face = "bold"),
axis.title.x = element_text(size = 15, face = "bold"),
axis.title.y = element_text(size = 15, face = "bold"))





# ===========
ggplot(Audi, aes(x=year))+
  geom_bar()+
  theme_gray()+
  theme(text = element_text(size = 7, face = "bold"))+
  scale_x_continuous(breaks = seq(2000,2020, by=2),
                     expand = c(0,0))+
  scale_y_continuous(breaks = seq(0,4000, by=400),
                     expand = c(0,0))


# ===========/색깔 넣으려면 범위가 나뉘어져야한다/====

ggplot(Audi, aes(x=year, fill=transmission))+
  geom_bar()+
  theme_gray()+
  theme(text = element_text(size = 7, face = "bold"))+
  scale_x_continuous(breaks = seq(2000,2020, by=2),
                     expand = c(0,0))+
  scale_y_continuous(breaks = seq(0,4000, by=400),
                     expand = c(0,0))


# ===========/범례의 위치를 조정해봄봄/=========
ggplot(Audi, aes(x=year, fill=transmission))+
  geom_bar()+
  theme_gray()+
  theme(axis.text.x = element_text(size = 8, face = "bold"),
        axis.text.y = element_text(size = 8, face = "bold"),
        axis.title.x = element_text(size = 8, face = "bold"),
        axis.title.y = element_text(size = 8, face = "bold"),
        legend.title = element_text(size = 8, face = "bold"),
        legend.text = element_text(size = 8, face = "bold"),
        legend.position="bottom")    +
  scale_x_continuous(breaks = seq(2000,2020, by=2),
                     expand = c(0,0))+
  scale_y_continuous(breaks = seq(0,4000, by=1000),
                     expand = c(0,0))+
  labs(fill = "TRANSMISSION")






# ====================================================



ggplot(Audi,aes(x=year))+geom_bar(stat="identity")

install.packages("sqldf")
library(sqldf)



ggplot(Audi, aes(x=year, fill=Origin)) + 
    geom_bar(position="dodge", colour="black") + 
    scale_fill_brewer(palette=1)



ggplot(Audi, aes(x=year)) + 
 geom_bar(stat="identity", fill="white", colour="black")

