# 애드버튼 만드는데 뭐에다 쓰는지는 잘 모름


# View(mtcars)
library(shiny)

library(shiny)

ui <- fluidPage(
  textInput("myText", "텍스트 입력"),
  verbatimTextOutput("txt")
  )

server <- function(input, output, session) {
  output$txt = renderPrint({
    req(input$myText)
    input$myText
  })
}

shinyApp(ui, server)
