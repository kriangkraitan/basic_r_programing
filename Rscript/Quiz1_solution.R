#### Quiz 1: Solution
## 1. Find the summation of number from 1596 to 20360
sum(1596:20360)

## 2. Find an average, sd, variance of all number from 89 to 560
89:560
vec1 <- 89:560

mean(vec1)
median(vec1)
sd(vec1)
var(vec1)

## 3. How many number between 200 to 80,000 that can be divided by 17
vec2 <- 200:80000
vec2 %% 17
vec3 <- vec2 [vec2 %% 17 ==0]
length(vec3)

## 4. Find the mean, median, sd, variance of the vector in (3)
mean(vec3)
median(vec3)
sd(vec3)
var(vec3)
