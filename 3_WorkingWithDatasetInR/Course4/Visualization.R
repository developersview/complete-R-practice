rm(list=ls())

bank.loan.df <- read.csv("./datasets/data_loan.csv", header = TRUE)

dim(bank.loan.df)

head(bank.loan.df)

colSums(is.na(bank.loan.df))

str(bank.loan.df)

bank.loan.df <- within(bank.loan.df,{
  Default <- as.factor(Default)
  Loan_type <- as.factor(Loan_type)
  Gender <- as.factor(Gender)
  Degree <- as.factor(Degree)
  Citizenship <- as.factor(Citizenship)
})

str(bank.loan.df)

### plots with basic graphics library #######################################

hist(bank.loan.df$Age,
     xlab = "Customer Age", ylab = "Count of Records",
     main = "Customer Age Histogram")

hist(bank.loan.df$Age,
     xlab = "Customer Age", ylab = "Count of Records",
     main = "Customer Age Histogram",
     breaks = 20,
     col = "green")

density(bank.loan.df$Income)

plot(density(bank.loan.df$Income))

polygon(density(bank.loan.df$Income), col = "grey", border = "black")

################### plots with ggplot2 #####################################
install.packages('ggplot2')
library(ggplot2)

ggplot(bank.loan.df, aes(x=Income))

ggplot(bank.loan.df, aes(x=Income)) + geom_histogram()

ggplot(bank.loan.df, aes(x=Income)) + geom_freqpoly()

ggplot(bank.loan.df, aes(x=Income)) + 
  geom_histogram(aes(y = ..density..), colour = "black", fill = "White") +
  geom_density(alpha = 0.2, fill = "#FF6666")

##################plots with ggplot2 and base library ######################

attach(bank.loan.df)

plot(Credit_score, Income, main = "Credit Score vs Income")

ggplot(bank.loan.df, aes(x=Credit_score, y=Income)) +
  geom_point()

ggplot(bank.loan.df, aes(x=Credit_score, y=Income)) +
  geom_point(size = 3, shape = 1)

ggplot(bank.loan.df, aes(x=Credit_score, y=Income)) +
  geom_point(size = Loan_length, alpha = 0.3, colour = "blue")

ggplot(bank.loan.df, aes(x=Credit_score, y=Income, colour = Gender)) +
  geom_point(size = Loan_length, alpha = 0.8)

boxplot(bank.loan.df$Income, main = "Summary statistic for income")

boxplot(bank.loan.df$Income ~ bank.loan.df$Degree, 
        main = "Summary statistic for income")

ggplot(bank.loan.df, aes(x=Degree, y=Income)) +
  geom_boxplot()

ggplot(bank.loan.df, aes(x=Degree, y=Income)) +
  geom_boxplot(notch = TRUE)

ggplot(bank.loan.df, aes(x=Degree, y=Income)) +
  geom_boxplot(outlier.color = "blue", outlier.shape = 1, outlier.size = 2)


ggplot(bank.loan.df, aes(x=Degree, y=Income, color=Gender)) +
  geom_boxplot(outlier.color = "blue", outlier.shape = 1, outlier.size = 2)

tsla.weekly.df <- read.csv("./datasets/TSLA_weekly.csv")
head(tsla.weekly.df)

str(tsla.weekly.df)

tsla.weekly.df$Date <- as.Date(tsla.weekly.df$Date, format = "%Y-%m-%d")
str(tsla.weekly.df)

plot(Close ~ Date, tsla.weekly.df, type = 'l')

ggplot(tsla.weekly.df, aes(x=Date, y=Close)) +
  geom_line() +
  geom_point()
















































































     