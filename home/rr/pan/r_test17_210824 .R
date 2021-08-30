# 여러가지를 모아보자자

View(mtcars)
library(shiny)

library(shiny)

ui <- fluidPage(
  titlePanel("표나 플롯"),
  radioButtons("selected", label = "표시할 내용 선택", choices = list("table",
                                                               "plot")),
  
  uiOutput("tbl2"),
  uiOutput("plot2"),
)

server <- function(input, output, session) {
   output$tbl = renderTable({
     mtcars
   })
   output$tbl2 = renderUI({
     if(input$selected == "table"){
       tableOutput("tbl")
     }
   })
   
   output$plt = renderTable({
     plot(mtcars$wt, mtcars$mpg)
   })
   output$plot2 = renderUI({
     if(input$selected == "plot"){
       plotOutput("plt")
     }
   })
   
}

shinyApp(ui, server)
