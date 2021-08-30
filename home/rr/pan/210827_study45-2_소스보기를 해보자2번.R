library(shiny)
library(miniUI)
# # install.packages("miniUI")
# library(shiny)

# library(shiny)
# View(mpg)
# data()
# 
# myData = mtcars
# 
# 
# ui <- fluidPage(
#   # TitleBar("연습장"),
#   verbatimTextOutput("txt")
# )
# 
# server <- function(input, output, session) {
#   output$txt = renderPrint({
#     head(myData)
#   })
#   
#   observeEvent(input$done,{
#     k= lapply(myData, class)
#     stopApp(k)
#   })
# }
# 
# shinyApp(ui, server)
# 
# 





myG <- function(myData) {
  ui <- miniPage(
    gadgetTitleBar("연습장"),
    verbatimTextOutput("txt")
  )
  
  server <- function(input, output, session) {
    output$txt <- renderPrint({
      head(myData)
    })
    observeEvent(input$done, {
      k <- lapply(myData, class)
      stopApp(k)
    })
  }
  
  runGadget(shinyApp(ui, server))
}
