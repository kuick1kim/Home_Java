values = reactiveValues(a=3)

isolate(values$a)


b = isolate(values$a + 4)

isolate(b)

values$a =5





library(shiny)

ui <- fluidPage(
  
  actionButton("do","실행"),
  plotOutput("histo")
)

server <- function(input, output, session) {
  observeEvent(input$do,{
    output$histo =renderPlot({
      histo(rnorm(1000))
    })
  })
}

shinyApp(ui, server)







library(shiny)

ui <- fluidPage(
  actionButton("do", "실행"),
  plotOutput("histo")
)

server <- function(input, output, session) {
  df= eventReactive(input$do, {
    rnorm(1000)
  })    
  
  output$histo = renderPlot({
    hist(df())
  })
  
}

shinyApp(ui, server)









# ========정의길 님 ============

library(shiny)

ui <- fluidPage(
  actionButton("do", "실행"),
  plotOutput("histo")
)

server <- function(input, output, session) {
  df= eventReactive(input$do, {
    rnorm(1000)
  })    
  
  output$histo = renderPlot({
    hist(df())
  })
  
}

shinyApp(ui, server)

