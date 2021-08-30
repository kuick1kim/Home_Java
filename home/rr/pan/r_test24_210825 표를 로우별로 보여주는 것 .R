library(shiny)

ui <- fluidPage(
  column(4,
         numericInput("x", "Value", 5),
         br(),
         actionButton("button", "Show")
         ),
  column(8, tableOutput("table"))
) 


server <- function(input, output) {
  observeEvent(input$button,{
    
   cat("showing", input$x, "row\n") 
  })
  
  df= eventReactive(input$button,{
    head(mpg,input$x)
  })
  
  
  output$table = renderTable({
    df()
  })
  }

shinyApp(ui, server)



View(cars)
View(mpg)
