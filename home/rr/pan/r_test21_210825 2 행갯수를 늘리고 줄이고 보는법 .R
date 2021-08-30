library(shiny)

myData = mtcars

ui <- fluidPage(
    numericInput("sel", "mtcars 데이터 행갯수",
                 value =6 , min =6, max= nrow(myData)),
    tableOutput("carData")
    )

server <- function(input, output, session) {
  output$carData = renderTable({
    head(myData,input$sel)
  })
  
  tryCatch({
    x= input$set
  }, error = function(c)cat(c$message))
  # 트라이 캐치문을 콤마로 구분한다다
}

shinyApp(ui, server)
