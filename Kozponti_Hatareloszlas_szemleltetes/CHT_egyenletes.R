#Kockadob�s szimul�ci�n keresztul CHT szeml�ltet�s
n<-1000  #kis�rlet sz�ma
k<-10   # 1 k�s�rleten bel�l a dob�sok

x<-round(runif(n*k,1,6))
x[1:100]

X<-matrix(x,ncol=k)  #n: sor (k�s�rletek), k:oszlop (dob�sok)
head(X)

col_sum<-apply(X,1,sum);col_sum  #minden k�s�rlet dob�s�sszege (1: sor, 2: oszlop)

par(mfrow=c(1,2))
hist(col_sum,freq = F) #norm�lisra hasonl�

#Alkalmazzuk a CHT-t
mean(col_sum) #34.856 >> elm�leti: 35=10*3.5
sd(col_sum) #4.764448 >> elm�leti: 4.564355=sqrt((6-11))^2/12)*sqrt(10)

Z<-(col_sum-mean(col_sum))/sd(col_sum);Z  #Standardiz�l�s

mean(Z)  #3.479812e-16 >> elm�leti: 0
sd(Z)    #1 >> elm�leti: 1

hist(Z,freq=F)  #Standard normal
lines(seq(-3,3,0.05),dnorm(seq(-3,3,0.05)),col="red")  #Standard normalis >>> CHT
