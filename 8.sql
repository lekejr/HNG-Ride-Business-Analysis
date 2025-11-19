SELECT 
    drivers_raw.driver_id,
    drivers_raw.name AS driver_name,
    COUNT(rides_raw.ride_id) AS total_rides,
    AVG(drivers_raw.rating) AS avg_rating,
    (COUNT(*) FILTER (WHERE rides_raw.status = 'cancelled') * 100.0 / COUNT(*)) AS cancellation_rate
FROM drivers_raw
JOIN rides_raw ON drivers_raw.driver_id = rides_raw.driver_id
WHERE rides_raw.status IN ('completed', 'cancelled')
GROUP BY drivers_raw.driver_id, drivers_raw.name
HAVING COUNT(rides_raw.ride_id) >= 30
   AND AVG(drivers_raw.rating) >= 4.5
   AND (COUNT(*) FILTER (WHERE rides_raw.status = 'cancelled') * 100.0 / COUNT(*)) < 5
ORDER BY total_rides DESC
LIMIT 10;
