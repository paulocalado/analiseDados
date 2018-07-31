install.packages("gplots")

library(gplots)
boxplot(weight ~ group,
         data = PlantGrowth,
         main = "formula = weight ~ group",
         col=rainbow(3))

plotmeans(weight ~ group, PlantGrowth,
          main = "Plot of Means")

plant.aov <- aov(formula = weight ~ group,
                 data = PlantGrowth)

#analisar o P value, ~se for menor que 0.05 então rejeita a hipotese nula
#se for maior que 0.05, aceita a hipótese nula

aux<- summary(plant.aov)

aux[[1]][1,"Pr(>F)"]

install.packages("car")



str(ToothGrowth)
ToothGrowth$dose<-factor(ToothGrowth$dose)
boxplot(len ~ supp+dose,
        data = ToothGrowth,
        main = "formula = len ~ supp+dose",
        col=rainbow(2))

plotmeans(len~interaction(supp,dose,sep=" "), data =ToothGrowth,
          connect=list(c(1,3,5),c(2,4,6)),col=c("red","darkgreen"),
          xlab="Dose and Supp Combination", main = "Interaction plot with
          95% confidence intervals")

######EXERCICIO
dataExercicio<- data.frame(program1= c(30,33,31,25,26,29,29,31),
                           program2= c(32,35,28,29,19,20,20,NA),
                           program3= c(31,34,33,32,29,30,31,31),
                           program4= c(43,47,53,54,52,55,45,NA),
                           program5= c(44,50,50,49,47,49,49,NA))

res.aov<- 