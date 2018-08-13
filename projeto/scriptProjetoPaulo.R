library(dplyr)
library(tidyr)
library(ggplot2)

#importando dados
nflData <- read.csv("/Users/paulocalado/Documents/UFRPE/analiseDados/pbp_2017_huge.csv",
                    header = T,stringsAsFactors = F)
#separando a coluna time em minutes e seconds
nflData<-nflData%>%
          separate(time,
                   into = c("minutes","seconds"),
                   sep=':')
#como s?? a coluna minutes me interessa, s?? transformo ela para num??rico
nflData$minutes<- as.numeric(nflData$minutes)
View(nflData)

#separando apenas os times que focarei no trabalho
nfcSouthData <- nflData[nflData$posteam == "TB"|
                          nflData$posteam == "NO"|
                          nflData$posteam == "ATL"|
                          nflData$posteam == "CAR", c("posteam","qtr","minutes","PlayType","Yards.Gained",
                                                       "RunLocation","Rusher","Passer","Receiver",
                                                       "PassOutcome","PassLocation",
                                                       "RushAttempt","RunGap","Touchdown")]

#separando os dados por times para caso seja necess??rio depois
buccaneersOfffenseData<- nfcSouthData[nfcSouthData$posteam == "TB",]

saintsOffenseData<- nfcSouthData[nfcSouthData$posteam == "NO",]

panthersOffenseData<- nfcSouthData[nfcSouthData$posteam == "CAR",]

falconsOffenseData<- nfcSouthData[nfcSouthData$posteam == "ATL",]

#verificando m??dia de jardas ganhas de cada recebedor da NFC South
nfcSouthReceivers <- nfcSouthData %>%
  group_by(Receiver,posteam) %>%
  filter(PlayType == "Pass" & PassOutcome=="Complete") %>%
  summarise(
    meanYardsGained = mean(Yards.Gained),
    numReception = sum(PlayType=="Pass"&PassOutcome=="Complete")
  )

#Ordenando para os recebedores com maior n??mero de passes recebidos
nfcSouthReceivers<- arrange(nfcSouthReceivers,desc(numReception))
head(bucsReceivers)

#vetor com as cores dos times para ser usado nas legendas
NFCsouthColors <- c("#A71930","#0085CA","#D3BC8D","#3D3935")

#Gr??fico com os n??meros de recep????es e m??dia de jardas dos principais Recebedores da NFC South
ggplot(data=head(nfcSouthReceivers), aes(x=Receiver,y=meanYardsGained,fill=posteam))+
  geom_bar(stat="identity")+
  geom_line(aes(y =numReception/10, group = 1, color = 'green'))+ 
  geom_text(aes(y = numReception/10.7, label = numReception),  color = "white", size = 3) +
  scale_color_manual('', labels = 'Numero de Recepcoes', values = 'black') +
  labs(x="Recebedor",y="Media de Jardas",fill="Time",title="Principais Recebedores da NFC South")+
  scale_fill_manual(values = NFCsouthColors)+
  theme(plot.title =element_text(hjust = 0.5))

#verificando m??dia de jardas corridas dos jogadores de cada time
nfcSouthRb<- nfcSouthData %>%
  group_by(Rusher,posteam) %>%
  filter(PlayType == "Run") %>%
  summarise(
    mediaJardas = mean(Yards.Gained),
    numCorridas = n()
  )
#Ordenando os corredores com maior n??mero de corridas
nfcSouthRb<- arrange(nfcSouthRb,desc(numCorridas))
head(nfcSouthRb)

ggplot(data=head(nfcSouthRb), aes(x=Rusher,y=mediaJardas,fill=posteam))+
  geom_bar(stat="identity")+
  geom_line(aes(y =numCorridas/100, group = 1, color = 'green'))+ 
  geom_text(aes(y = numCorridas/105, label = numCorridas),  color = "white", size = 3) +
  scale_color_manual('', labels = 'Numero de Corridas', values = 'black') +
  labs(x="Corredor",y="Media de Jardas",fill="Time",title="Principais Corredores da NFC South")+
  scale_fill_manual(values = NFCsouthColors)+
  theme(plot.title =element_text(hjust = 0.5))

#separando para an??lisar tend??ncias de passes para cada lado
#tive que usar uma matriz por conta da fun????o para plotar os gr??ficos que n??o aceita dataframe
QBcompletePassesBySide<- as.matrix(nfcSouthData%>%
      group_by(Passer)%>%
      filter((PlayType == "Pass")&(Passer=="D.Brees"|Passer=="J.Winston"|Passer=="M.Ryan"|Passer=="C.Newton"))%>%
      summarise(
        MiddleCompleted = sum(PassOutcome=="Complete"&PassLocation=="middle",na.rm = T),
        RightCompleted = sum(PassOutcome=="Complete"&PassLocation=="right",na.rm = T),
        LeftCompleted = sum(PassOutcome=="Complete"&PassLocation=="left",na.rm = T)
      ))
#ajustando a matriz para conseguir plota-la da maneira correta no gr??fico
completePassesBySide<- matrix(as.numeric(QBcompletePassesBySide[,2:4]),nrow=4,ncol=3)

barplot(completePassesBySide,main="Passes Completos por lado do campo",
        names.arg = c("Meio","Direita","Esquerda"),ylab = "Numero de Passes completos",cex.main=0.7,
        xlab = "Direcao do Passe",col=c("#0085CA","#D3BC8D","#3D3935","#A71930"),beside = T)
