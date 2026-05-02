-- Question 1: Which region makes the most profit?
SELECT Region, 
       ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Region
ORDER BY total_profit DESC;

-- Question 2: Which category sells the most?
SELECT Category,
       ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY Category
ORDER BY total_sales DESC;

-- Question 3: Top 10 best selling products?
SELECT `Product Name`,
       ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

-- Question 4: Which months have highest sales?
SELECT MONTH(`Order Date`) AS month_number,
       ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY month_number
ORDER BY total_sales DESC;

-- Question 5: Products that sell well but lose money?
SELECT `Product Name`,
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY `Product Name`
HAVING total_profit < 0
ORDER BY total_sales DESC
LIMIT 10;