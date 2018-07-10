View(iris)

plot(iris$Sepal.Length,
     iris$Petal.Length,
     main = "Gráfico Iris",
     cex.main = 2, col = iris$Species, pch=17, cex=2)
legend("topleft", legend = levels(iris$Species), col = c(1:3), pch = 17,cex=0.7)

