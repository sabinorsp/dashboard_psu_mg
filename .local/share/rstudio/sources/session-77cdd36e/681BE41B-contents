library(dplyr)
library(readr)

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

hospital_list <- function(esp){
    data <- df_orig %>% filter(Especialidade == esp) %>% data.frame()
    data$Hospital <- droplevels(data$Hospital)
    table <- table(data$Hospital) %>% data.frame()
    df_sum <- data %>% group_by(Hospital) %>%
              summarise(media = mean(Total),
                        terc_quartil = quantile(Total)[4]) %>% data.frame()
    table <- cbind(table, df_sum$media, df_sum$terc_quartil)
    colnames(table) <- c('Hospitais', 'Qtd de inscritos', 'Média Nota Total', '3° Quartil')
    return(table[order(-table$`Qtd de inscritos`),])
}

by_hospital <- function(esp, hosp){
  data <- df_orig %>% filter(Hospital == hosp) %>%
    filter(Especialidade == esp)
  table <- data %>% select(Nota_Prova, Nota_Curriculo, Total)
  return(table[order(-table$Total), ])
}

