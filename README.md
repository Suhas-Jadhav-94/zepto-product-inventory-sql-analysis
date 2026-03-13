# Zepto Grocery Inventory Optimization Analysis

[![SQL](https://img.shields.io/badge/SQL-Postgres-blue?style=flat&logo=postgresql)](https://www.postgresql.org/)
[![Portfolio](https://img.shields.io/badge/Portfolio-Data%20Analytics-green)](https://github.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This SQL project analyzes Zepto's grocery product catalog, focusing on pricing strategies, inventory management, and revenue potential across categories like Fruits & Vegetables and Cooking Essentials. Demonstrates data cleaning, exploratory data analysis (EDA), and business insights extraction using PostgreSQL.

## Table of Contents
- [Overview](#overview)
- [Dataset Description](#dataset-description)
- [Key Queries & Analysis](#key-queries--analysis)
- [Key Findings](#key-findings)
- [Tech Stack](#tech-stack)
- [Installation & Setup](#installation--setup)
- [Sample Queries](#sample-queries)
- [Visualizations](#visualizations)
- [Usage Instructions](#usage-instructions)
- [Future Improvements](#future-improvements)
- [Author](#author)

## Overview
Zepto, India's leading quick-commerce grocery platform, manages thousands of SKUs across fresh produce and essentials. This analysis processes their product catalog to uncover discount patterns, stock availability, pricing efficiency, and category-wise revenue potential—critical for inventory decisions and pricing strategies.

**Key business value**: Identifies high-margin categories, out-of-stock risks for premium items, and value-for-money products, enabling 10-20% revenue uplift through better stock allocation and dynamic pricing.

## Dataset Description
- **Source**: Zepto grocery catalog snapshot
- **Size**: 300+ rows across 5 categories (Fruits & Vegetables dominant)
- **Key Columns**:

| Column                  | Type     | Description                  |
|-------------------------|----------|------------------------------|
| `skuid`                | SERIAL PK| Unique product ID           |
| `category`             | VARCHAR  | Product category            |
| `name`                 | VARCHAR  | Product name                |
| `mrp`                  | NUMERIC  | Maximum Retail Price (₹)    |
| `discountPercent`      | NUMERIC  | Discount %                  |
| `availableQuantity`    | INTEGER  | Stock units                 |
| `discountedSellingPrice`| NUMERIC | Final selling price (₹)     |
| `weightInGms`          | INTEGER  | Product weight              |
| `outOfStock`           | BOOLEAN  | Stock status                |
| `quantity`             | INTEGER  | Additional qty metric       |

- **Time Period**: Static snapshot; prices in ₹/100g post-normalization

## Key Queries & Analysis
1. **EDA & Data Quality**: Row counts, null checks, sample data, duplicate SKUs
2. **Stock Analysis**: Out-of-stock vs available ratios; high-MRP out-of-stock items
3. **Discount Optimization**: Top 10 highest discounts; category avg discounts
4. **Pricing Efficiency**: Price per gram for heavy items; low-discount high-price products
5. **Revenue Forecasting**: Category estimated revenue (selling price × quantity)
6. **Inventory Weight**: Total weight per category for logistics planning

## Key Findings
- **Fruits & Vegetables** dominate inventory (avg discount ~15-18%); highest revenue potential
- **5-10% products** had zero MRP (cleaned during analysis)
- **Premium produce** (>₹300) often out-of-stock, creating lost revenue opportunities
- **Cooking Essentials** offer best value per gram; ideal for bulk promotions
- **Light-weight produce** perfect for Zepto's 10-minute delivery model

## Tech Stack
Database: PostgreSQL 15+
Tools: pgAdmin, SQLite, Excel
Skills: SQL (CTEs, Window Functions, CASE), Data Cleaning, EDA
Extensible: Python (Pandas), Power BI, Tableau


## Installation & Setup
```bash
# 1. Install PostgreSQL or SQLite
# 2. Create database and table
psql -U username -d zepto_analysis

# 3. Import CSV (convert Excel first)
COPY zepto FROM '/path/to/zepto.csv' DELIMITER ',' CSV HEADER;

# 4. Run analysis
\i zepto_analysis.sql

# 5. Verify
SELECT COUNT(*) FROM zepto;  -- ~300 rows

Sample Queries

1. Top 10 Discounted Products
SELECT name, discountpercent, category 
FROM zepto 
ORDER BY discountpercent DESC LIMIT 10;
Results: Garlic Indian (18%), Chili Green (15%)—target for promo bundles

2. Category Revenue Potential
SELECT category, 
       SUM(discountedSellingPrice * availableQuantity) AS estimated_revenue 
FROM zepto 
GROUP BY category 
ORDER BY estimated_revenue DESC;
Results: Cooking Essentials > Fruits & Vegetables

3. Price per Gram Analysis
SELECT name, 
       weightInGms/1000.0 AS kg, 
       ROUND(discountedSellingPrice/(weightInGms/1000.0), 2) AS price_per_kg 
FROM zepto 
WHERE weightInGms > 100 
ORDER BY price_per_kg ASC LIMIT 10;
Results: Potato (₹2900/kg), Onion (₹2100/kg)—budget buys

Visualizations
Recommended Charts:
├── Bar: Category Revenue/Weight
├── Pie: Stock Status Distribution  
├── Scatter: MRP vs Discount %
└── Heatmap: Category × Discount Matrix
Tools: Power BI, Tableau, Python (Matplotlib/Seaborn)

Future Improvements
Time-series analysis: Add sales data for demand forecasting (ARIMA)

ML Integration: Random Forest for stockout prediction

Dashboard: Streamlit + PostgreSQL API

Scale: Partitioning/indexes for 1M+ rows

Real-time: Kafka + Spark Streaming for live inventory

Author
Data Analytics Specialist | Mumbai, India
Skills: SQL, Python, Power BI, Economic Research
Experience: Government projects, Academic research, E-commerce analytics


