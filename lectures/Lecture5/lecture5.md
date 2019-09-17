---
title: BAIT507 - Data Management
separator: <!--s-->
verticalSeparator: <!--v-->
theme: solarized
revealOptions:
    transition: 'fade'
---

# Lecture 5
## More Joins & Indices

<!--v-->

## Taxi company

<!--v-->

## What do we need to know?

<!--v-->

*  Drivers
*  Passengers
*  Locations
*  Ratings (driver, customer)
*  Vehicles
*  Rides
*  Reservations
*  Maintenance
*  Dispatchers

<!--v-->

## Questions

*  Which pickup/dropoff locations have the worst customers?
*  How does vehicle maintenance affect driver rating?
*  Which vehicles are next in for maintenance
*  Which dispatchers drop the most reservations?

<!--v-->

## Pickup & Dropoff

*  Which pickup/dropoff locations have the worst customers?

<!--v-->

## Pickup & Dropoff

*  Locations
*  Rides
*  Passengers
*  Ratings

<!--v-->

## Pickup & Dropoff
### Simple INNER JOIN

All ride ratings for passengers grouped by origin and destination.

```sql
SELECT rr.rating,
  locor.area AS origin,
  locds.area AS destination
FROM ride AS ri
  INNER JOIN riderating AS rr ON rr.rideid = ri.rideid
  INNER JOIN location AS locor ON locor.lid = ri.rideor
  INNER JOIN location AS locds ON locds.lid = ri.rideds
```

<!--v-->


## Vehicle Maintenance

*  How does vehicle maintenance affect driver rating?

<!--v-->

## Vehicle Maintenance

*  Driver rating
*  Vehicle
*  Maintenance events

<!--v-->
