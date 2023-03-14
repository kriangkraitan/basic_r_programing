#===============================================================
#                 Basic R programming
#===============================================================
# TITLE  : LECTURE 2 AM, Hypothesis Testing 
# BY     : PALANG CHOTSIRI
# DATE   : 12 Jan 2021
#===============================================================


##========##
## Part 1 ##
##========##


# 1. One-sample test of population proportion
?binom.test
binom.test(x = 812,n = 8037,p=0.063,alternative ="two.sided",conf.level=0.95)
binom.test(x = 812,n = 8037,p=0.063,alternative ="two.sided",conf.level=0.99)


?prop.test
prop.test(x = 812,n = 8037,p=0.063,alternative = "two.sided",conf.level=0.95)
prop.test(x = 812,n = 8037,p=0.063,alternative = "two.sided",conf.level=0.99)





##========##
## Part 2 ##
##========##
setwd("D:/MyTeaching/Basic R programming/Distribute/Rscript/")

gbsg_data <- read.csv("../data/gbsg.csv", header = TRUE, as.is = TRUE)

# Parametric test
?t.test
t.test(gbsg_data$pgr, mu = 10, alternative = "greater")

# Nonparametric test
# Sign Test
binom.test(sum(gbsg_data$pgr>10,na.rm=T),length(gbsg_data$pgr))

# Signed-rank Test
wilcox.test(gbsg_data$pgr,mu = 10, alternative = "greater")







# 3. Testing the difference of population proportions

# Parametric z-test
z.prop = function(x1,x2,n1,n2){
  numerator = (x1/n1) - (x2/n2)
  p.common = (x1+x2) / (n1+n2)
  denominator = sqrt(p.common * (1-p.common) * (1/n1 + 1/n2))
  z.prop.ris = numerator / denominator
  return(z.prop.ris)
}

z.prop(324, 488, 4987,3050)

# Nonparametric Chi-square Test
prop.test(x = c(324, 488), n = c(4987, 3050))







# 4. Testing the difference of population means

# Let's explore the data first

# In the dataset, Death = 1 refers to patients who died. Death = 2 refers to patients who survived. 

# Plot a histogram
hist(gbsg_data$er[gbsg_data$status==1])
hist(gbsg_data$er[gbsg_data$status==0])

# Plot the distribution 
dens_died = density(gbsg_data$er[gbsg_data$status==1],na.rm=T)
dens_survived=density(gbsg_data$er[gbsg_data$status==0],na.rm=T)
plot(dens_died$x,dens_died$y,type = 'l')
lines(dens_survived$x,dens_survived$y,lty='dotted')

# Using ggplot
gbsg_data$status <- factor(gbsg_data$status, labels = c("Alive","Dead"))
ggplot(gbsg_data, aes(x=er, y=..density.., group=status, col=status)) + 
  geom_density(size=1.0) + 
  labs(x = "Estrogen receptor (fmol/l)")+
  theme_bw(base_size = 20)

# Check the equality of variance before proceeding with t-test
var.test(gbsg_data$er[gbsg_data$status=="Alive"], gbsg_data$er[gbsg_data$status=="Dead"])

# Parametric Test
t.test(gbsg_data$er[gbsg_data$status=="Alive"], gbsg_data$er[gbsg_data$status=="Dead"],
       var.equal = TRUE)

# Nonparametric Test
wilcox.test(gbsg_data$er[gbsg_data$status=="Alive"], gbsg_data$er[gbsg_data$status=="Dead"])


