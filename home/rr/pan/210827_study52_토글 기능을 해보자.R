library(shiny)
library(shinyjs)



ui = fluidPage(
  
  useShinyjs(),
  textInput("text", "텍스트"),
  actionButton("hide", "위젯 숨기기/보이기")
)
server  = function(input, output) {
  observeEvent(input$hide, {
    toggle("text", anim = TRUE)
  
    })
  
}
shinyApp(ui, server)
