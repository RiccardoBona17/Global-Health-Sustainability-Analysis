/* Is there a link between countries' change in the renewable energy consumption share 
and their GDP in the 2016-2020 timeframe? */

-- GOAL #1: Exclude rows with NULL values and select only the 2016-2020 timeframe
WITH gsd_2016_2020 AS (
	SELECT
		*
	FROM
		global_sustainability_data
	WHERE
		year BETWEEN 2016 AND 2020 -- 2015: ONU launches 'Agenda 2030'
		AND renewable_energy_share_over_total_energy_consumption IS NOT NULL 
),


-- GOAL #2: calculate the change in renewable_energy_share in 2016-2020
renew_energy_share_2016_2020 AS (
	SELECT DISTINCT
		country,
		country_label,
		FIRST_VALUE(renewable_energy_share_over_total_energy_consumption) 
			OVER (
				PARTITION BY country
				ORDER BY year ASC
				ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
			) as first_year_share, -- earliest data on renewable energy share on total consumption
	    LAST_VALUE(renewable_energy_share_over_total_energy_consumption)
		    OVER (
				PARTITION BY country
				ORDER BY year ASC
				ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
			) as last_year_share -- latest data on renewable energy share on total consumption
	FROM
		gsd_2016_2020
),


-- GOAL #3: classify each state based on the change in renewable energy consumption through 2016-2020 
renew_energy_sustainability_class AS (
	SELECT
		country,
		country_label,
		last_year_share - first_year_share as renew_energy_change,
		CASE
			WHEN last_year_share - first_year_share > 5 THEN 'Elevato miglioramento' -- 5 is a completely arbitrary value
			WHEN last_year_share - first_year_share BETWEEN 0 AND 5 THEN 'Discreto miglioramento'
			ELSE 'Peggioramento'
		END as sustainability_trend /* this clause allow to assign a label to each country 
		                               according to their change in renewable energy share */
	FROM
		renew_energy_share_2016_2020
)


-- ULTIMATE GOAL: Calculate the average GDP for each sustainability class of countries

SELECT
	sustainability_trend,
	AVG(wd.gdp)::NUMERIC(15,2) as average_gdp_in_dollars -- average within sustainability classes
FROM
	renew_energy_sustainability_class resc
JOIN
	country_codes cc ON cc.alpha3_code = resc.country_label -- link sustainability table with country_codes
JOIN
	world_data_2023 wd ON wd.abbreviation = cc.alpha2_code -- this double JOIN allows to get the GDP data
GROUP BY
	sustainability_trend
ORDER BY
	average_gdp_in_dollars DESC;