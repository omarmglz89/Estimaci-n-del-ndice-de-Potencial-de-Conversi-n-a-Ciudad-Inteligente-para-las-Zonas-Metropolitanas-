#Instalando paqueter?a 
library(openxlsx)
library(tidyverse)
library(scales)
library(readxl)
library(psych)
library(paran)
library(stats)
#cargando excel
data17 <- read_excel("IPCCI_datos_2017v2.xlsx",col_names = TRUE)
summary(data17)

data17vc <- data17[, 3:38]
rownames(data17vc) <- data17$ZM

#estandarizando variables
data17vc_esc <- scale(data17vc,center=T,scale=T)
data17vc_esc <- as.data.frame(data17vc_esc)
row.names(data17vc_esc) <- data17$ZM

#Matriz de correlaciones
#ho: corelación = 0
#ha: correlacion diferente de 0
#se debe rechazar Ho para aplicar AF
correlaciones <- corr.test(data17vc_esc)
#si pvalue > 0.05, no se rechaza ho
#si pvalue < 0.05, se rechaza ho
View(correlaciones$p)
View(correlaciones$r) #matriz correlaciones
r <- correlaciones$r
#determinacion de factores/ Horn's
paran(r, iterations = 1000, graph= T)

#Principal Axis Factor Analysis

af17 <- factanal(data17vc_esc, factors = 2, rotation="varimax", lower=0.04)

print(af17)
af17$loadings

View(af17$rotmat)

# calculo del indice

f1 <- apply(af17$rotmat[,1]*data17vc_esc, 1,sum)
f2 <- apply(af17$rotmat[,2]*data17vc_esc, 1,sum)


indice_af <- f1 + f2 
indice_af <- as.data.frame(indice_af)

#matriz rotacion 
indicexls <- write.xlsx(indice_af, 'indice_af2017.xls', row.names=T)
