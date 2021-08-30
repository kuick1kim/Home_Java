# RStudio 편집창에서 Source 버튼을 클릭하여 실행

shinyApp(
  ui = basicPage(
    actionButton("show", "Show modal dialog")
  ),
  server = function(input, output) {
    observeEvent(input$show, {
      showModal(modalDialog(
        title = "Important message ",
        "This is an important message!이걸 눌러라라"
      ))
    })
  }
)

