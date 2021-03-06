#Box-M�ller algoritmus
box_muller<-function(n){
  z = matrix(0, ncol=2, nrow=n)
  for (i in 1:n){
    u<-runif(2,0,1)   #2 db egyenletest gener�lunk
    z[i,1]<-sqrt(-2*log(u[1]))*cos(2*pi*u[2])  # 1-1 db norm�lis�rt
    z[i,2]<-sqrt(-2*log(u[1]))*sin(2*pi*u[2])
  }
  x<-cbind(z[,1],z[,2])  #A m�trix 2 oszlop�t egyes�tj�k.
  
  par(mfrow=c(1,2))
  hist(x,freq=F,main="With Box-M�ller")
  points(seq(-3,3,0.01),dnorm(seq(-3,3,0.01)),type="l",col="red")
  y<-rnorm(2*n)
  hist(y,freq=F,main="Normal from R")
  points(seq(-3,3,0.01),dnorm(seq(-3,3,0.01)),type="l",col="red")
}

box_muller(10000)
