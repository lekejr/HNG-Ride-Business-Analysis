-- Check for NULLs in each key table
SELECT COUNT * AS missing_drivers 
FROM drivers 
WHERE name IS NULL OR city IS NULL;

SELECT COUNT * AS missing_riders 
FROM riders 
WHERE name IS NULL OR signup_date IS NULL;

SELECT COUNT * AS missing_rides 
FROM rides 
WHERE pickup_city IS NULL OR dropoff_city IS NULL OR distance IS NULL;

SELECT COUNT * AS missing_payments 
FROM payments 
WHERE amount IS NULL OR payment_method IS NULL;

-- Handle missing city values in drivers table
-- Remove incomplete rows
DELETE FROM drivers 
WHERE city IS NULL;


-- Check for duplicate IDs in each table
SELECT driver_id, COUNT *
FROM drivers 
GROUP BY driver_id 
HAVING COUNT * > 1;

SELECT rider_id, COUNT *
FROM riders 
GROUP BY rider_id 
HAVING COUNT * > 1;

SELECT ride_id, COUNT *
FROM rides 
GROUP BY ride_id 
HAVING COUNT * > 1;

-- Remove duplicates 
DELETE FROM drivers a
USING drivers b
WHERE a.ctid < b.ctid
AND a.driver_id = b.driver_id;


-- Trim spaces and fix capitalization for city names
UPDATE drivers 
SET city = INITCAP(TRIM(city));

UPDATE rides 
SET pickup_city = INITCAP(TRIM(pickup_city));

UPDATE rides 
SET dropoff_city = INITCAP(TRIM(dropoff_city));

-- View a few distinct city names after cleaning
SELECT DISTINCT city 
FROM drivers 
ORDER BY city;

-

-- Check for invalid or unrealistic data values
-- Invalid fares (should not be negative or zero)
SELECT * 
FROM payments 
WHERE amount <= 0;

-- Invalid driver ratings (should be between 0 and 5)
SELECT * 
FROM drivers 
WHERE rating < 0 OR rating > 5;

-- Invalid ride distances (should not be negative or zero)
SELECT * 
FROM rides 
WHERE distance <= 0;

--  clean up invalid entries
DELETE FROM payments WHERE amount <= 0;
UPDATE drivers SET rating = NULL WHERE rating < 0 OR rating > 5;
DELETE FROM rides WHERE distance <= 0;



-- Keep only rides between June 2021 and December 2024
DELETE FROM rides
WHERE ride_date < '2021-06-01' 
   OR ride_date > '2024-12-31';

-- Confirm the time range after filtering
SELECT 
    MIN(ride_date) AS earliest_ride, 
    MAX(ride_date) AS latest_ride
FROM rides;



-- Record counts across all tables
SELECT COUNT * AS total_drivers FROM drivers;
SELECT COUNT * AS total_riders FROM riders;
SELECT COUNT * AS total_rides FROM rides;
SELECT COUNT * AS total_payments FROM payments;

-- Verify that all rides have corresponding payment records
SELECT COUNT * AS unmatched_rides
FROM rides r
LEFT JOIN payments p ON r.ride_id = p.ride_id
WHERE p.ride_id IS NULL;