#===============================================================
#                 Basic R programming
#===============================================================
# TITLE  : LECTURE 5 AM, Categorical variable
# BY     : PALANG CHOTSIRI
# DATE   : 12 Jan 2021
#===============================================================

alcohol <- data.frame(group = c("Non drinker", "Occasional drinker", "Frequent drinker","Regular drinker"),
                      n = c(1078,718,152,52))

ggplot(alcohol) + geom_col(aes(x=group,y=n)) +
  theme_bw()

setwd("d:/MyTeaching/Basic R programming/Distribute/Rscript/")
gbsg_data <- read.csv("../data/gbsg.csv", header = TRUE, as.is = TRUE)

table(gbsg_data$status, gbsg_data$hormon)

##Functions to calculate relative risks and odds ratios
relative.risk = function(x,  conf.level=0.95) 
{
  a = x[1,1]; b = x[1,2]; c = x[2,1]; d = x[2,2]
  RR <- (a/(a+b)) / (c/(c+d)) 
  ASE <- sqrt((b/(a*(a+b))) + (d/(c*(c+d))))
  CI <- exp(log(RR) + c(-1,1) * qnorm(0.5*(1+conf.level)) *ASE )
  list(estimator=RR,
       ASE=ASE,
       conf.interval=CI,
       conf.level=conf.level)
}


odds.ratio = function(x, pad.zeros=FALSE, conf.level=0.95) 
{
  if (pad.zeros) {
    if (any(x==0)) x <- x + 0.5
  }
  a = x[1,1]; b = x[1,2]; c = x[2,1]; d = x[2,2]
  OR = (a*d)/(b*c)
  ASE <- sqrt(sum(1/x))
  CI <- exp(log(OR) + c(-1,1) * qnorm(0.5*(1+conf.level)) *ASE )
  list(estimator=OR,
       ASE=ASE,
       conf.interval=CI,
       conf.level=conf.level)
}


covid_vaccine <- matrix(c(8, 21712, 162, 21566), nrow = 2, byrow = TRUE)

relative.risk(covid_vaccine)

odds.ratio(covid_vaccine)

chisq.test(covid_vaccine)

fisher.test(covid_vaccine)

install.packages("Exact")
library("Exact")

exact.test(t(covid_vaccine),cond.row = F)


