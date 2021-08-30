

# install.packages("shinyjs")
library(shinyjs)

library(shiny)

ui <- fluidPage(
  useShinyjs(),
  
  actionButton("button", "Click me"),
  textInput("text","글씨를 쓰세요요")
)

server <- function(input, output, session) {
  observeEvent(input$button,{
    toggle("text")
  })
}

shinyApp(ui, server)