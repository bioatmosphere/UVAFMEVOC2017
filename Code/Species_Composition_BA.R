#data loading
BA_Per <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Present_Species_Composition_BA.csv",header=T)

library(ggplot2)
library(grid)# where the 'unit' function from#

color <- c("red", "#9999CC","#66CC99","#999999","#E69F00", "#56B4E9", 
           "green", "#F0E442", "#0072B2", "#D55E00", "blue")
#"#009E73"
ggplot(BA_Per, aes(Year, Basal_Percent)) + 
  geom_area(aes(fill=Species),position ='stack',stat = "identity")+
  geom_vline(aes(xintercept=50),linetype='dashed')+
  labs(x="Year",y=expression("Basal area ("*"%"*")"))+
  scale_x_continuous(expand = c(0,1),limits=c(0,500.8))+
  scale_y_continuous(expand = c(0,0.5),limits=c(0,100.1))+
  theme_bw()+
  theme(axis.text  = element_text(size=10,face="plain"),
    axis.title = element_text(size=10,face="plain"),
    legend.direction='horizontal',
    legend.position="top",
    legend.title = element_blank(),
    legend.text  = element_text(size = 8, face = "plain"),
    legend.key  = element_rect(colour="white"),
    legend.key.width = unit(0.3,"in"),
    legend.key.height= unit(0.1,"in"))+
    scale_fill_manual(breaks=c("Black oak","Red oak","Chestnut oak","White oak",
                               "Black cherry","Yellow poplar","Beech",
                               "Hickory spp.","Sugar maple","Red maple",
                               "Other"),
                      values=color) 

