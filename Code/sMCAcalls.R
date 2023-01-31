###################################################
## Commands for: On subset multiple correspondence analysis for incomplete 
## multivariate categorical data
## Communications in Statistics: Simulation and Computation
## Authors: J Nienkemper-Swanepoel, NJ le Roux & S Gardner-Lubbe
## Corresponding author: J Nienkemper-Swanepoel
## 2023
###################################################

###required libraries:
library(ca)

###data sets:

comp.dat <- read.table(file="Data\\comp_dat.txt",sep=",")	#simulated complete data set (uniform distribution n=100, p=5)
miss.dat <- read.table(file="Data\\miss_dat.txt",sep=",")	#10% missing at random

###functions:
#mysMCA(), adap.mjca(), subinr(), CLPna(), df2fact(), delCL(), biplFig, FormatDat()

source("Code\\sMCAfunctions.R")

######################################FUNCTION CALLS######################################

#sMCA and construction of biplot
miss.dat <- df2fact(miss.dat)   #to ensure data frame consists of factor variables
miss.dat <- FormatDat(miss.dat) #to ensure that the formatting of the data is consistent
smca.out <- mysMCA(datNA=miss.dat, method="single", seed=1234)
biplFig(CLPs=smca.out$obsCLPs, Zs=smca.out$obsZs, Lvls=smca.out$obslvl, Z.col="grey37", CLP.col="forestgreen", Z.pch=1, CLP.pch=17, CLP.cex=1.7, Z.cex=1, title="sMCA biplot")

#MCA and construction of biplot
comp.dat <- df2fact(comp.dat)   #to ensure data frame consists of factor variables
comp.dat <- FormatDat(comp.dat) #to ensure that the formatting of the data is consistent
mca.out <- mjca(comp.dat,lambda="indicator")
biplFig(CLPs=mca.out$colcoord, Zs=mca.out$rowpcoord, Lvls=mca.out$levelnames, Z.col="grey37", CLP.col="forestgreen", Z.pch=1, CLP.pch=17, CLP.cex=1.7, Z.cex=1, title="MCA biplot")
