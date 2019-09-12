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
Col1 | col2 | col3 | col4 | . . . |
--- | --- | --- | --- | --- |
Asa | 12.2 | BC | Banana |
<!--v-->
## Tables Are Wide
Relationship is defined by co-occurrence
<!--v-->
## Databases are Relational
Tables defined narrowly
Relationships are defined explicitly
<!--v-->
## Databases are Relational
Country to Province/State to City
Industry to Clean Technology
<!--v-->
## Entity Relationship Diagram
Diagram defines relationships between entities
Data in entity tuples must be Atomic, Distinct, & Dependent
Normalization
<!--s-->
# Normalization
Normal Forms
Help manage data and reduce total disk space used
<!--v-->
## First Normal Form
Cells contain a single value
Each record is unique
Name | Hobbies | Address | Country
--- | --- | --- | ---
A Snuz | Fishing, Anime, Movies | 1111 Howe St, Vancouver | Canada
<!--v-->
## First Normal Form
Cells contain a single value
Each record is unique
Name | Hobbies | Address | Country
--- | --- | --- | ---
A Snuz | Fishing | 1111 Howe St, Vancouver | Canada
A Snuz | Anime | 1111 Howe St, Vancouver | Canada
A Snuz | Movies | 1111 Howe St, Vancouver | Canada
<!--v-->
## Second Normal Form
Must be in First Normal Form
Single Column (primary key) uniquely identifies record
Name | Hobbies | Address | Country
--- | --- | --- | ---
A Snuz | Fishing | 1111 Howe St, Vancouver | Canada
A Snuz | Anime | 1111 Howe St, Vancouver | Canada

**Fishing** is not dependent on the **Address**
<!--v-->
## Second Normal Form
Must be in First Normal Form
Single Column (primary key) uniquely identifies record
OID | Name | Address | Country
--- | --- | --- | ---
 1 | A Snuz | 1111 Howe St, Vancouver | Canada
 2 | A Snuz | 1111 Howe St, Vancouver | Canada

SID | Sport
--- | ---
1 | Fishing
2 | Anime

<!--v-->
## Third Normal Form
Satisfies second normal form
No transitive dependencies

