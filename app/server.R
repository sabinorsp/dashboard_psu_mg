server <- function(input, output, session) {
  
  output$plot_hist <- renderPlot({
    plot_hist(input$SelectHospital, input$especialidade)
  })
  
  output$SelectHospital <- renderUI ({
    df <- select(df_orig, Hospital) %>% filter(df_orig$Especialidade == input$especialidade)
    hospitals <- as.factor(df$Hospital)
    selectInput("SelectHospital",'2° - Selecione o Hospital:', choices = hospitals)
  })
  
  output$sum <- renderPrint({
    summaryPrint(input$SelectHospital, input$especialidade)
  })
  
}# End 
