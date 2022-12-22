library(shiny)
library(DT)
source('functions/plot_results.R')

ui <- fluidPage(
  
  titlePanel("Histórico Notas Residência Médica PSU 2022 - MG "),
  h5('Essa aplicação reúne os resultados das notas da edição do PSU de 2022-MG.'),
  h5('Esse Dashboard tem como objetivo  promover  pesquisas em dados históricos dos resultados 
     e servir ao candidato uma visualização de forma direta e simplificada.'),
  br(),
  br(),
  br(),
    sidebarLayout(
  
    sidebarPanel(
      selectInput("especialidade",label="1° - Escolha a Especialidade",choice=c('',list_especialidade),  selectize = F),
      uiOutput('SelectHospital'),
      h5('Desejamos continuar evoluindo com esta aplicação! 
         Por isso gostariamos de receber comentários e críticas! '),
      h5('Caso deseje contribuir, basta encaminhar um email com assunto FEEDBACK para:'),
      tags$a(href="https://forms.gle/vMN9jdCBhrfTtjqL9", "Acesso Formulário.")
      ),# End sidebarPanel
      
    mainPanel(
      
      DT::dataTableOutput('table'),
      br(),
      br(),
      DT::dataTableOutput('table_hospital'),
      plotOutput(outputId = 'plot_hist'),
      h2("Resumos estatísticos: "),
      verbatimTextOutput('sum')
      
      
    ) # End mainPanel
    
  )# End sidebarLayout
 ) # End Fluid
