
#Loading data
BAcomp <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Present_Species_Composition_BA_Inven_Model.csv",
                     header=TRUE)

#Statistical summary of the data
library(Rmisc)
BAcompstat <-summarySE(BAcomp,measurevar="BA_Per",groupvars=c("Case","Species"))

library(ggplot2)
ggplot(BAcompstat,aes(Species,BA_Per,fill=Case))+
  geom_bar(stat="identity",position="dodge")+
  geom_errorbar(aes(ymin=BA_Per-ci,ymax=BA_Per+ci),position="dodge")+
  labs(x="Year",y=expression("Basal area ("*"%"*")"))+
  theme_bw()+
  theme(axis.text  = element_text(size=10,face="plain"),
        axis.title = element_text(size=10,face="plain"),
        #legend.position="top",
        legend.justification = "center",
        legend.position=c(0.5,0.85),
        legend.title= element_blank(),
        legend.text = element_text(size = 10, face = "plain"),
        legend.key = element_rect(colour="white"),
        legend.key.width = unit(0.5,"in"),
        legend.key.height= unit(0.2,"in"))+
  scale_fill_manual(values=c('grey','red'))



