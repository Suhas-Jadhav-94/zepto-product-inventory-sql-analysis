Zepto Product & Inventory SQL Analysis
![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue)
![Analysis](https://img.shields.io/badge/Analysis-EDA-green)
![Domain](https://img.shields.io/badge/Domain-Retail%20Analytics-orange)
![Project](https://img.shields.io/badge/Project-Data%20Analytics-success)
---
Project Overview
This project analyzes product-level data from Zepto, a
quick-commerce grocery delivery platform, using PostgreSQL.
The goal of this project is to perform:
1. Data cleaning\
Exploratory Data Analysis (EDA)\
Business insights generation
Key focus areas include:
Product pricing\
Discount strategies\
Inventory availability\
Category-level performance
The analysis demonstrates how SQL can be used to derive actionable
business insights from retail datasets.
---
Project Workflow
The project follows the below analytical workflow:
Raw Dataset (Excel)\
Data Import → PostgreSQL Database\
Data Cleaning & Transformation\
Exploratory Data Analysis (EDA)\
Business Insights Generation
---
Dataset
The dataset contains product-level inventory and pricing information
from Zepto.
Column                   Description
---
sku_id                   Unique product identifier
category                 Product category
name                     Product name
mrp                      Maximum Retail Price
discountPercent          Discount percentage
availableQuantity        Available stock quantity
discountedSellingPrice   Final selling price
weightInGms              Product weight
outOfStock               Stock availability
quantity                 Pack quantity
---
Database Schema
``` sql
CREATE TABLE zepto(
sku\_id SERIAL PRIMARY KEY,
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
```
---
Data Cleaning
Before performing analysis, several data cleaning steps were applied:
Checked dataset size\
Identified missing values\
Removed products where MRP = 0\
Converted price units from paise → rupees\
Validated stock availability
Example cleaning query:
``` sql
DELETE FROM zepto
WHERE mrp = 0;
```
---
Exploratory Data Analysis
Key exploratory analysis tasks included:
Counting total records\
Identifying unique product categories\
Analyzing stock availability\
Detecting duplicate SKUs\
Investigating missing values
Example query:
``` sql
SELECT DISTINCT category
FROM zepto
ORDER BY category;
```
---
Key Business Insights
1. Revenue Potential by Category
``` sql
SELECT category,
SUM(discountedsellingprice \* availablequantity) AS estimated\_revenue
FROM zepto
GROUP BY category
ORDER BY estimated\_revenue DESC;
```
Insight
Categories with the highest estimated inventory revenue represent the
core revenue drivers for the platform and should receive priority
in:
Inventory stocking\
Supplier negotiations\
Marketing campaigns
---
2. High Value Products Currently Out of Stock
``` sql
SELECT name, mrp
FROM zepto
WHERE mrp > 300
AND outofstock = TRUE;
```
Insight
High-value products being out of stock indicate lost revenue
opportunities and potential supply chain inefficiencies.
---
3. Categories Offering the Highest Discounts
``` sql
SELECT category,
ROUND(AVG(discountpercent),2) AS avg\_discount
FROM zepto
GROUP BY category
ORDER BY avg\_discount DESC
LIMIT 5;
```
Insight
Categories with high discounts may indicate:
Competitive market segments\
Aggressive promotional strategies\
Price-sensitive consumer demand
---
4. Best Value Products for Consumers
``` sql
SELECT name,
discountedsellingprice,
ROUND(discountedsellingprice/weightInGms,2) AS price\_per\_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price\_per\_gram;
```
Insight
Products with the lowest price-per-gram provide the best value for
customers and can be highlighted in recommendation systems or
promotional campaigns.
---
5. Inventory Weight Distribution by Category
``` sql
SELECT category,
SUM(weightInGms \* availableQuantity) AS inventory\_weight
FROM zepto
GROUP BY category
ORDER BY inventory\_weight DESC;
```
Insight
This helps understand warehouse load distribution and optimize
storage planning and logistics operations.
---
Example Analytical Queries
Top 10 Highest Discounted Products
``` sql
SELECT name, discountpercent, category
FROM zepto
ORDER BY discountpercent DESC
LIMIT 10;
```
Products with Multiple SKUs
``` sql
SELECT name, COUNT(sku\_id) AS no\_of\_skus
FROM zepto
GROUP BY name
HAVING COUNT(sku\_id) > 1
ORDER BY no\_of\_skus DESC;
```
Stock Availability Overview
``` sql
SELECT outOfStock, COUNT(sku\_id)
FROM zepto
GROUP BY outOfStock;
```
---
Tools & Technologies
Tool         Purpose
---
PostgreSQL   Data storage & querying
SQL          Data cleaning & analytics
Excel        Raw dataset
GitHub       Version control & project portfolio
---
Project Structure
    zepto-product-inventory-sql-analysis
│
├── zepto_v1.xlsx        # Raw dataset
├── zepto_analysis.sql   # SQL queries for analysis
├── README.md            # Project documentation
└── LICENSE

---
Skills Demonstrated
This project highlights the following analytics skills:
SQL for Data Analysis\
Data Cleaning in SQL\
Exploratory Data Analysis\
Business Insight Generation\
Retail & Pricing Analytics\
Analytical Problem Solving
---
Future Improvements
Possible enhancements for the project:
Power BI dashboard for visualization\
Demand forecasting model\
Inventory optimization analysis\
Price elasticity analysis\
Product recommendation insights
---
Author
Suhas Jadhav
Data Analytics Enthusiast
Skills:  
SQL • Data Analysis • Business Insights • Analytics Projects
