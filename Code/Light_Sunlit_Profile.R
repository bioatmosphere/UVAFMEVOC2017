#data loading#
PPFD <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Light_Sunlit_Profile.csv",header=T)

library(ggplot2)
library(grid)

f1<-ggplot(PPFD,aes(x=Sunlit_Fraction_10))+
  geom_point(aes(y=LAI_10),shape=18,size=4)+
  geom_line(aes(y=LAI_10))+
  geom_text(aes(0.15525,-0.0005,label="10-year"))+
  labs(x="Sunlit leaf fraction",y=expression("LAI ("*"m"^2*" "*"m"^-2*")"))+
  scale_x_continuous(expand=c(0,0),limits=c(0.15445,0.1561))+
  scale_y_continuous(expand=c(0,0),limits=c(-0.021,0.001))+
  theme_bw()+
  theme(axis.title = element_text(face="plain"))
 
  
f2<-ggplot(PPFD,aes(x=Sunlit_Fraction_300))+
  geom_point(aes(y=LAI_300),shape=18,size=4)+
  geom_line(aes(y=LAI_300))+
  geom_text(aes(0.4,-0.30,label="300-year"))+
  labs(x="Sunlit leaf fraction",y=expression("LAI ("*"m"^2*" "*"m"^-2*")"))+
  scale_x_continuous(expand=c(0,0),limits=c(-0.02,0.82))+
  scale_y_continuous(expand=c(0,0),limits=c(-5.1,0))+
  theme_bw()+
  theme(#axis.title.y=element_blank(),
        axis.title = element_text(face="plain"),
        plot.background=element_rect(fill="white"))


f3<-ggplot(PPFD,aes(y=LAI_10))+
  geom_point(aes(x=Sunlit_PPFD_10),shape=18,size=4,color="red")+
  geom_line(aes(x=Sunlit_PPFD_10),color="red")+
  geom_point(aes(x=Shaded_PPFD_10),shape=18,size=4)+
  geom_line(aes(x=Shaded_PPFD_10))+
  labs(x=expression("PPFD(umol"*" "*"m"^-2*" "*"s"^-1*")"),y=expression("LAI ("*"m"^2*" "*"m"^-2*")"))+
  scale_x_continuous(expand=c(0,0),limits=c(-10,350))+
  scale_y_continuous(expand=c(0,0),limits=c(-0.021,0.001))+
  theme_bw()+
  theme(axis.title = element_text(face="plain"))


f4<-ggplot(PPFD,aes(y=LAI_300))+
  geom_point(aes(x=Sunlit_PPFD_300),shape=18,size=4,color='red')+
  geom_line(aes(x=Sunlit_PPFD_300),color='red')+
  geom_point(aes(x=Shaded_PPFD_300),shape=18,size=4)+
  geom_line(aes(x=Shaded_PPFD_300))+
  labs(x=expression("PPFD(umol"*" "*"m"^-2*" "*"s"^-1*")"),y=expression("LAI ("*"m"^2*" "*"m"^-2*")"))+
  scale_x_continuous(expand=c(0,0),limits=c(-10,615))+
  scale_y_continuous(expand=c(0,0),limits=c(-5.1,0))+
  theme_bw()+
  theme(#axis.title.y=element_blank(),
        axis.title = element_text(face="plain"),
        plot.background=element_rect(fill="white"))
        #plot.margin=unit(c(,,,1),unit="cm"))

library(cowplot)
plot_grid(f1,f2,f3,f4,ncol=2,nrow=2,
          align=c("v","h"))
