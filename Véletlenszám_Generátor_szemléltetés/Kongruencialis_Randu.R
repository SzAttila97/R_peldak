#V�letlensz�m gener�l� f�ggv�ny�nk: kongruenci�lis
velszam.gen<-function(N,a,c,m){
X = matrix(0, ncol=2, nrow=N)
x = 1
for(i in 1:N) {
  x = (a*x+c) %%m
  X[i,1] = x
  X[i,2] = x/m}  #ha [0,1]-beli elemet szeretn�nk
X
}

velszam.gen(15,7,0,13)  #�rai p�lda

x<-velszam.gen(15,7,0,13)[,2]   #N=100,1000
plot(seq(0,1,length.out=length(x)),x)

velszam.gen(15,65539,0,2^31)  #RANDU gener�tor
x<-velszam.gen(15,65539,0,2^31)[,2]  #N=100,1000,10000
plot(seq(0,1,length.out=length(x)),x)

#RANDU kongruenci�lis gener�tor
randu #be�p�tett p�lda 400*3
r=cbind(randu[,1],randu[,2],randu[,3]);r
hist(randu[,1])
plot(randu[,1])  #ez m�g egyenletes
plot(randu[,3]-6*randu[,2]+9*randu[,1])  #igy m�r nem egyenletes


install.packages("rgl") #MEN�
library(rgl) #LOAD
plot3d(randu[,1],randu[,2],randu[,3])

rgl.viewpoint(theta = -3.8, phi = 3.8, fov = 0, zoom = 0.7)  #Ebb�l a sz�gb�l n�zve
plot3d(randu[,1],randu[,2],randu[,3])