---
title: BAIT507 - Data Management
separator: <!--s-->
verticalSeparator: <!--v-->
theme: solarized
revealOptions:
    transition: 'fade'
---

# Data Modeling with Relational Databases, Normalization and JOINs
<!--v-->
## Table vs Database
<!--v-->
## Tables Are Wide
| Col1 | col2 | col3 | col4 | . . . |
| --- | --- | --- | --- | --- |
| Asa | 12.2 | BC | Banana | . . . |
| Asa | 12.3 | BC | Apple | . . . |
<!--v-->

## Tables Are Wide

* Relationship is defined by co-occurrence

<!--v-->

## Databases are Relational

* Tables defined narrowly
* Relationships are defined explicitly

<!--v-->

## Databases are Relational
* Country to Province/State to City
* Industry to Clean Technology

<!--v-->

## Entity Relationship Diagram
* Diagram defines relationships between entities
* Data in entity tuples must be Atomic, Distinct, & Dependent
* Normalization

<!--s-->

# Normalization

<!--v-->

## Normal Forms
Help manage data and reduce total disk space used

<!--v-->

## First Normal Form

* Cells contain a single value
* Each record is unique

Name | Hobbies | Address | Country
--- | --- | --- | ---
A Snuz | Fishing, Anime, Movies | 1111 Howe St | Canada
Quaz Bilzna | Movies | 1111 Howe St | Canada
Jau Abinya | Anime | 1113 Howe St | Canada

<!--v-->
## First Normal Form

- Common solutions
  - Leave as comma separated list (e.g., JSON & R lists)
  - Split to:

Name | Hobby1 | Hobby2 | Hobby3 | Address
--- | --- | --- | --- | ---
A Snuz  | Fishing  | Anime  | Movies  |

* Problems?
<!--v-->
## First Normal Form
* Cells contain a single value
* Each record is unique

Name | Hobbies | Address | Country
--- | --- | --- | ---
A Snuz | Fishing | 1111 Howe St | Canada
A Snuz | Anime | 1111 Howe St | Canada
A Snuz | Movies | 1111 Howe St | Canada

<!--v-->
## Second Normal Form
* Must be in First Normal Form
* Single Column (primary key) uniquely identifies record
* All fields must be dependent on the primary key

Name | Hobbies | Address | Country
--- | --- | --- | ---
A Snuz | Fishing | 1111 Howe St | Canada
A Snuz | Anime | 1111 Howe St | Canada
A Snuz | Movies | 1111 Howe St | Canada

**Fishing** is dependent on **person** but not dependent on the **Address**

<!--v-->
## Second Normal Form
* Must be in First Normal Form


OID | Name | Address | Country
--- | --- | --- | ---
 1 | A Snuz | 1111 Howe St | Canada
2 | Quaz Bilzna | 1111 Howe St | Canada
3 |  Jau Abinya | 1113 Howe St | Canada

SID | Hobby
--- | ---
1 | Fishing
2 | Anime

<!--v-->
## Third Normal Form
* Satisfies second normal form
* No transitive dependencies

OID | Name | Address | Country
--- | --- | --- | ---
 1 | A Snuz | 1111 Howe St, Vancouver | Canada

SID | Sport
--- | ---
1 | Fishing
2 | Anime

<!--v-->

Actual hours worked by occupation, monthly, unadjusted for seasonality
