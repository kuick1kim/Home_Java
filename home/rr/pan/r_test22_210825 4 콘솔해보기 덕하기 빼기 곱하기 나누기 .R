# 콘솔에서 변수를 숫자로 바꿀수가 있다
# 태그를 선택할때마다 변경할 수 있다. 


library(shiny)

ui <- fluidPage(
  titlePanel("간단한 계산 앱"),#큰 대문짝만하게 쓰는글
  wellPanel(
    p("숫자 2개와 계산법을 선택하셔요")#회색으로 글 쓰는칸 만들기 
  ),
  textInput("num1","첫번째 숫자"),
  textInput("num2","두번째 숫자"),
  radioButtons("cal", "계산법 선택", c("+" = "더하기",
                                  "-" = "빼기","x" = "곱하기",
                                  "%" = "나누기"), inline=TRUE),
  h2("결과"),
  textOutput("result")
  )

server <- function(input, output, session) {
  outputTxt = reactive({
    require(input$num1, input$num2)
    num1 = as.numeric(input$num1)
    num2 = as.numeric(input$num2)
    switch(input$cal,
           "더하기"={paste(num1,"+",num2, "=", num1+num2)},
          "빼기"={paste(num1,"-",num2, "=", num1-num2)},
           "곱하기"={paste(num1,"*",num2, "=", num1*num2)},
          "나누기"={paste(num1,"%",num2, "=", round(num1/num2,2))})
    
  })
  
  output$result = renderText({
    outputTxt()
  })
  
  observe({
    cat(outputTxt(), "\n")
  })
  
}

shinyApp(ui, server)
