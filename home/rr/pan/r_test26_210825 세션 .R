library(shiny)

ui <- fluidPage(
  textOutput("currentTime")
)

server <- function(input, output, session) {
  output$currentTime = renderText({
    invalidateLater(1000,session)
    paste("지금시간은", Sys.time())
  })
}

shinyApp(ui, server)