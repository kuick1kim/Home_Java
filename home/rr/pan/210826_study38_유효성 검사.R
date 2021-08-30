library(shiny)

ui <- fluidPage(
  titlePanel("사용자 이름과 나이"),
  textInput("myName",  "이름", placeholder = "이름입력"),
  numericInput("myAge", "나이", value = NULL,  min = 1, max = 110),
  textOutput("mine")
)

server <- function(input, output) {
  output$mine <- renderText({
    paste("당신의 이름은", input$myName, "이며, 나이는", input$myAge, "세입니다.")
  })
}

shinyApp(ui, server)
