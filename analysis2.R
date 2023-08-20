#ADR
packageurl<-"https://cran.r-project.org/src/contrib/Archive/aspace/aspace_3.2.tar.gz"
install.packages(packageurl, repos=NULL, type="source")
library(maptools)
library(aspace)
setwd("./data")
#2011
euro.dane=read.csv("UE2011.csv", header=T,sep=";", dec=",")
euro.poly<-readShapePoly("ue.shp")
coords <- coordinates(euro.poly)
colnames(coords)<-c("x","y")
centroid<-mean_centre(id=1, weighted=FALSE, weights=NULL, points=coords)
centroid<- cbind(13.78034, 48.98682)
calc_sdd(id=1, filename="SDD_Output.txt", centre.xy=NULL, calccentre=TRUE, weighted=FALSE, weights=NULL, points=coords, verbose=FALSE)  
plot(euro.poly, col="gray")
plot_sdd(plotnew=FALSE, plothv=FALSE, plotweightedpts=FALSE, plotpoints=FALSE, plotcentre=TRUE, titletxt="Measures of spatial statistics", xaxis="Easting (m)", yaxis="Northing (m)")  


weights<-euro.dane$X9
centre<-mean_centre(id=1, filename="mean_centre_Output.txt", weighted=TRUE, weights=weights, points=coords)
centre<-cbind(12.3783, 51.52021)
distances(centre.xy=centre, destmat=coords, verbose=FALSE)              
calc_sdd(id=1, filename="SDD_Output.txt", centre.xy=NULL, calccentre=TRUE, weighted=TRUE, weights=weights, points=coords, verbose=FALSE)
plot_sdd(plotnew=FALSE, plothv=FALSE, plotweightedpts=FALSE, plotpoints=FALSE, plotcentre=TRUE, centre.col='red', titletxt="Measures of spatial statistics", xaxis="Easting (m)", yaxis="Northing (m)", sdd.col='red') 
pointLabel(coords,as.character(euro.dane$X9),cex=0.7,offset=0)  
legend("bottomleft",fill=c('black', 'red'),legend=c('centroid with standard distance', 'center of gravity with weighted standard distance'), bty="n",cex=0.8)
dist(rbind(centre, centroid))

#2019
euro.dane=read.csv("UE2019.csv", header=T,sep=";", dec=",")
euro.poly<-readShapePoly("ue.shp")
coords <- coordinates(euro.poly)
colnames(coords)<-c("x","y")
centroid<-mean_centre(id=1, weighted=FALSE, weights=NULL, points=coords)
centroid<- cbind(13.78034, 48.98682)
calc_sdd(id=1, filename="SDD_Output.txt", centre.xy=NULL, calccentre=TRUE, weighted=FALSE, weights=NULL, points=coords, verbose=FALSE)  
plot(euro.poly, col="gray")
plot_sdd(plotnew=FALSE, plothv=FALSE, plotweightedpts=FALSE, plotpoints=FALSE, plotcentre=TRUE, titletxt="Measures of spatial statistics", xaxis="Easting (m)", yaxis="Northing (m)")  


weights<-euro.dane$X9
centre<-mean_centre(id=1, filename="mean_centre_Output.txt", weighted=TRUE, weights=weights, points=coords)
centre<-cbind(12.3783, 51.52021)
distances(centre.xy=centre, destmat=coords, verbose=FALSE)              
calc_sdd(id=1, filename="SDD_Output.txt", centre.xy=NULL, calccentre=TRUE, weighted=TRUE, weights=weights, points=coords, verbose=FALSE)
plot_sdd(plotnew=FALSE, plothv=FALSE, plotweightedpts=FALSE, plotpoints=FALSE, plotcentre=TRUE, centre.col='red', titletxt="Measures of spatial statistics", xaxis="Easting (m)", yaxis="Northing (m)", sdd.col='red') 
pointLabel(coords,as.character(euro.dane$X9),cex=0.7,offset=0)  
legend("bottomleft",fill=c('black', 'red'),legend=c('centroid with standard distance', 'center of gravity with weighted standard distance'), bty="n",cex=0.8)
dist(rbind(centre, centroid))


library(maptools)
library(spdep)
library(car)
library(sp)


euro.poly<-readShapePoly("ue.shp")
names(euro.poly)

