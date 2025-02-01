rm(list=ls())


setwd('D:/_DA+DS/07_R/complete-R-practice/3_WorkingWithDatasetInR/Course4')

install.packages('tidyverse')
library(tidyselect)
library(dplyr)
library(magrittr)

life.exp.df <- read.csv("./datasets/life_exp.csv", header = TRUE)
head(life.exp.df)

gdp.pop.df <- read.csv("./datasets/gdp_pop.csv", header = TRUE)
head(gdp.pop.df)

merged.df <- merge(life.exp.df, gdp.pop.df)

slice_sample(merged.df, n=10)

head(merged.df)

gdp.pop.df <- rename(gdp.pop.df, "UniqueID" = "ID")

## inner join
merged.df <- merge(life.exp.df, gdp.pop.df, 
                   by.x = "ID", by.y = "UniqueID")
head(merged.df)

## full outer join
merged.df <- merge(life.exp.df, gdp.pop.df, 
                   by.x = "ID", by.y = "UniqueID",
                   all = TRUE)
head(merged.df %>% select(-c("COUNTRY", "YEAR", "Country", "Year")))


## left join
merged.df <- merge(life.exp.df, gdp.pop.df, 
                   by.x = "ID", by.y = "UniqueID",
                   all.x = TRUE)
head(merged.df %>% select(-c("COUNTRY", "YEAR", "Country", "Year")))


## right join
merged.df <- merge(life.exp.df, gdp.pop.df, 
                   by.x = "ID", by.y = "UniqueID",
                   all.y = TRUE)
head(merged.df %>% select(-c("COUNTRY", "YEAR", "Country", "Year")))

#############################################################################

life.exp.df <- life.exp.df[,-1]
head(life.exp.df)

gdp.exp.df <- gdp.pop.df[,-1]
head(gdp.pop.df)

merged.df <- merge(life.exp.df, gdp.pop.df, 
                   by.x = c("Country","Year"), 
                   by.y = c("COUNTRY","YEAR"))
head(merged.df)

#############################################################################

life.exp.tbl <- as_tibble(read.csv("./datasets/life_exp.csv", header = TRUE))
head(life.exp.tbl)

gdp.pop.tbl <- as_tibble(read.csv("./datasets/gdp_pop.csv", header = TRUE))
head(gdp.pop.tbl)

merged.tbl <- inner_join(life.exp.tbl, gdp.pop.tbl)
head(merged.tbl)

life.exp.tbl <- life.exp.tbl[, -1]
head(life.exp.tbl)

gdp.pop.tbl <- gdp.pop.tbl[, -1]
head(gdp.pop.tbl)

merged.tbl <- inner_join(life.exp.tbl, gdp.pop.tbl,
                         by = c("Country" = "COUNTRY", "Year" = "YEAR"))
head(merged.tbl)



















