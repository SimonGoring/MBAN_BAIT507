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

*  Binary tree
*  Rapidly reduces search time

<!--v-->

<img src=images/Btree_index.png>

<!--v-->

## Build the Tree
```
[[1,2,3],[4,5,6],[7,8,9],[10,11,12]]
```

*  Minimize the steps to get to the value.

<!--v-->
