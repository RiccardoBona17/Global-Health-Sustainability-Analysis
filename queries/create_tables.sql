-- Creating the tables that will be holding the 4 datasets

-- Create the table for the "country_codes.csv" data
CREATE TABLE IF NOT EXISTS country_codes (
	id SERIAL PRIMARY KEY,
	alpha2_codes CHAR(2) UNIQUE, -- UNIQUE constraint as they'll be foreign keys in the other tables
	alpha3_codes CHAR(3) UNIQUE,
	numeric_code SMALLINT UNIQUE
)

-- Create the table that keeps "world-data-2023.csv" data
CREATE TABLE IF NOT EXISTS world_data_2023 (
	country VARCHAR(50),
	density INT,
	abbreviation CHAR(2) PRIMARY KEY,  
	agricultural_land_percent NUMERIC,
	land_area_km_sq INT,
	armed_force_size INT,
	birth_rate NUMERIC,
	calling_code INT,
	capital VARCHAR(50),
	co2_emissions INT,
	cpi NUMERIC,
	cpi_change_percent NUMERIC,
	currency_code VARCHAR(50),
	fertility_rate NUMERIC,
	forested_area_percent NUMERIC,
	gasoline_price_dollars NUMERIC,
	gdp NUMERIC, 
	gross_primary_edu_enrollment_percent NUMERIC,
	gross_tertiary_edu_enrollment_percent NUMERIC,
	infant_mortality NUMERIC,
	largest_city VARCHAR(50),
	life_expectancy NUMERIC,
	maternal_mortality_ratio INT,
	minimum_wage_dollars NUMERIC,
	official_language VARCHAR(50),
	out_of_pocket_health_expenditure NUMERIC,
	physician_per_thousand NUMERIC,
	population INT,
	labor_force_participation_percent NUMERIC,
	tax_revenue_percent NUMERIC,
	total_tax_rate_percent NUMERIC,
	unemployment_rate_percent NUMERIC,
	urban_population INT,
	latitude NUMERIC,
	longitude NUMERIC,
	FOREIGN KEY(abbreviation) REFERENCES country_codes(alpha2_code)
)

-- Create table hosting "air_water_quality_2021.csv" data
CREATE TABLE IF NOT EXISTS water_air_quality_2021 (
	id SERIAL PRIMARY KEY,
	city VARCHAR(50),
	region VARCHAR(50),
	country VARCHAR(50),
	country_code SMALLINT,
	air_quality NUMERIC,
	water_quality NUMERIC
)

-- Create table that contains "global_data_sustainability.csv" data
CREATE TABLE global_sustainability_data (
	id SERIAL PRIMARY KEY,
	country VARCHAR(50),
	year INT NOT NULL,
	electricity_access_population_percent NUMERIC,
	country_label CHAR(3),
	clean_cooking_fuels_access_population_percent NUMERIC,
	renewable_electricity_generating_capacity_per_capita NUMERIC,
	financial_flows_to_developing_countries BIGINT,
	renewable_energy_share_over_total_energy_consumption NUMERIC,
	electricity_from_fossil_fuels_twh NUMERIC,
	electricity_from_nuclear_twh NUMERIC,
	electricity_from_renewables_twh NUMERIC,
	low_carbon_electricity_percent_over_total_electricity NUMERIC,
	primary_energy_consumption_per_capita_kwh_person NUMERIC,
	energy_intensity_level_of_primary_energy_mj_over_2017_ppp_gdp NUMERIC,
	value_co2_emissions_kt_by_country NUMERIC,
	renewables_percent_equivalent_primary_energy NUMERIC,
	gdp_growth_percent NUMERIC,
	gdp_per_capita NUMERIC,
	density INT,
	land_area_km2 INT,
	latitude NUMERIC,
	longitude NUMERIC,
	FOREIGN KEY(country_label) REFERENCES country_codes(alpha3_code)
);