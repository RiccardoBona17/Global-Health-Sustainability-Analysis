/* Use the power of CTEs to join the tables together so as to have general 
information about countries as well as their air and water quality notions */

WITH country_health_stats AS (
SELECT 
	wd.country as country_name,
	wd.life_expectancy,
	waqc.avg_air_quality,
	waqc.avg_water_pollution
FROM
	world_data_2023 wd
JOIN
	country_codes cc ON cc.alpha2_code = wd.abbreviation -- this table connects all the other datasets
JOIN
	water_air_quality_by_country waqc ON waqc.country_code = cc.numeric_code
WHERE
	wd.life_expectancy IS NOT NULL
ORDER BY
	wd.life_expectancy
)

/* Question #4.1: Among the countries with the lowest air quality scores and 
highest water pollution rates, what is the average life expectancy? */

/* Question #4.2: Among the countries with the highest air quality scores and 
lowest water pollution rates, what is the average life expectancy? */

SELECT
	AVG(life_expectancy)::NUMERIC(5,2) -- compute the average among countries that meet the WHERE conditions
	as avg_life_expect_low_env_health_countries
FROM
	country_health_stats
WHERE
	avg_air_quality < 25 -- > 75 -- uncomment this to answer the other question
	AND avg_water_pollution > 75 -- < 25 -- uncomment this to answer the other question 

