/* In this dataset we have data collected from single cities, 
thus we need to calculate countries' averages */

CREATE VIEW water_air_quality_by_country AS 
		SELECT
			country as country_name,
			country_code,
			AVG(air_quality)::NUMERIC(5,2) as avg_air_quality, -- average air quality value within the country
			AVG(water_quality)::NUMERIC(5,2) as avg_water_pollution -- average water pollution value within the country
		FROM
			water_air_quality_2021
		WHERE
			air_quality IS NOT NULL
			AND water_quality IS NOT NULL
		GROUP BY
			country,
			country_code
		ORDER BY
			country_name;