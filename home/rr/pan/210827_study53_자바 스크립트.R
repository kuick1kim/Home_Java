library(shiny)

ui <- fluidPage(
  useShinyjs(),
  textInput("text", "텍스트"),
  #텍스트를 넣어라
  actionButton("btn", "클릭"),
  # 액션버튼을 누를 수 있게
  textOutput("inputText")
  # 텍스트 출력
)
server <- function(input, output) {
  observe({
    
    # 글씨가 없을때는 꺼지고 글씨가 있으면 켜지고
    if(is.null(input$text)|| input$text == ""){
      disable("btn")
    }else{
      enable("btn")
    }
  })
  
  # 
  observeEvent(input$btn, {
    output$inputText = renderText({
                     #렌더 텍스트 = 텍스트를 보여줘라
      isolate(input$text)
      # 아이솔레이트는 동기화이다. 
    })
    show("text")
  })
}
shinyApp(ui, server)
