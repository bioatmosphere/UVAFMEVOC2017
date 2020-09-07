          
#plot of isoprene emission dynamics#

#data loading#
isoprene <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Isoprene_flux_CSV.csv",header=T)

library(ggplot2)
library(grid)

f1<-ggplot(isoprene,aes(x=Year,y=Isoprene,colour=Case))+
  geom_line(size=2)+
  geom_segment(aes(x=300,xend=505,y=82,yend=82),linetype='dashed',color='red')+
  geom_segment(aes(x=300,xend=505,y=55,yend=55),linetype='dashed')+
  geom_vline(aes(xintercept=200),linetype='dashed')+
  geom_vline(aes(xintercept=300),linetype='dashed')+
  labs(x="Year",y=expression("Isoprene (mg"*" "*"m"^-2 *" "*"d"^-1 *" "*")"))+
  scale_x_continuous(expand = c(0,0),limits=c(0,505)) +
  scale_y_continuous(expand = c(0,0),limits=c(0,110)) +
  theme_bw()+
  theme(axis.text  = element_text(size=10,face="plain"),
        axis.text.y= element_text(angle=90,hjust=0.5),
        axis.title = element_text(size=10,face="plain"),
        #legend.position="top",
        legend.justification = "center",
        legend.position=c(0.80,0.15),
        legend.title= element_blank(),
        legend.text = element_text(size = 10, face = "plain"),
        legend.key = element_rect(colour="white"),
        legend.key.width = unit(0.5,"in"),
        legend.key.height= unit(0.3,"in"))+
  scale_colour_manual(breaks=c("Pre-blight","Present"),
                      values=c("black","red"))
                      
    
#data loading#
isoemitter <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Isoprene_Emitters_Percent_Past_Present.csv",header=T)

f2<-ggplot(isoemitter,aes(x=Year,y=Percentage,colour=Case))+
  geom_line(size=2)+
  #geom_segment(aes(x=300,xend=505,y=82,yend=82),linetype='dashed',color='red')+
  #geom_segment(aes(x=300,xend=505,y=55,yend=55),linetype='dashed')+
  geom_vline(aes(xintercept=200),linetype='dashed')+
  geom_vline(aes(xintercept=300),linetype='dashed')+
  labs(x="Year",y=expression("Isoprene emitters percentage (%)"))+
  scale_x_continuous(expand = c(0,0),limits=c(0,505)) +
  scale_y_continuous(expand = c(0,0),limits=c(0,80)) +
  theme_bw()+
  theme(axis.text  = element_text(size=10,face="plain"),
        axis.text.y=element_text(angle=90,hjust=0.5),
        axis.title = element_text(size=10,face="plain"),
        legend.justification = "center",
        legend.position=c(0.15,0.75),
        legend.title= element_blank(),
        legend.text = element_text(size = 8, face = "plain"),
        legend.key = element_rect(colour="white"),
        legend.key.width = unit(0.3,"in"),
        legend.key.height= unit(0.2,"in"))+
  scale_colour_manual(breaks=c("Pre-blight","Present"),
                      values=c("black","red"))


library(cowplot)
plot_grid(f1+theme(legend.position='none'),
          f2,
          ncol=1,nrow=2,
          align="v")

