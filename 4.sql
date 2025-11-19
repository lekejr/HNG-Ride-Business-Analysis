SELECT 
    drivers_raw.driver_id,
    drivers_raw.name AS driver_name,
    ROUND(
        (COUNT(rides_raw.ride_id)::numeric /
        NULLIF(
            (DATE_PART('year', AGE(MAX(rides_raw.pickup_time), drivers_raw.signup_date)) * 12) +
            DATE_PART('month', AGE(MAX(rides_raw.pickup_time), drivers_raw.signup_date)),
        0)
        )::numeric, 2
    ) AS avg_monthly_rides
FROM drivers_raw
JOIN rides_raw ON drivers_raw.driver_id = rides_raw.driver_id
WHERE rides_raw.status = 'completed'
GROUP BY drivers_raw.driver_id, drivers_raw.name, drivers_raw.signup_date
ORDER BY avg_monthly_rides DESC
LIMIT 5;
