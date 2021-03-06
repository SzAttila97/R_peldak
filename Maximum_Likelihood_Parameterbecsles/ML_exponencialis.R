#Exponenci�lis eloszl�s lambda param�ter�nek becsl�se
n<-1000
l<-3 #lambda, ezt fogjuk becs�lni!!!
x<-rexp(n,rate=l)

#Log-likelihood f�ggv�ny:
exp_loglik<-function(y,par){
  loglik<-sum(dexp(y,rate=par,log=TRUE))
  return(-loglik)
}
#Mgj: az�rt vessz�k a (-1)-szeres�t, mert az optimaliz�l� algoritmus
#minimum keres�sre van megirva
#Optimaliz�l�s: nlm(f= optimaliz�land� f�ggv�ny, p= param�ter kezdeti �rt�ke)
#Mgj: �rz�keny a kiindul� �rt�k v�laszt�sra, hogy v�lasztunk??

opt<-nlm(f=exp_loglik, p=1, y=x);opt #kiindul� �rt�k lambda=1
opt$estimate #param�ter becsl�se

#Mit csin�ltunk?
par(mfrow=c(1,3))
hist(x,freq = F,main="Exp(l) s�r�s�gfv")
points(seq(0,2,0.05),dexp(seq(0,2,0.05),rate=l),type="l")
hist(x,freq = F,main="Exp(ML becsl�ssel kapott lambda) s�r�s�gfv")
points(seq(0,2,0.05),dexp(seq(0,2,0.05),rate=opt$estimate),type="l", col="red")
hist(x,freq = F,main="Kett� egy�tt")
points(seq(0,2,0.05),dexp(seq(0,2,0.05),rate=l),type="l")
points(seq(0,2,0.05),dexp(seq(0,2,0.05),rate=opt$estimate),type="p", col="red")