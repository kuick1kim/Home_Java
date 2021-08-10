#install.packages("ggiraphExtra")
library(ggiraphExtra)

# 문자로 바꿔주기 
str(USArrests)
head(USArrests)

library(tibble) # 데이터프레임 

crime <-rownames_to_column(USArrests, var='state')

head(crime)


crime$state <- tolower(crime$state) # 소문자로 변환 
crime$state
str(crime)



library(ggplot2)
#install.packages("maps")
library(maps)

states_map<- map_data('state')
str(states_map)

#install.packages("mapproj")
library(mapproj)



ggChoropleth(data=crime, # 지도에 표시할 데이터 
             aes(fill-Murder, #색깔로 표시할 변수 
                 map_id=state), # 지역 기준 변수 
             map=states_map) # 지도데이터 


ggChoropleth(data= crime, # 지도에 표시할 데이터 
             aes(fill=Murder,# 색깔로 표시할 변수
                 map_id=state), # 지역 기준 변수 
             map=states_map, # 지도 데이터 
             interactive = T)
