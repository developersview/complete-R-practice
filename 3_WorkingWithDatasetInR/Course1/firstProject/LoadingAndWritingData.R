rm(list=ls())

View(installed.packages())

data(package = .packages(TRUE))

data(package = 'MASS')

##############################################
install.packages('sandwich', verbose = TRUE)
data(package='sandwich')

data('PublicSchools', package='sandwich')

head(PublicSchools, 10)

str(PublicSchools)
nrow(PublicSchools)
ncol(PublicSchools)
summary(PublicSchools)

hist(PublicSchools$Expenditure, col='green')
hist(PublicSchools$Income, col='grey')

plot(PublicSchools)
##############################################

browseVignettes(package = 'survival')
data('diabetic', package = 'survival')
head(diabetic, 10)
str(diabetic)
contingency.table <- table(diabetic$laser, diabetic$eye)
contingency.table
print(contingency.table)
addmargins(contingency.table)
##############################################

load('D:/_DA+DS/07_R/complete-R-practice/3_WorkingWithDatasetInR/Course1/dataset/indian.food.RData')

head(indian.food, 10)
names(indian.food)
indian.food[12:16, c(1,3,6)]
##########################################################

install.packages('learningr')
library(learningr)

english_monarchs <- system.file("extdata",
                                "english_monarchs.csv",
                                package = 'learningr')


english_monarchs.df <- read.csv(english_monarchs, header = TRUE, fill = TRUE)

head(english_monarchs.df, 10)
tail(english_monarchs.df, 10)

###########################################################

indian.food.csv <- read.csv("D:/_DA+DS/07_R/complete-R-practice/3_WorkingWithDatasetInR/Course1/dataset/indian_food.csv", header = TRUE)
names(indian.food.csv)
head(indian.food.csv, 10)
tail(indian.food.csv)
summary(indian.food.csv)
tail(indian.food.csv[, c('name', 'diet', 'flavor_profile', 'state')], 10)





















