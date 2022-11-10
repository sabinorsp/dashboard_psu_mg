library(shiny)
source('functions/plot_results.R')

ui <- fluidPage(
  
  titlePanel("Resumo Estatístico notas Residencia Médica PSU 2022 - MG "),

  sidebarLayout(
  
    sidebarPanel(
      selectInput("especialidade",label="1° - Escolha a Especialidade",choice=c('',list_especialidade),  selectize = F),
      uiOutput('SelectHospital')
      ),# End sidebarPanel
      
    mainPanel(
      
      plotOutput(outputId = 'plot_hist'),
      h2("Resumos estatísticos: "),
      verbatimTextOutput('sum')
      
    ) # End mainPanel
    
  )# End sidebarLayout
 ) # End Fluid