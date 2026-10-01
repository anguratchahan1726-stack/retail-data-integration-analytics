# Retail Data Integration and Analytics Pipeline

## 📌 Project Overview

A complete data engineering and analytics pipeline built using Python, Pandas, NumPy, SQL, SQLite, and Matplotlib.

The project processes the UCI Online Retail dataset through data ingestion, quality checks, cleaning, relational modeling, SQL analytics, numerical analysis, and visualization.

---

## 🎯 Business Problem

Retail transaction data is initially stored as a flat dataset containing orders, products, customers, quantities, prices, dates, and countries.

The goal of this project is to transform the raw transactional data into a structured analytical system that can answer questions such as:

- What is the overall sales performance?
- Which products generate the most revenue?
- Which countries contribute the most revenue?
- How does revenue change over time?
- Which entries have the highest sales quantity?
- How is product revenue distributed?

---

## 📊 Dataset

**Dataset:** UCI Online Retail Dataset  
**Source:** UCI Machine Learning Repository  
**Dataset ID:** 352

The dataset contains transactions from a UK-based online retailer covering December 2010 to December 2011.

### Raw dataset

- 541,909 transaction rows
- 8 original columns
- Invoice number
- Stock code
- Product description
- Quantity
- Invoice date
- Unit price
- Customer ID
- Country

---

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| Python | Pipeline development |
| Pandas | Data loading and transformation |
| NumPy | Numerical analysis |
| SQL | Data quality and analytics |
| SQLite | Relational database |
| Matplotlib | Data visualization |
| Google Colab | Development environment |

---

## 🔄 Pipeline Architecture

```text
Raw Dataset
     ↓
Data Ingestion
     ↓
Data Inspection
     ↓
SQLite Staging
     ↓
Data Quality Checks
     ↓
Data Cleaning
     ↓
Star Schema
     ↓
SQL Analytics
     ↓
Python + NumPy
     ↓
Matplotlib Visualizations
     ↓
Business Insights
