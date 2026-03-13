DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL, 
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

-- EDA

-- Count no of rows
SELECT COUNT(*) FROM zepto;

-- Sample data
SELECT * FROM zepto
LIMIT 5;

-- Check for null values
SELECT * FROM zepto
WHERE 
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
availableQuantity IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

-- Different product categories
SELECT DISTINCT category AS unique_categories
FROM zepto
ORDER BY category; 

-- Available stock vs Out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

-- Count SKUs
SELECT name, COUNT(sku_id) AS no_of_skus
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY no_of_skus DESC;


-- Data cleaning 
-- Check for products where price = 0
SELECT * FROM zepto
WHERE mrp = 0;

-- Delete products where price = 0
DELETE FROM zepto
WHERE mrp = 0;

-- Check again for products where price = 0
SELECT * FROM zepto
WHERE mrp = 0;

-- Convert mrp and discountedsellingprice units 
UPDATE zepto
SET mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

-- Find the top 10 products based on the discount percentage
SELECT name, discountpercent, category FROM zepto
ORDER BY discountpercent DESC 
LIMIT 10;

-- Find the products with high mrp but out of stock
SELECT * FROM zepto;
SELECT DISTINCT name, mrp, outofstock
FROM zepto
WHERE mrp > 300 AND outofstock = TRUE;

-- Calculate estimated revenue for each category
SELECT category, 
SUM(discountedsellingprice * availablequantity) AS estimated_revenue
FROM zepto
GROUP BY category
ORDER BY estimated_revenue DESC;

-- Find products where mrp > 500 and discount less than 10 percent
SELECT DISTINCT name, mrp, discountpercent
FROM zepto
WHERE discountpercent < 10 AND mrp > 5
ORDER BY mrp DESC, discountpercent DESC;

-- Identify the top 5 categories offering the highest average discount percentage
SELECT category, 
ROUND(AVG(discountpercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Find the price per gram for products above 100g
-- and sort by best value
SELECT DISTINCT name, weightingms, discountedsellingprice,
ROUND((discountedsellingprice/weightingms),2) AS price_per_gm
FROM zepto
WHERE weightingms >= 100
ORDER BY price_per_gm;

-- Group products into light, medium bulk based on weights
SELECT DISTINCT name, weightingms,
CASE WHEN weightingms <= 1000 THEN 'light'
	 WHEN weightingms <= 5000 THEN 'medium'
	 ELSE 'bulk'
	 END AS weight_category
	 FROM zepto;

-- Total inventory weight per category
SELECT category, 
SUM(weightingms * availablequantity) AS inv_wgt_per_cat
FROM zepto
GROUP BY category
ORDER BY inv_wgt_per_cat;


