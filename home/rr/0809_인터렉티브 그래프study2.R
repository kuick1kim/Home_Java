exam = read.csv("D:/kjw_data/00R/R/exl.csv")
exam[]
exam[1,]
exam[2,]
exam[,1]
exam[,2]
exam[,3]

exam[exam$class ==1,]   #클래스가 1인 행만

exam[exam$math >=20,]   #클래스가 1인 행만

exam[exam$class <=2 & exam$math>30,]   #클래스가 1인 행만

exam[exam$english <90 | exam$science <50,]


#==========================================================

# 열에대한 조건

exam [,3]
exam[, "math"]
exam[, "class"]

exam[, c("class","math","english")]


#행열같이 해보기

exam[1:3,3:5]

exam[1:11,"english"]

dim(exam)

exam[exam$math >= 50, "english"]

exam[exam$math >= 50, c("english","science","class")]




#dplyr 안에 있는 내장함수

# 내장함수

exam$tot =(exam$math + exam$english + exam$science)/3

aggregate(data = exam[exam$math >=50 & exam$english >=80,], tot~class, mean)

exam %>% 
  filter(math >=50 & english >=80) %>% 
  mutate(tot= (math +english +science)/3) %>% 
  group_by(class) %>% 
  summarise(mean = mean(tot))

var1= c(1,2,3,1,2)
var2= factor(c(1,2,3,1,2)) #종류만 보여줌

var1
var2

# 연산에서
var1+2 # 연산이 된다
var2+2 #연산이 안된다

#class()를 이용하면 변수타입확인가능하다

class(var1)

class(var2)
table(var2)
#factor를 연산으로 이용하고자하면
# numeric으로 변경하면 된다.

var3 = as.numeric(var2)
var3+1*3
var3

#함수 


a= 1
a

b="hello"
b

x1 = data.frame(var1=c(1,2,3),
                var2=c("a","b","c"))
x1

x2= matrix(c(1:12), ncol=2)
x2
        
  
x3= array(1:20, dim = c(2,5,2))
x3

#리스트

x4 = list(f1 = a,
          f2 = x1,
          f3 = x2,
          f4 = x3)
x4





#example : boxplot 출력결과를 리스트 형태로

mpg = ggplot2::mpg
x = boxplot(mpg$cty)
x
