# 여러가지를 모아보자자

library(shiny)
library(ggplot2)

library(shiny)

ui <- fluidPage(
  titlePanel("diaminds데이터"),
  selectInput(
    "plotType", "plotType",
    c(Scatter= "scatter",
      Histogram="hist")  ),
  conditionalPanel(
    condition = "input.plotType=='hist'",
    selectInput(
      "breaks", "breaks",
      c("sturges", "Scott",
        "Freedman-Diaconis",
        "[Custom]"= "custom")),
    conditionalPanel(
      condition = "input.breaks=='custom'",
      sliderInput("breaksCount", "Break Count", min =1, max = 1000, 
                  value = 10)
      
  )
), plotOutput("plot")
)

server <- function(input, output, session) {
  brs = reactive({
    if(input$breaks == "custom"){
      input$breaksCount
    }else{
      input$breaks
    }
    
  })
  p=reactive({
    if(input$plotType=="scatter"){
      plot(diamonds$carat, diamonds$price, col="red")
    }else{
      hist(diamonds$carat, breaks = brs())
    }
  })
  output$plot=renderPlot({
    p()
  })
}

shinyApp(ui, server)
