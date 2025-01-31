rm(list=ls())

PlantGrowth

unstacked_PG <- unstack(PlantGrowth)
unstacked_PG

stacked_PG <- stack(unstacked_PG)
stacked_PG

install.packages('reshape2')
library(reshape2)


### working on a real dataset ########################

oil.df <- read.csv("./datasets/U.S._crude_oil_production.csv", header=TRUE)

colnames(oil.df)

head(oil.df)

oil.df.long <- melt(oil.df,
                    id.vars = c("Date"),
                    variable.name = "Region",
                    value.name = "Quantity"
                    )


head(oil.df.long)
tail(oil.df.long)

us.crude.oil <- oil.df.long[oil.df.long$Region == 'US_Crude_Oil', ]
us.crude.oil

plot(us.crude.oil$Quantity ~ as.Date(us.crude.oil$Date, "%d/%m/%y"), type = 'o')

oil.df.wide <- dcast(oil.df.long, formula = Date ~ Region, value.var = "Quantity")

oil.df.wide

################## using tidyverse ####################################

install.packages('tidyr')
library(tidyr)

life.df <- read.csv("./datasets/life_expectancy.csv", header=TRUE)

head(life.df, 10)

life.df.wide <- spread(life.df, Year, Life.expectancy)

head(life.df.wide, 10)

life.df.long <- gather(life.df.wide, Year, Life.expectancy, "2000":"2015")

head(life.df.long, 10)

life.df.long
















































