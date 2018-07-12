Temperature<- airquality$Temp

hist(Temperature,col = "blue",density = 5,breaks = 30,
     main = "Histograma Temperatura")

hist(Temperature, col = "green", freq = F)

hist(Temperature,col="pink",main = "Histograma Temperatura",freq = F)
densityTemp<- density(Temperature)
lines(densityTemp,col="blue",cex=2)

####EXERCICIO
tempm<- c(67,72,74,62,56,66,65,59,61,69,74,69,66,68,58,64,66,57,68,62,59,73,61,61,57,58,
        57, 67,81,79,76) 

temps<- c(91,92,93,93,87,84,80,78,75,73,81,76,77,71,71,78,67,76,68,82,64,71,81,69,63,70,77,75,76,68)

hist(tempm,main='Temperatura em Maio', xlab = "Temperatura em F", col="red", density = 30)

tempsInC<- (temps-32)/1.8
hist(tempsInC, main = "Temperatura em Setembro", xlab = "Temperatura em C",
     col="blue",freq=F)
densityTempS<- density(tempsInC)
lines(densityTempS,col="red", cex=2)

######grafico de pizza
x<- c(32,12,30,53,68)
labels<- c("Recife","Durham","Toronto","Amsterdan","NY")

pie(x,labels, main = "Gráfico de Cidades", col=1:length(x))
pct<- round(x/sum(x)*100)
lbls<- paste(labels,pct)
lbls<- paste(lbls,"%",sep = "")
pie(x,labels = lbls,main="Grafico de cidades", col=1:length(x))

lbls<- paste(pct,"%",sep = "")
pie(x, labels = lbls,main="Gráfico de cidades", col=rainbow(length(x)))
legend("topright",legend = labels, cex = 0.5,fill=rainbow(length(x)))

########EXERCICIO
listaVerificacao<- data.frame(TipoDeDefeito=c("linha ruidosa",
                                              'linha aberta',
                                              'alarme',
                                              'não responde',
                                              'não toca'),
                              ocorrencias=c(250,110,85,45,25))
pct<- round(listaVerificacao$ocorrencias/sum(listaVerificacao$ocorrencias)*100)
legendLbl<- paste(pct,"%",sep="")
pie(listaVerificacao$ocorrencias, main="Gráfico de Ocorrencias", labels = legendLbl,
    col = rainbow(length(listaVerificacao$ocorrencias)))

legend("topleft",legend = listaVerificacao$TipoDeDefeito,cex = 0.5,
       fill = rainbow(length(listaVerificacao$TipoDeDefeito)))


USspend<- data.frame(tipo=c("comida e cigarro","domésticos",
                            "remédios e saúde","cuidados pessoais",
                            "educação privada"),
                     despesas= c(22200,10500,3530,1040,341))
pct<- round(USspend$despesas/sum(USspend$despesas)*100)
legendUS<- paste(pct,"%",sep="")
pie(USspend$despesas,labels = legendUS, main="Despesas Americanas", 
    col=rainbow(length(USspend$despesas)))
legend("topleft", legend = USspend$tipo, cex=0.5, fill=rainbow(length(USspend$despesas)))



boxplot(mtcars$mpg)

boxplot(mpg~cyl,data=mtcars,
        xlab="Número de cilindros",
        ylab="Milhas por galão",
        main="Dados de milhagem",
        col=2:4,outline=F)