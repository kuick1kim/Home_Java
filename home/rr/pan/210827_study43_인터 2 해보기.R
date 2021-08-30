
library(shiny)

ui <- fluidPage(
  h2("인터랙티브 플롯의 기본"),
  plotOutput("plot1", click = "clicked_point"),
  h3("클릭한 위치정보"),
  p(verbatimTextOutput("event_info"))
)

server <- function(input, output, session) {
  output$plot1 = renderPlot({
    x = mtcars$wt
    y = mtcars$mpg
    plot(x,y)
  })
  
  output$event_info = renderText({
    paste("x:", input$clicked_point$x, "y:", input$clicked_point$y)
  })
}

shinyApp(ui, server)