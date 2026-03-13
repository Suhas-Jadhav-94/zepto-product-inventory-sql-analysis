**Project Overview**
This project analyzes product-level data from Zepto, a quick-commerce grocery delivery platform, using PostgreSQL.The goal of the project is to perform 
data cleaning, exploratory data analysis (EDA), and generate business insights related to:
1. Product pricing
2. Discount strategies
3. Inventory availability
4. Category-level performance
The analysis demonstrates how SQL can be used to derive business insights from retail datasets.


**Project Workflow**
1. Raw Dataset (Excel)
2. Data Import → PostgreSQL Database
3. Data Cleaning & Transformation
4. Exploratory Data Analysis (EDA)
5. Business Insights Generation

**Dataset**
The dataset contains product-level inventory and pricing information from Zepto.
| Column                 | Description               |
| ---------------------- | ------------------------- |
| sku_id                 | Unique product identifier |
| category               | Product category          |
| name                   | Product name              |
| mrp                    | Maximum Retail Price      |
| discountPercent        | Discount percentage       |
| availableQuantity      | Available stock quantity  |
| discountedSellingPrice | Final selling price       |
| weightInGms            | Product weight            |
| outOfStock             | Stock availability        |
| quantity               | Pack quantity             |


**Database Schema**
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

**Data Cleaning**
Before analysis, several cleaning steps were performed:
1. Checked dataset size
2. Identified missing values
3. Removed products with MRP = 0
4. Converted price units from paise → rupees
5. Validated stock availability

Example cleaning query:
DELETE FROM zepto
WHERE mrp = 0;

**Exploratory Data Analysis**
Key EDA tasks performed:
1. Counting total records
2. Identifying unique product categories
3. Analyzing stock availability
4. Detecting duplicate SKUs
5. Investigating missing values

Example query:
SELECT DISTINCT category
FROM zepto
ORDER BY category;

**Key Business Insights**
1. Revenue Potential by Category
SELECT category,
SUM(discountedsellingprice * availablequantity) AS estimated_revenue
FROM zepto
GROUP BY category
ORDER BY estimated_revenue DESC;

**Insight**
1. Categories with the highest estimated inventory revenue represent the core revenue drivers for the platform and should receive priority in:
2. inventory stocking
3. supplier negotiations
4. marketing campaigns

2. High Value Products Currently Out of Stock
SELECT name, mrp
FROM zepto
WHERE mrp > 300
AND outofstock = TRUE;

**Insight**
High-value products being out of stock indicate lost revenue opportunities and potential supply chain inefficiencies.

3.Categories Offering the Highest Discounts
SELECT category,
ROUND(AVG(discountpercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

**Insight**
Categories with high discounts may indicate:
1. competitive market segments
2. aggressive promotional strategies
3. price-sensitive consumer demand

4. Best Value Products for Consumers
SELECT name,
discountedsellingprice,
ROUND(discountedsellingprice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

**Insight**
Products with the lowest price-per-gram provide the best value for customers and can be highlighted in recommendation systems or promotions.

5. Inventory Weight Distribution by Category
SELECT category,
SUM(weightInGms * availableQuantity) AS inventory_weight
FROM zepto
GROUP BY category
ORDER BY inventory_weight DESC;

**Insight**
This helps understand warehouse load distribution and optimize storage planning and logistics operations.

**Example Analytical Queries**

**Top 10 Highest Discounted Products**
SELECT name, discountpercent, category
FROM zepto
ORDER BY discountpercent DESC
LIMIT 10;

**Products with Multiple SKUs**
SELECT name, COUNT(sku_id) AS no_of_skus
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY no_of_skus DESC;

**Stock Availability Overview**
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

**Tools & Technologies**
| Tool       | Purpose                             |
| ---------- | ----------------------------------- |
| PostgreSQL | Data storage & querying             |
| SQL        | Data cleaning & analytics           |
| Excel      | Raw dataset                         |
| GitHub     | Version control & project portfolio |



**Skills Demonstrated**
This project highlights the following analytics skills:
1. SQL for Data Analysis
2. Data Cleaning in SQL
3. Exploratory Data Analysis
4. Business Insight Generation
5. Retail & Pricing Analytics
6. Analytical Problem Solving

**Future Improvements**
Possible enhancements:
1. Power BI dashboard for visualization
2. Demand forecasting model
3. Inventory optimization analysis
4. Price elasticity analysis
5. Product recommendation insights

**Author**
Suhas Jadhav
Data Analytics Enthusiast
SQL | Data Analysis | Business Insights | Analytics Projects









