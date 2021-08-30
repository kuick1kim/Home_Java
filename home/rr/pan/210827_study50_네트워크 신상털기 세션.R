library(shiny)

ui <- fluidPage(
  verbatimTextOutput("session_info")
  
)

server <- function(input, output, session) {
  output$session_info <- renderPrint({
    url_info <- list(
      url_protocol = session$clientData$url_protocol,
      url_hostname = session$clientData$url_hostname,
      url_port = session$clientData$url_port,
      url_pathname = session$clientData$url_pathname,
      
      url_search = session$clientData$url_search,
      url_hash_initial = session$clientData$url_hash_initial
      
    )
    unlist(url_info)
    
  })
}

shinyApp(ui, server)