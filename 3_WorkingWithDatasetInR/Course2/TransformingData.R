rm(list=ls())

bank.customers.df <- read.csv("./datasets/BankCustomers.csv", header=TRUE)

head(bank.customers.df)

str(bank.customers.df)

summary(bank.customers.df)

colnames(bank.customers.df)

bank.customers.df <- subset(bank.customers.df, select = -c(1,2))
colnames(bank.customers.df)

head((bank.customers.df))

colnames(bank.customers.df)[8]

colnames(bank.customers.df)[8] <- "NumProducts"

colnames(bank.customers.df)[8]

colnames(bank.customers.df)

colnames(bank.customers.df)[colnames(bank.customers.df)=='Surname'] <- "LastName"

colnames(bank.customers.df)

##################### working with dplyr package ###########################################

install.packages('dplyr')
library(dplyr)

bank.customers.df <- rename(bank.customers.df, 
                            "Country" = "Geography",
                            "IsActive" = "IsActiveMember"
                            )
colnames(bank.customers.df)

str(bank.customers.df)

bank.customers.df$Gender <- factor(bank.customers.df$Gender,
                            levels = c('Female', 'Male'),
                            ordered = FALSE
                            )

str(bank.customers.df)

bank.customers.df$HasCrCard <- factor(bank.customers.df$HasCrCard,
                                      levels = c(0,1),
                                      ordered = FALSE)

bank.customers.df$IsActive <- factor(bank.customers.df$IsActive,
                                      levels = c(0,1),
                                      ordered = FALSE)

bank.customers.df$Exited <- factor(bank.customers.df$Exited,
                                      levels = c(0,1),
                                      ordered = FALSE)

str(bank.customers.df)

current.year <- as.numeric(format(Sys.Date(), "%Y"))
current.year

bank.customers.df$YearOfBirth <- current.year - bank.customers.df$Age

colnames(bank.customers.df)
str(bank.customers.df)
head(bank.customers.df)

bank.customers.df <- transform(bank.customers.df, LastName = toupper(LastName))

colnames(bank.customers.df)
str(bank.customers.df)
head(bank.customers.df)

bank.customers.df <- transform(bank.customers.df, EstimatedSalary = round(EstimatedSalary))

colnames(bank.customers.df)
str(bank.customers.df)
head(bank.customers.df)

apply(bank.customers.df, 2, function(column){length(column)})

apply(bank.customers.df, 2, function(column){mean(column)})

apply(bank.customers.df[c('Balance', 'EstimatedSalary')], 2, function(column){mean(column)})


bank.customers.df$Points <- apply(bank.customers.df[,c('Balance', 'EstimatedSalary')], 1, 
                                  function(row){
                                    if(row[1] > 10000 && row[2] > 100000){
                                      1000
                                    } else if (row[1] > 10000){
                                      600
                                    } else if (row[2] > 100000) {
                                      600
                                    } else {
                                      100
                                    }
                                  })


colnames(bank.customers.df)
str(bank.customers.df)
head(bank.customers.df[,c('LastName', 'Balance', 'EstimatedSalary', 'Points')])

increment_balance <- function(num.products, has.credit.card, balance) {
  if(num.products >= 2 && has.credit.card == 1){
    balance <- balance + 50
  } else if (has.credit.card == 1){
    balance <- balance + 10
  } else {
    balance
  }
}

bank.customers.df$Balance <- mapply(increment_balance,
                                    bank.customers.df$NumProducts,
                                    bank.customers.df$HasCrCard,
                                    bank.customers.df$Balance
                                    )


head(bank.customers.df[,c('LastName', 'NumProducts', 'HasCrCard', 'Balance')])

bank.customers.df$SeniorCitizensDepositeRate <- ifelse(bank.customers.df$Age > 60, 1, 0)

head(bank.customers.df[bank.customers.df$Age > 60, ])

bank.customers.df <- mutate(bank.customers.df, Points = Tenure * Points)

head(bank.customers.df)

bank.customers.df <- mutate(bank.customers.df,
                            EligibleForOffer = if_else(Tenure > 2, TRUE, FALSE),
                            PlatinumCard = if_else(EstimatedSalary > 110000 & HasCrCard==1, 1, 0))

head(bank.customers.df)







































































