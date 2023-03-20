SELECT
	i.industry,
	EXTRACT(YEAR FROM d.date_joined) AS year,
	COUNT(c.company_id) AS num_unicorns,
	ROUND(AVG(f.valuation/1000000000), 2) AS average_valuation_billions
FROM companies c
	-- inner join companies with industries, dates and funding table
	INNER JOIN industries i USING(company_id)
	INNER JOIN dates d USING(company_id)
	INNER JOIN funding f USING(company_id)
WHERE
	-- extract the year from d.date_joined, then filter the years 2019 - 2021
	EXTRACT(YEAR FROM d.date_joined) BETWEEN 2019 AND 2021
	
	-- filter the top 3 industries based on the number of new unicorns
	 AND i.industry IN (
		SELECT i.industry
		FROM 
			companies c
			INNER JOIN industries i ON c.company_id = i.company_id
			INNER JOIN dates d ON c.company_id = d.company_id
		WHERE
			EXTRACT(YEAR FROM d.date_joined) BETWEEN 2019 AND 2021
		GROUP BY 
			i.industry, 
			EXTRACT(YEAR FROM d.date_joined)
		ORDER BY 
			COUNT(c.company_id) DESC
		LIMIT 3)

GROUP BY 
	i.industry,
	DATE_PART('year', d.date_joined)
ORDER BY
	i.industry,
	year DESC;
