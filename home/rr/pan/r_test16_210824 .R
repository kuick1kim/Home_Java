# 여러가지를 모아보자자

library(shiny)

library(shiny)

ui <- fluidPage(
  uiOutput("moreControls")
)

server <- function(input, output, session) {
   output$moreControls = renderUI({
     tagList(
       sliderInput("n", "N", 1, 1000, 500),
       textInput("label","Label")
     )
   })
}

shinyApp(ui, server)
