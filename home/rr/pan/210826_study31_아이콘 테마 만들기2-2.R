# RStudio의 편집창에서 Source 버튼을 클릭해서 실행
shinyApp(
  ui = navbarPage("United",
                  theme = shinythemes::shinytheme("united"),
                  tabPanel("Plot", "Plot tab contents..."),
                  navbarMenu("More",
                             tabPanel("Summary", "Summary tab contents..."),
                             tabPanel("Table", "Table tab contents...")
                  )
  ),
  server = function(input, output) { }
)

