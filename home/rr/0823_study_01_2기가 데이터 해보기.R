# 2기가 데이터는 bit.ly 에 가면 khard에 있다. 


a= read.csv("F:/kjw_data/01_R/data/big/2019-Oct.csv")
b= read.csv("F:/kjw_data/01_R/data/big/2019-Nov.csv")
c= read.csv("F:/kjw_data/01_R/data/big/2019-Dec.csv")
d= read.csv("F:/kjw_data/01_R/data/big/2020-Jan.csv")
e= read.csv("F:/kjw_data/01_R/data/big/2020-Feb.csv")

library(data.table)

View(a)

table(a$event_type)

library(dplyr)

DIR = "F://kjw_data//01_R//data//big//"
FILES = list.files(DIR)

# 니가 알아서 불러와와

for(k in 1:length(FILES)){
  assign(gsub(".csv","",FILES[k]),
         fread(paste0(DIR, FILES[k])))
}


Total_DF = rbind(`2019-Dec`, `2019-Nov`, `2019-Oct`, 
                 `2020-Feb`, `2020-Jan` )

Total_DF = rbind(a,b,c,d,e)

View(Total_DF)

Customer_ID2 = unique(Total_DF$user_id)

set.seed(1234)
Customer_Sample2 = sample(Customer_ID2, 50000, replace = FALSE)
# 5만명만 뽑아봐라라
# 아이디가 다른 사람만 50000명 뽑아라라

library(ggplot2)

library(dplyr)
Sample_Data2 = Total_DF %>% 
  filter(user_id %in% Customer_Sample2) %>% 
  mutate(event_time2 = as.POSIXct(event_time)) %>%  
  arrange(event_time2) %>% 
  select(user_id, event_time2, event_type, product_id,
                  category_id, brand, price) %>% 
  arrange(user_id, event_time2)
         
Sample_Data2
View(Sample_Data2)


summary(Sample_Data2$price)


# 요일별로 한번보기 

# 이렇게 모두 만들어야 한다 그래야 보기가 쉽다. 

Sample_Data2 = Sample_Data2 %>%
  mutate(Day = format(event_time2, "%a"),
         Day = factor(Day, levels = c("일","월","화","수","목","금","토")), #데이에서 빼오기 
         Time = format(event_time2, "%H"), # 타임에서 빼오기
         Time = as.numeric(Time),  
         Time_G = ifelse(Time < 9, "새벽",
                         ifelse(Time < 13, "오전",
                                ifelse(Time < 19, "오후","저녁"))),
         Time_G = factor(Time_G, levels = c("새벽","오전","오후","저녁")),
         Month = format(event_time2,"%m"),
         Month = as.numeric(Month),
         YM = paste0(format(event_time2,"%y"),"-",format(event_time2,"%m")))

  

# 월별로 나누기 해보기 

# 축을 이중 축으로 만들어 보는것것


Monthly = Sample_Data2 %>%
  filter(event_type == "purchase") %>%
  group_by(YM) %>%
  summarise(Price = sum(price),
            Count = n())


Max_Count = max(Monthly$Count) * 5 

library(ggplot2)

# 그래프를 통해 이중 축을 을 그려볼 수 있습니다. 


# 이벤트 부분의 구매 부분에서 그룹을 ym을 해야 한다. 

Sample_Data2 %>%
  filter(event_type == "purchase") %>%
  group_by(YM) %>%
  summarise(Price = sum(price),
            Count = n()) %>%
  ggplot() +
  geom_bar(aes(x = YM, y = Price), stat = 'identity', alpha = 0.5) +
  geom_line(aes(x = YM, y = Count * 5), group = 1, col = "red", size = 2) +
  geom_label(aes(x = YM, y = Price, label = Price)) +
  scale_y_continuous(sec.axis = sec_axis(~.*Max_Count, name="Sailing Count")) +
  theme_bw()



