#Instalando paqueter?a 
library(openxlsx)
library(tidyverse)
library(scales)
library(readxl)
library(psych)
library(paran)
library(stats)
#cargando excel
data14 <- read_excel("IPCCI_datos_2014v2.xlsx",col_names = TRUE)
summary(data14)

data14vc <- data14[, 3:38]
rownames(data14vc) <- data14$ZM

#estandarizando variables
data14vc_esc <- scale(data14vc,center=T,scale=T)
data14vc_esc <- as.data.frame(data14vc_esc)
row.names(data14vc_esc) <- data14$ZM

#Matriz de correlaciones
#ho: corelación = 0
#ha: correlacion diferente de 0
#se debe rechazar Ho para aplicar AF
correlaciones <- corr.test(data14vc_esc)
#si pvalue > 0.05, no se rechaza ho
#si pvalue < 0.05, se rechaza ho
View(correlaciones$p)
View(correlaciones$r) #matriz correlaciones
r <- correlaciones$r
#determinacion de factores/ Horn's
paran(r, iterations = 1000, graph= T)

#Principal Axis Factor Analysis

af14 <- factanal(data14vc_esc, factors = 2, rotation="varimax", lower=0.04)

print(af14)
af14$loadings

View(af14$rotmat)

# calculo del indice

f1 <- apply(af14$rotmat[,1]*data14vc_esc, 1,sum)
f2 <- apply(af14$rotmat[,2]*data14vc_esc, 1,sum)

indice_af <- f1 + f2
indice_af <- as.data.frame(indice_af)

#matriz rotacion 
indicexls <- write.xlsx(indice_af, 'indice_af2014.xls', row.names=T)
