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

## The 4 Vs of Big Data

Farley, Dawson Goring & Williams, *Ecography*, 2018

<!--v-->

## The 4 Vs

* Velocity, Variety, Veracity and Volume

<!--v-->

## Velocity, Variety, Veracity and Volume

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
* Manage “hot” and “cold” data differently

<!--v-->

## Hot and Cold Data

* Hot Data:
  - In Memory Processing (e.g., Redis)
  - Application
  - Data Classes
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
* Know your data
* Data volatility (how long is it accurate)?
* Domain knowledge is critical
* Clear definition of assumptions
* Clear checks on key processes
* TDD * Test Driven Development
<!--v-->

## Different Industries, Different Challenges

* Many File Types
* Many Data Types
* Veracity Crowd Sourced Survey
Data
Log
Files
Variety
MB
GB
TB
PB
Volume
Batch
Periodic
Real Time
Velocity

<!--v-->
Different Industries, Different
Challenges
Many File Types
Many Data Types
Veracity
Crowd
Sourced
Survey
Data
Log
Files
Variety
MB
GB
TB
PB
Volume
Batch
Periodic
Real Time
Velocity
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
Server
Analyst
Interface/
Dashboard
Server
Server
Server
Server
<!--v-->
## Strategy - Basics
* Map & Reduce
[12,14,12,16]

<!--v-->
## Strategy - Basics
* Map & Reduce
[12,14,12,16]

```
{name: “Simon Goring”,
Purchases: [12,14,15,12],
OrderIDs: [1312,121,12,121],
...
}
```
<!--v-->
## Strategy - Basics

(not) Map & Reduce

```
newList = list(c(12,13,14),c(0,1,2),c(3,5,6),
               c(12,14,11),c(5,6,12))
means = rep(NA, length(newList))
for (i in 1:length(newList)) {
  means[i] = mean(newList[i])
}
```
<!--v-->
## Strategy - Basics

* Map & Reduce in R

```r
newList = list(c(12,13,14),c(0,1,2),c(3,5,6),
               c(12,14,11),c(5,6,12))
means <- lapply(newList, mean)
means <- purrr::map(newList, mean)
```
<!--v-->
## Strategy - Basics

*  Map & Reduce

```r
newList = list(c(12,13,14),c(0,1,2),c(3,5,6),
               c(12,14,11),c(5,6,12))
allMax = Reduce(max, newList)
pluses = Reduce("+", newList)
```
<!--v-->
## Partitioning Data
Map and Reduce allow us to partition data

Server Server Server Server Server
map() map() map() map() map()
<!--v-->
* HADOOP * A core system
* Runs with Java
* Includes several elements
* Hadoop Distributed File System is the core component
<!--v-->
hdfs
NameNode
Hadoop Distributed
File System
DataNode
Replication Factor = 3
<!--v-->
hdfs
NameNode
Hadoop Distributed
File System
DataNode
Replication Factor = 3
<!--v-->
NameNode
<!--v-->
 nd NameNode
DataNode
<!--v-->
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
● Hadoop/HDFS/Hive is not for speed
● Large scale analytics on complex data
<!--v-->
## Sharding
* Sharding is also an option
* Tools like Citus (Postgres), MySQL Cluster and others
https://www.mysql.com/products/cluster/scalability.html
<!--v-->
## Vertical Sharding
* Tables are split among nodes
* “Fast” tables with many inserts/updates are
optimized
* “Slow” tables managed more easily
<!--v-->
## Horizontal Sharding
* Data within tables is split
* Regionally, or as part of internal application
logic
https://www.mysql.com/products/cluster/scalability.html
<!--v-->
●
●
Sharding can reduce lag due to locks
May require additional effort to re-
assemble data (e.g., JOIN operations)
<!--v-->
## Spark
* Faster, in memory processing
* Can manage real-time streaming data (e.g.,
Twitter)
* Works with HDFS, or without
* Limited in total size, but size is very large
<!--v-->
Application
Spark Driver
Cluster Manager
Execution
Nodes
HDFS
<!--v-->
Application
Spark Driver
Cluster Manager
Execution
Nodes
HDFS
<!--v-->
Application
Spark Driver
Cache
Execution
Task1
Nodes
Cluster Manager
Task2
HDFS
<!--v-->
● Reduced read/write processing
● Faster startup for jobs
● Better control of itterated processes
<!--v-->
## Key Terms & Context
* Map/Reduce
* Hadoop * HDFS
* Sharding
* Spark
<!--v-->
# Considerations in Big Data Analysis
<!--v-->
## Researcher Degrees of Freedom
> “In the course of collecting and analyzing data, researchers have many decisions to make: Should more data be collected? Should some observations be excluded? Which conditions should be combined and which ones compared? Which control variables should be considered? Should specific measures be combined or transformed or both? ... The problem, of course, is that the likelihood of at least one (of many) analyses producing a falsely positive finding at the 5% level is necessarily greater than 5%.
<!--v-->
## Researcher Degrees of Freedom
* Wrong Correlations
* Fluke Correlations
* Artifacts
* Hyped Correlations
* Uncorroborated
* Correlations
* Ephemeral Correlations
* Effects can by Magnified in Big Data
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
