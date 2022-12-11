server <- function(input, output, session) {
  
  datall <- reactive({
      validate(
        need(input$especialidade !='', "Por favor, selecione uma especialidade! ")
      )
      input$especialidade
    })
  
  output$plot_hist <- renderPlot({
    try(plot_hist(input$SelectHospital, input$especialidade), silent = T)
  })
  
  output$SelectHospital <- renderUI ({
    df <- select(df_orig, Hospital) %>% filter(df_orig$Especialidade == input$especialidade)
    hospitals <- as.factor(df$Hospital)
    selectInput("SelectHospital",'2° - Selecione o Hospital:', choices = hospitals)
  })
  
  output$sum <- renderPrint({
    summaryPrint(input$SelectHospital, input$especialidade)
  })
  
  output$table <- DT::renderDataTable(datatable(
    hospital_list(datall()),
    options = list(pageLength = 5),
    caption = 'RESULTADO ESPECIALIDADE POR HOSPITAL:',
    style = 'bootstrap') %>% formatRound(columns = c('Média Nota Total', '3° Quartil'), digits = 2) 
  )
  
  output$table_hospital <- DT::renderDataTable(datatable(
    by_hospital(input$especialidade, input$SelectHospital),
    options = list(pageLength = 5),
    caption = 'ORDENAÇÃO DE NOTAS POR HOSPITAL SELECIONADO:',
    style = 'bootstrap') %>% formatRound(columns = c('Nota_Prova', 'Nota_Curriculo', 'Total'), digits = 2) 
  )
  
}# End 
