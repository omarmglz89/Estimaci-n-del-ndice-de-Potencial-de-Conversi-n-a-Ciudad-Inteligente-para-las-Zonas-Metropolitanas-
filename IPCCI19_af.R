#Instalando paqueter?a 
library(openxlsx)
library(tidyverse)
library(scales)
library(readxl)
library(psych)
library(paran)
library(stats)
#cargando excel
data19 <- read_excel("IPCCI_datos_2019v2.xlsx",col_names = TRUE)
summary(data19)

data19vc <- data19[, 3:38]
rownames(data19vc) <- data19$ZM

#estandarizando variables
data19vc_esc <- scale(data19vc,center=T,scale=T)
data19vc_esc <- as.data.frame(data19vc_esc)
row.names(data19vc_esc) <- data19$ZM

#Matriz de correlaciones
#ho: corelación = 0
#ha: correlacion diferente de 0
#se debe rechazar Ho para aplicar AF
correlaciones <- corr.test(data19vc_esc)
#si pvalue > 0.05, no se rechaza ho
#si pvalue < 0.05, se rechaza ho
View(correlaciones$p)
View(correlaciones$r) #matriz correlaciones
r <- correlaciones$r
#determinacion de factores/ Horn's
paran(r, iterations = 1000, graph= T)

#Principal Axis Factor Analysis

af19 <- factanal(data19vc_esc, factors = 2, rotation="varimax", lower=0.04)

print(af19)
af19$loadings

View(af19$rotmat)

# calculo del indice

f1 <- apply(af19$rotmat[,1]*data19vc_esc, 1,sum)
f2 <- apply(af19$rotmat[,2]*data19vc_esc, 1,sum)

indice_af <- f1 + f2 
indice_af <- as.data.frame(indice_af)

#matriz rotacion 
indicexls <- write.xlsx(indice_af, 'indice_af2019.xls', row.names=T)
