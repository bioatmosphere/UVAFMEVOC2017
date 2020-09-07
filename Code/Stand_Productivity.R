
#Carbon fluxes#

#data loading#
productivity <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Stand_Productivity.csv",header=T)

library(ggplot2)
library(grid)

ggplot(productivity,aes(x=Year))+
  geom_line(aes(y=NPP),color='red',size=1)+
  geom_line(aes(y=NEP),color='green',size=1)+
  geom_line(aes(y=SR),color='orange',size=1)+
  geom_hline(aes(yintercept=0))+
  geom_hline(aes(yintercept=6))+
  geom_hline(aes(yintercept=3.8),linetype='dashed')+  #observered NPP value
  geom_hline(aes(yintercept=7.9),linetype='dashed')+  #Observed NPP value
  geom_hline(aes(yintercept=-6.1),linetype='dashed')+ #Observed CO2 efflux
  geom_hline(aes(yintercept=-7),linetype='dashed')+
  geom_vline(aes(xintercept=40),linetype='dashed')+
  labs(x="Year",y=expression("C flux ("*"tC"*" "*"ha"^-1*" "*"year"^-1 *")"))+
  scale_x_continuous(expand = c(0,0),limits=c(0,500)) +
  scale_y_continuous(expand = c(0,0),limits=c(-10,10)) +
  theme_bw()+
  theme(axis.text  = element_text(size=10,face="plain"),
        axis.title = element_text(size=10,face="plain"),
        legend.position="top")

#System carbon stock change#
ggplot(productivity,aes(x=Year,y=TOC))+
  geom_line(color='red',size=2)+
  labs(x="Year",y=expression("C stock ("*" "*"t C" *" "*"ha"^-1 *")"))+
  scale_x_continuous(expand = c(0,0),limits=c(0,500)) +
  scale_y_continuous(expand = c(0,0),limits=c(20,200)) +
  theme_bw()

