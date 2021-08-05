# mutate () 기존 데이터에 파생변수를 추가

exam1=read.csv("exl.csv")

exam1 %>% 
  mutate(total= science, 
  mean=(math + english +science)/3) %>% 
  head



exam1 %>% 
  mutate(test= ifelse(science >=60, "pass", "fail")) %>% 
  head


exam1 %>% 
 summarise(mean_math = mean(math))
  
  
  extractNoun("하나님이 세상을 이처럼 사랑하사 독생자를 주셨으니 이는 저를 믿는자 마다 멸망하지 않고 영생을 얻게하려 하심이로다")
  
  
#1. 회사별
#2. sub 추출
#3. 통합연비 변수 생성
#4. 통합연비 평균 산출
#5. 내림차순
#6. 1-5위까지 출력

mpg %>% 
  group_by(manufacturer) %>%  #회사별
  filter(class == "suv") %>%  # 클래스별 
  mutate(tot =(cty+hwy)/2) %>% # 연비변수를 추가함
  summarise(mean_tot= mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)  
  
#데이터 합치기  

test1= data.frame(id = c(1,2,3,4,5),
                  midterm = c (60,80,70,80,85))
test2= data.frame(id = c(1,2,3,4,5),
                  midterm = c (70,83,65,95,80))
  
test2

total = left_join(test1 + test2, by='id')
total
  