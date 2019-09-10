---
title: BAIT507 - Data Management
separator: <!--s-->
verticalSeparator: <!--v-->
theme: solarized
revealOptions:
    transition: 'fade'
---

# MBAN - BAIT507
## Single table queries, LIMIT, ORDER, OFFSET

<!--v-->

## Re-connecting

Host, port, database, user, password

<!--v-->

## Storage

<!--v-->

## A Table in a Database

*  A table is stored as a file, or as a hash
*  It is defined using SQL, but the DBMS interprets the SQL and stores it in an appropriate format.

<!--v-->

## Creating the Table

```
CREATE TABLE XXXX
```

<!--v-->

## Creating the Table
### Using R

```
CREATE TABLE XXXX
```


<!--v-->

## Viewing the Table
### Directly from the DB

```
SELECT * FROM name.table
```

<!--v-->

## Viewing the Table
### Using R

```
library(RPostgreSQL)

dbGetQuery(con, "SELECT * FROM name.table")
```

<!--v-->

## Managing Large Volumes of Data

* Large tables must be transferred
* From disk, to memory, between servers
* How much memory do you have?

<!--v-->

## Cursors and FETCH

* Postgres can return a pointer
* Points to result set in memory
* User then fetches with calls to move the cursor

<!--v-->

## Cursors and FETCH

* The cursor
