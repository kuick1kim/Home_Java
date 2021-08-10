install.packages("foreign")

library(foreign)
# SPSS 불러오기

library(ggplot2)
library(dplyr)
library(readxl)

raw = read.spss(file = "d:/01R/k1.sav", to.data.frame =  T)

#View(raw)

welfare=raw
#View(welfare)
dim(welfare)
str(welfare)

welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)


#install.packages("sas7bdat")
#library(sas7bdat)
#sas= read.sas7bdat(file="d:/01R/k16.sas7bdat")
# 변수를 보기
dim(welfare)



class(welfare$code_region)
table(welfare$code_region)
welfare$code_region


welfare

list_region = data.frame(codo_region=c(1:7),
                         region = c("서울",
                                    "수도권(인천/경기)",
                                    "부산/경남/울산",
                                    "대구/ 경북",
                                    "대전/ 충남",
                                    "강원/ 충북",
                                    "광주/전남/전북/제주도"
                                    ))
welfare$sex =ifelse(welfare$sex==9,NA, welfare$sex)
table(welfare$sex)
table(is.na(welfare$sex))

welfare$sex = ifelse(welfare$sex==1,"male","female")
table(is.na(welfare$sex))

qplot(welfare$sex)



circle <- table(welfare$sex)
pct <- round(circle/sum(circle)*100,2)
label <- paste(names(circle), "\n", pct, "%")
pie(circle, labels=label, init.angle=90)

table(welfare$income)
summary(welfare$income)
qplot(welfare$income) + xlim(1000,2400) +ylim(0,4)
qplot(welfare$income) + xlim(0,1000)

welfare$income = ifelse(welfare$income %in% c(0,9999), NA , welfare$income)

table(is.na(welfare$income))


# 성별에 따른 월급차이

sex_incomeA = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))
  
sex_incomeA
# qplot(sex_incomeA)






class(welfare$birth)
summary(welfare$birth)

qplot(welfare$birth)
boxplot(welfare$birth)

summary(welfare$birth)
table(is.na(welfare$birth))


welfare$age <- 2015-welfare$birth + 1
summary(welfare$age)

qplot(welfare$age)





age_income = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income=mean(income))


head(age_income)
age_income
#

ggplot(data = age_income, aes(x=age, y=mean_income)) + geom_line()


#나이를 나누다

welfare = welfare %>% 
  mutate(ageg = ifelse(age<30, "young", 
                       ifelse(age <=59, "middle", "old")))
table(welfare$ageg)

qplot(welfare$ageg)

ageg_income = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income =  mean(income))

ageg_income

ggplot(data=ageg_income, aes(x=ageg, y=mean_income))+ geom_col()


ggplot(data=ageg_income, aes(x=ageg, y=mean_income))+ geom_col() + 
  scale_x_discrete(limits = c("young","middle","old"))



#연령대 및 성별에 따른 월급의 차이
sex_income= welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg,sex) %>% 
  summarise(mean_income=mean(income))
sex_income

# welfare의 데이터중에 income 데이터를 가져다가
# ageg 와 성별로 나눠서 그룹으로 
#평균을 구한것을 봅니다.


ggplot(data=sex_income, aes(x=ageg, y=mean_income, fill=sex))+ geom_col()+
  scale_x_discrete(limits=c("young","middle","old"))
# 방금 구한 sex_income데이터에서 
#x 축은 ageg별로 나누고 , y 축은 평균 인컴을 넣어서 뽑아냅니다. 
# 나이별로 young, middle, old순으로 정렬로 보려고 합니다. 

ggplot(data=sex_income, aes(x=ageg, y=mean_income, fill=sex))+ geom_col(position="dodge")+
  scale_x_discrete(limits=c("young","middle","old"))
# 그래프를 따로 나눠 봅니다. 

sex_age = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age, sex) %>% 
  summarise(mean_income = mean(income))

head(sex_age)

#이번에는 welfare 데이터중에 income 부분만 필터링하여
# 성별에 따른 나이마다 평균을 낸 데이터를 가지고 그래프를 그려봅니다. 

ggplot(data=sex_age, aes(x=age, y=mean_income, col =sex))+
  geom_line()

# 여성이 나이가 들수록 소득이 줄어드는것을 볼 수 있습니다. 

# 이번에는 직업별 직군에 따른 소득평균을 알아보려고합니다. 
library(readxl)
list_job=read_excel("D:/01R/data/kcode.xlsx", col_names = T, sheet=2)
#엑셀에 2번 시트에서 잡 리스트를 가져옵니다. 
head(list_job)

dim(list_job)


welfare = left_join(welfare, list_job, id = "code_job")

# 시트2에 있던 리스트를 welfare에 붙입니다


welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job,job) %>% 
  head(10)

#welfare에 새로 붙인 코드잡을 중심으로 필터링합니다
# 선택은 code_job과 job만 봅니다. 

#이번에는 직업별 인컴을 보려고 합니다. 
job_income = welfare %>% 
  filter(!is.na(job)&!is.na(income)) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income))

head(job_income)

# # welfare 데이터에서
# 필터로 job과 income을 필터링 합니다
# 그 것들을 그룹을 job으로 그룹을 만듭니다. 
# 그룹별로 평균을 냅니다


# 이번에는 내림차순으로 10개만 뽑아봅니다. 
top10 = job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)

top10

# 그래프 뽑아보기

ggplot(data = top10, aes(x=reorder(job,mean_income), y=mean_income))+ geom_col()

#그래프를 가로 그래프로 바꿉니다. 

ggplot(data = top10, aes(x=reorder(job,mean_income),y=mean_income))+  geom_col() + coord_flip()
              
       

# 이번에는 하위 낮은 직업 10개 뽑아봅니다다

bottom10=job_income %>% 
  arrange(mean_income) %>% 
  head(10)

bottom10


ggplot(data=bottom10, aes(x=reorder(job,-mean_income), y= mean_income))+
  geom_col() + coord_flip()+ ylim(0,850)

# 이번에는 ggplot에서 코드를 가로로 한다음에
# 그다음 변별도를 주기위해서 850을 가장 큰 값으로 넣습니다. 













# 이번에는 성별에 따른 직업의 빈도를 분석해 봅니다

job_male = welfare %>% 
  filter(!is.na(job) & sex == "male" ) %>% 
  # filter(!is.na(job)) %>% 
  group_by(job) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
# 남자만 뽑아봅니다
# welfare에서 필터로 성별이 male 인 사람을 job에서 뽑습니다
# 그룹을 job으로 분류합니다. 


job_male



job_female = welfare %>% 
  filter(!is.na(job)& sex =="female") %>% 
  group_by(job) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(10)

job_female  

ggplot(data=job_female, aes(x=reorder(job,n), y=n))+
         geom_col()+coord_flip()
# 여성의 빈도를 가로 높이로 나오는 것을 x좌표와 Y 좌표를 변경시킨것






