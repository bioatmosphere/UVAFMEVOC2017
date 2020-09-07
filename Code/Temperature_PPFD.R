#data loading#
TEMPPPFD <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Temperature_PPFD.csv",header=T)

library(ggplot2)
library(grid)

#plotting of daily temperature vs. DOY:
fig1<-ggplot(TEMPPPFD,aes(x=DOY_T,y=Dt))+
  geom_line(aes(color=T_type),size=1)+
  labs(x="DOY",y="Temperature(°C)")+
  theme_bw()+
  theme(axis.title = element_text(size =10,face="plain"),
        axis.text.y= element_text(angle=90,hjust=0.5),
        legend.justification = "center",
        legend.position=c(0.55,0.3),
        legend.title= element_blank(),
        legend.text = element_text(size = 6, face = "plain"),
        legend.key = element_rect(colour="white"),
        legend.key.width = unit(0.2,"in"),
        legend.key.height= unit(0.1,"in"))

#PLOTTING OF hourly temp. vs. HOD:
fig2<-ggplot(TEMPPPFD,aes(x=HOD_T,y=Ht))+
  geom_point(shape=18,size=4)+
  geom_line(size=1)+
  labs(x="HOD",y="Temperature(°C)")+
  scale_x_continuous(limits=c(0,24))+
  theme_bw()+
  theme(axis.text.y= element_text(angle=90,hjust=0.5),
        axis.title = element_text(size=10,face="plain"))


#plotting 'daily PAR vs. DOY'
fig3<-ggplot(TEMPPPFD,aes(x=DOY_P,y=PPFD_D))+
  geom_line(size=1)+
  labs(x="DOY",y=expression("PPFD(umol"*" "*"m"^-2*" "*"s"^-1*")"))+
  theme_bw()+
  theme(axis.title = element_text(size=10,face="plain"),
        axis.text.y= element_text(angle=90,hjust=0.5),
        axis.title = element_text(face="plain"))

#Plotting of 'hourly radiation vs. HOD':
fig4<-ggplot(TEMPPPFD,aes(x=HOD_P,y=PPFD_H))+
  geom_point(shape=18,size=4)+
  geom_line(size=1)+
  labs(x="HOD",y=expression("PPFD(umol"*" "*"m"^-2*" "*"s"^-1*")"))+
  scale_x_continuous(limits=c(0,24))+
  theme_bw()+
  theme(axis.title = element_text(size=10,face="plain"),
        axis.text.y= element_text(angle=90,hjust=0.5))

#combing those plots:
library(cowplot)
plot_grid(fig1,fig3,fig2,fig4,ncol=2,nrow=2,align=c("h","v"))