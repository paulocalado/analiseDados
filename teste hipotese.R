x<- c(5.1,5,4.8,5,5,4.9,4.9,4.7)
media<- 4.8
ns<- 0.05

t.test(x,alternative = "two.sided",mu=media,conf.level = ns)
shapiro.test(x)

x<- c(8.8,8.4,7.9,8.7,9.1,9.6)
y<- c(9.9,9,11.1,9.6,8.7,10.4,9.5)
t.test(x,y,alternative = "two.sided",conf.level = ns)
shapiro.test(x)
shapiro.test(y)
var.test(x,y)

install.packages("yarrr")
library(yarrr)
t.test(formula=tattoos~eyepatch,data = pirates)

tempAntes<- c(37.5,36,39,38,37.8,38.5,39.3)
tempDepois<- c(37.8,36.4,37.6,37.2,36.9,37.7,38)
t.test(tempAntes,tempDepois,paired = T)
shapiro.test(tempAntes)
shapiro.test(tempDepois)
var.test(tempAntes,tempDepois)


#exercicio
mediaNicotina<- 23
analise<- c(27,24,21,25,26,22)
ns<-0.05
t.test(analise,alternative = "greater",mu=mediaNicotina,conf.level = ns)
###p-value = 0.1361 logo aceita-se a hip??tese NULA

mediaConsumo<- 600
ns<-0.05
consumoPirituba<- c(300,400,350,450,100,220,150,500,900,800,600,150,50,170,370,200)
t.test(consumoPirituba,alternative = "less",mu=mediaConsumo,conf.level = ns)
###p-value menor que 0.05 logo rejeita-se a hip??tesse NULA, logo consumo realmente ?? menor
shapiro.test(consumoPirituba)
##p-value do shapiro foi maior que 0.05 logo os elementos dessa amostragem s??o distribuidos normalmente.

