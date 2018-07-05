x = c (1, 2, 3, 3, 5, 3, 2, 4, NA)
x<- factor(x)
levels(x)

f <- factor(c("a", "a", "b", "c", "c", "d"))
f[f=="a"]
f[f%in%c("b,c")]
f[-3]

mths = c("March", "April", "January", "November",
         "January", "September", "October", "September",
         "November", "August", "January", "November", "November",
         "February", "May", "August", "July", "December",
         "August", "August", "September", "November", "February",
         "April")
mthsFactor<- factor(mths,levels=c("January","February","March","April","May","June","July","August","September","October",
                                  "November","December"))
table(mthsFactor)

resposta<- factor(c("Concordo","Concordo","Concordo Plenamente","Discordo","Concordo"))
table(resposta)
levels(resposta)<- c("Concordo Plenamente", "Concordo", "Discordo","Discordo Plenamente")

z<- factor(c("p","q","p","r","q"))
levels(z)<- c(levels(z),"w")
z[z=="p"]<- "w"
z<- factor(z)

#####################LIST
v<- list(Um="a",Dois="b",Tres="c")
v<- list(a=1:10,b="Bom Dia", c="Rural")
v<- c(v, z=2017)
v<-v[-3]

x<-list(c(1,2,3),c("A","B","C"))
x[[2]][1]<-"W"

v[[1]]<-v[[1]]+1

##################MATRIX
x<-matrix(c(1,-1,2,2,1,-1,3,0,3),3,3)
det(x)
aperm(x)
solve(x)
x[,2:3]

x<-c(10,20,30)
y<-c(40,50,60)
z<-c(70,80,90)
matXYZ<-matrix(cbind(x,y,z),3,3)
row.names(matXYZ)<-c("a","b","c")

inteiros<-c(1,2,3,4,5,6,7,8,9,10,11,12)
matrizInt<-matrix(inteiros,4,3)
colnames(matrizInt)<-c("x","y","z")
rownames(matrizInt)<-c("a","b","c","d")

m <- matrix( c(1, 2, 3,4), nrow = 2)