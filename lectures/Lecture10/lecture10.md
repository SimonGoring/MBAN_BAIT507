---
title: BAIT507 - Data Management
separator: <!--s-->
verticalSeparator: <!--v-->
theme: solarized
revealOptions:
    transition: 'fade'
---

# Big Data and Analytics

<!--v-->

## Big Data and Analytics

In this lecture you will learn

* When big data approaches are appropriate
* General framework & key concepts for big data
analysis
* How to approach big data analysis in an
analytics environment
<!--v-->

## Big Data

How big is big data?

<!--v-->

## Big Data

How big is big data?

**It Depends**

<!--v-->

<h2>The 4 V<small>s</small> of Big Data</h2>

<img src=images/fourv_bigdata.png width="80%">

<citation>Farley, Dawson Goring & Williams, *Ecography*, 2018</citation>

<!--v-->

## The 4 Vs

* Velocity, Variety, Veracity and Volume
* Modify elements of
  - Processing
  - Storage
  - Analysis
* All attributes of “Big Data” require different (but complimentary)
solutions

<!--v-->
## Volume

* How big is the data?
* Total File Size
* Number of Data Points

<!--v-->
## Volume Solutions
* Cloud storage solutions
  - Still limited by read-write access
  - Still limited by memory capacity
* Dividing/Sharding

<img src=images/sharding_concept.png>

<!--v-->
## Velocity

* How fast is the data arriving?
  - Annual data from Stats Can?
  - Real-time data from stock tickers or Twitter?
* How fast do we need our answers?
  - Monthly or annual strategy planning?
  - Real-time commodities purchasing?
* How fast is the data changing?
  - Changing interpretations?
<!--v-->

## Velocity
* Agile development
* Modular analytics
* Identify “Key Performance Indicators” & develop real-time reporting

<!--v-->
## Hot and Cold Data

<img src=images/hot_cold.png>

<!--v-->

## Hot and Cold Data

* Hot Data:
  - In Memory Processing (e.g., Redis)
* Cold Data:
  * RDBMS
  * Disk Storage

<!--v-->

## Variety
* How different is the data source?
* Are data coming from multiple sources?
  - Do fields in sources align well?
  - Do files have similar formatting?
* How different are the data structures?
  - Can the data work in a relational model?
  - Do we need multiple data models?
<!--v-->

## Variety
* Multiple Data Sources
* Clear interface layers (structured based on
velocity and volume)
* Different management systems (RDBMS &
Graph DB)

<!--v-->
## Veracity
* How much do (should) we trust the data?
* What assumptions or biases are inherent?
* Does the value change over time?
* How do we manage missing data?
* How do we validate or check data validity?
  - Incoming data
  - Outgoing analysis
<!--v-->
## Veracity (& Value)
* **Know your data**
* Data volatility (how long is it accurate)?
* _Domain knowledge is critical_
* Clear definition of assumptions
* Clear checks on key processes
* TDD * Test Driven Development
<!--v-->

## Different Industries, Different Challenges

<img src=images/bigdata_dims.png width=60%>

<!--v-->
## When is Big Data Appropriate?
* Depends on:
  * Velocity, Veracity, Volume and Variety
  * When traditional tools begin to fail
  * If analysis crashes your computer
<!--v-->
# General Framework for Big Data Analysis
<!--v-->
## General Framework
* Develop a knowledge model
* Understand your data
* Understand resources available
  - Cores (processing)
  - Servers (storage & memory)
  - Time
<!--v-->
## Strategy - Basics
* Map & Reduce
* Splitting the data up, applying a function & aggregating results

```r
mean(c(12,14,12,16))
```

<!--v-->
## Strategy - Basics
* Map & Reduce

<img src=images/longboxes.png>

```json
{
  "name": "Simon Goring",
  "values": [12,14,15,12],
  "items": [1312,121,12,121]
}
```
<!--v-->
## Strategy - Basics

<img src=images/longboxes_for.png>

```r
newList = list(c(12,13,14),c(0,1,2),c(3,5,6),
               c(12,14,11),c(5,6,12))
means <- rep(NA, length(newList))
sums <- 0
for (i in 1:length(newList)) {
  sums <- sums + mean(newList[i])
}
result <- sums / length(newList)
```
<!--v-->
## Strategy - Basics

* Reduce

```r
newList = list(c(12,13,14),c(0,1,2),c(3,5,6),
               c(12,14,11),c(5,6,12))
allMax = Reduce(max, newList)
pluses = Reduce("+", newList)
```

<!--v-->
## Strategy - Basics

* Map & Reduce in R

```r
newList = list(c(12,13,14),c(0,1,2),c(3,5,6),
               c(12,14,11),c(5,6,12))
means <- Reduce(sum, Map(mean, newList)) / length(newList)
```

