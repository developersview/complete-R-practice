rm(list=ls())

bank.churners.df <- read.csv("./datasets/BankChurners.csv", header=TRUE)

head(bank.churners.df)

str(bank.churners.df)

bank.churners.df$Attrition_Flag <- factor(bank.churners.df$Attrition_Flag,
                                          levels = unique(bank.churners.df$Attrition_Flag))

str(bank.churners.df)

bank.churners.df$Gender<- factor(bank.churners.df$Gender,
                                          levels = unique(bank.churners.df$Gender))

str(bank.churners.df)

bank.churners.df$Education_Level<- factor(bank.churners.df$Education_Level,
                                 levels = unique(bank.churners.df$Education_Level))

str(bank.churners.df)


bank.churners.df$Marital_Status<- factor(bank.churners.df$Marital_Status,
                                          levels = unique(bank.churners.df$Marital_Status))

str(bank.churners.df)

unique(bank.churners.df$Income_Category)

bank.churners.df$Income_Category <- ordered(bank.churners.df$Income_Category,
                                            levels = c(
                                              "Unknown",
                                              "Less than $40K",
                                              "$40K - $60K",
                                              "$60K - $80K",
                                              "$80K - $120K",
                                              "$120K +"
                                            )
                                            )
str(bank.churners.df)

head(bank.churners.df)


unique(bank.churners.df$Card_Category)


bank.churners.df$Card_Category <- ordered(bank.churners.df$Card_Category,
                                            levels = c("Blue", "Silver", "Gold", "Platinum"))

str(bank.churners.df)

head(bank.churners.df)

colnames(bank.churners.df)

############# selection and filtering ############################3

bank.churners.personal <- bank.churners.df[, 3:8]
head(bank.churners.personal)

bank.churners.professional <- bank.churners.df[, c(1,2,9,10,11,12,13)]
head(bank.churners.professional)

bank.churners.family <- bank.churners.df[, c("Dependent_count", "Marital_Status")]
head(bank.churners.family)

bank.churners.underscore <- bank.churners.df[,grep("_", colnames(bank.churners.df))]
head(bank.churners.underscore)

bank.churners.filtered <- bank.churners.df[1:8,]
head(bank.churners.filtered)

bank.churners.filtered <- bank.churners.df[c(2,4,6,8)]
head(bank.churners.filtered)

bank.churners.filtered <- bank.churners.df[bank.churners.df$Gender == 'F',]
head(bank.churners.filtered)

bank.churners.filtered <- bank.churners.df[bank.churners.df$Education_Level == 'High School',]
head(bank.churners.filtered)

bank.churners.filtered <- bank.churners.df[bank.churners.df$Customer_Age > 60,]
head(bank.churners.filtered)

bank.churners.filtered <- bank.churners.df[bank.churners.df$Card_Category >= 'Gold',]
head(bank.churners.filtered)


bank.churners.filtered <- bank.churners.df[(bank.churners.df$Dependent_count > 0
                                           & bank.churners.df$Marital_Status == 'Married'),]
head(bank.churners.filtered)


bank.churners.filtered <- bank.churners.df[(bank.churners.df$Months_on_book > 40
                                            & bank.churners.df$Card_Category == 'Gold'),]
head(bank.churners.filtered)


bank.churners.filtered <- bank.churners.df[(bank.churners.df$Total_Revolving_Bal > 5000
                                            | bank.churners.df$Credit_Limit > 20000),]
head(bank.churners.filtered)


bank.churners.filtered <- bank.churners.df[!(bank.churners.df$Education_Level == 'Unknown'),]
head(bank.churners.filtered)


bank.churners.filtered <- bank.churners.df[(bank.churners.df$Education_Level %in%
                                               c('Graduate', 'Post-Graduate', 'Doctorate')),]
head(bank.churners.filtered)


############### selection and filtering data with tidyverse ########################################

install.packages('tidyverse')
library(tidyverse)

bank.churners.tbl <- as_tibble(bank.churners.df)
head(bank.churners.tbl)


bank.churners.filtered <- select(bank.churners.tbl,
                                 Gender, Income_Category, Credit_Limit, Total_Revolving_Bal)
head(bank.churners.filtered)

library('magrittr')


bank.churners.filtered <- bank.churners.tbl %>%
                                 select(c(Gender, Income_Category, 
                                           Credit_Limit, Total_Revolving_Bal))
head(bank.churners.filtered)



bank.churners.filtered <- bank.churners.tbl %>%
  select(-c(Gender, Income_Category, 
           Credit_Limit, Total_Revolving_Bal))
head(bank.churners.filtered)



bank.churners.filtered <- bank.churners.tbl %>%
  select(Customer_Age:Education_Level)

head(bank.churners.filtered)

bank.churners.filtered <- bank.churners.tbl %>% select(starts_with("To"))
head(bank.churners.filtered)

bank.churners.filtered <- bank.churners.tbl %>% select(ends_with("Count"))
head(bank.churners.filtered)

bank.churners.filtered <- bank.churners.tbl %>% select(matches("*ion*"))
head(bank.churners.filtered)

bank.churners.filtered <- bank.churners.tbl %>% slice(4:9)
head(bank.churners.filtered)

bank.churners.filtered <- bank.churners.tbl %>% filter(Education_Level == 'Unknown')
head(bank.churners.filtered)

bank.churners.filtered <- bank.churners.tbl %>% 
                          filter(Education_Level == 'Unknown', Gender == 'F')
head(bank.churners.filtered)


bank.churners.filtered <- bank.churners.tbl %>% 
                          filter(Education_Level == 'Unknown', Dependent_count == 0)
head(bank.churners.filtered)


bank.churners.filtered <- bank.churners.tbl %>% 
                          filter(Marital_Status %in% c("Single", "Divorced"), Dependent_count == 0)
head(bank.churners.filtered)


bank.churners.sampled <- bank.churners.tbl %>% sample_n(10, replace = TRUE)
bank.churners.sampled

bank.churners.sampled <- 
  bank.churners.tbl %>% 
  filter(Marital_Status %in% c('single', 'Divorced'), 
         Income_Category > "$60K - $80K") %>%
  sample_n(10, replace = FALSE)
bank.churners.sampled


bank.churners.sampled <- 
  bank.churners.tbl %>% 
  filter(Income_Category > "Unknown") %>%
  sample_n(5, replace = FALSE)
bank.churners.sampled



bank.churners.topn <- bank.churners.tbl %>%
  top_n(5, Credit_Limit) %>%
  select(Gender, Income_Category, Credit_Limit)
head(bank.churners.topn)


bank.churners.topn <- bank.churners.tbl %>%
  top_n(5, Total_Revolving_Bal) %>%
  select(Gender, Income_Category, Total_Revolving_Bal)
head(bank.churners.topn)















































































