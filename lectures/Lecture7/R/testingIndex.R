library(RPostgreSQL)
library(dplyr)
library(purrr)
library(purrrlyr)
library(sf)
library(randomNames)
library(assertthat)
library(sentimentr)

# Build will fail if the file isn't there.
assertthat::assert_that(file.exists('db_connect.txt'),
  msg = "Your connection file is missing.")

con_file <- readr::read_lines('db_connect.txt')

con <- RPostgreSQL::dbConnect(
             PostgreSQL(),
             host = con_file[1],
             port = con_file[2],
             user = con_file[3],
         password = con_file[4],
           dbname = con_file[5])

datatable <- data.frame(oid = 1:1e6,
                        code = NA,
                        value = round(runif(1e6, 10, 100)))

for(i in 1:1e6) {
  # This takes a long time.
  datatable$code[i] <- paste0(letters[sample(1:26, 3, replace = TRUE)], collapse = '')
}

dbWriteTable(con,
             "datatablenoindex",
             datatable)

dbWriteTable(con,
             "datatableindex",
             datatable)

dbExecute(con,
          "CREATE INDEX testval ON testindex(value)")

# How many data pages does this take up?
dbGetQuery(con,
           "SELECT
               pg_relation_filepath(oid),
               relpages
            FROM pg_class
            WHERE relname = 'datatable';")
