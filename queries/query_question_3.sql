/* Is there a relationship between countries' public health and their 
GDP (Gross Domestic Product)? */

/* This CTE (Common Table Expression) calculates the percentile associated with each 
country based on their GDP */

WITH country_rank_by_gdp AS (
SELECT
	country,
    cast(PERCENT_RANK() OVER (ORDER BY gdp)*100 as NUMERIC(5,2)
	) as percentile_by_gdp /* this function assigns a decimal number between 0 and 1 
	                          denoting the rank of the country, so I multiplied it by
							  100 to have proper percentiles */
FROM
	world_data_2023
WHERE
	gdp IS NOT NULL 
	AND life_expectancy IS NOT NULL
)

-- Then, I selected the countries that were also present among the 5 countries with lowest life expectancy 
SELECT
	country as country_name,
	percentile_by_gdp
FROM
	country_rank_by_gdp
WHERE
	country IN (
		SELECT country as country_name 
		FROM world_data_2023
		WHERE life_expectancy IS NOT NULL AND gdp IS NOT NULL
		ORDER BY life_expectancy -- default order is ASCENDING
		LIMIT 5
		); -- this subquery passes in the 5 countries with the lowest life expectancy values