-- World Wide Energy Consumption SQL Project
-- This file contains table creation and analysis queries
-- written by me for understanding real-world energy data.

-- Create database
CREATE DATABASE energyconsumption1;
USE energyconsumption1;

-- =========================
-- Country (Parent Table)
-- =========================

SET FOREIGN_KEY_CHECKS = 0;
drop table country;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE country (
    Country VARCHAR(100) NOT NULL,
    CID VARCHAR(10) PRIMARY KEY
);
-- =========================
-- Emission Table
-- =========================
CREATE TABLE emission_3 (
    country VARCHAR(100) NOT NULL,
    energy_type VARCHAR(50),
    year INT,
    emission INT,
    per_capita_emission DOUBLE,
    CONSTRAINT fk_emission_country
    FOREIGN KEY (country) REFERENCES country(Country)
);

-- =========================
-- Population Table
-- =========================
CREATE TABLE population (
    country VARCHAR(100) NOT NULL,
    year INT,
    value DOUBLE,
    CONSTRAINT fk_population_country
    FOREIGN KEY (country) REFERENCES country(Country)
);

-- =========================
-- Production Table
-- =========================
CREATE TABLE production (
    country VARCHAR(100) NOT NULL,
    energy VARCHAR(50),
    year INT,
    production INT,
    CONSTRAINT fk_production_country
    FOREIGN KEY (country) REFERENCES country(Country)
);

-- =========================
-- GDP Table
-- =========================
CREATE TABLE gdp_3 (
    country VARCHAR(100) NOT NULL,
    year INT,
    value DOUBLE,
    CONSTRAINT fk_gdp_country
    FOREIGN KEY (country) REFERENCES country(Country)
);

-- =========================
-- Consumption Table
-- =========================
CREATE TABLE consumption (
    country VARCHAR(100) NOT NULL,
    energy VARCHAR(50),
    year INT,
    consumption INT,
    CONSTRAINT fk_consumption_country
    FOREIGN KEY (country) REFERENCES country(Country)
);

-- =========================
-- ANALYSIS QUERIES
-- =========================

-- Total emission per country for latest year
SELECT country, SUM(emission) AS total_emission
FROM emission_3
WHERE year = (SELECT MAX(year) FROM emission_3)
GROUP BY country;

-- Top 5 countries by GDP
SELECT country, value
FROM gdp_3
WHERE year = (SELECT MAX(year) FROM gdp_3)
ORDER BY value DESC
LIMIT 5;

-- Global emission trend
SELECT year, SUM(emission) AS global_emission
FROM emission_3
GROUP BY year
ORDER BY year;

-- Total energy production by country
SELECT country, SUM(production) AS total_production
FROM production
GROUP BY country;

-- Production vs Consumption
SELECT p.country, p.year,
       SUM(p.production) AS total_production,
       SUM(c.consumption) AS total_consumption
FROM production p
JOIN consumption c
ON p.country = c.country AND p.year = c.year
GROUP BY p.country, p.year;

-- Energy consumption per capita
SELECT c.country, c.year,
       c.consumption / p.value AS consumption_per_capita
FROM consumption c
JOIN population p
ON c.country = p.country AND c.year = p.year;

-- Emission to GDP ratio
SELECT e.country, e.year,
       SUM(e.emission) / g.value AS emission_gdp_ratio
FROM emission_3 e
JOIN gdp_3 g
ON e.country = g.country AND e.year = g.year
GROUP BY e.country, e.year, g.value;

-- Population trend
SELECT country, year, value AS population
FROM population
ORDER BY country, year;

-- GDP trend
SELECT country, year, value AS gdp
FROM gdp_3
ORDER BY country, year;
INSERT INTO country (CID, Country)
VALUES ('C1','India'), ('C2','USA'), ('C3','China');

