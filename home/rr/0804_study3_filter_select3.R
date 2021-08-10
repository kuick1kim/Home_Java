library(dplyr)
exam = read.csv('../01R/exl.csv')

exam


exam %>% filter(class ==1)
exam %>% filter(class ==2)

filter(exam, class==1)# 
#1반이 아닌 경우

exam %>% filter(class !=1)

exam %>% filter(math >= 50)

exam %>% filter(english <80)

50점 이상 
exam %>% filter(class ==2 & math>=90)



exam %>% filter(class %in% c(1,3,5))


exam %>% filter(english <80 | science <50)

#영어만 선택 ----열만선택

exam %>% select(english)

# 수학만 빼고 해라
exam %>% select(-math , -id)

# filter 와 select의 조합

exam %>% 
  filter(class !=1) %>% 
  select(math)
#동일한것
exam %>%   filter(class !=1) %>%   select(math)

exam %>% 
  select(english) %>% 
  head(1)
