---
jupyter:
  colab:
    name: Welcome to DataCamp Workspaces.ipynb
  editor: DataCamp Workspace
  kernelspec:
    display_name: Python 3 (ipykernel)
    language: python
    name: python3
  language_info:
    codemirror_mode:
      name: ipython
      version: 3
    file_extension: .py
    mimetype: text/x-python
    name: python
    nbconvert_exporter: python
    pygments_lexer: ipython3
    version: 3.8.10
  nbformat: 4
  nbformat_minor: 5
---

::: {#1fe66cd5-4e11-4046-9e68-016430b84ecd .cell .markdown}
[Analyzing Unicorns Companies
project](https://app.datacamp.com/learn/projects/1531) is a DataCamp
unguided SQL project that intends to find the number of companies that
achieved unicorn status (values exceeding USD 1 billion) between 2019
and 2021. I'm using DataCamp workspace as the environment for this project.

# Tables

Given is the `unicorns` database, which contains the following tables,
for this project\'s dataset sources.

#### `dates` table

  Column         Description
  -------------- ---------------------------------------------
  company_id     A unique ID for the company.
  date_joined    The date that the company became a unicorn.
  year_founded   The year that the company was founded.
:::

::: {#0f9bd075-9350-4990-b5d2-3807c93d5652 .cell .code execution_count="1" chartConfig="{\"bar\":{\"hasRoundedCorners\":true,\"stacked\":false},\"type\":\"bar\",\"version\":\"v1\"}" customType="sql" dataFrameVariableName="df2" executionTime="1194" lastSuccessfullyExecutedCode="SELECT * FROM dates
LIMIT 5;" sqlSource="{\"integrationId\":\"89e17161-a224-4a8a-846b-0adc0fe7a4b1\",\"type\":\"integration\"}" visualizeDataframe="false"}
``` python
SELECT * FROM dates
LIMIT 5;
```

::: {.output .execute_result execution_count="1"}
``` json
{"table":{"data":[{"company_id":189,"date_joined":"2017-06-24T00:00:00.000Z","index":0,"year_founded":1919},{"company_id":848,"date_joined":"2021-06-01T00:00:00.000Z","index":1,"year_founded":2019},{"company_id":556,"date_joined":"2022-02-15T00:00:00.000Z","index":2,"year_founded":2011},{"company_id":999,"date_joined":"2021-11-17T00:00:00.000Z","index":3,"year_founded":2020},{"company_id":396,"date_joined":"2021-10-21T00:00:00.000Z","index":4,"year_founded":2021}],"schema":{"fields":[{"name":"index","type":"integer"},{"name":"company_id","type":"integer"},{"name":"date_joined","type":"datetime","tz":"UTC"},{"name":"year_founded","type":"integer"}],"pandas_version":"1.4.0","primaryKey":["index"]}},"total_rows":5,"truncation_type":null}
```
:::
:::

::: {#768158c9-5ba4-43bf-b664-4b5c42b4078c .cell .markdown}
#### `funding` table

  Column             Description
  ------------------ ---------------------------------------------
  company_id         A unique ID for the company.
  valuation          Company value in US dollars.
  funding            The amount of funding raised in US dollars.
  select_investors   A list of key investors in the company.
:::

::: {#aeadcb40-b0dc-4e7e-916e-d934f52dc111 .cell .code execution_count="2" customType="sql" dataFrameVariableName="df3" executionTime="1613" lastSuccessfullyExecutedCode="SELECT * FROM funding
LIMIT 5;" sqlSource="{\"integrationId\":\"89e17161-a224-4a8a-846b-0adc0fe7a4b1\",\"type\":\"integration\"}"}
``` python
SELECT * FROM funding
LIMIT 5;
```

::: {.output .execute_result execution_count="2"}
``` json
{"table":{"data":[{"company_id":189,"funding":0,"index":0,"select_investors":"EQT Partners","valuation":4000000000},{"company_id":848,"funding":100000000,"index":1,"select_investors":"Dragonfly Captial, Qiming Venture Partners, DST Global","valuation":1000000000},{"company_id":556,"funding":100000000,"index":2,"select_investors":"Blackstone, Bessemer Venture Partners","valuation":2000000000},{"company_id":999,"funding":100000000,"index":3,"select_investors":"Goldman Sachs Asset Management, 3L","valuation":1000000000},{"company_id":396,"funding":100000000,"index":4,"select_investors":"Insight Partners, Softbank Group, Connect Ventures","valuation":2000000000}],"schema":{"fields":[{"name":"index","type":"integer"},{"name":"company_id","type":"integer"},{"name":"valuation","type":"integer"},{"name":"funding","type":"integer"},{"name":"select_investors","type":"string"}],"pandas_version":"1.4.0","primaryKey":["index"]}},"total_rows":5,"truncation_type":null}
```
:::
:::

::: {#1424fdee-b4a7-4ce4-a6dd-66ab0e9db092 .cell .markdown}
#### `industries` table

  Column       Description
  ------------ --------------------------------------------
  company_id   A unique ID for the company.
  industry     The industry that the company operates in.
:::

::: {#aafd959e-a1f6-4446-8213-2cf0afc884c0 .cell .code execution_count="5" customType="sql" dataFrameVariableName="df4" executionTime="1264" lastSuccessfullyExecutedCode="SELECT * FROM industries
LIMIT 5;" sqlSource="{\"integrationId\":\"4000eaff-e663-4eef-88d8-4260bab6c43b\",\"type\":\"integration\"}"}
``` python
SELECT * FROM industries
LIMIT 5;
```

::: {.output .execute_result execution_count="5"}
``` json
{"table":{"data":[{"company_id":189,"index":0,"industry":"Health"},{"company_id":848,"index":1,"industry":"Fintech"},{"company_id":556,"index":2,"industry":"Internet software & services"},{"company_id":999,"index":3,"industry":"Internet software & services"},{"company_id":396,"index":4,"industry":"Fintech"}],"schema":{"fields":[{"name":"index","type":"integer"},{"name":"company_id","type":"integer"},{"name":"industry","type":"string"}],"pandas_version":"1.4.0","primaryKey":["index"]}},"total_rows":5,"truncation_type":null}
```
:::
:::

::: {#07b8e7be-74a8-4356-921f-a364f51e766a .cell .markdown}
#### `companies` table

  Column       Description
  ------------ ---------------------------------------------------
  company_id   A unique ID for the company.
  company      The name of the company.
  city         The city where the company is headquartered.
  country      The country where the company is headquartered.
  continent    The continent where the company is headquartered.
:::

::: {#312a9edf-f82c-4dcb-b667-d1a69f495c1a .cell .code execution_count="6" customType="sql" dataFrameVariableName="df5" executionTime="1251" lastSuccessfullyExecutedCode="SELECT * FROM companies
LIMIT 5;" sqlSource="{\"integrationId\":\"4000eaff-e663-4eef-88d8-4260bab6c43b\",\"type\":\"integration\"}"}
``` python
SELECT * FROM companies
LIMIT 5;
```

::: {.output .execute_result execution_count="6"}
``` json
{"table":{"data":[{"city":"Duderstadt","company":"Otto Bock HealthCare","company_id":189,"continent":"Europe","country":"Germany","index":0},{"city":"","company":"Matrixport","company_id":848,"continent":"Asia","country":"Singapore","index":1},{"city":"Santa Clara","company":"Cloudinary","company_id":556,"continent":"North America","country":"United States","index":2},{"city":"Bellingham","company":"PLACE","company_id":999,"continent":"North America","country":"United States","index":3},{"city":"New York","company":"candy.com","company_id":396,"continent":"North America","country":"United States","index":4}],"schema":{"fields":[{"name":"index","type":"integer"},{"name":"company_id","type":"integer"},{"name":"company","type":"string"},{"name":"city","type":"string"},{"name":"country","type":"string"},{"name":"continent","type":"string"}],"pandas_version":"1.4.0","primaryKey":["index"]}},"total_rows":5,"truncation_type":null}
```
:::
:::

::: {#aac7fe37-87fd-425b-99ff-436903108004 .cell .markdown}
# Tasks

-   Identify the three best-performing industries based on the number of
    new unicorns created over the last three years (2019, 2020,
    and 2021) combined.
-   Write a query to return the industry, the year, and the number of
    companies in these industries that became unicorns each year in
    2019, 2020, and 2021, along with the average valuation per industry
    per year, converted to billions of dollars and rounded to two
    decimal places!
-   Display the result by industry, then the year in descending order.

The final output of the query will look like this: `<br/>`{=html}

[Expected result]{.image .placeholder
original-image-src="expected_result.png" original-image-title=""}

`<br/>`{=html} Where industry1, industry2, and industry3 are the three
top-performing industries.
:::

::: {#5e2f7eee-e958-402e-8edf-977fdaf46ee0 .cell .markdown}
# The Final Query & Result {#the-final-query--result}
:::

::: {#61b12278-b723-451b-85fb-368775972e4e .cell .code execution_count="8" customType="sql" dataFrameVariableName="df1" executionTime="1754" lastSuccessfullyExecutedCode="SELECT
	i.industry,
	EXTRACT (YEAR FROM d.date_joined) AS year,
	COUNT(c.company_id) AS num_unicorns,
	ROUND(AVG(f.valuation/1000000000), 2) AS average_valuation_billions
FROM companies c
	-- inner join companies with industries, dates and funding table
	INNER JOIN industries i USING(company_id)
	INNER JOIN dates d USING(company_id)
	INNER JOIN funding f USING(company_id)
WHERE
	-- exctract the year from d.date_joined, then filter the years 2019 - 2021
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
" sqlSource="{\"integrationId\":\"89e17161-a224-4a8a-846b-0adc0fe7a4b1\",\"type\":\"integration\"}"}
``` python
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
```

::: {.output .execute_result execution_count="8"}
``` json
{"table":{"data":[{"average_valuation_billions":2.47,"index":0,"industry":"E-commerce & direct-to-consumer","num_unicorns":47,"year":2021},{"average_valuation_billions":4,"index":1,"industry":"E-commerce & direct-to-consumer","num_unicorns":16,"year":2020},{"average_valuation_billions":2.58,"index":2,"industry":"E-commerce & direct-to-consumer","num_unicorns":12,"year":2019},{"average_valuation_billions":2.75,"index":3,"industry":"Fintech","num_unicorns":138,"year":2021},{"average_valuation_billions":4.33,"index":4,"industry":"Fintech","num_unicorns":15,"year":2020},{"average_valuation_billions":6.8,"index":5,"industry":"Fintech","num_unicorns":20,"year":2019},{"average_valuation_billions":2.15,"index":6,"industry":"Internet software & services","num_unicorns":119,"year":2021},{"average_valuation_billions":4.35,"index":7,"industry":"Internet software & services","num_unicorns":20,"year":2020},{"average_valuation_billions":4.23,"index":8,"industry":"Internet software & services","num_unicorns":13,"year":2019}],"schema":{"fields":[{"name":"index","type":"integer"},{"name":"industry","type":"string"},{"name":"year","type":"integer"},{"name":"num_unicorns","type":"integer"},{"name":"average_valuation_billions","type":"number"}],"pandas_version":"1.4.0","primaryKey":["index"]}},"total_rows":9,"truncation_type":null}
```
:::
:::

::: {#5f1bed25-93ca-4f1f-9199-cbda3c666151 .cell .markdown}
Thank you, and check out my other portfolio posts.
:::
