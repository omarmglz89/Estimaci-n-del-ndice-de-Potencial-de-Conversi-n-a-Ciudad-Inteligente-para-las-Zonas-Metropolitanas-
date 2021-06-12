#Instalando paqueter?a 
library(openxlsx)
library(tidyverse)
library(scales)
library(readxl)
library(psych)
library(paran)
library(stats)
#cargando excel
data16 <- read_excel("IPCCI_datos_2016v2.xlsx",col_names = TRUE)
summary(data16)

#que las variables sean numericas
data16$UE_TIC <- as.numeric(data16$UE_TIC)

data16vc <- data16[, 3:38]
rownames(data16vc) <- data16$ZM

#estandarizando variables
data16vc_esc <- scale(data16vc,center=T,scale=T)
data16vc_esc <- as.data.frame(data16vc_esc)
row.names(data16vc_esc) <- data16$ZM

#Matriz de correlaciones
#ho: corelación = 0
#ha: correlacion diferente de 0
#se debe rechazar Ho para aplicar AF
correlaciones <- corr.test(data16vc_esc)
#si pvalue > 0.05, no se rechaza ho
#si pvalue < 0.05, se rechaza ho
View(correlaciones$p)
View(correlaciones$r) #matriz correlaciones
r <- correlaciones$r
#determinacion de factores/ Horn's
paran(r, iterations = 1000, graph= T)

#Principal Axis Factor Analysis

af16 <- factanal(data16vc_esc, factors = 2, rotation="varimax", lower=0.04)

print(af16)
af16$loadings

View(af16$rotmat)

# calculo del indice

f1 <- apply(af16$rotmat[,1]*data16vc_esc, 1,sum)
f2 <- apply(af16$rotmat[,2]*data16vc_esc, 1,sum)

indice_af <- f1 + f2 
indice_af <- as.data.frame(indice_af)

#matriz rotacion 
indicexls <- write.xlsx(indice_af, 'indice_af2016.xls', row.names=T)
