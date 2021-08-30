library(shiny)
shinyApp(
ui <- fluidPage(
  actionButton("show", "Show")
),
  server <- function(input, output) {
  observeEvent(input$show,{
    showNotification("This is a notification.")
  })
}
)
# shinyApp(ui, server)