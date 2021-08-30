library(shiny)
# install.packages("shinythemes")
library(shinythemes)





ui = navbarPage("App Title", theme = shinytheme("united"),
                tabPanel("Plot"),
                navbarMenu("More",
                           tabPanel("Summary"),
                           "--------",
                           "Section header",
                           tabPanel("Table")
                           )
  
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
