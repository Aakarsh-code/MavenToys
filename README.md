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
## 5. Gold Layer (Business Marts)
The Gold Layer represents the business-facing data marts, designed with business analysts in mind. In this layer, I created four specialized tables, each addressing different business problems or analysis requirements as I anticipated they would be needed.