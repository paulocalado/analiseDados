install.packages("ggplot2")
library(ggplot2)

x<-1:15
y<- x**2
t<- x**3

plot(x,y,type = "l")
plot(x,y,type = "b")
plot(x,y,type = "o")
plot(x,y,type = "s")
plot(x,y,type = "c")
plot(x,y,type = "h")

plot(x,y,type = "o",pch=11)
plot(x,y,type = "o",pch="$")

plot(x,y,type = "o",pch=3,cex=2,col="blue")

plot(x,y,type = "o",pch=3,col="green",
     xlab = "Eixo X",ylab = "Eixo Y",
     main = "Cha-Ching",cex.lab=1.5,
     cex.axis=2, cex.main=2,
     xlim = c(0,20),ylim = c(0,300),bty="n",
     axes = F)

lines(t,type = "o",pch=11,col="blue")

legend("bottomright",legend = c("Dados 1","Dados 2"),
       col=c("green","blue"),pch=c(3,11))

axis(side=1,at=seq(1,15,1),
     labels = seq(1,15,1),
     cex.axis=0.7)
axis(side=2,at=seq(0,300,25),
     labels=seq(0,300,25),
     cex.axis=0.7)

par(mfrow=c(1,2))
plot(x,y,type="o",pch=11,col="red")
plot(t,y,type = "s",pch="$", col="yellow",main = "grafico simples")

#####EXERCICIO
x<-seq(2,10,2)
y<-seq(2,10,2)
t<-c(NA,4,6,8,NA)
plot(x,y,type="o",pch="%",xlab = "Valores do eixo X", ylab="Valores do eixo Y", 
     main="Primeiro gráfico")
lines(t,type = "o",col="red")


View(cars)

plot(cars$speed,cars$dist, type = "o",main = "Primeiro gráfico",
     bty="n")
axis()
