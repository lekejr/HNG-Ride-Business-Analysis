SELECT 
    rides_raw.ride_id,
    drivers_raw.name AS driver_name,
    riders_raw.name AS rider_name,
    rides_raw.pickup_city,
    rides_raw.dropoff_city,
    payments_raw.method,
    rides_raw.distance_km
FROM rides_raw
JOIN drivers_raw ON rides_raw.driver_id = drivers_raw.driver_id
JOIN riders_raw ON rides_raw.rider_id = riders_raw.rider_id
JOIN payments_raw ON rides_raw.ride_id = payments_raw.ride_id
WHERE payments_raw.amount > 0
ORDER BY rides_raw.distance_km DESC
LIMIT 10;

