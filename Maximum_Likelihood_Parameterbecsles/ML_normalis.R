#Norm�lis eloszl�s m- v�rhat� �rt�k �s s - sz�r�s param�ter�nek becsl�se
n<-1000
m<-3 #v�rhat� �rt�k, ezt fogjuk becs�lni!!!
s<-2 #vsz�r�s, ezt fogjuk becs�lni!!!

x<-rnorm(n,mean=m,sd=s)

#Log-likelihood f�ggv�ny:
norm_loglik<-function(y,par){
  loglik<-sum(dnorm(y,mean=par[1], sd=par[2],log=TRUE))
  return(-loglik)
}

opt<-nlm(f=norm_loglik, p=c(1,1), y=x);opt #kiindul� �rt�k m=1, sd=1
opt$estimate #param�ter becsl�se

-m-s-3
m+s+3

#Mit csin�ltunk?
par(mfrow=c(1,2))
hist(x,freq = F,main="Norm(m,s) s�r�s�gfv")
points(seq(-8,8,0.1),dnorm(seq(-8,8,0.1),mean=m,sd=s),type="l")
hist(x,freq = F,main="Norm(ML becsl�ssel kapott m �s s) s�r�s�gfv")
points(seq(-8,8,0.1),dnorm(seq(-8,8,0.1),mean=opt$estimate[1],sd=opt$estimate[2]),type="l", col="red")