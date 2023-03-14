#===============================================================
#                 Basic R programming
#===============================================================
# TITLE  : LECTURE 6 PM, Linear regression
# BY     : PALANG CHOTSIRI
# DATE   : 12 Jan 2021
#===============================================================

rm(list = ls())  ## clear environment

setwd("D:/MyTeaching/Basic R programming/Distribute/Rscript/")
kid.data <- read.csv("../data/Kids198.csv", header = TRUE, as.is = TRUE)


# names: This function allows you to get (or set) the names of an object which in 
# this case is the data file "kid.data".
names(kid.data)

# summary: This command will return a summary information of each variable in the 
# dataset.
summary(kid.data)

# pairs: A matrix of scatterplots for every pair of varaibles in your data(Davis) 
# is produced.
pairs(kid.data)

# The attach() function in R can be used to make objects within dataframes accessible in R with fewer keystrokes.
attach(kid.data)
# A plot of weight(y-axis) against height(x-axis) will be produced
plot(Height, Weight)

library(ggplot2)

kid.data$Sex <- factor(kid.data$Sex, labels = c("Male", "Female"))

ggplot(kid.data, aes(x=Height, y=Weight)) + geom_point(aes(shape = Sex, col=Sex))

ggplot(kid.data, aes(x=Height, y=Weight)) + geom_point(aes(shape = Sex, col=Sex)) + 
  geom_smooth(method = "lm", col="red", se=FALSE) 

ggplot(kid.data, aes(x=Height, y=Weight, group=Sex)) + geom_point(aes(shape = Sex, col=Sex)) + 
  geom_smooth(method = "lm", aes(col=Sex), se=FALSE)


fit.1 <- lm(Weight ~ Height, data = kid.data)
summary(fit.1)
anova(fit.1)

ggplot(kid.data, aes(x=Height, y=Weight)) + geom_point(aes(shape = Sex, col=Sex)) + 
  geom_smooth(method = "lm", col="red", se=FALSE) 

ggplot(kid.data, aes(x=Height, y=Weight)) + geom_point(aes(shape = Sex, col=Sex),size=3) +
  geom_vline(aes(xintercept=mean(kid.data$Height)), linetype=2) +
  geom_hline(aes(yintercept=mean(kid.data$Weight)), linetype=2) +
  geom_smooth(method = "lm", col="red", se=TRUE)+ theme_gray(base_size = 20)

fit.2 <- lm(Weight ~ Height + Sex, data = kid.data)
summary(fit.2, cor = F)

ggplot(kid.data, aes(x=Height, y=Weight, group=Sex, col=Sex)) + geom_point(aes(shape = Sex)) + 
  geom_smooth(method = "lm",  se=FALSE) 

anova(fit.1, fit.2)

fit.3 <- lm(Weight ~  Height + Age )
summary(fit.3)

fit.4 <- lm(Weight ~  Height + Age + Sex)
summary(fit.4)

fit.5 <- lm(Weight ~  Height + Age + Sex + Race)
summary(fit.5)
