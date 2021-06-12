#Instalando paqueter?a 
library(openxlsx)
library(tidyverse)
library(scales)
library(readxl)
library(psych)
library(paran)
library(stats)
#cargando excel
data15 <- read_excel("IPCCI_datos_2015v2.xlsx",col_names = TRUE)
summary(data15)

#que las variables sean numericas
data15$UE_TIC <- as.numeric(data15$UE_TIC)

data15vc <- data15[, 3:38]
rownames(data15vc) <- data15$ZM

#estandarizando variables
data15vc_esc <- scale(data15vc,center=T,scale=T)
data15vc_esc <- as.data.frame(data15vc_esc)
row.names(data15vc_esc) <- data15$ZM

#Matriz de correlaciones
#ho: corelación = 0
#ha: correlacion diferente de 0
#se debe rechazar Ho para aplicar AF
correlaciones <- corr.test(data15vc_esc)
#si pvalue > 0.05, no se rechaza ho
#si pvalue < 0.05, se rechaza ho
View(correlaciones$p)
View(correlaciones$r) #matriz correlaciones
r <- correlaciones$r
#determinacion de factores/ Horn's
paran(r, iterations = 1000, graph= T)

#Principal Axis Factor Analysis

af15 <- factanal(data15vc_esc, factors = 2, rotation="varimax", lower=0.04)

print(af15)
af15$loadings

View(af15$rotmat)

# calculo del indice

f1 <- apply(af15$rotmat[,1]*data15vc_esc, 1,sum)
f2 <- apply(af15$rotmat[,2]*data15vc_esc, 1,sum)

indice_af <- f1 + f2
indice_af <- as.data.frame(indice_af)

#matriz rotacion 
indicexls <- write.xlsx(indice_af, 'indice_af2015.xls', row.names=T)
