
library(shiny)

ui <- fluidPage(
  tags$script('
              Shiny.addCustomMessageHandler("myData", function(message) {
                $("#display").text(JSON.stringify(message));
                });
                '),
  actionButton("send", "데이터(mtcars) 볼까"),
  tags$div(id = "display")
)

server <- function(input, output, session) {
  observeEvent(input$send, {
    session$sendCustomMessage("myData", iris)
  })
}

shinyApp(ui, server)
