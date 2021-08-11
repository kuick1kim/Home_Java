m1 = c(1, 2, 3, NA, 4, NA)

m2 = c(6, NA, 7, 8, 9, NA)



missing_data = data.frame(
  
  v1 = m1,
  
  v2 = m2
  
)

missing_data



is.na(m1) # 결측치를 TRUE로 표시



#결측치의 개수

sum(is.na(m1))



#결측치가 아닌 개수

sum(!is.na(m1))



#데이터 프레임에 대한 결측치 개수

colSums(is.na(missing_data))



#데이터 프레임에서 결측치 제거

#한 열에 대해서

missing_data[!is.na(missing_data[,c("v1")]),]



#두 열에 대해서

missing_data[!is.na(missing_data[,c("v1")]) &
               
               !is.na(missing_data[,c("v2")]),]



#함수 사용으로 한번에 결측치 제거 (모든열에 대해서 한번에)

na.omit(missing_data)



# 결측치를 가진 값 연산(제거/무시)

# 무시 하기

missing_data$v1[is.na(missing_data$v1)] = mean(missing_data$v1, na.rm = TRUE)

missing_data$v2[is.na(missing_data$v2)] = mean(missing_data$v2, na.rm = TRUE)

missing_data

