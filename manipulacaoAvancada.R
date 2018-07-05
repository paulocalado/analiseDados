risco_survey <- data.frame("ID.part"=c(1,2,3,4,5),
                           "av.risco"=c(3,4,5,3,1))

felicidade_survey <- data.frame("ID.part"=c(4,2,6,5,1,3),
                                "feli.score"=c(20,40,50,93,78,45))

data_combinado <- merge(x=risco_survey,
                        y=felicidade_survey,
                        by="ID.part",
                        all=T)

aggregate(formula= value ~ individual,
          FUN = mean,
          data = data)

View(df)

aggregate(formula = Temp ~ Month,
          FUN =mean,
          data = airquality,
          subset = Month<8)

aggregate(formula = weight ~ Diet,
          FUN = mean,
          data = ChickWeight,
          subset = Time<10)

aggregate(formula = Temp ~ Month,
          FUN = mean,
          data = airquality,
          subset = Wind<10)

install.packages("dplyr")
library(dplyr)

teste<-filter(airquality,Temp<70,Wind>14,!is.na(Ozone))

select(airquality,Temp,Wind,Ozone)

df<-mutate(airquality,
           celsius = (airquality$Temp-32)/1.8,
           windTimesTen = airquality$Wind*10)

arrange(df,desc(celsius))