legend("topleft",pch = c(15,15,15,15),col =c("#0085CA","#D3BC8D","#3D3935","#A71930"),legend = QBcompletePassesBySide[,1] )

#verificando agora o total de passes tentados para cada lado
QBtriedPassesBySide<- as.matrix(nfcSouthData%>%
    group_by(Passer)%>%
    filter((PlayType == "Pass")&(Passer=="D.Brees"|Passer=="J.Winston"|Passer=="M.Ryan"|Passer=="C.Newton"))%>%
    summarise(
       MiddleTried = sum(PassLocation=="middle",na.rm = T),
       RightTried = sum(PassLocation=="right",na.rm = T),
       LeftTried = sum(PassLocation=="left",na.rm = T)
     ))

triedPassesBySide<- matrix(as.numeric(QBtriedPassesBySide[,2:4]),nrow=4,ncol=3)

barplot(triedPassesBySide,main="Passes Completos por lado do campo",
        names.arg = c("Meio","Direita","Esquerda"),ylab = "Numero de Passes completos",cex.main=0.7,
        xlab = "Direcao do Passe",col=c("#0085CA","#D3BC8D","#3D3935","#A71930"),beside = T)
legend("topleft",pch = c(15,15,15,15),col =c("#0085CA","#D3BC8D","#3D3935","#A71930"),legend = QBcompletePassesBySide[,1] )


#Verificando agora o n??mero de corridas para cada lado do campo dos principais RB de cada time
RBrunBySide<- as.matrix(nfcSouthData%>%
      group_by(Rusher)%>%
      filter((PlayType == "Run")&(Rusher=="D.Freeman"|Rusher=="D.Martin"|Rusher=="J.Stewart"|Rusher=="M.Ingram"))%>%
      summarise(
        MiddleRun = sum(RunLocation=="middle" & Yards.Gained>0,na.rm = T),
        RightRun = sum(RunLocation=="right" & Yards.Gained>0,na.rm = T),
        LeftRun = sum(RunLocation=="left" & Yards.Gained>0,na.rm = T)
      ))

#ajustando a matriz para deixa-la num??rica
runsBySide<- matrix(as.numeric(RBrunBySide[,2:4]),nrow=4,ncol=3)

barplot(runsBySide,main="Corridas por lado do campo",
        names.arg = c("Meio","Direita","Esquerda"),ylab = "Numero de Corridas tentadas",cex.main=0.7,
        xlab = "Direcao da Corrida",col=c("#A71930","#3D3935","#0085CA","#D3BC8D"),beside = T)
legend("topleft",pch = c(15,15,15,15),col =c("#A71930","#3D3935","#0085CA","#D3BC8D"),legend = RBrunBySide[,1] )


topScorers<- nfcSouthData%>%
  group_by(Passer, posteam)%>%
  filter(PlayType=="Pass")%>%
  summarise(
    Touchdowns = sum(Touchdown==1,na.rm = T)
  )

#verificando m??dia de jardas por quarto de cada time, para isso foi necess??rio criar os seguintes dataframes
#para serem usados no gr??fico
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

#criando o gr??fico
plot(BucsMeanYardsByQuarter,type="o",main="Media de Jardas por Periodo",xaxt="n",col = NFCsouthColors[4],ylim=c(3.5,6.5),
     ylab="Media de Jardas por Jogada",xlab='Periodo',bty="n")
lines(SaintsMeanYardsByQuarter[1:4,],type = "o",col = NFCsouthColors[3])
lines(FalconsMeanYardsByQuarter,type = "o",col = NFCsouthColors[1])
lines(PanthersMeanYardsByQuarter,type = "o", col = NFCsouthColors[2])
axis(1,at=c(1,2,3,4),labels = c(1,2,3,4))
legend("bottomleft",pch = c(1,1,1,1),col= NFCsouthColors, legend=c("ATL","CAR","NO","TB"))


#PARTE ESTATIST??CA
fullBucsOffense<- nflData[nflData$posteam == "TB",]
cor.test(formula = ~Win_Prob + ScoreDiff,
         data = fullBucsOffense)

modelBucs<- lm(Win_Prob ~ ScoreDiff,
               data = fullBucsOffense)

plot(Win_Prob ~ ScoreDiff,
     pch = 16,
     main = "Linha de regressao",
     xlab = "Diferenca Pontuacao",
     ylab = "Probabilidade de Vitoria",
     data = fullBucsOffense)
abline(modelBucs,col="red")

summary(modelBucs)

shapiro.test(residuals(modelBucs))
plot(modelBucs,1)

cor.test(formula = ~yrdline100 + Opp_Touchdown_Prob,
         data = fullBucsOffense)
modelOppTD<- lm(yrdline100 ~ Opp_Touchdown_Prob,data = fullBucsOffense)
summary(modelOppTD)
shapiro.test(residuals(modelOppTD))

cor.test(formula = ~Field_Goal_Prob +FieldGoalDistance,
         data = fullBucsOffense)
modelFG<- lm(Field_Goal_Prob ~ FieldGoalDistance, data = fullBucsOffense)
summary(modelFG)
shapiro.test(residuals(modelFG))
plot(modelFG,1)