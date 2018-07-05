pirates<- data.frame("names" = c("Astrid", "Lea", "Sarina","Remon","Letizia","Babice","Jonas","Wendy","Niveditha",
                               "Gioia"),
                     "Sex" = c("F","F","F","M","F","F","M","F","F","F"),
                     "Age" = c(30,25,25,29,22,22,35,19,32,21),
                     "Superhero" = c("Batman","Superman","Batman","Spiderman","Batman","Antman","Batman","Superman",
                                     "Maggot","Superman"),
                     "Tattos" = c(11,15,12,5,65,3,9,13,900,0),stringsAsFactors = F)
median(pirates$Age)
mean(pirates$Age[pirates$Sex=="M"])
mean(pirates$Age[pirates$Sex=="F"])
max(pirates$Tattos[pirates$Sex=="M"])
femalePirates32 <- c(pirates[,"Sex"=="F" & "Age"<32])
length(pirates$Age[pirates$Sex=="F" & pirates$Age<32])*100/length(pirates$Age[pirates$Sex=="F"])

maxTattoo<- max(pirates$tattos.per.year)
pirates$names[pirates$tattos.per.year == maxTattoo]
pirates$names[pirates$Sex=="F" & pirates$Superhero=="Superman"]
mean(pirates$Tattos[pirates$Age>20 & pirates$Superhero=="Batman"])