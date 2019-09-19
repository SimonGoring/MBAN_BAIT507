---
title: BAIT507 - Data Management
separator: <!--s-->
verticalSeparator: <!--v-->
theme: solarized
revealOptions:
    transition: 'fade'
---

# Queries, Joins & Indices

<!--v-->

## A SQL Query

```sql
SELECT column
FROM table
```

<!--v-->

## A SQL Query with Alias

```sql
SELECT tb.column
FROM table AS tb
```

<!--v-->

## A SQL Query with Alias in R

```r
dbGetQuery(con, "SELECT tb.column
                 FROM table AS tb")
```

<!--v-->

## With Two Tables Related

*  What is the average driver rating?
*  In `taxico`:
  - `ratings` is related to the `ride` table using the `rideid` column.  Both tables have the `rideid` column.

<!--v-->

<img src=images/rating_links.svg>

```sql
SELECT *
FROM rides AS ri
INNER JOIN ratings AS ra ON ra.rideid = ri.rideid
LIMIT 10
```
<!--v-->

## With Two Tables Related: INNER JOIN
```
| origin | destination | driver |  rider | date       | rideid | rideid | rdid | rating | comments |

|-------:|------------:|-------:|-------:|:-----------|-------:|-------:|-----:|-------:|:---------|

|  32398 |       97031 |   1349 | 154515 | 2014-01-01 |      1 |      1 |    1 |      5 | NA       |

| 367333 |      393206 |   1803 | 102723 | 2014-01-01 |      3 |      3 |    1 |      5 | NA       |

|  92351 |      433182 |   1789 | 147015 | 2014-01-01 |      4 |      4 |    1 |      3 | NA       |

| 361263 |      259311 |    124 | 196659 | 2014-01-01 |      5 |      5 |    1 |      2 | NA       |
```
<!--v-->

## Left Table vs Right Table

```sql
SELECT *
FROM
              left
  INNER JOIN right ON left.index = right.index
```

<!--v-->

## INNER JOIN

```sql
SELECT *
FROM
              left
  INNER JOIN right ON left.index = right.index
```

* Linked value must appear in both tables
  - `ON left.index = right.index`
  - `left.index` contains [1,2,3,4,5]
  - `right.index` contains [4,5,6,7,8]
  - Result set contains [4,5]

<!--v-->
## LEFT OUTER JOIN

```sql
SELECT *
FROM
                   left
  LEFT OUTER JOIN right ON left.index = right.index
```

* Linked value must appear in both tables
  - `ON left.index = right.index`
  - `left.index` contains `[1,2,3,4,5]`
  - `right.index` contains `[4,5,6,7,8]`
  - Result set contains `[1,2,3,4,5]`

<!--v-->

## RIGHT OUTER JOIN

```sql
SELECT *
FROM
                    left
  RIGHT OUTER JOIN right ON left.index = right.index
```

* Linked value must appear in both tables
  - `ON left.index = right.index`
  - `left.index` contains `[1,2,3,4,5]`
  - `right.index` contains `[4,5,6,7,8]`
  - Result set contains `[4,5,6,7,8]`

<!--v-->

## FULL OUTER JOIN

```sql
SELECT *
FROM
                   left
  FULL OUTER JOIN right ON left.index = right.index
```

* Linked value must appear in both tables
  - `ON left.index = right.index`
  - `left.index` contains `[1,2,3,4,5]`
  - `right.index` contains `[4,5,6,7,8]`
  - Result set contains `[1,2,3,4,5,6,7,8]`

<!--v-->

## Cleaning Up the Query

```sql
SELECT
  ri.rideid, ra.rdid, ra.rating
FROM rides AS ri
INNER JOIN ratings AS ra ON ra.rideid = ri.rideid
LIMIT 10
```

<!--v-->

## Cleaning Up the Query

| rideid| rdid| rating|
|------:|----:|------:|
|      1|    1|      5|
|      3|    1|      5|
|      4|    1|      3|
|      5|    1|      2|
|      6|    1|      4|

