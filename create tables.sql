CREATE TABLE drivers_raw (
    driver_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
	city VARCHAR(50),
    signup_date DATE NOT NULL,
    rating NUMERIC(2,1)
);

CREATE TABLE riders_raw (
    rider_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    signup_date DATE NOT NULL,
    city VARCHAR(50),
	email VARCHAR(100)
);


CREATE TABLE rides_raw (
    ride_id INTEGER PRIMARY KEY,
    rider_id INT,
    driver_id INT,
    request_time TIMESTAMP,
    pickup_time TIMESTAMP,
    dropoff_time TIMESTAMP,
    pickup_city VARCHAR(50),
    dropoff_city VARCHAR(50),
    distance_km NUMERIC(5,2),
    status VARCHAR(20),
    fare NUMERIC(10,2)
);




CREATE TABLE payments_raw (
    payment_id INTEGER PRIMARY KEY,
    ride_id INT,
    amount NUMERIC(10,2),
    method VARCHAR(20),
	paid_date DATE NOT NULL
);




