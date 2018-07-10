View(mtcars)
str(mtcars)
plot(iris$Sepal.Length,
     iris$Petal.Length,
     main = "Gráfico Iris",
     cex.main = 2, col = iris$Species, pch=17, cex=2)
legend("topleft", legend = levels(iris$Species), col = c(1:3), pch = 17,cex=0.7)

####Exercicio
#### 1
plot(mtcars$mpg,
     mtcars$qsec,
     main = "Gráfico MTCars",
     cex.main = 2,
     xlab = "MPG", ylab = "QSEC", pch= 4,col = mtcars$cyl)
legend("topleft",legend = c(4,6,8), col= c(4,6,8), pch = 4, cex=0.7 )

#### 2
plot(mtcars$vs,
     mtcars$mpg,
     main = "Gráfico inutil",
     xlab = "VS", ylab = "MPG")

#### 3
sapos<- c(6,5,10,11,26,16,17,37,18,21,22,15,24,25,29,31,32,13,39,40)
umid<- c(62,24,21,30,34,36,41,48,56,74,57,46,58,61,68,76,79,33,85,86)
temp<- c(31,23,28,30,15,16,24,27,18,10,17,13,25,22,34,12,29,35,26,19)

par(mfrow=c(1,2))
plot(sapos,
     umid,
     main = "Sapos e Umidade", xlab = "Sapos",ylab = "Umidade",pch=2)
plot(sapos,
     temp,
     main = "Sapos e Temperatura",xlab = "Sapos", ylab = "Temperatura",pch=1)

##################################
max.temp<- c(30,35,40,38,25,24,23)
barplot(max.temp,
        main = "Máxima temperatura em uma semana",
        ylab = "Graus em Celsius",
        xlab = "Dia da semana",
        names.arg = c("Sun","Mon","Tu","Wed","Thu","Fri","Sat"),
        col = "green",horiz = T)

colors<- c("green","orange","brown")
months<- c("Mar","Apr","May","Jun","Jul")
regions<- c("East","West","North")
Values<-matrix(c(2,9,3,11,9,4,8,7,3,12,5,2,8,10,11),ncol = 5,nrow = 3,byrow = T)
barplot(Values,main = "Rendimento total",names.arg = months,xlab = "Meses",ylab = "Rendimento",
        col = colors, beside = T)
legend("topleft",legend = regions, col = colors, pch=c(15,15,15), cex=0.7)

######EXERCICIO
peso<- c(42,51,59,64,76)
dias<- c(2,4,6,8,10)
colors<- c("blue","orange","yellow","green","red")
barplot(peso,
        main = "Peso médio",
        xlab = "Dias",
        ylab = "Peso",
        names.arg = dias,
        col = colors)

#### 3
barplot(peso,
        main = "Peso médio",
        xlab = "Dias",
        ylab = "Peso",
        names.arg = dias,
        col = colors,
        horiz = T)

#### 4
qualityRating<- c("Good","Very Good","Excelent")
metalPrice<- matrix(c(53.8,33.9,2.6,0,43.6,54.2,60.5,21.4,2.6,11.9,36.8,78.6),nrow = 3,ncol = 4,
                    byrow = T)
price<- c("$10-19", "$20-29","$30-39","$40-49")
colors<- c("blue","orange","yellow","green")

barplot(metalPrice,main="Meal Plot",xlab = "Quality Rating",ylab = "Meal Price",
        names.arg = price,col=colors)
legend("bottomright",legend = qualityRating, col = colors,pch = c(15,15,15),cex = 0.7)