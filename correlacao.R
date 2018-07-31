install.packages("yarrr")
library(yarrr)
cor.test(formula = ~ age + parrots,
         data = pirates,
         subset = sex=="female")