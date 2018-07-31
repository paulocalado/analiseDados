install.packages("yarrr")
library(yarrr)
cor.test(formula = ~ age + parrots,
         data = pirates,
         subset = sex=="female")

cor.test(formula= ~ speed + dist,
         data=cars)

head(marketing)

cor.test(marketing$sales,marketing$youtube)

model<- lm(sales ~ youtube, data=marketing)

plot(sales ~ youtube, pch=16,data=marketing)
abline(model,col="red")

#para fazer previsão é preciso ajustar os dados
plot(model$fitted.values, marketing$youtube)

summary(model)
shapiro.test(residuals(model))
plot(model,1)

previsao<- data.frame(youtube = c(100,1000,5000))
predict(model, previsao)

#multipla
model<- lm(sales~youtube+facebook+newspaper, data=marketing)
summary(model)

model<- lm(sales~youtube+facebook,data=marketing)
shapiro.test(residuals(model))
plot(model,1)


#Exercicio
modelExercicio<- lm(speed~dist,data=cars)
plot(speed~dist, pch=16,data=cars)
plot(modelExercicio,1)
summary(modelExercicio)
shapiro.test(residuals(modelExercicio))
previsaoCars<- data.frame(dist=c(150,200,250))
predict(modelExercicio,previsaoCars)

