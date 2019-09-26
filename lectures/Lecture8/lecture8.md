---
title: BAIT507 - Data Management
separator: <!--s-->
verticalSeparator: <!--v-->
theme: solarized
revealOptions:
    transition: 'fade'
---

# Data and Hypotheses

<!--v-->

## Managing Data

<!--v-->

## Developing the Question

How do job openings and average wages affect inter-provincial migration?

* Business prospect: Settlement services (paperwork, rentals, insurance, &cetera)
* Predict shifts, focus advertising.

<!--v-->

## Data Resources

* Census - Interprovincial migration
  - https://catalogue.data.gov.bc.ca/dataset/inter-provincial-and-international-migration/resource/95579825-bfa2-4cab-90fa-196e0ecc8626

<!--v-->

## Census Migration

| ref_date|origin |dest | people|
|--------:|:------|:----|------:|
|   1971.5|Ont.   |N.L. |   2436|
|   1971.5|Ont.   |N.S. |   3942|
|   1971.5|Ont.   |N.B. |   2967|
|   1971.5|Ont.   |Que. |   7014|
|   1971.5|N.L.   |Ont. |   1732|
|   1971.5|N.S.   |Ont. |   3754|

<!--v-->

## Monthly Employment Data

* https://www150.statcan.gc.ca/n1/en/tbl/csv/14100017-eng.zip?st=o0s47X7R
* Includes Employment, Unemployment, gender, age classes &cetera.
<!--v-->

|ref_date   |location |variable        | value|
|:----------|:--------|:---------------|-----:|
|1976-01-01 |Ontario  |Employment rate |  42.2|
|1976-02-01 |Ontario  |Employment rate |  42.7|
|1976-03-01 |Ontario  |Employment rate |  43.0|
|1976-04-01 |Ontario  |Employment rate |  42.5|
|1976-05-01 |Ontario  |Employment rate |  42.3|
|1976-06-01 |Ontario  |Employment rate |  42.2|

<!--s-->

## Developing the Question

* How do employment opportunities or challenges affect inter-provincial migration?

<!--v-->

## Data Structure

* Spatial (both datasets with provinces)
* Temporal (both datasets over time since ~1976)
  - One monthly, one quarterly
* Migration between provinces for Canada
* Employment by gender & age classes
* Employment data with 10 different employment values:
  - Population, Labour force, Employment, Full-time employment, Part-time employment, Unemployment, Not in labour force, Unemployment rate (%), Participation rate (%), Employment rate (%)

<!--v-->

## RMarkdown Document

* New database - any name
* [RMarkdown Document](https://github.com/SimonGoring/MBAN_BAIT507/blob/master/lectures/Lecture8/migration_report.Rmd)

<!--v-->

## Analytic Questions

* Tables:  ages, dataclass, gender, labour, migration, province
* Motivation: Resettlement company
  - How do we market better?
  - How do we plan?
