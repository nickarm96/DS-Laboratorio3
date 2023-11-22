# load libraries
library(readr)
library(tidyr)
library(dplyr)
library(data.table)
library(mltools)
library(ggplot2)

#("ORIGEN","FECHA","TIPO","URL","PROTOCOLO","PETICIONES","BYTES")

# convertir campos a factor

  
epa_http_one_hot <- epa_http %>% mutate(
  TIPO = as.factor(TIPO), 
  PROTOCOLO = as.factor(PROTOCOLO),
  PETICIONES = as.factor(PETICIONES),
  BYTES = as.factor(BYTES)
  )
  
# Eliminar tablas no numericas
epa_http_one_hot$ORIGEN <- NULL
epa_http_one_hot$FECHA <- NULL
epa_http_one_hot$URL <- NULL

print(lapply(epa_http_one_hot, class))
  
epa_http_one_hot <-select(epa_http, TIPO, PROTOCOLO, PETICIONES, BYTES)

epa_http_one_hot <- one_hot(as.data.table(epa_http), sparsifyNAs = TRUE)
