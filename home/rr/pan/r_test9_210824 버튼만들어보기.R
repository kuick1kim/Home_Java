
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



library(shiny)

버튼이 아니고 움직이고 좌우로 
그리고 거기다가 버튼을 누름






library(shiny)

ui <- fluidPage(
  sliderInput("obs", "Number of observations", 0,100000,500),
  actionButton("goButton", "Go!"),
  plotOutput("distPlot")
  )

server <- function(input, output, session) {
  output$distPlot = renderPlot({
    input$goButton
    
    dist = isolate(rnorm(input$obs))
    hist(dist)
  })
}

shinyApp(ui, server)
