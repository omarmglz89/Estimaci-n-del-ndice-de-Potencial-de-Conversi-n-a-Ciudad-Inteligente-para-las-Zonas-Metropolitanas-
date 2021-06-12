#Instalando paqueter?a 
library(openxlsx)
library(tidyverse)
library(scales)
library(readxl)
library(psych)
library(paran)
library(stats)
#cargando excel
data20 <- read_excel("IPCCI_datos_2020v2.xlsx",col_names = TRUE)
summary(data20)

data20vc <- data20[, 3:38]
rownames(data20vc) <- data20$ZM

#estandarizando variables
data20vc_esc <- scale(data20vc,center=T,scale=T)
data20vc_esc <- as.data.frame(data20vc_esc)
row.names(data20vc_esc) <- data20$ZM

#Matriz de correlaciones
#ho: corelación = 0
#ha: correlacion diferente de 0
#se debe rechazar Ho para aplicar AF
correlaciones <- corr.test(data20vc_esc)
#si pvalue > 0.05, no se rechaza ho
#si pvalue < 0.05, se rechaza ho
View(correlaciones$p)
View(correlaciones$r) #matriz correlaciones
r <- correlaciones$r
#determinacion de factores/ Horn's
paran(r, iterations = 1000, graph= T)

#Principal Axis Factor Analysis

af20 <- factanal(data20vc_esc, factors = 2, rotation="varimax", lower=0.04)

print(af20)

View(af20$rotmat)
af20$loadings

# calculo del indice

f1 <- apply(af20$rotmat[,1]*data20vc_esc, 1,sum)
f2 <- apply(af20$rotmat[,2]*data20vc_esc, 1,sum)

indice_af <- f1 + f2 
indice_af <- as.data.frame(indice_af)

#matriz rotacion 
indicexls <- write.xlsx(indice_af, 'indice_af2020.xls', row.names=T)

factorxls <- write.xlsx(af20$loadings, 'factores2020.xls', row.names=T)