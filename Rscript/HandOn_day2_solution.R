#===============================================================
#                 Basic R programming
#===============================================================
# TITLE  : Hand on 2; Solution
# BY     : PALANG CHOTSIRI
# DATE   : 12 Jan 2021
#===============================================================

rm(list = ls())     # clear environment 
.rs.restartR()      # restart R

setwd("D:/MyTeaching/Basic R programming/Distribute/Rscript/")

covid_clinical_data <- read.csv("../data/covid_analytics_clinical_data.csv", header = TRUE, as.is = TRUE, na.strings = c("",0,"NA",'na'))

head(covid_clinical_data, 10)

summary(covid_clinical_data)
covid_clinical_data$Mortality <- as.numeric(covid_clinical_data$Mortality)

attach(covid_clinical_data)

ggplot(covid_clinical_data, aes(x=Diabetes)) + geom_histogram() 
ggplot(covid_clinical_data, aes(x=Cardiovas)) + geom_histogram() 
ggplot(covid_clinical_data, aes(x=Cerebrovas)) + geom_histogram() 
ggplot(covid_clinical_data, aes(x=Comorbid)) + geom_histogram() 
ggplot(covid_clinical_data, aes(x=Obesity)) + geom_histogram() 
ggplot(covid_clinical_data, aes(x=Liver)) + geom_histogram() 
ggplot(covid_clinical_data, aes(x=COPD)) + geom_histogram()
ggplot(covid_clinical_data, aes(x=Cancer)) + geom_histogram()

ggplot(covid_clinical_data, aes(x=Diabetes,y=Mortality)) + 
  geom_point(aes(size=N), shape=1) + geom_smooth(method = "lm") +
  coord_cartesian(xlim = c(0,1), ylim = c(0,1))

ggplot(covid_clinical_data, aes(x=Cardiovas,y=Mortality)) + 
  geom_point(aes(size=N), shape=1) + geom_smooth(method = "lm") +
  coord_cartesian(xlim = c(0,1), ylim = c(0,1))

ggplot(covid_clinical_data, aes(x=Cerebrovas,y=Mortality)) + 
  geom_point(aes(size=N), shape=1) + geom_smooth(method = "lm")+
  coord_cartesian(xlim = c(0,1), ylim = c(0,1))

ggplot(covid_clinical_data, aes(x=Comorbid,y=Mortality)) + 
  geom_point(aes(size=N), shape=1) + geom_smooth(method = "lm")+
  coord_cartesian(xlim = c(0,1), ylim = c(0,1))

ggplot(covid_clinical_data, aes(x=Obesity,y=Mortality)) + 
  geom_point(aes(size=N), shape=1) + geom_smooth(method = "lm")+
  coord_cartesian(xlim = c(0,1), ylim = c(0,1))

ggplot(covid_clinical_data, aes(x=Liver,y=Mortality)) + 
  geom_point(aes(size=N), shape=1) + geom_smooth(method = "lm")+
  coord_cartesian(xlim = c(0,1), ylim = c(0,1))

ggplot(covid_clinical_data, aes(x=COPD,y=Mortality)) + 
  geom_point(aes(size=N), shape=1) + geom_smooth(method = "lm")+
  coord_cartesian(xlim = c(0,1), ylim = c(0,1))

ggplot(covid_clinical_data, aes(x=Cancer,y=Mortality)) + 
  geom_point(aes(size=N), shape=1) + geom_smooth(method = "lm")+
  coord_cartesian(xlim = c(0,1), ylim = c(0,1))

fit.1 <- lm(Mortality~Diabetes)
summary(fit.1)

fit.2 <- lm(Mortality~Cardiovas)
summary(fit.2)

fit.3 <- lm(Mortality~Cerebrovas)
summary(fit.3)

fit.4 <- lm(Mortality~Comorbid)
summary(fit.4)

fit.5 <- lm(Mortality~Obesity)
summary(fit.5)

fit.6 <- lm(Mortality~Liver)
summary(fit.6)

fit.7 <- lm(Mortality~COPD)
summary(fit.7)

fit.8 <- lm(Mortality~Cancer)
summary(fit.8)

# adding weight 

fit.1.w <- lm(Mortality~Diabetes, weights = N)
summary(fit.1.w)

fit.2.w <- lm(Mortality~Cardiovas, weights = N)
summary(fit.2)

fit.3.w <- lm(Mortality~Cerebrovas, weights = N)
summary(fit.3.w)

fit.4.w <- lm(Mortality~Comorbid, weights = N)
summary(fit.4.w)

fit.5.w <- lm(Mortality~Obesity, weights = N)
summary(fit.5.w)

fit.6.w <- lm(Mortality~Liver, weights = N)
summary(fit.6.w)

fit.7.w <- lm(Mortality~COPD, weights = N)
summary(fit.7.w)

fit.8.w <- lm(Mortality~Cancer, weights = N)
summary(fit.8.w)

fit.all <- lm(Mortality~Diabetes+Cardiovas+Liver+COPD+Cancer, weights = N)
summary(fit.all)
