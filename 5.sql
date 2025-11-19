SELECT 
    pickup_city,
    (COUNT(*) FILTER (WHERE status = 'cancelled') * 100.0 / COUNT(*)) AS cancellation_rate
FROM rides_raw
GROUP BY pickup_city
ORDER BY cancellation_rate DESC
LIMIT 1;