euro.nb<-poly2nb(euro.poly)
euro.listw<-nb2listw(euro.nb, style="W", zero.policy=TRUE)

euro.dane=read.csv("UE2011.csv", header=T,sep=";", dec=",")

coords <- coordinates(euro.poly)
colnames(coords)<-c("x","y")

x2<- (coords[,1])^2
xy<-(coords[,1])* (coords[,2])
y2<-(coords[,2])^2

x3<-(coords[,1])^3
x2y<-x2*(coords[,2])
xy2<-(coords[,1])*y2
y3<-(coords[,2])^3

euro.dane<-cbind(euro.dane, coords, x2, xy, y2, x3, x2y, xy2 , y3)
brks<-round(fivenum(euro.dane$X9),digits=1)
cols<-c("lightblue","green","red","blueviolet")
plot(euro.poly,col=cols[findInterval(euro.dane$X9,brks)],forcefill=FALSE)

legend("bottomleft",fill=cols,legend=c("less than Median-Q", "from Median-Q to Median", "from Median to Median+Q", "more than Median+Q"),leglabs(brks2),bty="n",cex=0.8)


#Fitting the trend surface
library(rgl)
library(Rcmdr)
library(RcmdrMisc)
scatter3d(X9~x+y, data=euro.dane, fit="smooth", residuals=FALSE, axis.scales=FALSE) 
scatter3d(X9~x+y, data=euro.dane, fit="linear", residuals=FALSE, axis.scales=FALSE) 
scatter3d(X9~x+y, data=euro.dane, fit="quadratic", residuals=FALSE, axis.scales=FALSE)

#Estimation and statistical verification of spatial trend
##Estimation of first-order trend.
trend1.lm<-lm(X9~x+y,data=euro.dane)
summary(trend1.lm)

##Estimation of second-order trend.
trend2.lm<-lm(X9~x+y+x2+xy+y2,data=euro.dane)
summary(trend2.lm)

#Extraction of residuals and their inclusion into the data
residuals2011<-trend1.lm$residuals

euro.dane<-cbind(euro.dane, residuals2011)

#Splitting residuals into two groups
brks1<-c(round(min(euro.dane$residuals2011), digits=2), 0, round(max(euro.dane$residuals2011), digits=2))

cols<-c("grey80", "grey45")

plot(euro.poly,col=cols[findInterval(euro.dane$residuals2011,brks1)],forcefill=FALSE)

legend("bottomleft",fill=cols,legend=c("negative residuals", "positive residuals"),leglabs(brks),bty="n",cex=0.9)



#2019
euro.dane=read.csv("UE2019.csv", header=T,sep=";", dec=",")

coords <- coordinates(euro.poly)
colnames(coords)<-c("x","y")

x2<- (coords[,1])^2
xy<-(coords[,1])* (coords[,2])
y2<-(coords[,2])^2

x3<-(coords[,1])^3
x2y<-x2*(coords[,2])
xy2<-(coords[,1])*y2
y3<-(coords[,2])^3

euro.dane<-cbind(euro.dane, coords, x2, xy, y2, x3, x2y, xy2 , y3)
brks<-round(fivenum(euro.dane$X9),digits=1)
cols<-c("lightblue","green","red","blueviolet")
plot(euro.poly,col=cols[findInterval(euro.dane$X9,brks)],forcefill=FALSE)

legend("bottomleft",fill=cols,legend=c("less than Median-Q", "from Median-Q to Median", "from Median to Median+Q", "more than Median+Q"),leglabs(brks2),bty="n",cex=0.8)

#Fitting the trend surface
library(rgl)
library(Rcmdr)
library(RcmdrMisc)
scatter3d(X9~x+y, data=euro.dane, fit="smooth", residuals=FALSE, axis.scales=FALSE) 
scatter3d(X9~x+y, data=euro.dane, fit="linear", residuals=FALSE, axis.scales=FALSE) 
scatter3d(X9~x+y, data=euro.dane, fit="quadratic", residuals=FALSE, axis.scales=FALSE)

#Estimation and statistical verification of spatial trend
##Estimation of first-order trend.
trend1.lm<-lm(X9~x+y,data=euro.dane)
summary(trend1.lm)

##Estimation of second-order trend.
trend2.lm<-lm(X9~x+y+x2+xy+y2,data=euro.dane)
summary(trend2.lm)

