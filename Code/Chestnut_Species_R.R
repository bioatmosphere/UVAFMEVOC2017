


#loading data for species of pre-blight
Fieldmodel <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Species_Composition_Field_Model.csv",header=TRUE)

library(Rmisc)
Stat <- summarySE(Fieldmodel,measurevar="Percent",groupvars=c("Case","Species"))

library(ggplot2)

fchestnut<-ggplot(Stat,aes(Species,Percent,fill=Case))+
  geom_errorbar(aes(ymin=Percent-0.8,ymax=Percent+ci),position="dodge")+
  geom_bar(stat="identity",position="dodge")+
  geom_text(aes("LIRItuli",48,label="Pre-blight"))+
  labs(x="Year",y=expression("Percent (%)"))+
  theme_bw()+
  theme(axis.text  = element_text(size=10,face="plain"),
        axis.title = element_text(size=10,face="plain"),
        axis.title.x = element_blank(),
        legend.position="none",
        legend.justification = "center",
        legend.position=c(0.89,0.79),
        legend.title= element_blank(),
        legend.text = element_text(size = 10, face = "plain"),
        legend.key = element_rect(colour="white"),
        legend.key.width = unit(0.4,"in"),
        legend.key.height= unit(0.15,"in"))+
  scale_fill_manual(values=c('grey','red'))
  

#Loading data for present species
BAcomp <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Present_Species_Composition_BA_Inven_Model.csv",
                   header=TRUE)

#Statistical summary of the data
library(Rmisc)
BAcompstat <-summarySE(BAcomp,measurevar="BA_Per",groupvars=c("Case","Species"))

fpresent<-ggplot(BAcompstat,aes(Species,BA_Per,fill=Case))+
  geom_errorbar(aes(ymin=BA_Per-0.8,ymax=BA_Per+ci),position="dodge")+
  geom_bar(stat="identity",position="dodge")+
  geom_text(aes("QUERalba",70,label="Present"))+
  labs(x="Year",y=expression("Percent (%)"))+
  theme_bw()+
  theme(axis.text  = element_text(size=10,face="plain"),
        axis.title = element_text(size=10,face="plain"),
        axis.title.x = element_blank(),
        #legend.position='none',
        legend.justification = "center",
        legend.position=c(0.89,0.79),
        legend.title= element_blank(),
        legend.text = element_text(size = 10, face = "plain"),
        legend.key = element_rect(colour="white"),
        legend.key.width = unit(0.4,"in"),
        legend.key.height= unit(0.15,"in"))+
  scale_fill_manual(values=c('grey','red'))



library(cowplot)
plot_grid(fpresent,fchestnut,ncol=1,nrow=2,align="v")

                 
                 