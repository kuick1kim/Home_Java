
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
library(broom)

library(shiny)

ui <- fluidPage(
  h2(textOutput("txt")),
  tableOutput("tab1")
)

server <- function(input, output, session) {
  output$txt = renderText({
    "엠티카"
  })
  output$tab1 = renderTable({
    tidy(lm(mpg~wt + qsec +hp, data = mtcars))
  }, striped =TRUE , hover= TRUE, bordered = TRUE)
}

shinyApp(ui, server)

