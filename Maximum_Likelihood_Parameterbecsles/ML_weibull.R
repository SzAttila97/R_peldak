#Weibull eloszl�s c=0 -eltol�s, a-alak (shape), b -sk�la (scale), param�terrel
n<-1000

#1. eset: Exponenci�lis
a<-0.5 #alak (shape), ezt fogjuk becs�lni!!!
b<-1 # sk�la (scale), ezt fogjuk becs�lni!!!

#2. eset: Rayleigh
a<-2 #alak (shape), ezt fogjuk becs�lni!!!
b<-1 # sk�la (scale), ezt fogjuk becs�lni!!!

#1. eset: Norm�lis
a<-3.57 #alak (shape), ezt fogjuk becs�lni!!!
b<-1 # sk�la (scale), ezt fogjuk becs�lni!!!
x<-rweibull(n,shape=a,scale=b)

#Log-likelihood f�ggv�ny:
weibull_loglik<-function(y,par){
  loglik<-sum(dweibull(y,shape=par[1], scale=par[2],log=TRUE))
  return(-loglik)
}

opt<-nlm(f=weibull_loglik, p=c(2,2), y=x);opt #kiindul� �rt�k l=1, s=1
opt$estimate #param�ter becsl�se

#Mit csin�ltunk?
par(mfrow=c(1,2))
hist(x,freq = F,main="Weibull(a,b) s�r�s�gfv")
points(seq(0,25,0.1),dweibull(seq(0,25,0.1),shape=a,scale=b),type="l")
hist(x,freq = F,main="Weibull(ML becsl�ssel kapott a �s b) s�r�s�gfv")
points(seq(0,25,0.1),dweibull(seq(0,25,0.1),shape=opt$estimate[1],scale=opt$estimate[2]),type="l", col="red")