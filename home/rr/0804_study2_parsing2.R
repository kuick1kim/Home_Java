df_raw=  data.frame(var1= c(1,2,1),  var2= c(2,3,2))

df_raw

df_new =df_raw
df_new

print(df_new)
print( df_raw)

df_new = rename(df_new, 김민상=v2)
df_new
df_raw



df =data.frame(var1= c(4,3,8),
              var2= c(2,6,1))
df$var_sum = df$var1+ df$var2
df

df_new
df$varvar = df$var_sum + df_new$김민상

df
df$mean = (df$var1 + df$var2)/2


mpg$total = (mpg$cty + mpg$hwy)/2
head(mpg)

#내가 만든 total이 20 이상이면 합격 그렇지 않으면 fail
mpg$test= ifelse(mpg$total >=20, "pass", "fail")
mpg

# \
library(ggplot2)


head(mpg , 20)
table(mpg$test)
qplot(mpg$test)
mpg$grade = ifelse(mpg$total >=25,"A",ifelse(mpg$total >=20, "b", ifelse(mpg$total >=15, "c", "d")))



# 등급 빈도표 생성
table(mpg$grade)
#등급 막대그래프
qplot(mpg$grade)

