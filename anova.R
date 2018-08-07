plat.aov<- aov(formula = weight ~ group,
                 data=PlantGrowth)

summary(plat.aov)
TukeyHSD(plat.aov)
plot(TukeyHSD(plat.aov))

plant.lm<- lm(formula = weight ~ group,
              data=PlantGrowth)
summary(plant.lm)

plot(plat.aov,2)
shapiro.test(residuals(plat.aov))

install.packages("car")
library(car)
leveneTest(weight~ group,
           data = PlantGrowth)

str(ToothGrowth)
ToothGrowth$dose<-factor(ToothGrowth$dose)

boxplot(len ~ supp+dose,
        data = ToothGrowth,
        main = "formula = len ~ supp+dose",
        col=rainbow(2))