library(readr)
library(dplyr)
library(tidyr)
data <- read_csv('data/resultados_residencia.csv', show_col_types = FALSE)

###############################################################################
# Limpeza e processamento dos dados relacionados as incrições prévias para 2023
#Cópia do data original para limpeza
df <- data.frame(data)
colnames(df) <- c(
  'Hospital',
  'Especialidade',
  'Candidato',
  'Pref',
  'Situacao',
  'Nota_Prova',
  'Bonus_Prova',
  'Nota_Curriculo',
  'Bonus_Curriculo',
  'Total'
)
# Retira as 2 primeiras linhas que não são dados pertinentes
df <- df[-1:-2,]


#Conta quantos NA tem em cada coluna
colSums(is.na(df))


# Subset df1 colunas: Hospital, Especialidade, Notas de provas e total
df1 <- select(df, Hospital, Especialidade, Nota_Prova, Nota_Curriculo, Total)


# Nesse caso, o Total contém um total de 432 NA, para resultados, aqui vamos dropar 
# do dataframe original df1 e salvar no df_na para podermos tratar e adicionar 
# posteriormente ao df1 original. 
df_na_original <- filter(df, is.na(Total))
df_na <- select(df1, Hospital, Especialidade, Nota_Prova, Nota_Curriculo, Total) %>% 
  filter(is.na(Total))


# [1:48] Correçao
df_na$Total[1:48] <- df_na$Nota_Curriculo[1:48]
df_na$Nota_Curriculo[1:48] <- df_na$Nota_Prova[1:48]
df_na$Nota_Prova[1:48] <- df_na_original$Pref[1:48]
# [49: 144] Correçao
df_na$Nota_Prova[49:144] <- df_na_original$Situacao[49:144]
df_na$Nota_Curriculo[49:144] <- df_na_original$Bonus_Prova[49:144]
df_na$Total[49:144] <- df_na_original$Bonus_Curriculo[49:144]
#[145:162]
df_na$Nota_Prova[145:162] <- df_na_original$Situacao[145:162]
df_na$Nota_Curriculo[145:162] <- df_na_original$Bonus_Prova[145:162]
df_na$Total[145:162] <- df_na_original$Bonus_Curriculo[145:162]
#[163:192]
df_na$Nota_Prova[163:192] <- df_na_original$Situacao[163:192]
df_na$Nota_Curriculo[163:192] <- df_na_original$Bonus_Prova[163:192]
df_na$Total[163:192] <- df_na_original$Bonus_Curriculo[163:192]
#[193:240]
df_na$Nota_Prova[193:240] <- df_na_original$Pref[193:240]
df_na$Nota_Curriculo[193:240] <- df_na_original$Nota_Prova[193:240]
df_na$Total[193:240] <- df_na_original$Nota_Curriculo[193:240]
#[241:288 ]
df_na$Nota_Prova[241:288] <- df_na_original$Situacao[241:288]
df_na$Nota_Curriculo[241:288] <- df_na_original$Bonus_Prova[241:288]
df_na$Total[241:288] <- df_na_original$Bonus_Curriculo[241:288]
#[289:432]
df_na$Nota_Prova[289:432] <- df_na_original$Pref[289:432]
df_na$Nota_Curriculo[289:432] <- df_na_original$Nota_Prova[289:432]
df_na$Total[289:432] <- df_na_original$Nota_Curriculo[289:432]

df1 <- drop_na(df1)

# Dataset editado para exploração dos dados
df1 <- rbind(df1,df_na)


# Alterando dados tipo char para numerico nas variáveis Nota_Prova, 
# Nota_ Curriculo e Total
df1$Nota_Prova <- gsub(',','.', df1$Nota_Prova)
df1$Nota_Curriculo <- gsub(',', '.', df1$Nota_Curriculo)
df1$Total <- gsub(',', '.', df1$Total)
df1$Nota_Prova <- sapply(df1$Nota_Prova, as.numeric)
df1$Nota_Curriculo <- sapply(df1$Nota_Curriculo, as.numeric)
df1$Total <- sapply(df1$Total, as.numeric)

# Tratando variáveis categóricas, limpeza e organização

especialidades <- c('ULTRASSONOGRAFIA EM GINECOLOGIA E OBS', 'Urologia',
                    'Reumatologia', 'Reprodução Assistida', 'Radioterapia',
                    'Radiologia e Diagnóstico por Imagem', 'R3 Clínica Médica',
                    'Psiquiatria', 'Pediatria', 'Patologia','Otorrinolaringologia',
                    'Ortopedia e Traumatologia', 'Oncologia Clínica', 'Oftalmologia',
                    'Obstetrícia e Ginecologia', 'Nutrologia', 'Neurologia Pediatrica',
                    'Neurologia', 'Neurocirurgia', 'NEONATOLOGIA', 'Nefrologia',
                    'Medicina Paliativa', 'MEDICINA INTENSIVA PEDIATRICA', 'Medicina Intensiva',
                    'MEDICINA FETAL', 'Medicina de Família e Comunidade', 'Medicina de Emergência',
                    'Mastologia', 'Infectologia', 'Homeopatia', 'Hematologia e Hemoterapia',
                    'Geriatria', 'Gastroenterologia', 'ENDOSCOPIA RESPIRATORIA', 'ENDOCRINOLOGIA PEDIÁTRICA',
                    'Endocrinologia e Metabologia', 'Emergência Pediátrica', 'ECOCARDIOGRAFIA',
                    'Dermatologia', 'Coloproctologia', 'Clínica Médica', 'Cirurgia Vascular',
                    'Cirurgia Torácica', 'Cirurgia Plástica', 'Cirurgia Pediátrica', 'Cirurgia Oncológica',
                    'Cirurgia Geral', 'CIRURGIA DO TRAUMA', 'Cirurgia do Aparelho Digestivo',
                    'Cirurgia de Cabeça e Pescoço', 'Cirurgia da Mão', 'Cirurgia craneo Maxilo Facial',
                    'Cirurgia Cardiovascular', 'CARDIOLOGIA PEDIÁTRICA', 'Cardiologia', 'Anestesiologia',
                    'ALERGIA E IMUNOLOGIA PEDIÁTRICA')
for (esp in especialidades){
  df1$Especialidade <- gsub(esp,tolower(esp), df1$Especialidade)
}
df1$Especialidade <- gsub('[A-Z]', '', df1$Especialidade)
df1$Especialidade <- gsub('[ÊÇÃÚÂÁÉÍÓ-]|2','',df1$Especialidade)
df1$Especialidade <- gsub('berlandia','', df1$Especialidade)
df1$Especialidade <- sapply(df1$Especialidade, trimws)
# Salva dataset_organizado.csv 
write_csv(df1, 'dataset_organizado.csv')
################################################################################
# Limpeza e processamento dos dados relacionados as inscrições para 2023
# Em desenvolvimento...
df_relacao <- read_csv('data/relacao_incritos.csv', show_col_types = F)
df_r <- data.frame(df_relacao)
colnames(df_r) <- c(
  'Instituição',
  'col2',
  'Especialidade',
  'Qtd Inscricao',
  'Vagas',
  'Candidato/Vagas'
)
################################################################################


