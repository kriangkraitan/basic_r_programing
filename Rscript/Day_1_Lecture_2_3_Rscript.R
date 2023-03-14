#===============================================================
#                 Basic R programming
#===============================================================
# TITLE  : LECTURE 1 AM; Data exploration and ggplot
# BY     : PALANG CHOTSIRI
# DATE   : 11 Jan 2021
#===============================================================

rm(list = ls())     # clear environment 
.rs.restartR()      # restart R

##========##
## Part 1 ##  Library
##========##

install.packages("ggplot2")

library(ggplot2)  # initialize the pkg 'ggplot2'
require(ggplot2)  # another way to initialize
library()     # see list of all installed packages


## Getting help! There are several ways to get help in R:
## Type ? then the function name (if you know the function) eg

library(help="ggplot2")  # see info about 'car' pkg

?sin
??sin

## Or use the help() function

help("ggplot2")

## If you don't know the function name:

help.search('chi square') # -> it suggests chisq.test

## Use autocomplete. If you hit tab after you have input the name of the function, it gives hints on what the arguments could be, eg
#chisq.<<hit TAB here please!>>
## Use google!  As R is a common letter in the alphabet as well as our favorite stats package, you may need to add CRAN into your search term. Note that some of the people who help on these sites can be a bit terse in their answers...

## Where we are?
getwd()         # gets the working directory

dirname <- "D:/MyTeaching/Basic R programming/Distribute/Rscript/"
setwd(dirname)  # set the working directory to dir name

##========##
## Part 2 ## Import and Export file
##========##

gestation <- read.csv("../data/Gestation.csv", header = TRUE, na.strings = "NA")
head(gestation)
head(gestation, n = 15)

tail(gestation)
tail(gestation, n = 15)

View(gestation)

### Write out a file
write.csv(file = "Gestation_out.csv", gestation, row.names = FALSE)

##========##
## Part 3 ## Dataframe
##========##

states <- state.x77
head(states)
summary(states)

## structure of the data
str(states) 

##========##
## Part 4 ## Creating a dataframe
##========##

days <- c('Mon','Tue','Wed','Thu','Fri')
temp <- c(22.2,21,23,24.3,25)
rain <- c(TRUE , TRUE , FALSE , FALSE , TRUE)

df <- data.frame(days, temp, rain)
df

empty.df <- data.frame()
c1 <- 1:10
c2 <- letters[1:10]
df <- data.frame(number = c1, letters = c2)
df

##========##
## Part 5 ## Basic data exploration
##========##

gestation <- read.csv("../data/Gestation.csv", header = TRUE, na.strings = "NA")

### Exploring the data
names (gestation)
head(gestation)
tail(gestation)

summary (gestation)

nrow(gestation)
ncol(gestation)
rownames(gestation)
colnames(gestation)

View(gestation)

gestation[1,]
gestation[,5]
gestation[,"wt"]

gestation$age
gestation[gestation$id==6254,]

gestation[18:50,]

##========##
## Part 6 ## Basic ploting
##========##

hist (gestation$wt)
hist (gestation$wt, breaks = 20)

attach(gestation)   ## make the data to be globally recognised
hist (wt)
hist (wt, breaks = 20)

plot (wt~ht)
plot (wt~ht, main = "Weight-height")

plot (wt~ht, main = "Weight-height",
      xlab = "Height (inches)",
      ylab = "Weight (pound)")

##========##
## Part 6 ## ggplot
##========##

### Basic R Graphics
rm(list = ls())

data(iris)
head(iris)

summary(iris)
par(mfrow=c(1,1))
# 1 Variable - Histograms
hist(iris$Sepal.Width)

# Use relative frequency
hist(iris$Sepal.Width, freq=FALSE)   

hist(iris$Sepal.Width, freq=FALSE, breaks=30)

# 1 variables - Boxplots
boxplot(iris$Petal.Length)
boxplot(iris$Petal.Length~iris$Species)
boxplot(iris$Petal.Length~iris$Species,notch=TRUE)

# 2 variables - Plots
plot(iris$Petal.Width, iris$Petal.Length)
# Creating the outbreak dataset
outbreak=data.frame("days"=1:15,"deaths"=c(0,2,5,23,21,15,10,6,5,2,3,2,1,1,0))

outbreak

attach(outbreak)

plot(days,deaths)
plot(days,deaths,type="b")
plot(days,deaths,type="l",lwd=3)
# Plot with one qualitative variable
plot(iris$Species, iris$Petal.Length)
plot(iris$Species, iris$Petal.Length,notch=T)

# 3 variables or more - Pair-wise graphs
plot(iris[1:4])

