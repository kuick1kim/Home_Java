
f1 = function(x){
  y=2*x+1
  return(y)
}

#변수 선언은 없고, 함수만 선언한다. 

f1(3)

list = c(1,2,3,4)

f1(list)
for(k in length(list)) {
  a=f1(k)
  print(a)
}


# y = 3x²+2x +3



f2 = function(x1, x2){
  y= 3*x1^2 + 2*x2 +3
  return(y)
}

f2(3,4)


f3 = function(x){
  y= 3*x^2 + 2*x +3
  return(y)
}

f3(3)





#문자에 대한 사용자 정의 함수

f4 = function(Input){
  if(Input =='Hello'){
    Response = 'hi'
  }else if(Input=='sorry'){
    Responde = 'Its OK'
  }else{
    Response = "Error"
  }
  return(Response)
}

f4('Hello')
f4("Hello")

f4("sorry")

f4("ttt")
