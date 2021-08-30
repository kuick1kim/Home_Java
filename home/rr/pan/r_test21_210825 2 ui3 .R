


library(shiny)


shinyApp(
  ui= fluidPage(
    fluidRow(
      column(12,
             dataTableOutput('table'))
    )
  )
    , server= function(input, output){
      output$table = renderDataTable(mpg,
                  options = list(
                    pageLength=11,
                    initComplete=I("function(settings,json){
                                   alert('Done.')
                    ;}")
                  ))
      
    })


View(iris)
