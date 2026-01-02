# World Wide Energy Consumption – SQL Project

This project is about analyzing world wide energy consumption data using SQL.
The dataset contains information about energy consumption, production, emissions,
GDP and population for different countries.

I worked on this project to understand how energy usage and emissions are related
to economic growth and population over time.

---

## Project Goal

The main goal of this project is:
- To analyze energy consumption and production across countries
- To study CO₂ emissions and per capita emissions
- To understand the relation between GDP, population and energy usage
- To compare countries based on economic and energy indicators

---

## Dataset Information

The data was taken from an organization that tracks global energy data.
There are 6 CSV files which were imported into MySQL.

Tables used:
- country
- consumption
- production
- emission_3
- gdp_3
- population

All tables (except country) are connected using foreign key relationships.

---

## Database Design

I created a relational database in MySQL.
The country table acts as the parent table and all other tables have
a one-to-many relationship with it.

---

## Analysis Done Using SQL

Some of the analysis questions I worked on:
- Total emissions per country for the latest year
- Top 5 countries by GDP
- Energy production vs consumption comparison
- Global emission trends over the years
- Energy consumption per capita
- Emission to GDP ratio
- Population and GDP trends

---

## Tools Used

- MySQL
- SQL (joins, group by, aggregate functions, subqueries)
- CSV files
- Power BI (for visualization)

---

## Author

Sravya Chinthamreddy  
Data Analytics Fresher  

---

## Note

All SQL queries in this project were written by me as part of my learning.
