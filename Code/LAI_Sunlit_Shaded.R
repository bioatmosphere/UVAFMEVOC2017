
lai <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/LAI_Sunlit_Shaded.csv",header=T)

library(ggplot2)

ggplot(lai,aes(x=Year))+
  
  ##****Note that the y values are divided by 0.632******##
  geom_line(aes(y=Shaded.leaf.area/0.632,color='Shaded'),size=1.5)+ 
  geom_line(aes(y=Sunlit.leaf.area/0.632,color='Sunlit'),size=1.5)+    
  labs(x="Year",y=expression("LAI("*"m"^2* " "*"m"^-2 *")"))+
  scale_x_continuous(expand = c(0,3),limits=c(0,505)) +
  scale_y_continuous(expand = c(0,0),limits=c(0,7)) +
  theme_bw()+
  theme(axis.text  = element_text(size=10,face="plain"),
        axis.text.y= element_text(angle=90,hjust=0.5),
        axis.title = element_text(size=10,face="plain"),
        legend.justification = "center",
        legend.position=c(0.80,0.505),
        legend.title= element_blank(),
        legend.text = element_text(size = 8, face = "plain"),
        legend.key = element_blank(),
        legend.key.width = unit(0.3,"in"),
        legend.key.height= unit(0.1,"in"))
