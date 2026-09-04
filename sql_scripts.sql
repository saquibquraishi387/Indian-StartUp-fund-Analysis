
---- Query 1: Total funding and deal count by year ----
SELECT YEAR(funding_date) AS year,
       COUNT(*) AS deal_count,
       SUM(amount_usd) AS total_funding
FROM funding_rounds
GROUP BY YEAR(funding_date)
ORDER BY year;

--- Query 2: Top 10 sectors by total funding ---
SELECT industry,
       COUNT(*) AS deal_count,
       SUM(amount_usd) AS total_funding,
       ROUND(AVG(amount_usd), 0) AS avg_deal_size
FROM funding_rounds
GROUP BY industry
ORDER BY total_funding DESC
LIMIT 10;

 --- Query 3: Top 10 most active investors (by deal count) ---
 SELECT i.investor_name,
       COUNT(*) AS deal_count
FROM round_investors ri
JOIN investors i ON ri.investor_id = i.investor_id
GROUP BY i.investor_name
ORDER BY deal_count DESC
LIMIT 10;

--- Query 4: City-wise funding concentration ---
SELECT city,
       COUNT(*) AS deal_count,
       SUM(amount_usd) AS total_funding
FROM funding_rounds
GROUP BY city
ORDER BY total_funding DESC;

 --- Query 5: Average deal size by funding stage (InvestmentType ---
 SELECT investment_type,
       COUNT(*) AS deal_count,
       ROUND(AVG(amount_usd), 0) AS avg_amount,
       MIN(amount_usd) AS min_amount,
       MAX(amount_usd) AS max_amount
FROM funding_rounds
GROUP BY investment_type
ORDER BY avg_amount DESC;