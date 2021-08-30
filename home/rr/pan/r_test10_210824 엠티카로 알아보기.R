
# 1 문자해보기
# 
# 2. 패스워드 해보기
# 
# 3. 숫자
# 
# 4. 슬라이드
# 
# 5. 셀렉트
# 
# 6. 라디오 버튼
# 7. 체크박스 

엠티카로 해보자 



# mtcars

# View(mtcars)


library(shiny)

ui <- fluidPage(
  
  h2(textOutput("txt")),
  verbatimTextOutput("sum1")
)

server <- function(input, output, session) {
  output$txt =renderText({
    "엠티카 활용"
  })
  output$sum1 = renderPrint({
    summary(lm(mpg~wt + qsec,data = mtcars))
  })
}

shinyApp(ui, server)