<!--v-->
## Partitioning Data
Map and Reduce allow us to partition data

<img src=images/longboxes_map.png>

<!--s-->

## HADOOP - A core system

<img src=images/longboxes.png>

* Runs with Java
* Multiple components
* Hadoop Distributed File System is the core component

<!--v-->

<img src=images/hadoop.png>

<!--v-->

<img src=images/hadoop_deadnode.png>

<!--v-->
<img src=images/hadoop_deadnode_namenode.png>
<!--v-->
## Hadoop tools
* sqoop/Hue
  - Import data from sources into HDFS
  - Postgres tables
  - Individual files
* Hive
  - Data warehousing
  - SQL-like access
  - HDFS integration
<!--v-->
## Hive
* Hive is ACID compliant
* Uses an internal metastore to map to DataNodes
* Uses Hive QL
  - Similar to SQL
  - Compiled to MapReduce
  - Summarizes, Groups & Processes structured data
<!--v-->
## Hadoop
* Hadoop/HDFS/Hive is not for speed
* Large scale analytics on complex data
<!--v-->
## Sharding
* Sharding is also an option
* Tools like Citus (Postgres), MySQL Cluster and others
<!--v-->
<img src=images/citud_arch.png width=55%>
<!--v-->
## Vertical Sharding
* Tables (or columns within tables) are split among nodes
* "Fast" (hot) tables with many inserts/updates are
optimized
* "Slow" tables managed more easily

<img src=images/hot_cold.png width=50%>
<!--v-->
## Horizontal Sharding
* Rows within tables are split
* Regionally, or as part of internal application
logic

<!--v-->
<img src=images/DB_image_1_cropped.png width=60%>
<small>https://www.digitalocean.com/community/tutorials/understanding-database-sharding</small>
<!--v-->
## Sharding Benefits/Costs
* Sharding can reduce lag due to locks
* May require additional effort to re-assemble data (e.g., JOIN operations)
<!--v-->
## Spark
* Faster, in memory processing
* Can manage real-time streaming data (e.g., Twitter)
* Works with HDFS, or without
* Limited in total size, but size is very large
<!--v-->
<img src=images/apache_spark.png>
<!--v-->
<img src=images/apache_spark_manager.png>
<!--v-->
## Spark Advantages
* Reduced read/write processing
* Faster startup for jobs
* Better control of itterrated processes
* R - `sparklyr` package, works with `dplyr`/`tidyverse`
<!--v-->
## Key Terms & Context
* Map/Reduce
* Hadoop / HDFS
* Sharding
* Spark
<!--v-->
# Considerations
## Big Data Analysis
<!--v-->
## Researcher Degrees of Freedom
<blockquote style="font-size:.8em">In the course of collecting and analyzing data, researchers have many decisions to make: Should more data be collected?  Should some observations be excluded?  Which conditions should be combined and which ones compared?  Which control variables should be considered?  Should specific measures be combined or transformed or both? ... <em>The problem, of course, is that the likelihood of at least one (of many) analyses producing a falsely positive finding at the 5% level is necessarily greater than 5%</em>.</blockquote>
JP Simmons &al **2011**. *Psychological Science*
<!--v-->
## Researcher Degrees of Freedom
* **Effects can by Magnified in Big Data**
  - Wrong/Fluke correlations
  - Data artifacts
  - Hyped Correlations
  - Uncorroborated correlations
  - Ephemeral correlations

<!--v-->
## Researcher Degrees of Freedom
* Possibilities are magnified
* Impact of outcomes may also be magnified
* Ethics, Expectations, and Assertions must be clearly stated
<!--v-->
## Researcher Degrees of Freedom
* Project Management becomes Critical
  - Mapping data sources (files? Data streams?)
  - Understanding data sources (What do anomolous data look like? What artifacts might be present?)
* Understanding analytic outcomes
* Am I doing real-time analysis?
* Is smoothing affecting apparent relationships?
* Is analysis on part the same as analysis on all?
* Am I missing compounding factors?
<!--v-->
## Project Management becomes Critical
* Data choice matters
* Expectations matter
* Interrogating results matters
* Test Driven Development (software paradigm)
<!--v-->
## Project Management becomes Critical

* Clear documentation of choices
* Clear understanding of what results mean
* Clear understanding of what may invalidate results
* Clear understanding of what may give more value to results
<!--v-->
## Project Management becomes Critical

* `unittest` (python), `assertthat` (R)
* Quick example:
  - Generate assertion
  - Develop test (e.g., equality, type)
  - raise `try-error` if test fails.

<!--v-->
## How to approach big data
* Understand your data
* Interrogate errors & issues
* Turn assumptions into assertions & tests
* Know the dangers of too much data!!!!
