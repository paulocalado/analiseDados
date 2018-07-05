vec<- rep(c("sim","nao","nao"),33)

pirates<- data.frame(name=c("Astrid","Lea","Sarina","Remon","Letizia","Babice","Jonas","Wendy","Niveditha","Gioia"),
                     sex=c("F","F","F","M","F","F","M","F","F","F"),
                     age=c(30,25,25,29,22,22,35,19,32,21),
                     superhero=c("Batman","Superman","Batman","Spiderman","Batman","Antman","Batman","Superman",
                                 "Maggott","Superman"),
                     Tattoos=c(11,15,12,5,65,3,9,13,900,0),stringsAsFactors = F)

median(pirates$age)
mean(pirates$age[pirates$sex=="M"])
mean(pirates$age[pirates$sex=="F"])
max(pirates$Tattoos[pirates$sex=="M"])

sum(pirates$age[pirates$sex=="F"]<32)*100/sum(pirates$sex=="F")

tattoos.per.year<-pirates$Tattoos/pirates$age
pirates<- cbind(pirates,tattoos.per.year)

pirates$name[pirates$tattoos.per.year==max(pirates$tattoos.per.year)]

pirates$name[pirates$sex=="F"&pirates$superhero=="Superman"]

mean(pirates$Tattoos[pirates$age>20 & pirates$superhero=="Batman"])