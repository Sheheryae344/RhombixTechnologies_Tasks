# RhombixTechnologies_Tasks
Data Analysis Internship Tasks - Rhombix Technologies
# Task 1.1: Data Collection & Cleaning

## Objective
Collect a dataset and clean it using Python and Pandas.

## Dataset
Titanic Dataset

## Tools Used
- Google Colab
- Python
- Pandas
- NumPy

## Cleaning Performed
- Loaded dataset
- Checked data types
- Removed duplicate rows
- Handled missing values
- Converted data types
- Saved cleaned dataset

## Files
- Task1_Data_Cleaning.ipynb
- cleaned_titanic.csv
# Task 1.2: Exploratory Data Analysis (EDA)

## Objective
Perform Exploratory Data Analysis (EDA) on the cleaned Titanic dataset.

## Tools Used
- Python
- Google Colab
- Pandas
- NumPy
- Matplotlib
- Seaborn

## Analysis Performed
- Summary Statistics
- Correlation Analysis
- Heatmap
- Histograms
- Count Plots
- Box Plot
- Line Plot
- Pair Plot
- Outlier Detection

## Key Insights
- Most passengers belonged to Class 3.
- Male passengers outnumbered female passengers.
- Fare contained several outliers.
- Passenger age was concentrated between 20 and 40 years.
- Survival varied by gender and passenger class.

# Task 2.1:SQL Querying and Analysis on E-Commerce Data

## Task Overview
This task involved downloading a real-world e-commerce dataset from Kaggle, loading it into a Microsoft SQL Server 2025 database, and writing SQL queries to extract meaningful business insights — top-selling products, revenue by country, monthly revenue trends, and top customers by spend.

## Dataset
- **Source:** Kaggle — Online Retail Dataset
- **Format:** CSV, imported into SQL Server via the Import Flat File Wizard
- **Rows:** 500,000+ transaction line items
- **Columns:** `InvoiceNo`, `StockCode`, `Description`, `Quantity`, `InvoiceDate`, `UnitPrice`, `CustomerID`, `Country`

## Tools Used
- Microsoft SQL Server 2025
- SQL Server Management Studio (SSMS)
- T-SQL

## Key SQL Concepts Practiced
- `SELECT` and `WHERE` — filtering transaction records
- Calculated columns — deriving revenue as `Quantity * UnitPrice`
- `GROUP BY` — aggregating sales by product, country, and month
- `ORDER BY` — ranking results to surface top performers
- `JOIN` — linking a derived `Countries` reference table back to the main transactions table
- `COUNT(DISTINCT ...)` — counting unique orders and customers within aggregates

## Insights Extracted
- **Top-selling products** by total revenue and units sold
- **Revenue by country**, identifying the highest-grossing markets
- **Monthly revenue trend**, identifying the highest and lowest revenue months
- **Top customers by lifetime spend**
