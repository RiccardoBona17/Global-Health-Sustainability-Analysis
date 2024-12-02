/* Do the 5 top/bottom countries in terms of health levels 
remain the same when the reference measure changes? */

-- In this case, infant_mortality was used as measure of health

SELECT
	country as country_name,
	infant_mortality as infant_mortality_rate
FROM
	world_data_2023
WHERE
	infant_mortality IS NOT NULL -- exclude NULL values
ORDER BY
	infant_mortality ASC -- sort it in ascending order
	/* replace ASC with DESC if you want to find out the 5 
	countries with the highest infant mortality rate */
LIMIT
	5; -- extract the top 5