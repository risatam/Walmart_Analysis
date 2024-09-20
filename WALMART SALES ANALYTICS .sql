-----------------------EDA--------------------
-------------Generic-----------------------
--How many unique cities does the data have?----
SELECT 
	DISTINCT city
FROM sales;

----In which city is each branch?-------
SELECT 
	DISTINCT branch
FROM sales;

SELECT 
	DISTINCT city,
	branch
FROM sales;

----Product----------
--How many unique product lines does the data have?
SELECT 
	DISTINCT product_line
FROM sales;

SELECT 
	COUNT(DISTINCT product_line)
FROM sales;

--WHAT IS THE MOST COMMON PAYMENT METHOD?---
SELECT 
	payment_method,
	COUNT(payment_method) AS cnt
FROM sales
GROUP BY payment_method
ORDER BY cnt DESC;

--WHAT IS THE MOST SELLING PRODUCT LINE---
SELECT 
	product_line,
	COUNT(product_line) AS cnt
FROM sales
GROUP BY product_line
ORDER BY cnt DESC;


--What is the total revenue by month?----
SELECT 
	month_name AS month,
	SUM(total) AS total_revenue
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC;

--WHAT MONTHS HAD THE LARGEST COGS?---
SELECT 
	month_name AS month,
	SUM(cogs) as cogs
FROM sales
GROUP BY month_name 
ORDER BY cogs DESC;

--What product line had the largest revenue?---
SELECT 
	product_line,
	SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

--What is the city with the largest revenue?---
SELECT 
	branch,
	city,
	SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch
ORDER BY total_revenue DESC;	

--What product line had the largest VAT?---
SELECT 
	product_line,
	AVG(VAT) AS avg_tax
FROM sales 
GROUP BY product_line
ORDER BY avg_tax DESC;

--Fetch each product line 

--Which branchs old more products than average product sold?
SELECT 
	branch,
	SUM(quantity) AS qty
FROM sales 
GROUP BY branch 
HAVING SUM(quantity)> (SELECT AVG(quantity) FROM sales);

--What is the most common product line by gender?
SELECT 
	gender,
	product_line,
	COUNT(GENDER) AS total_cnt
FROM sales 
GROUP BY gender,product_line 
ORDER BY total_cnt DESC;

--What is the average rating of each product line?---
SELECT 
	product_line,
	ROUND(AVG(rating),2) as avg_rating
FROM sales 
GROUP BY product_line 
ORDER BY avg_rating DESC;

	


	