<!--v-->

## Rating For Drivers

```sql
SELECT
  ri.rideid, ro.rated, ra.rating
FROM rides AS ri
INNER JOIN ratings AS ra ON ra.rideid = ri.rideid
INNER JOIN rateobj AS ro ON ra.rdid = ro.rdid
LIMIT 10
```

<!--v-->

```
| rideid|rated     | rating|
|------:|:---------|------:|
|      1|Passenger |      5|
|      3|Passenger |      5|
|      4|Passenger |      3|
|      5|Passenger |      2|
|      6|Passenger |      4|
```

<!--v-->

```sql
SELECT
  ri.rideid, ro.rated, ra.rating
FROM rides AS ri
INNER JOIN ratings AS ra ON ra.rideid = ri.rideid
INNER JOIN rateobj AS ro ON ra.rdid = ro.rdid
WHERE ro.rated = 'Driver'
LIMIT 10
```

<!--v-->

```
| rideid|rated  | rating|
|------:|:------|------:|
|      3|Driver |      2|
|      5|Driver |      4|
|      6|Driver |      3|
|      7|Driver |      3|
```

<!--s-->

## Summarizing

```sql
SELECT
  ri.rideid, ro.rated, ra.rating
FROM rides AS ri
INNER JOIN ratings AS ra ON ra.rideid = ri.rideid
INNER JOIN rateobj AS ro ON ra.rdid = ro.rdid
WHERE ro.rated = 'Driver'
LIMIT 10
```

<!--v-->

## Aggregate Functions

* COUNT, AVG, MIN, MAX, SUM
* https://www.postgresql.org/docs/current/functions-aggregate.html

```sql
SELECT
  ro.rated, COUNT(ra.rating)
FROM rides AS ri
INNER JOIN ratings AS ra ON ra.rideid = ri.rideid
INNER JOIN rateobj AS ro ON ra.rdid = ro.rdid
WHERE ro.rated = 'Driver'
GROUP BY ro.rated
LIMIT 10
```

<!--v-->

## GROUP BY

```sql
SELECT
  ro.rated,
  ri.driver,
  AVG(ra.rating) AS avg,
  COUNT(ra.rating) AS count
FROM rides AS ri
  INNER JOIN ratings AS ra ON ra.rideid = ri.rideid
  INNER JOIN rateobj AS ro ON ra.rdid = ro.rdid
WHERE ro.rated = 'Driver'
GROUP BY ro.rated, ri.driver
ORDER BY avg ASC
LIMIT 10
```

<!--v-->

## Grouped By

```
|rated  | driver|      avg| count|
|:------|------:|--------:|-----:|
|Driver |    598| 1.000000|     1|
|Driver |     70| 1.000000|     1|
|Driver |    950| 1.000000|     1|
|Driver |   1402| 1.500000|     2|
|Driver |    979| 1.500000|     2|
|Driver |   1010| 1.600000|     5|
```
<!--v-->

## HAVING

```sql
SELECT
  ro.rated,
  ri.driver,
  ROUND(AVG(ra.rating),2) AS avg,
  COUNT(ra.rating) AS count
FROM rides AS ri
INNER JOIN ratings AS ra ON ra.rideid = ri.rideid
INNER JOIN rateobj AS ro ON ra.rdid = ro.rdid
WHERE ro.rated = 'Driver'
GROUP BY ro.rated, ri.driver
HAVING COUNT(ra.rating) > 6
ORDER BY avg ASC
LIMIT 10
```

<!--v-->

## Having

```
|rated  | driver|  avg| count|
|:------|------:|----:|-----:|
|Driver |    984| 2.00|     7|
|Driver |   1760| 2.14|     7|
|Driver |    232| 2.29|     7|
|Driver |   1909| 2.29|     7|
|Driver |   1724| 2.36|    11|
```
