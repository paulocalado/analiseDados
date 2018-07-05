###############QUEST??O 1
results<- data.frame(name=c("Leonie","Luca","Leon","Lea","Luis","Laura"),
                     degree=c("Bachelor","Master","Bachelor","Bachelor","Master","Master"),
                     grade=c(2.3,3.0,2.0,1.3,2.7,1.0),stringsAsFactors = F)

#1.A
names(results)
str(results)
summary(results)

#1.B
results$grade

#1.C
results$grade[5]

#1.D
alunos<- results[,1:2]

#1.E
names(alunos)[2]<- "deg"

#1.F
mean(results$grade)

#1.G
length(results$grade[results$grade >2])/length(results$grade)

#1.H
results$name[results$grade==max(results$grade)]
results$name[results$grade==min(results$grade)]

#1.I
if(mean(results$grade[results$degree=="Bachelor"]) > mean(results$grade[results$degree=="Master"])){
  print("Media de Bachelor maior")
}else{
  print("Media de Master maior")
}

#########################QUEST??O 2
setwd("/Users/paulocalado/Documents/UFRPE/analiseDados")
load("chuvas.RData")

#2.J
mean(chuvas)

#2.K
chuvas["mun_81",1:10]

#2.L
sum(chuvas[,1:15])
sum(chuvas[,15:30])

#2.M
chuvas_soma<- rep(0,100)
for(i in 1:100){
  chuvas_soma[i]<-sum(chuvas[i,])
}
chuvas<-cbind(chuvas,soma=chuvas_soma)

#2.N
chuvas_15dias<-chuvas[,1:15]