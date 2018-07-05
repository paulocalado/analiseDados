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

summarise(airquality,
          maxWind  = max(Wind),
          Contador = n())

summarise(group_by(airquality,Month),
          maxWind = max(Wind))

airquality %>%
  group_by(Month) %>%
  filter(Temp>80) %>%
  summarise(
    SumTemp  = sum(Temp),
    meanWind = mean(Wind),
    ozoneMedian = median(Ozone,na.rm = T)
  )

#####EXERCICIO DPLYR
setwd("/Users/paulocalado/Documents/UFRPE/analiseDados")
cafein <- read.csv("caffein.csv",header = T,stringsAsFactors = F, sep="")
View(cafein)

cafein %>%
  group_by(gender) %>%
  summarise(
    meanAge = mean(age)
  )

cafein %>%
  group_by(drink) %>%
  summarise(
    meanAge = mean(age)
  )

cafein %>%
  group_by(drink,gender) %>%
  summarise(
    meanAge = mean(age)
  )

cafein %>%
  group_by(age) %>%
  summarise(
    medianScore = median(score)
  )
  
cafein %>%
  group_by(age) %>%
  filter(gender == "male") %>%
  summarise(
    maxScore = max(score)
  )

cafein %>%
  group_by(drink) %>%
  summarise(
    meanScore = mean(score),
    medianScore = median(score),
    maxScore = max(score),
    sdScore = sd(score)
  )

cafein %>%
  group_by(drink,cups) %>%
  filter(gender == "female",age>20) %>%
  summarise(
            meanScore = mean(score),
            medianScore = median(score),
            maxScore = max(score),
            sdScore = sd(score)
            )

install.packages("tidyr")
library(tidyr)

head(USArrests)
USArrests$States <- rownames(USArrests)

df1 <- USArrests%>%
  gather(key="tipo_crime",value = "valor", -States,-Rape)

df2<- df1%>%
  spread(key = "tipo_crime",value="valor")

df3<- df2%>%
  unite(col="Assault_Murder_Rape",Assault,Murder,Rape,sep = "_")

df4<- df3%>%
  separate(col="Assault_Murder_Rape",
           into = c("Assault","Murder","Rape"),
           sep = "_")

#######EXERCICIO
tb<- read.csv("tb.csv",header = T,stringsAsFactors = F)

View(tb)

tb<- tb%>%
  gather(key="codigo",value = "valor",-iso2,-year)

tb<-tb%>%
  separate(col="codigo",
           into=c("Caso_Novo","Tipo_Caso","Outra_Coluna"),
           sep = "_")

tb<- tb%>%
  separate(col="Outra_Coluna",
           into=c("Sexo","Faixa_Etaria"),
           sep=c("m","f"))