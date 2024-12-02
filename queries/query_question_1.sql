-- #1: What are the 5 best countries in terms of health quality?
-- #2: What are the 5 worst countries in terms of health quality?

-- Health level is 'measured' as life expectancy index

SELECT
	country as country_name, -- I want country name
	life_expectancy as expected_living_years -- and data about life expectancy
FROM
	world_data_2023 -- 
WHERE
	life_expectancy IS NOT NULL -- this clause excludes 'null' values
ORDER BY -- Now sorted in DESCENDING order
	expected_living_years DESC -- ASC 
	/* replace DESC with ASC to change the sorting logic and get the 5 countries 
	with lowest life expectancy values */
LIMIT
	5; -- only the first 5 values