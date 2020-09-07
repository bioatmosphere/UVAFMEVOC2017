#data loading#
Diurnalisoprene <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Diurnal_Isoprene.csv",header=T)

library(ggplot2)
library(grid)


ggplot(Diurnalisoprene,aes(x=HOD,y=Isoprene))+
  geom_line(color='red',size=2)+
  labs(x="Hour of Day",y=expression("Isoprene ("*" "*"mg"*" "*" "*"m"^2 *" "*"h"^-1 *")"))+
  scale_x_continuous(expand = c(0,0),limits=c(0,25)) +
  scale_y_continuous(expand = c(0,0),limits=c(-0.1,5)) +
  theme_bw()
