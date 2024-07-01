--Step 1: Data Cleaning for Walmart Sales Project--
WITH Filtered_Wsales AS (
  SELECT 
    *
  FROM
    `walmart-sales-1.Walmart_Sales.Walmart_Analysis` AS Walmart_Sales
  WHERE
    Store IS NOT NULL
    AND Date IS NOT NULL
)
SELECT 
  Store,
  Date,
  ROUND(Weekly_Sales, 2) AS R_WSales,
  ROUND(CAST(REPLACE(Temperature, '/','') AS FLOAT64)) as R_Temp,
  ROUND(Fuel_Price, 2) as Fuel_Price,
  ROUND(CPI, 3) AS CPI,
  ROUND(Unemployment, 3) As R_Unemployment,
  Holiday_Flag
FROM
  Filtered_Wsales
WHERE
  Date IS NOT NULL  -- Ensure Date is not null before parsing
ORDER BY Store ASC, Date DESC;