# Labels - Title
plot(iris$Petal.Length,iris$Petal.Width, 
     main="Petal Width as a function of Petal Length",
     xlab = "Petal Length")
hist(iris$Sepal.Width,freq=F,breaks=30, 
     main="Frequencies of Sepal Width")

# Labels - Axis labels
plot(iris$Petal.Length,iris$Petal.Width, xlab = "Petal length in centimeters", 
     ylab = "Petal width in centimeters also!!!")

# Dimension of the axis
pdf(width = 3, height = 3,  
    file = "output_plot.pdf")
plot(days,deaths,type="l",lwd=3,
     xlim=c(0,30),ylim=c(0,30))
dev.off()

# Colors
hist(iris$Sepal.Width, breaks=20, col= "darkblue")
plot(iris$Species, iris$Petal.Length, xlab="Espèce", ylab="longueur des Pétales (en cm)", 
     col="yellow")
plot(days,deaths,type="l",lwd=3, col= "red")

# Low level plotting commands
# Creating the dataset
incidence=c(3,40,25,20,17,12,6,5,3,2,1,0,1,1,0)
outbreak=cbind(outbreak,incidence)
attach(outbreak)
# Add a line to an existing plot
plot(days,deaths,type="l",lwd=3,col="red",ylim=c(0,40))
lines(days,incidence,lwd=2,lty=2,col="blue")
points(days,incidence,col="black", pch = 1, cex=2)


# Add a legend to an existing graph
legend("topright",legend=c("Number of death","Incidence"), lty=c(1,2),lwd=c(3,2), col=c("red","blue"))

# Split the graph window
par(mfrow=c(1,2))
plot(iris$Petal.Width,iris$Petal.Length,col='purple')
plot(iris$Petal.Width,iris$Petal.Length,col='red')


### Basic ggplot
library(ggplot2)

ggplot(data = iris) + geom_histogram(aes(x=Sepal.Length))
ggplot(data = iris) + geom_histogram(aes(x=Sepal.Length, y=..density..))

ggplot(iris) + geom_density(aes(x=Sepal.Length))

ggplot(iris) + geom_boxplot(aes(y= Petal.Length, group=Species))

ggplot(iris) + geom_boxplot(aes(y= Petal.Length, group=Species), notch = T)

ggplot(iris) + geom_boxplot(aes(y= Petal.Length, group=Species),
                            outlier.colour = "red", outlier.size = 3)

ggplot(outbreak) + geom_point(aes(x = days, y = deaths), 
                              col = "red", size=3)

ggplot(outbreak, aes(x = days, y = deaths)) + 
  geom_line(col="blue", size=2) +
  geom_point(col = "red", size=3) 

ggplot(outbreak, aes(x = days, y = deaths)) + geom_point(size = 2, colour="red") + 
  geom_line(linetype=2, size=1, colour="blue")

ggplot(iris) + geom_point(aes(x=Species, y=Petal.Width))

ggplot(iris) + geom_jitter(aes(x=Species, y=Petal.Width))

ggplot(iris) + geom_jitter(aes(x=Species, y=Petal.Width)) + 
  geom_boxplot(aes(x=Species, y=Petal.Width))

ggplot(iris, aes(x=Species, y=Petal.Width)) + geom_jitter() + geom_boxplot()

ggplot(iris, aes(x=Species, y=Petal.Width)) + geom_jitter(width = 0.1) + 
  geom_boxplot(fill='salmon', alpha=0.5, colour="red", size=0.75)


#label
ggplot(iris, aes(x=Species, y=Petal.Width)) + geom_jitter(width = 0.2) + 
  geom_boxplot(fill='salmon', alpha=0.5, colour="red", size=0.75) +
  labs(x = "Species", 
       y = "Petal Width (cm)",
       title = "Petal Width ~ Species",
       tag = "(A)", 
       caption = "#species vs. petal width") +
  theme_bw(base_size = 20) + 
  theme(axis.title.x = element_text(colour = "green"),
        axis.ticks = element_line(color = "orange", size = 1), 
        panel.background = element_blank(), 
        panel.border = element_rect(colour = "yellow"),
        panel.grid = element_blank())

## Gestational data
gestation <- read.csv("./data/Gestation.csv", header = TRUE, na.strings = "NA")

ggplot(gestation) + geom_histogram(aes(x=age))
ggplot(gestation) + geom_histogram(aes(x=age), fill = "salmon", color = "red")
ggplot(gestation) + geom_histogram(aes(x=age), fill = "salmon", color = "red", alpha=0.5)

ggplot(gestation) + geom_histogram(aes(x=age), fill = "salmon", color = "red") +
  facet_grid(.~smoke)

ggplot(gestation) + geom_histogram(aes(x=age), fill = "salmon", color = "red") +
  facet_grid(marital~smoke)

