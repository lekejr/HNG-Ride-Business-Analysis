WITH revenue_per_driver AS (
    SELECT 
        rides_raw.pickup_city,
        drivers_raw.name AS driver_name,
        SUM(payments_raw.amount) AS total_revenue,
        RANK() OVER (
            PARTITION BY rides_raw.pickup_city 
            ORDER BY SUM(payments_raw.amount) DESC
        ) AS rank_in_city
    FROM rides_raw
    JOIN drivers_raw ON rides_raw.driver_id = drivers_raw.driver_id
    JOIN payments_raw ON rides_raw.ride_id = payments_raw.ride_id
    WHERE payments_raw.amount > 0
      AND rides_raw.pickup_time BETWEEN '2021-06-01' AND '2024-12-31'
    GROUP BY rides_raw.pickup_city, drivers_raw.name
)
SELECT 
    pickup_city,
    driver_name,
    total_revenue
FROM revenue_per_driver
WHERE rank_in_city <= 3
ORDER BY pickup_city, total_revenue DESC;

