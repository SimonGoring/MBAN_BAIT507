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

| Element  | Value     |
|----------|-----------|
| Host     | localhost |
| Port     | 5432      |
| Database | ???       |
| User     | ???       |
| Password | ???       |

<!--v-->

## Storage
### Things go in, things go out

<!--v-->

## A Table in a Database

*  A table is stored as a file/files, or as a hash
*  It is defined using SQL, but the DBMS interprets the SQL and stores it in an appropriate format.

<!--v-->

## Creating the Table

```sql
CREATE TABLE tablename
CREATE TABLE IF NOT EXISTS tablename
```

<!--v-->

## Creating the Table

```sql
CREATE TABLE IF NOT EXISTS tablename
  (columnone integer,
   columntwo text,
   columnthree date)
```

<!--v-->

## Creating the Table
### Using R

```r
library(RPostgreSQL)
dbCreateTable(con, data.frame, name = "tablename")

# or, in schema:
dbCreateTable(con, data.frame, name = c("schema", "tablename"))
```

<!--v-->

## Creating the Table
### Using R (Explicitly)

```r

dbExecute(con,
  "CREATE TABLE IF NOT EXISTS tablename
    (columnone integer,
     columntwo text,
     columnthree date)")
```
<!--v-->

## Viewing the Table
### Directly from the DB

```sql
SELECT * FROM name.table
```

<!--v-->

## Viewing the Table
### Using R

```r
library(RPostgreSQL)

dbGetQuery(con, "SELECT * FROM name.table")
```

<!--v-->

## When Data Gets Big

```sql
SELECT * FROM verybigtable
```

* Could be GBs in size (instantaneous power consumption by tenant across properties over time)
* Simple `SELECT` queries could crash user computers

<!--v-->

## When Data Gets Big

* `LIMIT` and `OFFSET` limit records returned and shift position of first record.

```sql
SELECT
  *
FROM
  verybigtable
LIMIT 10
OFFSET 10
```

<!--v-->

## Table Data Ordered by Property

```sql
SELECT
  *
FROM
  verybigtable
ORDER BY columnone
LIMIT 10
```

<!--v-->

## Table Data Ordered Randomly

```sql
SELECT
  *
FROM
  verybigtable
ORDER BY random()
LIMIT 10
```

<!--s-->

## Managing Project Data

<!--v-->

### What are the steps?

* Identify the problem
  - Document (RMarkdown file)
* Find and explore data
  - R (RMarkdown file)
* Model data efficiently
  - R and Postgres
* Final analysis and data presentation
  - RMarkdown
<!--v-->

### What's the Objective?

* Database (Postgres - connection)
* Project Folder
  - RMarkdown file
  - R Folder
  - Data Folder
    - input
    - output
  - Figures
  - Drafts

<!--v-->

# So Let's Get Started
