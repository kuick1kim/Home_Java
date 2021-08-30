# 애드버튼 만드는데 뭐에다 쓰는지는 잘 모름


# View(mtcars)
library(shiny)

library(shiny)

ui <- fluidPage(
  actionButton("rmv", "RemoveUI"),
  textInput("txt", "This is no longer useful")
  )

server <- function(input, output, session) {
  observeEvent(input$rmv,{
    removeUI(
      selector = "div:has(> #txt)"
    )
  })
}

shinyApp(ui, server)
