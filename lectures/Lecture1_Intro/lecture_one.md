---
title: BAIT507 - Data Management
separator: <!--s-->
verticalSeparator: <!--v-->
theme: solarized
revealOptions:
    transition: 'fade'
---

# MBAN - BAIT507
## Data Management for Business Analytics

Simon Goring

<!--v-->

# About Me

<!--v-->

## Simon Goring

<hr>

### Assistant Scientist, University of Wisconsin

[http://goring.org]()

*Geoinformatics, paleogeosciences, natural language processing, data visualization, data management and cyberinfrastructure*

<!--v-->

## Research Goals

<img src=images/engagement_image.svg width=50% style="padding:5px;">

Neotoma Paleoecology Database [http://neotomadb.org]()

<!--v-->

## Research Goals

<img src=images/Figure1_threePanel_rev.png style="padding:5px;">

Neotoma Paleoecology Database [http://neotomadb.org]()

<!--v-->

## Research Goals

<img src=images/Wicked_East.png>

<!--v-->

## Research Goals

<img src=images/circle_problem.png width="70%">

<!--s-->

# Course Overview

   * Course Topics
   * Evaluation
   * Group Project

<!--v-->

Topic                      | Lectures         | Concepts
---------------------------|------------------|-----------------------------------------------------------
Background                 | Lectures 1 -- 3  | What is a database; connecting to databases; working in R.
Building Queries           | Lectures 3 -- 6  | Moving from raw data to data structures, and back again.
Advanced Database Concepts | Lectures 7 -- 10 | Database design, constraints and testing.

<!--v-->

## Background

### 3 Lectures

  * What is a database?
  * How do we use a database?
  * Basic queries
  * Preparing a database

<!--v-->

## Buildng Queries

### 4 Lectures

  * Normalizing data to save space
  * Joining data back together
  * Complex queries

<!--v-->

## Advanced db Queries

### 4 Lectures

  - Advanced data design
  - Constraints & advanced indices
  - Query optimization & hypothesis testing
  - Structured data
  - Big data tools

<!--s-->

# Grading

<!--v-->

## Assignments

  * 3 x 10% each

## Group Assignment

  * 30% total
  * Assigned Sept 5, Due Oct 3.
  * Written & Oral components.

<!--v-->

## Individual Assignments

### Assignment One:

Install Postgres, R and associated development tools locally and describe the process.

<!--v-->

## Individual Assignments

### Assignment Two:

Connect to a remote database and perform basic queries using R in an RMarkdown notebook.

<!--v-->

## Individual Assignments

### Assignment Three:

Build a simple database using assigned data. Perform basic analysis in an RMarkdown notebook.

<!--s-->

## Group Assignment

### Fun Times!

<!--v-->

## Group Assignment

In assigned groups of three or four.

*  Define a business analytics problem
*  Discover relevant data
*  Refine your question and model a database structure
*  Write a group report

<!--v-->

## Group Assignment

### Presentations

Four Pecha Kucha style presentations - Present one, submit all four

Shared with the class

<!--s-->

# Engagement

## Grade: 10%

  * Graded on in-class and online discussion

<!--s-->

# Expectations, Grading & Office Hours

<!--v-->

## Expectations

*   **Be on time** (you and I!)
*   No screens except during coding sessions
*   Academic dishonesty is not tolerated

<!--v-->

## Grading

*  Grading will be done ASAP
*  Rubrics will be available with the assignments
*  All grades will be provided before the final exam

<!--v-->

## Office Hours and Feedback

*  Use Canvas discussions as much as possible please
*  Office hours are Thursday 12 - 1:30pm ICICS/CS 187

<!--s-->

# Introduction to Data Management

Note: Data are fundamental to any analysis.

<!--v-->

## Key Points

* What are key data management concerns?
* How does ACID address these?
* What is a Database/DBMS?

<!--v-->

## Introduction to Data Management

The way data is used and managed is fundamental to any analysis.

<!--v-->

## Data Management is Crucial

*  Data is highly variable but mission critical
*  Poor data management makes everything harder
*  Good data management makes everything easier
*  **Good data management is not easy**

<!--v-->

## Good Data Management

*  Data is well organized
*  Versioning and updates are controlled
*  Analysis is reproducible
*  Results are free from artifacts

<!--v-->

## Data Organization

Good organization depends on:
* Data types
* Data applications

<!--v-->

## Data Organization
### Data Types Involved in Analysis

- Transactions
- Spatial Data
- Assets/Objects
- Personal Data
- Events
- Organizational Data
- Temporal Data
- Files and Reports
- Relationships

<!--v-->

## Data Organization
### Data Applications

- One-off Analysis
- Streaming data event detection
- Annual Reports
- Data Quality Assurance
- Machine Learning Applications
- Proprietary/Sensitive Data Management

<!--v-->

## Data Management Concerns

* Duplication
* Security
* Incomplete records
* Parallel Transactions

<!--v-->

## Analytic Transactions

Note: Some examples of an analytic transaction include the analysis of log files, but we can use banking as a good (and common example).  Suggestion engines, that use streaming data, but then modify other tables.

<!--v-->

## ACID as a Central Concept

* Haerder and Reuter (1983) http://bit.ly/2C3lTLh

### Data Transactions Should Be
**A**tomic, **C**onsistent, **I**solated, **D**urable

<!--v-->

## A Transaction

* Banking transaction

<!--v-->

## Atomicity

<!--v-->

## Atomicity

* The "transaction" is indivisible.  It is the fundamental unit of operation.
* There can be multiple operations within a transaction.
* Any operation within a transaction will only succeed if all other operations succeed.

<!--v-->

## Consistency

<!--v-->

## Consistency

* The "transaction" can only return results that are “legal” in the context of the database.
* Data types must be preserved (no characters in integer fields).
* Data relationships must be preserved.

<!--v-->

## Isolation

<!--v-->

## Isolation

* When multiple transactions cannot affect one another.
* Concurrency is supported through isolation

<!--v-->

## Durability

<!--v-->

## Durability

* Results of a transaction must persist.
* Results can only be lost through subsequent transactions (e.g., DELETE)

<!--s-->

# Database Solutions

<!--v-->

## What is a Database?

* Most times Database Management System (DBMS)
* Postgres, MySQL, dbLite, Oracle
* Manages databases

<!--v-->

## What is a Database

 * Databases store data in a structured format for storage and retreival
 * They are self-describing
 * DBMS manage the storage & retrieval of data, and interaction with other software systems through program interfaces
 * A DBMS (Postgres) may contain multiple databases

<!--v-->

## What is a DBMS

* A DBMS manages interaction between the file system and the data queries.
* Postgres is a DBMS
* Manages how data is accessed

<!--s-->

# Key Points

* Why is good data management important?
* What are key data management concerns?
* How does ACID address these?
* What is a Database/DBMS?

<!--s-->

# Assignment One

* Files as Markdown (plain text - [https://www.markdownguide.org/cheat-sheet/]())
* Installing PostgreSQL, PGAdmin, R, RStudio
  - R libraries
    - `tidyverse`, `rmarkdown`, `DBI`, `RPostgreSQL`
    - `install.packages("tidyverse")`
