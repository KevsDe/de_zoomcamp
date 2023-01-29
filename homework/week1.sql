-- How many taxi trips were totally made on January 15?

SELECT COUNT(*)
FROM public.green_taxi_data
WHERE CAST(lpep_pickup_datetime AS Date) = '2019-01-15' 
AND CAST(lpep_dropoff_datetime AS Date) = '2019-01-15';

-- Which was the day with the largest trip distance Use the pick up time for your calculations.

SELECT CAST(lpep_pickup_datetime AS Date),
MAX(trip_distance)
FROM public.green_taxi_data
GROUP BY 
CAST(lpep_pickup_datetime AS Date)
ORDER BY MAX(trip_distance) DESC
LIMIT 1;

--In 2019-01-01 how many trips had 2 and 3 passengers?

SELECT passenger_count,
COUNT(*) AS total_trips
FROM public.green_taxi_data
WHERE CAST(lpep_pickup_datetime AS Date) = '2019-01-01' 
AND passenger_count in (2,3)
GROUP BY 
passenger_count;

--For the passengers picked up in the Astoria Zone which was the drop off zone that had the largest tip? We want the name of the zone, not the id.

SELECT p."Zone",
MAX(t."tip_amount") AS Max_tip
FROM public.green_taxi_data AS t
LEFT JOIN public.zone AS p
ON t."DOLocationID" = p."LocationID"
WHERE t."PULocationID" = 7
GROUP BY p."Zone"
ORDER BY 2 DESC
LIMIT 1;
