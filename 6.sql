SELECT 
    riders_raw.rider_id,
    riders_raw.name,
    COUNT(DISTINCT rides_raw.ride_id) AS total_rides
FROM riders_raw
JOIN rides_raw ON riders_raw.rider_id = rides_raw.rider_id
JOIN payments_raw ON rides_raw.ride_id = payments_raw.ride_id
WHERE payments_raw.amount > 0
GROUP BY riders_raw.rider_id, riders_raw.name
HAVING COUNT(DISTINCT rides_raw.ride_id) > 10
   AND SUM(CASE WHEN LOWER(payments_raw.method) = 'cash' THEN 1 ELSE 0 END) = 0;
