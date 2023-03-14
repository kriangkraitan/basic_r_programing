#===============================================================
#                 Basic R programming
#===============================================================
# TITLE  : Hand on 1; Solution
# BY     : PALANG CHOTSIRI
# DATE   : 11 Jan 2021
#===============================================================

rm(list = ls())     # clear environment 
.rs.restartR()      # restart R

setwd("D:/MyTeaching/Basic R programming/Distribute/Rscript/")

gbsg_data <- read.csv("../data/gbsg.csv", header = TRUE, as.is = TRUE)

head(gbsg_data, 10)

summary(gbsg_data)
library(ggplot2)

ggplot(gbsg_data) + geom_histogram(aes(x= pgr)) + scale_x_log10()+theme_minimal()

ggplot(gbsg_data) + geom_boxplot(aes(x=er, y=as.factor(grade))) + 
  labs(x = "Estrogen level",
       y = "Tumor grade")

ggplot(gbsg_data, aes(x=er, y=as.factor(grade))) + geom_boxplot() + 
  scale_x_log10() + 
  labs(x = "Estrogen level",
       y = "Tumor grade") + 
  theme_bw()

gbsg_data$status <- factor(gbsg_data$status, labels=c("Alive","Dead"))

ggplot(gbsg_data) + geom_point(aes(x=er, y=pgr)) + 
  scale_x_log10() + scale_y_log10() +
  theme_light()+
  labs(x = "Estrogen level",
       y = "Progesterone level")

gbsg_data$grade <- factor(gbsg_data$grade, labels=c("Mild","Moderate","Severe"))

ggplot(gbsg_data, aes(x=er, y=pgr)) + 
  geom_point(aes(col=age)) + 
  scale_x_log10() + scale_y_log10() +
  scale_color_gradient(low = "white", high = "red")+
  facet_grid(status~grade) +
  geom_smooth(method = "loess", color="red") + 
  labs(x = "Estrogen level",
       y = "Progesterone level") + 
  theme_dark()

pdf("hand_on_plot.pdf", width = 8, height = 6)
ggplot(gbsg_data, aes(x=er, y=pgr)) + 
  geom_point(aes(col=age)) + 
  scale_x_log10() + scale_y_log10() +
  scale_color_gradient(low = "yellow", high = "darkgreen")+
  facet_grid(status~grade) +
  geom_smooth(method = "loess", color="red") + 
  labs(x = "Estrogen level",
       y = "Progesterone level") + 
  theme_light()
dev.off()

high_risk <- gbsg_data[gbsg_data$grade == "Severe" & gbsg_data$er <=5,]

write.table(file = "High_risk_patients.txt",
            high_risk, row.names = FALSE, sep = "\t")
