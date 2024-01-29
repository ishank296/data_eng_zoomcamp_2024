### Question 1. Which tag has the following text?  Automatically remove the container when it exits

- --delete
- --rc
- --rmc
- --rm +


### Question 2. Docker run: version of wheel

- 0.42.0 +
- 1.0.0
- 23.0.1
- 58.1.0

`docker run --rm -it python:3.9 bash`

### Question 3. How many taxi trips were totally made on September 18th 2019?

- 15767
- 15612 +
- 15859
- 89009

### Answer

`select count(*) from public.green_taxi_trips 
where 
date(lpep_pickup_datetime) = '2019-09-18'
and date(lpep_dropoff_datetime) = '2019-09-18'`


### Question 4. Which was the pick up day with the largest trip distance Use the pick up time for your calculations.

- 2019-09-18
- 2019-09-16
- 2019-09-26 +
- 2019-09-21

### Answer
`select * from public.green_taxi_trips 
where trip_distance = (select max(trip_distance) 
					   from public.green_taxi_trips)`


### Question 5. Three biggest pickups

- "Brooklyn" "Manhattan" "Queens" +
- "Bronx" "Brooklyn" "Manhattan"
- "Bronx" "Manhattan" "Queens"
- "Brooklyn" "Queens" "Staten Island"

`with trips_2019_09_18 as (
select * from public.green_taxi_trips 
where date(lpep_pickup_datetime) = '2019-09-18'
),
lookup_zone as (
select * from public.taxi_zone_lookup 
	where lower(borough)<> 'unknown' 
),
amt_pickup as (
select "PULocationID",trip_distance,fare_amount,total_amount,
borough from 
trips_2019_09_18 tri join
lookup_zone look on tri."PULocationID"=look.locationid
)
select borough,sum(total_amount) from amt_pickup group by borough
having sum(total_amount) > 50000`

### Question 6. For the passengers picked up in September 2019 in the zone name Astoria which was the drop off zone that had the largest tip? 

- Central Park
- Jamaica
- JFK Airport +
- Long Island City/Queens Plaza

`with largest_tip_rec as 
(
select *,row_number() over(order by tip_amount desc)  as seq from public.green_taxi_trips 
where
extract('month' from lpep_pickup_datetime) = 9
and extract('year' from lpep_pickup_datetime) = 2019
and "PULocationID" in (
select distinct locationid from public.taxi_zone_lookup
	where zone = 'Astoria'
 )
) 
select * from public.taxi_zone_lookup
where locationid in (select "DOLocationID" from largest_tip_rec where seq = 1)`

### Question 7. Terraform