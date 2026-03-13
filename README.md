# Zepto Grocery Inventory Optimization Analysis

This SQL project analyzes Zepto's grocery product catalog, focusing on pricing strategies, inventory management, and revenue potential across categories like Fruits & Vegetables and Cooking Essentials. It demonstrates data cleaning, exploratory data analysis (EDA), and business insights extraction using PostgreSQL syntax. [file:1][file:2]

[![SQL](https://img.shields.io/badge/SQL-Postgres-blue?style=flat&logo=postgresql)](https://www.postgresql.org/)
[![Portfolio](https://img.shields.io/badge/Portfolio-Data%20Analytics-green)](https://github.com/)

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
Zepto, a leading quick-commerce grocery platform in India, manages thousands of SKUs across fresh produce and essentials. This analysis processes their product catalog to uncover discount patterns, stock availability, pricing efficiency, and category-wise revenue potential—critical for inventory decisions and pricing strategies.

**Key business value**: Identifies high-margin categories, out-of-stock risks for premium items, and value-for-money products, enabling 10-20% revenue uplift through better stock allocation and dynamic pricing. [file:1][file:2]

## Dataset Description
- **Source**: Zepto grocery catalog snapshot (likely scraped/exported from platform).
- **Size**: ~300+ rows across 5 categories (Fruits & Vegetables dominant).
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

- **Time Period**: Static snapshot (no dates); prices in ₹/100g post-normalization. [file:1][file:2]

## Key Queries & Analysis
- **EDA & Data Quality**: Row counts, null checks, sample data, duplicate SKUs.
- **Stock Analysis**: Out-of-stock vs available ratios; high-MRP out-of-stock items.
- **Discount Optimization**: Top 10 highest discounts; category avg discounts.
- **Pricing Efficiency**: Price per gram for heavy items; low-discount high-price products.
- **Revenue Forecasting**: Category estimated
