library(shiny)

numberDisplayUI <- function(Id ) {
  ns <- NS(Id)
  tagList(
    sliderInput(ns("inputNum"), "Select Number:", min = 1, max = 500, value = 50),
    textOutput(ns("outputNum"))
  )
}

numberDisplay <- function(input, output, session) {
  output$outputNum <- renderText({
    input$inputNum
  })
}




# -------------------------------------------------------------------
ui <- fluidPage(
  numberDisplayUI("firstId"),
  numberDisplayUI("secondId"),
  numberDisplayUI("secondId2")
)
server <- function(input, output) {
  callModule(numberDisplay,"firstId")
  callModule(numberDisplay,"secondId")
  
  callModule(numberDisplay,"secondId2")
}

shinyApp(ui, server)