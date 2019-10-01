---
title: BAIT507 - Data Management
separator: <!--s-->
verticalSeparator: <!--v-->
theme: solarized
revealOptions:
    transition: 'fade'
---

## Data Formats

<!--v-->

### What you will learn

*  Key Features of Five Key Data Types
  - CSV, XML, JSON, JSON-LD, YAML
* Strengths of Linked Data for data analytics
* Python bindings for data types

<!--v-->

### Data Encoding
*  Standard data encoding is critical
  - (Semi) Universal standards allow the reliable
transfer of data
  - Standards should support universal data usage
* Open Standards
<!--v-->

### World Wide Web Consortium “Standards”

*  Transparency
  - Public discussions & archived minutes
*  Relevance
  - Standards represent defined needs
* Openness
  - Public consultation
* Impartiality and consensus
  - Fairness guaranteed by W3C Consortium, all participants valued
* Availability
  - Standards are freely accessible, and available royalty free.
* Maintenance
  - Standards are revisted & revised.

<!--v-->

## Data Types

*  CSV
  - Not standardized, human readable
*  JSON
  - Standardized, standard parsers, human
  readable
* XML
  - Standardized, self describing, human readable
* JSON-LD
  - Standardized, self-referencing, human
  readable, extensible
* YAML
  - Standardized, human readable

<!--v-->

### CSV

*  Comma Separated Values
  - Notionally controlled by RFC 4180, but
also in CSV on the Web

```
,name,city,province,orders,payment
1,Simon Goring,Toronto,ON,3,12.45
2,Amanda Manuel, Vancouver, BC,2,12.11
```

<!--v-->
### CSV

* Each row represents a “record”, separated by a newline character (\n)
* Each field is separated by a comma
* Each record has the same number of fields
* Each field must be encoded as characters

<!--v-->
### CSV

* Must use quotes to escape fields with commas, newlines, etc.
* Non-standard implementation (e.g., not all parsers support line-breaks)
* No variable definitions supported
  - (Although some parsers support yaml/json)

<!--v-->

### XML
* Extensible Markup Language
* Document focused
* Elements defined by tags
  - Tags & elements may have attributes
* Content vs. Attributes
```
<?xml version="1.0" encoding="ISO8859-1" ?>
<note>
<to>Tove</to>
<from>Jani</from>
<heading>Reminder</heading>
<body>Don't forget me this weekend!</body>
</note>
```

### XML
*  Standardized by W3C
*  Must be parsed to be imported
*  May include XSD fles (XML Schema)

```
<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
targetNamespace="https://www.w3schools.com"
xmlns="https://www.w3schools.com"
elementFormDefault="qualified">
<xs:element name="note">
<xs:complexType>
<xs:sequence>
<xs:element name="to" type="xs:string"/>
<xs:element name="from" type="xs:string"/>
<xs:element name="heading" type="xs:string"/>
<xs:element name="body" type="xs:string"/>
</xs:sequence>
</xs:complexType>
</xs:element>
</xs:schema>
```

<!--s-->
### JSON
* Widely supported and common in web APIs

```
[
  {
    "name": "Mary Smith",
    "age": 27,
    "city": "Toronto",
    "movies": [
      "Dumb & Dumber",
      "40 Year Old Virgin",
      "Heyy Babyy"
    ]
  },
  {
    "name": "Paul Smith",
    "age": 13,
    "city": "Toronto",
    "movies": [
      "Metropolis",
      "Les Parapluies de Cherbourg"
    ]
  }
]
```
<!--v-->
### JSON
* Each record is an object bounded by
{ . . .}
* Can contain strings, numeric values, objects or arrays
* Partial standardization ([json-schema.org]())
* Each record with uniquely identifed fields (key:value pairs)

<!--s-->
### yaml
*  **YAML**: YAML ain’t Markup Language
*  Plain text, uses linebreaks and indentation to represent records and nesting (similar to Python)

```
- name: Mary Smith
  age: 27
  city: Toronto
  movies: [Dumb \& Dumber, 40 Year Old Virgin, Heyy Babyy]
- name: Paul Smith
  age:13
  city: Toronto
  movies: [Metropolis, Les Parapluies de Cherbourg]
```

<!--s-->
### JSON-LD
* Similar to JSON
* Uses context to provide authority
* Adds @id, @value, @type
```
{"@context": "http://schema.org",
  "@type": "Person",
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "Vancouver",
    "addressRegion": "BC"
  }
}
```
<!--v-->
### JSON-LD
*  Contexts provide authoritative definitions:
* Many available [GitHub Link]
  - https://web-payments.org/specs/source/web-payments/
  - http://xmlns.com/foaf/spec/
  - https://health-lifesci.schema.org/TherapeuticProcedure
  - https://auto.schema.org/MotorizedBicycle
  - https://pending.schema.org/ExchangeRateSpecifcation
  - https://pending.schema.org/PublicToilet
<!--s-->
### Data files in R
* YAML `library(yaml)`
* JSON `library(jsonlite)`
* JSON-LD `library(jsonld)`
* CSV `library(readr)`
