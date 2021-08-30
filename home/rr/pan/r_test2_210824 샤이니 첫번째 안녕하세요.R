
library(shiny)




ui <- fluidPage(
  textInput("myText", "텍스트를 입력하세요"),
  verbatimTextOutput("txt")
)



server <- function(input, output, session) {
  output$txt = renderPrint({
      req(input$myText)
      input$myText
  })
}

shinyApp(ui, server)


runExample()

# Valid examples are "01_hello", "02_text", "03_reactivity", "04_mpg", "05_sliders", "06_tabsets", "07_widgets", "08_html", "09_upload", "10_download", "11_timer"


runExample("07_widgets")

runExample("03_reactivity")
runExample("01_hello")
runExample("02_text")












패스워드 인풋해보기기
ui <- fluidPage(
    passwordInput("passwortd", "텍스트를 입력하세요"),
)



server <- function(input, output, session) {
    
}

shinyApp(ui, server)


