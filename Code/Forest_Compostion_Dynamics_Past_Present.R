
            #Forest dynamics change with 'stacked area' plot#

#data loading for present species
dat1 <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Species_Composition_Control.csv",header=T)

library(ggplot2)
library(grid)# where the 'unit' function from#
library(gridExtra)

color <- c("red", "#9999CC","#66CC99","#999999","#E69F00", "#56B4E9", 
           "#009E73", "#F0E442", "#0072B2", "#D55E00", "blue","#CC79A7")

f1<-ggplot(dat1, aes(year, total_biomC)) + 
  geom_area(aes(fill= species),position = 'stack',alpha=1) +
  geom_text(aes(30,100,label="Present"))+
  #geom_hline(aes(yintercept=110),linetype='dashed')+
  #geom_hline(aes(yintercept=100),linetype='dashed')+
  labs(x="Year",y=expression("Biomass (tC" *" "* "ha"^-1 * ")"))+
  scale_x_continuous(expand = c(0,5),limits=c(0,500))+
  scale_y_continuous(expand = c(0,5),limits=c(0,120))+
  theme_bw()+
  theme(#panel.grid.major = element_blank(), 
        #panel.grid.minor = element_blank(),
        #plot.title = element_text(size=10,face="plain"),
        axis.text = element_text(size=10,face="plain"),
        axis.text.x = element_blank(),
        axis.title = element_text(size=10,face="plain"),
        axis.title.x=element_blank(),
        legend.direction='horizontal',
        legend.position="top",
        #legend.margin=
        #legend.position=c(0,1),
        #legend.justification = "center",
        legend.title= element_blank(),
        legend.text = element_text(size = 8, face = "plain"),
        legend.key = element_rect(colour="white"),
        legend.key.width = unit(0.3,"in"),
        legend.key.height= unit(0.1,"in")) +
  scale_fill_manual(breaks=c("QUERvelu","QUERrubr","QUERprin","QUERalba", "PRUNsero",
                             "LIRItuli","FAGUgran","CARYcord","CASTdent","ACERsacc", "ACERrubr",
                             "Other"),
                    values=color) 



#data loading
dat2 <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Succession_Dynamics_Chestnut.csv",header=T)

f2<-ggplot(dat2, aes(x=Year, y=Biomass)) + 
  geom_area(aes(fill= Species),position = 'stack',alpha=1) +
  geom_text(aes(40,100,label="Pre-blight"))+
  #geom_hline(aes(yintercept=110),linetype='dashed')+
  #geom_hline(aes(yintercept=100),linetype='dashed')+
  labs(x="Year",y=expression("Biomass (tC" *" "* "ha"^-1 * ")"))+
  scale_x_continuous(expand = c(0,5),limits=c(0,500))+
  scale_y_continuous(expand = c(0,5),limits=c(0,120))+
  theme_bw()+
  theme(#panel.grid.major = element_blank(), 
    #panel.grid.minor = element_blank(),
    #plot.title = element_text(size=10,face="plain"),
    axis.text  = element_text(size=10,face="plain"),
    axis.title = element_text(size=10,face="plain"),
    legend.direction='horizontal',
    legend.position="top",
    #legend.margin=
    #legend.position=c(0,1),
    #legend.justification = "center",
    legend.title= element_blank(),
    legend.text = element_text(size = 8, face = "plain"),
    legend.key = element_rect(colour="white"),
    legend.key.width = unit(0.3,"in"),
    legend.key.height= unit(0.1,"in")) +
  scale_fill_manual(breaks=c("QUERvelu","QUERrubr","QUERprin","QUERalba", "PRUNsero",
                             "LIRItuli","FAGUgran","CARYcord","CASTdent","ACERsacc", "ACERrubr",
                             "Other"),
                    values=color) 

#Get the legend
library(gridExtra)
get_legend <- function(a.gplot){
  tmp <- ggplot_gtable(ggplot_build(a.gplot))
  leg <- which(sapply(tmp$grobs,function(x) x$name) =="guide-box")
  legend <- tmp$grobs[[leg]]
  legend
}
legend <-get_legend(f1)


#p1<- f1+theme(legend.position='none')
p2<- f2+theme(legend.position='none')
grid.newpage()
p3<-grid.draw(rbind(ggplotGrob(f1), ggplotGrob(p2),size = "last"))



# with axis title and text in each plot
# #grid.arrange(legend,
#              f1+theme(legend.position='none'),
#              f2+theme(legend.position='none'),
#              ncol=1,nrow=3,
#              heights=c(1/9,4/9,4/9))


