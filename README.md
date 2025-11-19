# HNG Ride Business Analysis (2021–2024)

## Table of Contents
1. [Introduction](#introduction)
2. [Objectives](#objectives)
3. [Data Overview](#data-overview)
4. [Data Cleaning and Preparation](#data-cleaning-and-preparation)
5. [Business Analysis](#business-analysis)
   - [Question 1: Top 10 Longest Rides](#question-1-top-10-longest-rides)
   - [Question 2: Riders From 2021 Active in 2024](#question-2-riders-from-2021-active-in-2024)
   - [Question 3: Quarterly Revenue Comparison](#question-3-quarterly-revenue-comparison)
   - [Question 4: Top 5 Drivers by Average Monthly Rides](#question-4-top-5-drivers-by-average-monthly-rides)
   - [Question 5: Cancellation Rate Per City](#question-5-cancellation-rate-per-city)
   - [Question 6: Riders With More Than 10 Rides but Never Paid With Cash](#question-6-riders-with-more-than-10-rides-but-never-paid-with-cash)
   - [Question 7: Top 3 Drivers by Revenue Per City](#question-7-top-3-drivers-by-revenue-per-city)
   - [Question 8: Bonus-Qualified Drivers](#question-8-bonus-qualified-drivers)
6. [Key Insights and Recommendations](#key-insights-and-recommendations)
7. [Conclusion](#conclusion)
8. [Limitations and Future Work](#limitations-and-future-work)

---

## Introduction
This project looks at business data for HNG Ride, a North American ride-hailing company that is growing. With the company expanding quickly across several locations, management wants to evaluate rider and driver performance, gauge business growth and identify opportunities for operational enhancement. The provided raw datasets were inconsistent and lacking, necessitating careful data preparation, validation, and cleaning. I performed a thorough analysis from mid-2021 to the end of 2024 using PostgreSQL to guarantee data accuracy and produce insights to direct strategic business decisions.

## Objectives
The main objectives of this project were to clean and validate the datasets by resolving missing, duplicate and inconsistent data issues, analyze business performance through structured SQL queries addressing specific questions, generate actionable insights to guide HNG Ride’s strategic decisions on customer retention, driver performance and revenue growth and produce a technical report summarizing the data cleaning process, analytical findings and key recommendations.

## Data Overview
Four primary datasets were provided for this analysis, each representing a different aspect of HNG Ride’s operations:

- **drivers_raw**: Contains details of drivers, including their names, ratings and registered city.
- **riders_raw**: Includes rider information, such as names and signup dates.
- **rides_raw**: Records each trip’s details ride date, distance, status, and pickup/dropoff locations.
- **payments_raw**: Stores information about payments, amounts and methods used for each ride.

These tables collectively depict the entire ride activity lifecycle, from registration to trip completion and payment.

## Data Cleaning and Preparation
Before analysis, the raw datasets were thoroughly cleaned and validated in PostgreSQL to guarantee accuracy, consistency and dependability.

- Missing values were found and treated appropriately.  
- Duplicate records, particularly in the drivers and riders tables, were eliminated using unique identifiers like driver_id and rider_id.  
- Text fields, including city names, were standardized.  
- Invalid data were identified and eliminated, including negative fares, out-of-range driver ratings and rides with zero or negative miles.  
- All rides were cross-checked with matching payment records to ensure data integrity.  

The datasets were cleaned, organised, and prepared for analysis through these structured procedures, making them ideal for producing precise business insights.

## Business Analysis

### Question 1: Top 10 Longest Rides
<img width="861" height="436" alt="Screenshot (732)" src="https://github.com/user-attachments/assets/e541d471-2e75-43d0-a29e-f505bebfbe7a" />
This analysis identified the ten longest rides based on distance, along with details about the driver, rider, pickup/dropoff locations, and payment method.

### Question 2: Riders From 2021 Active in 2024
<img width="833" height="456" alt="Screenshot (733)" src="https://github.com/user-attachments/assets/edf4b277-c931-40c1-9ad0-806a69e46093" />

The query identified how many riders who joined in 2021 were still active in 2024. The findings revealed that a considerable number of riders remained engaged over multiple years, demonstrating strong customer loyalty and satisfaction.

### Question 3: Quarterly Revenue Comparison (2021–2024)
<img width="709" height="516" alt="Screenshot (734)" src="https://github.com/user-attachments/assets/83714a33-bdbe-4286-b14f-56b9f09ae0ce" />
Quarterly revenue analysis was conducted to compare performance across four years. The results indicated a steady increase in revenue year over year, with the largest jump observed in the second quarter of 2023. This period coincided with HNG Ride’s post-pandemic recovery and expansion into new regions.

### Question 4: Top 5 Drivers by Average Monthly Rides
<img width="879" height="689" alt="Screenshot (735)" src="https://github.com/user-attachments/assets/84b83203-f1f5-4e05-bbfe-38747964df4f" />
This query calculated each driver’s average number of rides per active month since signup. The top five drivers were identified as consistent, high performers.

### Question 5: Cancellation Rate Per City
<img width="797" height="489" alt="Screenshot (736)" src="https://github.com/user-attachments/assets/679ec9d4-6ec0-499c-931e-cff6ca126c9e" />
This query calculated the cancellation rate across cities and highlighted the city with the highest rate.

### Question 6: Riders With More Than 10 Rides but Never Paid With Cash
<img width="773" height="495" alt="Screenshot (737)" src="https://github.com/user-attachments/assets/99df8a50-2101-43d9-8f80-8dd416a61c4f" />
This query identified frequent riders who exclusively used non-cash payment methods.

### Question 7: Top 3 Drivers by Revenue Per City (June 2021 – Dec 2024)
<img width="799" height="750" alt="Screenshot (738)" src="https://github.com/user-attachments/assets/94ead30f-cb04-4524-88cd-2b8f3fe8a876" />
This analysis ranked drivers by total earnings in each city. Results showed that a small number of high-performing drivers generated the majority of revenue, emphasizing the importance of driver retention and recognition programs.

### Question 8: Bonus-Qualified Drivers
<img width="779" height="535" alt="Screenshot (739)" src="https://github.com/user-attachments/assets/ea35122c-3726-4645-9196-7af2196299a0" />
Drivers were evaluated using:
- At least 30 completed rides  
- An average rating of 4.5 or higher  
- Cancellation rate below 5%  

About ten drivers met these conditions, representing top-performing, high-quality drivers.

## Key Insights and Recommendations
- Strong rider retention between 2021 and 2024 indicates high customer satisfaction.  
- The highest revenue growth occurred in 2023 due to successful geographic expansion.  
- High cancellation rates in certain cities point to operational inefficiencies; solutions include surge pricing and improved driver availability.  
- A clear shift toward digital payments was observed; this should be encouraged through incentives.  
- Many drivers met bonus criteria, highlighting the need for structured reward programs to maintain service excellence.

## Conclusion
This SQL-based analysis provided valuable insights into HNG Ride’s operations from June 2021 to December 2024. Through careful data cleaning, validation, and SQL-driven business queries, raw datasets were transformed into actionable intelligence to support management decision-making. The findings highlight strong rider retention, steady revenue growth, high-performing drivers, and a shift toward digital payments.

## Limitations and Future Work
The analysis was limited by data quality and completeness. Some operational factors such as demographics or market conditions were absent. Future work could incorporate real-time data, customer feedback, and external economic indicators. Using visualization tools like Power BI or Tableau would improve data storytelling for stakeholders.
