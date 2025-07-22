# Maven Toys DBT Project
This document outlines my step-by-step experience in creating data layers using the provided dataset. The process was carried out using Snowflake and dbt, following a standard medallion architecture (Bronze, Silver, Gold).

## 1. Data Exploration
I began by exploring the dataset in Excel. This initial step allowed me to familiarize myself with the structure, content, and types of data available. By reviewing the data in Excel, I was able to identify key columns, potential data quality issues, and areas that might require transformation later in the process.

## 2. Data Loading into Snowflake
After understanding the data, I loaded it into Snowflake. This step enabled centralized access and integration with our dbt environment. Although some simple data changes were initially considered within Snowflake, the project guidelines required that all transformations be handled exclusively through dbt. As a result, no changes were made directly in Snowflake at this stage.

## 3. Bronze Layer (Raw Data)
Once the data was accessible in Snowflake, I connected it to dbt and created the Bronze Layer. This layer serves as the raw data repository, preserving the original data as loaded. No transformations were made in this layer, except for the following:

In the data_dictionary table, I updated column names that were incorrect.
Created a source.yml file to document all the source tables and their destinations in Snowflake, ensuring proper data lineage and traceability.
## 4. Silver Layer (Intermediate/Cleansed Data)
The Silver Layer focuses on data cleaning and intermediate transformations. Here, I performed the following tasks:

Removed null values from the datasets to improve data quality.
In the calendar table, I extracted and added separate columns for month, day, and year to facilitate easier time-based analysis.
In the product table, I introduced a new column for profit, calculated as appropriate for further analysis.

## 5. Snapshot
Added sanpshot to record the changes that will be happening in the intermediate layer tables for this I have created snaphots of only 4 major tables where chances of change is higher and need to be recorded incase it happens.
Also Orchestrated the tables to run every 4 hours to check for changes.

## 6. Gold Layer (Business Marts)
The Gold Layer represents the business-facing data marts, designed with business analysts in mind. In this layer, I created four specialized tables, each addressing different business problems or analysis requirements as I anticipated they would be needed.
The 4 tables are :
    
    name: montly_sales_per_store
    description: Montly sales per store with the running sales.

    name: products_offered_per_store
    description: The number of products offered in every store.

    name: store_sales_and_profit
    description: Total sales in each store and the total profit made by that store.

    name: top3_products_per_store
    description: Total number of units sold of top three products in every store along with the profit gained.
    