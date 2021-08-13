
Audi =read.csv("D:/kjw_data/00_R/data/audi.csv")
View(Audi)
head(Audi)
library(dplyr)

Audi12= Audi %>% 
  group_by(model) %>% 
  summarise(Count=n()) %>% 
  filter(model %in% c(" A1"," A2"," A3"," A4"))

head(Audi12)





# ==========/아우디를 그룹을 모델별로하고, 평균을 갯수를 내고/===========
#===========/필터를 /================

Audi13= Audi %>% 
  group_by(model) %>% 
  summarise(Mean= mean(price)) %>% 
  filter(model %in% c(" A3"," A4", " A5", " A6"))

Audi13
# =======================/데이터를 left조인/========================

Audi14= Audi12 %>% 
  left_join(Audi13, by="model")

head(Audi14)  

# =======================/데이터를 right조인/========================

Audi15= Audi12 %>% 
  right_join(Audi13, by="model")

head(Audi15)  



# =======================/데이터를 풀조인/========================

Audi16= Audi12 %>% 
  full_join(Audi13, by="model")

head(Audi16)  


# ========================================

Audi =read.csv("D:/kjw_data/00_R/data/1/audi.csv")
View(Audi)

Audi$model <- gsub(' ','', Audi$model)


# ========/공백제거하는것 trim/ ========================




Audi

head(Audi)
Audi12= Audi %>% 
  group_by(model) %>% 
  summarise(Count=n()) %>% 
  filter(model %in% c("A1"," A2"," A3"," A4"))

head(Audi12)


