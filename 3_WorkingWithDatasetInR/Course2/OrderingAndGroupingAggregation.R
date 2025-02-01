rm(list=ls())

car.price.df <- read.csv("./datasets/CarPrice_Assignment.csv", header=TRUE)
head(car.price.df)

colnames(car.price.df)

car.price.df <- car.price.df[, c(
  "CarName", "fueltype", "doornumber", "carbody", "drivewheel", "curbweight",    
  "horsepower", "citympg", "highwaympg", "price" 
)]

colnames(car.price.df)
head(car.price.df)

str(car.price.df)

car.price.df$fueltype <- factor(car.price.df$fueltype,
                                levels = unique(car.price.df$fueltype))
str(car.price.df)


car.price.df$doornumber <- factor(car.price.df$doornumber,
                                levels = unique(car.price.df$doornumber))
str(car.price.df)


car.price.df$carbody <- factor(car.price.df$carbody,
                                  levels = unique(car.price.df$carbody))
str(car.price.df)


car.price.df$drivewheel <- ordered(car.price.df$drivewheel,
                               levels = c("rwd", "fwd", "4wd"))
str(car.price.df)

###################### sorting operations ###############################################
order(car.price.df$horsepower)

car.price.ordered <- car.price.df[order(car.price.df$horsepower),]
head(car.price.ordered)

car.price.ordered <- car.price.df[order(car.price.df$price),]
head(car.price.ordered)



car.price.ordered <- car.price.df[order(desc(car.price.df$horsepower)),]
head(car.price.ordered)

car.price.ordered <- car.price.df[order(desc(car.price.df$price)),]
head(car.price.ordered)



car.price.ordered <- car.price.df[order(-car.price.df$horsepower),]
head(car.price.ordered)

car.price.ordered <- car.price.df[order(-car.price.df$price),]
head(car.price.ordered)



car.price.ordered <- car.price.df[order(car.price.df$drivewheel),]
head(car.price.ordered)


car.price.ordered <- car.price.df[order(car.price.df$drivewheel, -car.price.df$horsepower),]
head(car.price.ordered)

library(tidyverse)
library(magrittr)

car.price.tbl <- as_tibble(car.price.df)
head(car.price.tbl)

car.price.ordered <- car.price.tbl %>% arrange(price)
head(car.price.ordered)

car.price.ordered <- car.price.tbl %>% arrange(desc(price))
head(car.price.ordered)

car.price.ordered <- car.price.tbl %>% arrange(-price, -horsepower)
head(car.price.ordered)


###################### grouping operations ###############################################

car.price.table <- table(car.price.df$fueltype)
car.price.table

car.price.table <- table(car.price.df$drivewheel)
car.price.table

car.price.table <- table(car.price.df$carbody)
car.price.table

car.price.table <- prop.table(table(car.price.df$carbody))
car.price.table

car.price.table <- table(car.price.df$carbody, car.price.tbl$drivewheel)
car.price.table

car.price.table <- prop.table(table(car.price.df$carbody, car.price.tbl$drivewheel))
car.price.table

car.price.table <- table(car.price.df$fueltype, car.price.tbl$drivewheel)
car.price.table

car.price.table <- prop.table(table(car.price.df$fueltype, car.price.tbl$drivewheel))
car.price.table

str(car.price.df)

aggregate(car.price.df$horsepower ~ car.price.df$drivewheel, FUN = max)
aggregate(car.price.df$horsepower ~ car.price.df$drivewheel, FUN = min)
aggregate(car.price.df$horsepower ~ car.price.df$drivewheel, FUN = mean)


aggregate(price ~ carbody, data = car.price.df, FUN = max)
aggregate(price ~ carbody, data = car.price.df, FUN = min)
aggregate(price ~ carbody, data = car.price.df, FUN = mean)
aggregate(price ~ carbody, data = car.price.df, FUN = median)

aggregate(citympg ~ carbody, data = car.price.df, FUN = mean)

aggregate(citympg ~ carbody + fueltype, data = car.price.df, FUN = mean)

aggregate(citympg ~ carbody + fueltype, data = car.price.df, FUN = c(mean, median))


aggregate(citympg ~ carbody + fueltype, 
          data = car.price.df, 
          FUN = function(x){
            result <- c(mean(x), median(x))
            names(result) <- c("mean", "median")
            result
          })

aggregate(citympg ~ carbody + fueltype, 
          data = car.price.df, 
          FUN = function(x){
              quantile(x, c(0.25, 0.5, 0.75))
          })


library(dplyr)

summarise(car.price.tbl, count = n())

summarize(car.price.tbl, count = n())

summarize(car.price.tbl, count = n_distinct(CarName))

summarize(car.price.tbl, count = n_distinct(carbody))

car.price.tbl %>% summarise(count=n_distinct(carbody))

car.price.tbl %>% summarise(count=n(), mean = mean(price))

car.price.tbl %>% summarise(count=n_distinct(carbody), mean = mean(price))

car.price.tbl %>% summarise(count=n(), 
                            mean.price = mean(price),
                            mean.citympg = mean(citympg))


car.price.tbl %>% summarise(count=n(), 
                            min.price = min(price),
                            max.citympg = max(citympg))

car.price.tbl %>% group_by(drivewheel)


car.price.grouped.doornumber <- car.price.tbl %>% group_by(doornumber)

summarise(car.price.grouped.doornumber, count = n())

car.price.grouped.doornumber %>% summarise(count = n())


car.price.grouped.doornumber %>% summarise(count = n(),
                                           mean.price = mean(price),
                                           mean.highway = mean(highwaympg))





############ test ####################
df = data.frame(id = c(1, 2, 3, 4, 5, 6), 
                name = c("Alice", "Bob", "Julie", "Peter", "Jill", "James"),
                score.10 = c(3, 5, 6, 7, 3, 5))
df %>% top_n(1, score.10)


df = data.frame(name = c("Camry", "Endeavour", "City", "CR-V", "Hummer"),
                make = c("Toyota", "Ford", "Honda", "Honda", "General Motors"),
                hp = c(150, 400, 120, 130, 300))
counts(df$make)
table(df$make)


df = data.frame(id = c(1, 2, 3, 4, 5, 6), 
                name = c("Alice", "Bob", "Julie", "Peter", "Jill", "James"),
                score.10 = c(3, 5, 6, 7, 3, 5))
order(df$score.10)
















































