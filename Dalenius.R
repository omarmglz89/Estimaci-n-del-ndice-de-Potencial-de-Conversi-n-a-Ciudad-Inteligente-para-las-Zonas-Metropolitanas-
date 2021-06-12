#Estratificacion Dalenius-Hodges 

#Instalar y cargar paqueteria
install.packages("stratification")
library(stratification)
library(readxl)
library(openxlsx)

#Cargar IPCCI 2020
#Debe contener una columna con valores estandarizados
ipcci <- read_excel("IPCCI20_Dalenius.xlsx",col_names = TRUE)

#El método de Dalenius-Hodges forma estratos en los cuales la varianza es mínima intra-grupos y máxima inter-grupos, es decir, forma grupos lo más homogéneos posible.

strata <- strata.cumrootf(ipcci$indice_est, n=74, Ls=5)
strata
