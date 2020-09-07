#Plots showing the contribution by species and leaf types(shade/sunlit)

#"Contriubtion by species":data loading
isoper <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Isoprene_Contribution_by_Species.csv",header=T)

library(ggplot2)
library(grid)# where the 'unit' function from#

color <- c("red", "#9999CC","#66CC99","#999999","#E69F00")

fspecies<-ggplot(isoper, aes(Year, Iso_Per)) + 
  geom_area(aes(fill= Species),position = 'stack',alpha=1) +
  geom_hline(aes(yintercept=100),linetype='dashed')+
  labs(x="Year",y=expression("Isoprene by species(%)"))+
  scale_x_continuous(expand = c(0,1),limits=c(0,502))+
  scale_y_continuous(expand = c(0,0),limits=c(0,100.1))+
  theme_bw()+
  theme(axis.text  = element_text(size=10,face="plain"),
        axis.text.y= element_text(angle=90,hjust=0.5),
        axis.title = element_text(size=10,face="plain"),
        legend.direction='horizontal',
        legend.position="top",
        #legend.margin=
        #legend.position=c(0,1),
        #legend.justification = "center",
        legend.title= element_blank(),
        legend.text = element_text(size = 7, face = "plain"),
        legend.key = element_rect(colour="white"),
        legend.key.width = unit(0.1,"in"),
        legend.key.height= unit(0.1,"in")) +
  scale_fill_manual(breaks=c("QUERalba","QUERprin","QUERrubr","QUERvelu","Others"),
                    values=color)

     
#Isoprene contribution from sunlit and shaded leaves
isoperleaf <- read.csv("~/Desktop/Projects/IBM_VOC/Simulation_Results/Isoprene_Contribution_by_Leaftype.csv",header=T)

fleaf<-ggplot(isoperleaf,aes(x=Year,group=Leaf))+
  geom_line(aes(y=Percent_Leaf,color=Leaf),size=1.5)+ #iso.percentage
  geom_line(aes(y=Leaf_Per,color=Leaf),size=1.5,linetype='dotted')+     #leaf percentage
  labs(x="Year",y=expression(" Isoprene by leaves(%)"))+
  scale_x_continuous(expand = c(0,3),limits=c(0,505)) +
  scale_y_continuous(expand = c(0,0),limits=c(0,100)) +
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
        legend.key.height= unit(0.1,"in"))+
  scale_colour_manual(breaks=c("Shade","Sunlit"),
                      values=c("black","red"))

#Get the legend
library(gridExtra)
get_legend <- function(a.gplot){
  tmp <- ggplot_gtable(ggplot_build(a.gplot))
  leg <- which(sapply(tmp$grobs,function(x) x$name) =="guide-box")
  legend <- tmp$grobs[[leg]]
  legend
}

legend <-get_legend(fspecies)


#Combing panels in one plot#

#Option 1:
grid.arrange(legend,
             fspecies+theme(legend.position='none'),
             fleaf,
             ncol=1,nrow=3,
             heights=c(1/9,4/9,4/9))
             


#Option 2:
grid.newpage()
p1<-grid.draw(rbind(ggplotGrob(fspecies), ggplotGrob(fleaf),size = "last"))


#Option 3:
library(cowplot)
plot_grid(fspecies,
          fleaf,
          ncol=1,nrow=2,
          align="v")

