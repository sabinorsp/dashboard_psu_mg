library(tidyverse)


# Importação do dataset
df_orig <- read_csv('data/dataset_organizado.csv', show_col_types = FALSE)

View(df_orig)

str(df_orig)

# resumos estatísticos dos valores númericos
summary(df_orig[c('Nota_Prova', 'Nota_Curriculo', 'Total')])

# plot boxplot geral, variáveis númericas: 
boxplot(df_orig$Total, main ='Boxplot para as notas Total Todas Especialidades', ylab= 'Total Nota' )
boxplot(df_orig$Nota_Prova, main = 'Boxplot para as notas Provas Todas Especialidades', ylab = 'Notas Provas')
boxplot(df_orig$Nota_Curriculo, main = 'Boxplot para notas Curriculos Todas Especialidades', ylab= 'Notas Curriculo')

# Histogramas : 
hist(df_orig$Total, main='Hist Total Notas Geral', xlab='Notas Total')
hist(df_orig$Nota_Prova, main='Hist Notas Provas Geral', xlab='Nota Prova')
hist(df_orig$Nota_Curriculo, main='Hist Notas Curriculo Geral', xlab = 'Nota Curriculo')

# Medidas de dispersão para as variáveis numéricas: 
var(df_orig$Nota_Prova)
var(df_orig$Nota_Curriculo)
var(df_orig$Total)
sd(df_orig$Nota_Prova)
sd(df_orig$Nota_Curriculo)
sd(df_orig$Total)

## Análise para variáveis categóricas
df_orig$Hospital <- as.factor(df_orig$Hospital)
df_orig$Especialidade <- as.factor(df_orig$Especialidade)
table(df_orig$Hospital)
length(table(df_orig$Hospital))
table(df_orig$Especialidade)
list_hospital <- levels(df_orig$Hospital)
list_especialidade <- levels(df_orig$Especialidade)






