# RStudio에서 Source 버튼을 클리하여 실행한 다음 R 콘솔에서 다음을 실행
## gghisto()

library(shiny)
library(miniUI)
library(ggplot2)

gghisto = function(){
  
  
  ui <- miniPage(
    miniTitleBar("히스토그램(난수의 갯수와 binwidth)",
                right =  miniTitleBarButton("done","완료", primary= TRUE)),
    sliderInput("rnd", "난수의 개수", value= 300, min=1 , max =3000),
    sliderInput("bin_width", "구간의 너비", value = 0.1, min=0, max=1),
    miniContentPanel(
      plotOutput("myPlot", height = "100%")
    )
  )
  
  server <- function(input, output, session) {
    pl = reactive({
      df = data.frame(x=rnorm(input$rnd))
      ggplot(df) + geom_histogram(aes_string(df$x),
                                  binwidth = input$bin_width,
                                  fill = "steelblue")+
        labs(x = "Standard Normal Random Numbers",
             title = paste("N:", input$rnd, "Bin Width:", input$bin_width)
             )
    })
    output$myPlot = renderPlot({
      pl()
    })
    
    observeEvent(input$done,{
      stopApp(pl())
    })
  }
  
  runGadget(
  shinyApp(ui, server)
  )
}

# RStudio에서 Source 버튼을 클리하여 실행한 다음 R 콘솔에서 다음을 실행
## gghisto()