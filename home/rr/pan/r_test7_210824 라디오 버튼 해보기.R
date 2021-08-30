
library(shiny)











# 숫자자 눌러서 올리고 내리고 보기기
ui <- fluidPage(
    numericInput("obs","Observation:",10,  min= 1, max =100),
    verbatimTextOutput("value")
)
server <- function(input, output, session) {
    output$value = renderText({input$obs})
}

shinyApp(ui, server)




shiny::runGitHub(repo = "shiny-examples", username = "rstudio", subdir="003-reactivity")



# 
# 
# 1 문자해보기
# 
# 2. 패스워드 해보기
# 
# 3. 숫자
# 
# 4. 슬라이드
# 
# 5. 셀렉트
# 
# 6. 라디오 버튼
# 


library(shiny)

library(shiny)

ui <- fluidPage(
  radioButtons("dist", "Distribution type",
               c("Normal" = "norm",
                 "Uniform" = "unif",
                 "Log-normal" = "lnorm",
                 "Exopnential" = "exp")),
  plotOutput("distPlot")
)

server <- function(input, output, session) {
  output$distPlot = renderPlot({
    dist = switch(input$dist,
                   norm = rnorm,
                   unif = runif,
                   lnorm = rlnorm,
                   exp= rexp,
                   rnorm)
      hist(dist(5000))
    
  })
}

shinyApp(ui, server)



















