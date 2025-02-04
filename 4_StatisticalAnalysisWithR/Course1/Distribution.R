rm(list=ls())

install.packages("ggplot2")

library(ggplot2)

########################## Uniform distribution ################################

uniform.dist.data <- data.frame(val = runif(10, 1, 100))
uniform.dist.data
hist(uniform.dist.data$val)
ggplot(uniform.dist.data, aes(x=val)) + geom_histogram()


uniform.dist.data <- data.frame(val = runif(100, 1, 100))
uniform.dist.data
ggplot(uniform.dist.data, aes(x=val)) + geom_histogram()

uniform.dist.data <- data.frame(val = runif(10000, 1, 100))
uniform.dist.data
ggplot(uniform.dist.data, aes(x=val)) + geom_histogram()

uniform.dist.data <- data.frame(val = runif(1000000, 1, 100))
uniform.dist.data
ggplot(uniform.dist.data, aes(x=val)) + geom_histogram()

########################## Binomial distribution ###############################
rbinom(20, size = 1, prob = 0.5)

rbinom(10, size = 1000, prob = 0.03)

rbinom(10, size = 200, prob = 0.5)

dbinom(5, size = 10, prob = 0.5)

dbinom(7, size = 10, prob = 0.5)

dbinom(0:7, size = 10, prob = 0.5)

pbinom(5, size = 10, prob = 0.5)

pbinom(7, size = 10, prob = 0.5)

num.heads <- 0:20
binom.dist.data <- data.frame(val = dbinom(num.heads, size = 20, prob = 0.5))
binom.dist.data
ggplot(binom.dist.data, aes(x=num.heads, y=val)) + geom_line() + geom_point()


num.heads <- 300:700
binom.dist.data <- data.frame(val = dbinom(num.heads, size = 1000, prob = 0.5))
binom.dist.data
ggplot(binom.dist.data, aes(x=num.heads, y=val)) + geom_line() + geom_point()

num.heads <- 0:20
binom.dist.data <- data.frame(val = dbinom(num.heads, size = 20, prob = 0.8))
binom.dist.data
ggplot(binom.dist.data, aes(x=num.heads, y=val)) + geom_line()

########################## Poisson distribution ################################
rpois(n = 20, lambda = 10)

rpois(n = 7, lambda = 50)

dpois(7, lambda = 10)

dpois(10, lambda = 10)

dpois(2, lambda = 10)

ppois(7, lambda = 10)

1 - ppois(25, lambda = 25)

num.complaints <- 0:40

poisson.dis.data <- data.frame(val = dpois(num.complaints, lambda = 10))
poisson.dis.data

ggplot(poisson.dis.data, aes(x=num.complaints, y=val)) + geom_line()



num.complaints <- 0:40
poisson.dis.data <- data.frame(
  val1 = dpois(num.complaints, lambda = 5),
  val2 = dpois(num.complaints, lambda = 8),
  val3 = dpois(num.complaints, lambda = 12),
  val4 = dpois(num.complaints, lambda = 15),
  val5 = dpois(num.complaints, lambda = 10)
)

poisson.dis.data

ggplot(poisson.dis.data, aes(x=num.complaints, y=val)) + 
  geom_line(aes(y = val1, color = 'red')) +
  geom_line(aes(y = val2, color = 'blue')) +
  geom_line(aes(y = val3, color = 'green')) +
  geom_line(aes(y = val4, color = 'yellow')) +
  geom_line(aes(y = val5, color = 'orange'))




















































