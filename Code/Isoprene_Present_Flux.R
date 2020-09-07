#data loading#
isoprene <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Isoprene_flux_CSV_1.csv",header=T)

library(ggplot2)
library(grid)

ggplot(isoprene,aes(x=Year,y=Isoprene,Case='Present'))+
  geom_line(size=2,color ='red')+
  #geom_segment(aes(x=300,xend=505,y=82,yend=82),linetype='dashed',color='red')+
  #geom_segment(aes(x=300,xend=505,y=55,yend=55),linetype='dashed')+
  #geom_vline(aes(xintercept=200),linetype='dashed')+
  #geom_vline(aes(xintercept=300),linetype='dashed')+
  labs(x="Year",y=expression("Isoprene (mg"*" "*"m"^-2 *" "*"d"^-1 *" "*")"))+
  scale_x_continuous(expand = c(0,0),limits=c(0,506)) +
  scale_y_continuous(expand = c(0,0),limits=c(0,128)) +
  theme_bw()+
  theme(axis.text  = element_text(size=12,face="plain"),
        axis.text.y= element_text(angle=90,hjust=0.5),
        axis.title = element_text(size=14,face="plain"))
        


