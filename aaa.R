# Instalar pacotes necessários (se ainda não estiverem instalados)
if (!require("dplyr")) install.packages("dplyr")
if (!require("lubridate")) install.packages("lubridate")

# Carregar os pacotes
library(dplyr)
library(lubridate)

install.packages("dplyr")
install.packages("forecast")
install.packages("ggplot2")
install.packages("lubridate")
install.packages("Metrics")
install.packages("tsibble")
install.packages("tsibbledata")
install.packages("TTR")
install.packages("fpp2")
library(dplyr)
library(fpp2)
library(forecast)
library(ggplot2)
library(lubridate)
library(Metrics)
library(tsibble)
library(tsibbledata)
library(TTR)




####################MUDAR OS DADOS PARA TER INTERVALO DE 1 HR####################################
# Carregar os dados (supondo que 'cleaned_weather' seja o seu dataframe)
dados <- cleaned_weather

# Garantir que a coluna de data seja do tipo datetime
dados$date <- ymd_hms(dados$date)

# Verificar se algum valor da coluna 'date' é NA e, se sim, corrigir ou remover
dados <- dados %>% filter(!is.na(date))

# Criar a coluna 'hour' e agrupar por hora
dados_hora <- dados %>%
  mutate(hour = floor_date(date, "hour")) %>%  # Agrupar por hora
  group_by(hour) %>%  # Agrupar os dados
  summarise(across(where(is.numeric), mean, na.rm = TRUE), .groups = 'drop')  # Calcular a média

# Verificar se o primeiro valor da coluna 'hour' é o esperado
head(dados_hora)

# Salvar o resultado em um novo arquivo CSV (opcional)
write.csv(dados_hora, "dados_horarios.csv", row.names = FALSE)

head(dados_hora)

####################################################################################################



##############################FAZER AS PREVISÕES PARA AS PRÓXIMAS 24 HORAS##########################

#############################NAIVE########################################
install.packages("ggfortify")
library(ggfortify)
library(lubridate)
library(ggplot2)
library(forecast)

ts.plot(dados_hora$T)
























