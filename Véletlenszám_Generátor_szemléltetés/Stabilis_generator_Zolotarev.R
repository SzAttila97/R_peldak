#Stabilis generator

install.packages("stabledist") #MEN�
library(stabledist) #LOAD

stabilis_gen<-function(n){
  alpha=2; #alpha ]0;2] �s alpha!=1
  lambda=1;
  beta = 1; #ferdes�g: [-1; 1]
  z = array(n)
   for (i in 1:n){
    xszi<-runif(1,-pi/2,pi/2)   #1 db egyenletes
    eta<-rexp(1,lambda)
    z[i]<-(sin(alpha*xszi)/(cos(xszi)^(1/alpha)))*((cos((1-alpha)*xszi)/eta))^((1-alpha)/alpha) 
  }
   
  par(mfrow=c(1,2))
  hist(z,freq=F,main="Zolotarev-f�le")
  points(seq(-6,6,0.01),dstable(seq(-6,6,0.01),alpha,beta),type="l",col="red")

  y<-rstable(n,alpha,beta) #gamma a scale, delta shift lenne m�g
  hist(y,freq=F,main="Stabilis R h�v�ssal")
  points(seq(-6,6,0.01),dstable(seq(-6,6,0.01),alpha,beta),type="l",col="red")
}

stabilis_gen(10000)






