
library(shiny)
library(shinyjs)

ui <- fluidPage(
  useShinyjs(),
  textInput("text", "텍스트"),
  #텍스트 입력하는곳
  a(id = "clickme", "클릭하면 입력한 텍스트가 출력됩니다."),
  #링크 걸리는곳
  textOutput("inputText")
)

server <- function(input, output) {
  onclick("clickme", {
    # 온클릭 클릭을 할때때
    output$inputText <- renderText({
      
      isolate(input$text)
    })
  })
}

shinyApp(ui, server)