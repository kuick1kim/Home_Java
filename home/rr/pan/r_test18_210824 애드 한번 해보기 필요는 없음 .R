# 애드버튼 만드는데 뭐에다 쓰는지는 잘 모름


# View(mtcars)
library(shiny)

library(shiny)

ui <- fluidPage(
  actionButton("add", "addUI")
)

server <- function(input, output, session) {
  observeEvent(input$add,{
    insertUI(
      selector = "#add",
      where = "afterEnd",
      ui = textInput(paste0("txt", input$add),
                     "Insert some text")
    )
  })
}

shinyApp(ui, server)
