---
title: BAIT507 - Data Management
separator: <!--s-->
verticalSeparator: <!--v-->
theme: solarized
revealOptions:
    transition: 'fade'
---

## Indices

<!--v-->

## Indexes and Optimization

<!--v-->

* Manages query optimization.
* Store a representation of the data

<!--v-->

* **Rows**: 2, 3, 6, 7, 9, 0

* **Tuples**: *value*, name, . . .

<!--v-->

```
SELECT * FROM table WHERE column = 12
```

<!--v-->

```
SELECT * FROM table WHERE column = 12
```

```
[1, 13, 12, 15, 9, 24, 17, 39, 12, 160]
```

<!--v-->

```
SELECT * FROM table WHERE column = 12
```

```
[[1, 13, 12], [15, 9, 24], [17, 39, 12], [160]]
```
<!--v-->

## Why Indexing?

* Indexing provides a mapping between row values & pages on the physical media.

* Speeds reading & queries

<!--v-->

## Index Types

* B-tree
* Hash
* GiST
* SP-GiST
* GIN
* BRIN

<!--v-->

## Index Types

* **B-tree**
* **Hash**
* GiST
* SP-GiST
* **GIN**
* BRIN

<!--s-->

## Index Types

* **B-tree**
* Hash
* GiST
* SP-GiST
* GIN
* BRIN

<!--v-->

# B-Tree Index

<!--v-->

## B-Tree Index

* `CREATE INDEX indexname ON table(column) USING BTREE`
*  Binary tree
*  Rapidly reduces search time

<!--v-->

<img src=images/Btree_index.png>

<!--v-->

## Build the Tree
```
[[1,2,3],[4,5,6],[7,8,9],[10,11,12], [13,14,15]]
```

*  Minimize the steps to get to the value.
*  Tree stores values in `>=` nodes.

```
   [1] -- -- -- [7]
 [1]--[4]     [7]--[13]
```
<!--v-->

## Testing the speed:

* [Rscript](R/testingIndex.R)

```
noindex <- system.time(
  for (i in 1:1000) {
    suppressMessages(dbGetQuery(con, "SELECT *
     FROM datatablenoindex
     WHERE code LIKE 'l%'
        OR code LIKE 'k%';"))
  })
```

<!--v-->

## Testing the Speed

* Text search with B-Tree index faster by 17% (on 1m rows)

<!--v-->

## B-Tree Strengths

* When there are many value classes or unique.
* Small size relative to other indexes

<!--v-->

## B-Tree Limitations

* Strict equality searches:
  - `<`, `<=`, `=`, `>=`, `>`
  - Also text searches with `LIKE` or `~` (regular expressions) **ONLY** when searching for the beginning of strings.

<!--s-->

# HASH Functions

<!--v-->

## Hash functions

* `CREATE INDEX indexename ON table USING HASH (column);`

<!--v-->

## Hash functions

* Good for equality only `=`
* Strongly discoraged, but can be fast (64% faster)

<!--s-->

# GIN Index

<!--v-->

## Generalized Inverted Index

* A collection of tools to build a key:value(s) pairing
* A compound B-Tree with algorythmic decisions -- Can be tuned.
