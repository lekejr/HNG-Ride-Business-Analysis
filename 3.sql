SELECT 
    EXTRACT(YEAR FROM paid_date) AS year,          
    EXTRACT(QUARTER FROM paid_date) AS quarter,     
    SUM(amount) AS total_revenue                      
FROM payments_raw
WHERE amount > 0                                     
GROUP BY year, quarter                               
ORDER BY year, quarter;                               