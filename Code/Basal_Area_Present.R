#Present forest basal area,stem density#

library(ggplot2)
library(grid)


#'Stem Data'data loading#
basalarea <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Total_Basal_Area_Present.csv",header=T)

f1<- ggplot(basalarea,aes(x=Year,y=Basal_area))+
  geom_line(size=2,color='red')+
  geom_point(aes(y=Obs_BA),size=8,shape=1)+
  labs(x="Year",y=expression("Basal area ("*" "*"m"^2 *" "*"ha"^-1 *")"))+
  scale_x_continuous(expand = c(0,0),limits=c(0,507)) +
  scale_y_continuous(expand = c(0,0),limits=c(0,50)) +
  theme_bw()


#'STEM DENSITY'data loading#
stemden <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Stem_Density_Present.csv",header=T)

f2<-ggplot(stemden,aes(x=Year,y=Stem_density))+
  geom_line(size=2,color='red')+
  geom_point(aes(y=Obs_SD),size=8,shape=1)+
  labs(x="Year",y=expression("Stem density("*" "*"100*stem"*" "*"ha"^-1 *")"))+
  scale_x_continuous(expand = c(0,0),limits=c(0,507)) +
  scale_y_continuous(expand = c(0,0),limits=c(0,16)) +
  theme_bw()


library(cowplot)
plot_grid(f1,
          f2,
          ncol=2,nrow=1)
