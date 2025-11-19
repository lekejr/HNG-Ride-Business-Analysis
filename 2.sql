SELECT 
    COUNT(DISTINCT riders_raw.rider_id) AS active_riders_2021_to_2024
FROM riders_raw
JOIN rides_raw ON riders_raw.rider_id = rides_raw.rider_id
JOIN payments_raw ON rides_raw.ride_id = payments_raw.ride_id
WHERE EXTRACT(YEAR FROM riders_raw.signup_date) = 2021
  AND EXTRACT(YEAR FROM rides_raw.pickup_time) = 2024
  AND payments_raw.amount > 0;
