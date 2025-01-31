rm(list = ls())

install.packages('DBI')
library(DBI)

install.packages('RSQLite')
library(RSQLite)
library(MASS)

?dbConnect

#connection initialization
conn <- dbConnect(RSQLite::SQLite(), dbname = ':memory:')
dbListTables(conn)

#writing data
dbWriteTable(conn, 'Cars93', Cars93)
dbListTables(conn)

dbListFields(conn, 'Cars93')

dbReadTable(conn, 'Cars93')

dbGetQuery(conn, "SELECT * FROM Cars93 WHERE DriveTrain = '4WD' LIMIT 5")

dbGetQuery(conn, 
           "SELECT Manufacturer, Model, Price, Origin 
           FROM Cars93 WHERE DriveTrain = '4WD'
           ORDER BY Price DESC"
           )

dbGetQuery(conn, 
           "SELECT
              Type, 
              ROUND(AVG(Price),2) AS avg_price
            FROM
              Cars93
            GROUP BY Type
            ORDER BY avg_price DESC
           "
)

# for very large dataset
result <- dbSendQuery(conn, 
                     "SELECT
              Type, 
              ROUND(AVG(Price),2) AS avg_price
            FROM
              Cars93
            GROUP BY Type
            ORDER BY avg_price DESC
           "
)
result
class(result)

dbFetch(result)
dbClearResult(result)


results <- dbSendQuery(conn, "
                        SELECT Manufacturer, Make, Type, Price
                        FROM Cars93
                        ORDER BY Price
                       ")
page <- 1

while(!dbHasCompleted(results)){
  chunk <- dbFetch(results, n = 5)
  cat("###########################################", page, '\n')
  print(chunk)
  page <- page + 1
  if(page > 3) {
    break
  }
}
dbClearResult(results)
dbDisconnect(conn)



# new task
setwd('D:/_DA+DS/07_R/complete-R-practice/3_WorkingWithDatasetInR/Course2')
conn <- dbConnect(RSQLite::SQLite(), dbname = 'animals.db')

head(Animals, 10)

Animals$names <- rownames(Animals)

head(Animals, 10)

dbWriteTable(conn, 'Animals', Animals, overwrite = TRUE)

dbGetQuery(conn, 'SELECT * FROM Animals LIMIT 5')

dbGetQuery(conn, 'SELECT COUNT(*) FROM Animals')

head(snails)

dbWriteTable(conn, 'Snails', snails, overwrite = TRUE)

dbListTables(conn)

dbExecute(conn, "DELETE FROM Animals WHERE brain < 10")

dbGetQuery(conn, 'SELECT * FROM Animals WHERE brain < 100')

dbExecute(conn, "INSERT INTO Animals VALUES(1.35, 8.1, 'Mountain Beaver')")

dbGetQuery(conn, "SELECT * FROM Animals WHERE names = 'Mountain Beaver'")

dbDisconnect(conn)

another.conn <- dbConnect(RSQLite::SQLite(), dbname = 'animals.db')
dbListTables(another.conn)
dbDisconnect(another.conn)










































