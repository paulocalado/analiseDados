nflData <- read.csv("/Users/paulocalado/Documents/UFRPE/analiseDados/pbp_2017_huge.csv",header = T,stringsAsFactors = F)

eaglesOffenseData <- nflData[nflData$posteam == "PHI",]

panthersOffenseData <- nflData[nflData$posteam == "CAR",]
falconsOffenseData <- nflData[nflData$posteam == "ATL",]
saintsOffenseData <- nflData[nflData$posteam == "NO",]

brownsOffenseData <- nflData[nflData$posteam == "CLE", ]

buccaneersOfffenseData <- nflData[nflData$posteam == "TB",]
View(nflData$posteam == "PHI")

nflData$Yards.Gained

brownsOffenseData$Rusher[brownsOffenseData$PlayType=="Run"]
table(brownsOffenseData$Rusher[brownsOffenseData$PlayType=="Run"])

aggregate(formula = Yards.Gained ~ RunLocation,
          FUN = mean,
          data = eaglesOffenseData)

library(dplyr)

eaglesOffenseData %>%
  group_by(Rusher) %>%
  filter(PlayType=="Run") %>%
  summarise(
    meanYardsGained = mean(Yards.Gained)
  )

sum(eaglesOffenseData$PlayType=="Run"&eaglesOffenseData$Rusher=="N.Sudfeld")

buccaneersOfffenseData %>%
  group_by(Rusher) %>%
  filter(PlayType == "Run") %>%
  summarise(
    meanYardsGained = mean(Yards.Gained),
    numRuns = sum(PlayType=="Run")
  )


QBCompletePassBySide<- as.matrix(nflData%>% 
                    group_by(Passer) %>%
  filter((PlayType == "Pass")&(Passer=="D.Brees"|Passer=="J.Winston"|Passer=="M.Ryan"|Passer=="C.Newton")) %>%
  summarise(
    MiddleComplete = (sum(PassOutcome=="Complete"&PassLocation=="middle",na.rm = T)/sum(PassOutcome=="Complete"))*100,
    RightComplete = (sum(PassOutcome=="Complete"&PassLocation=="right",na.rm = T)/sum(PassOutcome=="Complete"))*100,
    LeftComplete = (sum(PassOutcome=="Complete"&PassLocation=="left",na.rm = T)/sum(PassOutcome=="Complete"))*100
  ))

NFCsouthColors <- c("#0085CA","#D3BC8D","#3D3935","#A71930")
completePassesBySide<- matrix(as.numeric(QBCompletePassBySide[,2:4]),nrow=4,ncol=3)
barplot(completePassesBySide,main="Passes Completos por lado do campo",
        names.arg = c("Meio","Direita","Esquerda"),ylab = "Porcentagem de Passes Completos %",cex.main=0.7,
        xlab = "Direcao do Passe",col=NFCsouthColors,beside = T,ylim = c(0,50))
legend("topleft",pch = c(15,15,15,15),col =NFCsouthColors,legend = QBCompletePassBySide[,1] )


BucsMeanYardsByQuarter<- buccaneersOfffenseData%>%
  group_by(qtr)%>%
  summarise(
    meanYards = mean(Yards.Gained)
  )
SaintsMeanYardsByQuarter<- saintsOffenseData%>%
  group_by(qtr)%>%
  summarise(
    meanYards = mean(Yards.Gained)
  )
FalconsMeanYardsByQuarter<- falconsOffenseData%>%
  group_by(qtr)%>%
  summarise(
    meanYards = mean(Yards.Gained)
  )
PanthersMeanYardsByQuarter<- panthersOffenseData%>%
  group_by(qtr)%>%
  summarise(
    meanYards = mean(Yards.Gained)
  )

plot(BucsMeanYardsByQuarter,type="o",main="Media de Jardas por Periodo",xaxt="n",col = NFCsouthColors[3],ylim=c(3.5,6.5),
     ylab="Media de Jardas por Jogada",xlab='Periodo',bty="n")
lines(SaintsMeanYardsByQuarter[1:4,],type = "o",col = NFCsouthColors[2])
lines(FalconsMeanYardsByQuarter,type = "o",col = NFCsouthColors[4])
lines(PanthersMeanYardsByQuarter,type = "o", col = NFCsouthColors[1])
axis(1,at=c(1,2,3,4),labels = c(1,2,3,4))
legend("bottomleft",pch = c(1,1,1,1),col= NFCsouthColors, legend=c("CAR","NO","TB","ATL"))


InterceptionBySide<-  as.matrix(nflData%>% 
                                  group_by(Passer) %>%
                                  filter((PlayType == "Pass")&(Passer=="D.Brees"|Passer=="J.Winston"|Passer=="M.Ryan"|Passer=="C.Newton")) %>%
                                  summarise(
                                    MiddleInt = sum(InterceptionThrown==1&PassLocation=="middle",na.rm = T),
                                    RightInt = sum(InterceptionThrown==1&PassLocation=="right",na.rm = T),
                                    LeftInt = sum(InterceptionThrown==1&PassLocation=="left",na.rm = T)
                                  ))
