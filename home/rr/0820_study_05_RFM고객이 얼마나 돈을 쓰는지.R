

DEC_2019 = read.csv("D:/kjw_data/01_R/data/70/2019.csv")

View(a)
# 
# rfm 분석이란 
# 고객이 최근에 구매하였는지 
# 돈을 얼마나 썼는지 
# 얼마나 자주 했는지 분석하는 것이다. 

dim(a)
install.packages("data.table")
library(dplyr)
library(ggplot2)
library(data.table)
library(reshape)
library(ggsci)

DIR = "D:\\kjw_data\\01_R\\data\\70\\"
DEC_2019 = fread(paste0(DIR, "2019.csv"))
head(DEC_2019, 3)
str(DEC_2019)

DEC_2019= as.data.frame(DEC_2019)
DEC_2019

# 한명의 고객을 뽑아보는것

Customer_ID = unique(DEC_2019$user_id)

Customer_Example = Customer_ID[50]
Customer_Example

Example_DF = DEC_2019 %>% 
  filter(user_id == Customer_Example) %>% 
  mutate(event_time2 = as.POSIXct(event_time)) %>% 
  arrange(event_time2) %>% 
  select(user_id, event_time2,event_type, product_id,category_id) %>% 
  as.data.frame()

knitr::kable(Example_DF)


View(Example_DF)


# 무작위로 1000명을 조사할때 



set.seed(1234)
 
# 무작위 추출방법법

Customer_Sample = sample(Customer_ID, 1000, replace = FALSE)

Sample_Data= DEC_2019 %>% 
  filter(user_id %in% Customer_Sample) %>% 
  mutate(event_type = factor(event_type,
                             levels = c("view","cart","remove_from_cart",
                                        "purchace"))) %>% 
  mutate(event_time2 = as.POSIXct(event_time)) %>% 
  select(user_id, event_time2,event_type, product_id,
         category_id, brand, price) %>% 
  arrange(user_id, event_time2)


Sample_Data  
  
View(Sample_Data)

Sample_Data = Sample_Data %>% 
  mutate(Day = format(event_time2, "%a"),
         Day = factor(Day, levels = c("일","월","화","수","목","금","토")),
         Time = format(event_time2, "%H"),
         Time = as.numeric(Time),
         Time_G = ifelse(Time <9, "새벽",
                         ifelse(Time <13, "오전",
                         ifelse(Time < 19, "오후", "저녁"))),
         Time_G = factor(Time_G, levels = c("새벽","오전","오후","저녁")))

knitr::kable(head(Sample_Data, 100))        

View(Sample_Data)


  



# 시각화 해보기 
Sample_Data %>% 
  ggplot()+
  geom_bar(aes(x=Day, fill = event_type))+
  scale_fill_nejm()
  xlab("") + theme_bw()+ theme(legend.position = "bottom")

  
  # 시각화 해보기 
  Sample_Data %>% 
    group_by(Day, event_type) %>% 
    summarise(count= n()) %>% 
    mutate(Perc = count/sum(count)*100) %>% 
    ggplot()+
    geom_bar(aes(x=Day, y= Perc, fill = event_type), stat = 'identity')+
    geom_text(aes(x=Day, y= Perc, label = round(Perc,2), fill =event_type),
              position = position_stack(0.5), col = "white", size =5)
    
  +
  
  
  #==================================================================
  
    scale_fill_nejm()

    xlab("") + theme_bw()+ theme(legend.position = "bottom")

  
  #================================/요게 안됨/===================================
    
    
    
    
    
    
    
# 시간대별 데이터 분석석
    
Sample_Data %>% 
      ggplot()+
      geom_bar(aes(x= Time, fill=Time_G ))+
      scale_fill_nejm()+
      xlab("")+
      theme_bw()+
      theme(legend.position = "bottom")
    
    
    
    
# 일별 데이터 
  # 구매만 추출해 매출액 시각화화
    

Sample_Data %>%
  filter(event_type =="purchase") %>% 
  mutate(Date = as.Date(event_time2)) %>% 
  group_by(Date) %>% 
  summarise(Count = n(), Price = sum(price)) %>% 
  ggplot()+
  geom_point(aes(x=Date, y = Count))+
  geom_line(aes(x=Date, y = Count))+
  theme_bw()


View(Sample_Data)



Sample_Data %>%
  filter(event_type =="purchase") %>% 
  mutate(Date = as.Date(event_time2)) %>% 
  group_by(Date) %>% 
  summarise(Count = n(),
            price = sum(price)) %>% 
  ggplot()+
  geom_point(aes(x=Date, y = price))+
  geom_line(aes(x=Date, y = price))+
  theme_bw()




Sample_Data %>% 
  
  filter(event_type == "purchase" ) %>% 
  mutate(Date = as.Date(event_time2)) %>% 
  group_by(Date) %>% 
  summarise(Count = n(), price = sum(price)) %>% 
  
  ggplot() +
  geom_point(aes(x = Date, y = Count)) +
  geom_line(aes(x = Date, y = Count)) +
  
  theme_bw()
  
    
    
    
    
    
    
