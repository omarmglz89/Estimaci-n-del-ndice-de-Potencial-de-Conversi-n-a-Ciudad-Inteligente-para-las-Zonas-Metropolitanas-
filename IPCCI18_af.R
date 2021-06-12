#Instalando paqueter?a 
library(openxlsx)
library(tidyverse)
library(scales)
library(readxl)
library(psych)
library(paran)
library(stats)
#cargando excel
data18 <- read_excel("IPCCI_datos_2018v2.xlsx",col_names = TRUE)
summary(data18)

#que las variables sean numericas
data18$UE_TIC <- as.numeric(data18$UE_TIC)

data18vc <- data18[, 3:38]
rownames(data18vc) <- data18$ZM

#estandarizando variables
data18vc_esc <- scale(data18vc,center=T,scale=T)
data18vc_esc <- as.data.frame(data18vc_esc)
row.names(data18vc_esc) <- data18$ZM

#Matriz de correlaciones
#ho: corelación = 0
#ha: correlacion diferente de 0
#se debe rechazar Ho para aplicar AF
correlaciones <- corr.test(data18vc_esc)
#si pvalue > 0.05, no se rechaza ho
#si pvalue < 0.05, se rechaza ho
View(correlaciones$p)
View(correlaciones$r) #matriz correlaciones
r <- correlaciones$r
#determinacion de factores/ Horn's
paran(r, iterations = 1000, graph= T)

#Principal Axis Factor Analysis

af18 <- factanal(data18vc_esc, factors = 2, rotation="varimax", lower=0.04)

print(af18)
af18$loadings

View(af18$rotmat)

# calculo del indice

f1 <- apply(af18$rotmat[,1]*data18vc_esc, 1,sum)
f2 <- apply(af18$rotmat[,2]*data18vc_esc, 1,sum)

indice_af <- f1 + f2
indice_af <- as.data.frame(indice_af)

#matriz rotacion 
indicexls <- write.xlsx(indice_af, 'indice_af2018.xls', row.names=T)
