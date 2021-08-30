
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




ui <- fluidPage(
  checkboxGroupInput("sels", "전공 언어 (복수 선택 가능)",
                     c("C++","Java", 
                       "JavaScripts", "R", "Perl")),
  verbatimTextOutput("langs")
  
)

server <- function(input, output, session) {
  output$langs = renderPrint({
    input$sels
  })
}

shinyApp(ui, server)