nflData <- read.csv("/Users/paulocalado/Documents/UFRPE/analiseDados/pbp_2017_huge.csv",header = T,stringsAsFactors = F)

eaglesOffenseData <- nflData[nflData$posteam == "PHI",]
eaglesDefenseData <- nflData[nflData$DefensiveTeam == "WAS",]

brownsOffenseData <- nflData[nflData$posteam == "CLE", ]

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