library(tidyverse)
# import do dataset
df_orig <- read_csv('data/dataset_organizado.csv', show_col_types = FALSE)
df_orig$Hospital <- as.factor(df_orig$Hospital)
df_orig$Especialidade <- as.factor(df_orig$Especialidade)
list_hospital <- levels(df_orig$Hospital)
list_especialidade <- levels(df_orig$Especialidade)

plot_hist <- function(hosp, esp){
  data <- df_orig %>% filter(Hospital == hosp) %>%
    filter(Especialidade == esp)
  hist(data$Nota_Prova, main='Histograma - Nota Total', xlab='Notas Total')
}

summaryPrint <- function(hosp, esp){
  data <- df_orig %>% filter(Hospital == hosp) %>%
    filter(Especialidade == esp)
  summary(data[c('Nota_Prova', 'Nota_Curriculo', 'Total')])                     
}



#list_especialidade[17]
#list_hospital[2]
#plot_hist(list_hospital[2], list_especialidade[17])
#summaryPrint(list_hospital[2], list_especialidade[17])