ggplot(gestation, aes(y=wt, x=smoke)) + geom_boxplot()

ggplot(gestation, aes(y=wt, x=smoke)) + geom_jitter(shape=1)
ggplot(gestation, aes(y=wt, x=smoke)) + geom_violin()

ggplot(gestation, aes(x=wt, y=smoke)) + geom_boxplot()
ggplot(gestation, aes(x=wt, y=ed)) + geom_boxplot()

ggplot(gestation) + geom_point(aes(x=dwt, y=dht))

ggplot(gestation) + geom_point(aes(x=dwt, y=dht), color="forestgreen", shape=1)

ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_smooth(method = "lm", color="red")

ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_smooth(method = "lm", color="red") + 
  scale_y_continuous(limits = c(65,75))

ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_smooth(method = "lm", color="red") + 
  scale_y_continuous(limits = c(65,75)) + 
  theme_minimal()

ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_vline(aes(xintercept = 175), linetype=2) 

ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_vline(aes(xintercept = 175), linetype=2) +
  geom_hline(aes(yintercept = 70), linetype=3, color="darkblue")

ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_vline(aes(xintercept = 175), linetype=2) +
  geom_hline(aes(yintercept = 70), linetype=3, color="darkblue") + 
  facet_grid(.~smoke)

ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_vline(aes(xintercept = 175), linetype=2) +
  geom_hline(aes(yintercept = 70), linetype=3, color="darkblue") + 
  geom_smooth(method = "lm", color="red", se=FALSE)

ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_vline(aes(xintercept = 175), linetype=2) +
  geom_hline(aes(yintercept = 70), linetype=3, color="darkblue") + 
  facet_grid(.~smoke) +
  geom_smooth(method = "lm", color="red", se=FALSE)

ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_vline(aes(xintercept = 175), linetype=2) +
  geom_hline(aes(yintercept = 70), linetype=3, color="darkblue") + 
  facet_grid(.~smoke) +
  geom_smooth(method = "lm", color="red", se=FALSE) + 
  scale_x_log10() + scale_y_log10() 

ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_vline(aes(xintercept = 175), linetype=2) +
  geom_hline(aes(yintercept = 70), linetype=3, color="darkblue") + 
  geom_smooth(method = "lm", color="red", se=FALSE) +
  theme_classic()

ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_vline(aes(xintercept = 175), linetype=2) +
  geom_hline(aes(yintercept = 70), linetype=3, color="darkblue") + 
  geom_smooth(method = "lm", color="red", se=FALSE) +
  theme_minimal()

ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_vline(aes(xintercept = 175), linetype=2) +
  geom_hline(aes(yintercept = 70), linetype=3, color="darkblue") + 
  geom_smooth(method = "lm", color="red", se=FALSE) +
  labs(x = "Dad bodyweight (pounds)", 
       y = "Dad height (inches)") + 
  theme_minimal()

## save out graph
pdf("plot1.pdf", width = 10, height = 8)
ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_vline(aes(xintercept = 175), linetype=2) +
  geom_hline(aes(yintercept = 70), linetype=3, color="darkblue") + 
  geom_smooth(method = "lm", color="red", se=FALSE) +
  labs(x = "Dad bodyweight (pounds)", 
       y = "Dad height (inches)") + 
  theme_bw(base_size = 20)
dev.off()

png("plot1.png", width = 10, height = 8, units = "in", res = 300)
ggplot(gestation, aes(x=dwt, y=dht)) + geom_point(color="forestgreen", shape=1) +
  geom_vline(aes(xintercept = 175), linetype=2) +
  geom_hline(aes(yintercept = 70), linetype=3, color="darkblue") + 
  geom_smooth(method = "lm", color="red", se=FALSE) +
  labs(x = "Dad bodyweight (pounds)", 
       y = "Dad height (inches)") + 
  theme_bw(base_size = 20)
dev.off()

##========##
## Part 6 ## Basic statistics
##========##

mean(age, na.rm = TRUE)
median(age, na.rm = TRUE)

Modes <- function(x) {
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  ux[tab == max(tab)]
}

Modes(age)

# Measure of spread
max(age, na.rm = TRUE) - min(age, na.rm = TRUE)
Q3 <- quantile(age, 0.75, na.rm = TRUE)
Q1 <- quantile(age, 0.25, na.rm = TRUE)
Q3-Q1

IQR(age, na.rm = TRUE)

sd(age, na.rm = TRUE)

ggplot(gestation) + geom_point(aes(x = dht, y = dwt))

var(age, wt, na.rm = TRUE)
cov(age, wt, method = "pearson", use = "complete.obs")
cor(age, wt, method = "pearson", use = "complete.obs")

