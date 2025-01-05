# Global-Health-Sustainability-Analysis

## Phases of the project
The process of completing this project can be broken down into three main steps:  
- Cleaning the data  
- Building and populating the tables  
- Analyzing the data

## Phase #1: Cleaning the data
In the first phase, I selected the datasets I considered useful for answering my questions. Then, using Excel, I verified the accuracy of the data, adjusted its format, and standardized the headers to make them easily readable by the DBMS. Finally, I ensured that essential columns, such as identifiers and IDs, were included.

## Phase #2: Building and populating the tables
For this project, I selected 4 different datasets:
- **Country Codes Alpha-2 & Alpha-3**: this table contains numeric and letter-based codes identifying each country.
- **Global Country Information Dataset 2023**: this dataset holds demographic and geographic information, statistics regarding the economy, population, sustainability attitude, and more.
- **World Cities Air Quality and Water Pollution**: this dataset has data on the quality of air and the level of water pollution in each country.
-**Global Data on Sustainable Energy (2000-2020)**: this dataset contains various statistics, most of them related to sustainability, for each country from 2000 to 2020.

To upload the datasets into the DBMS, I first had to create tables with the same characteristics as the datasets. The queries that I used to create the tables can be found in the **create_tables.sql** file.

## Phase #3: Data analysis
To better illustrate the data analysis process I've decided to introduce the question and then describee the results and the insights gained.

### Question #1: Which countries are the best and worst ranked in terms of healthcare (top/bottom 5 countries)?
The queries used to investigate this question are listed in the **query_question_1.sql** file.

**Top 5 countries for healthcare quality:**
|     country_name     | expected_living_years |     
| ---------------------|:---------------------:|
| San Marino           |                  85.4 |
| Japan                |                  84.2 |
| Switzerland          |                  83.6 |
| Spain                |                  83.3 |
| Singapore            |                  83.1 |


**Bottom 5 countries for healthcare quality:**
|        country_name        | expected_living_years |
| ---------------------------|:---------------------:|
| Central African Republic   |                  52.8 |
| Lesotho                    |                  53.7 |
| Chad                       |                  54   |
| Nigeria                    |                  54.3 |
| Sierra Leone               |                  54.3 |

#### Comments:
The countries with the highest life expectancy values seem to be dominated by ‘small’ countries, for example San Marino, Switzerland, and Singapore. However, two of the five countries can be considered pretty extended, this is the case of Spain, and Japan.

**Interesting follow-up question:** At this point, an interesting follow-up question could be: Does the extent of the country (in Km^2) has something to do with the life expectancy levels? Is there a correlation? What about the size of the population?

On the countries with the lowest life expectancy standards, not surprisingly, are all located in Africa, suggesting that the health levels within this continent are way below the standard. 

<br>

### Question #2: Do these countries maintain their 5 best/worst positions when the healthcare indicator changes?
With the second question, I wanted to check whether changing the public health indicator from _life expectancy_ to _infant mortality_ would result in the same rankings for the countries with the highest and lowest healthcare standards.

**What is the purpose of this analysis?** 
The question behind this analysis was whether _life expectancy_ is truly a good metric for measuring the overall quality of healthcare across countries. In fact, a good general healthcare indicator should remain relatively consistent across metrics related to the health levels of citizens. The indicator I chose is _infant mortality_, which refers to the number of children who die within the first year of life per 1,000 births.

The queries used to investigate this question are available in the **query_question_2.sql** file.

**5 countries with the highest _infant mortality_ rate:**
|        country_name        | infant_mortality_rate |
| ---------------------------|:---------------------:|
| Central African Republic   |                  84.5 |
| Sierra Leone               |                  78.5 |
| Somalia                    |                  76.6 |
| Nigeria                    |                  75.7 |
| Chad                       |                  71.4 |


**5 countries with the lowest _infant mortality_ rate:**
|     country_name     | infant_mortality_rate |
| ---------------------|:---------------------:|
| Finland              |                   1.4 |
| Iceland              |                   1.5 |
| San Marino           |                   1.7 |
| Slovenia             |                   1.7 |
| Japan                |                   1.8 |


#### Comments:
Interestingly, among the countries with the lowest infant mortality rate in the first year of life are San Marino and Japan, which also appeared in the ranking of the 5 countries with the highest life expectancy. Finland and Iceland are two other countries present in the result of this last query, along with, surprisingly, Slovenia.

In the ranking derived from this query, 4 out of 5 countries are also part of the list of countries with the lowest life expectancy. This result is highly informative, as it suggests a relationship between life expectancy and infant mortality. It’s not surprising to think that in a country with low life expectancy — meaning (according to our interpretation of this value) a low overall healthcare level — the proportion of infants who do not survive their first year of life would be high.

<br>

### Question #3: Is there a relationship between healthcare levels and economic prosperity indicators?
With this question, I aimed to investigate whether there is a relationship between healthcare levels, represented by _life expectancy_, and the _GDP_ of countries around the world. This question arose from my belief that countries with the lowest healthcare levels are also the poorest.

I structured this analysis to test my hypothesis, focusing only on the 5 countries with the lowest healthcare levels. To find an answer, I decided to calculate the percentile associated with each of the countries among the 5 with the lowest life expectancy values.

**Note:** The percentile calculation was done by sorting the data in ascending order, with the poorest countries (those with the lowest GDP) corresponding to percentiles closest to 0.

The query used to answer this question can be found in the **query_question_3.sql** file.

Query's output:
|       country_name       | percentile_by_gdp |
| -------------------------|:-----------------:|
| Central African Republic |             13.11 |
| Lesotho                  |             14.21 |
| Sierra Leone             |             16.39 |
| Chad                     |             25.68 |
| Nigeria                  |             85.79 |

#### Comments: 
This analysis reveals a potential relation between health and wealth of countries. In particular, the 5 countries scoring lowest in the life_expectancy metric were also included in the 30% of the distribution with the lowest GDP. An interesting exception is Nigeria. Despite scoring extremely low in our reference health metric, Africa’s most-populated country showcases an outstandingly high GDP. This might reflect that, from an economic standpoint, Nigeria is moving upward, whereas it still has to overcome the burden of low health quality.

<br>

### Question #4: Is there a connection between the air and water quality and life expectancy?
Sticking around healthcare, which can be considered the central theme of this project, I asked myself whether the environment, and more specifically the resources it provides have an impact on the average life expectancy of countries around the world.

In order to answer this question, I've leveraged data from the **World Cities Air Quality and Water Pollution** and **Country Codes Alpha-2 & Alpha-3** datasets. Besides, I've broken the question into two smaller queries:
- What's the average life expectancy among those countries with the highest air and water quality?
- What's the average life expectancy among those countries with the lowest air and water quality?

The query that answers these two questions is illustrated in the **query_question_4.sql** file.

**Note:** while the air quality index goes 0-100 with the highest numbers indicating the better air quality, the water pollution index works the opposite, with the lowest numbers representing a higher water quality (lower presence of pollution).

This note leads us to explaining the threshold I've set to determine the high and low-air and water quality levels. I've decided that air quality levels above 75 correspond to HIGH AIR QUALITY, whereas levels below 25 are deemed LOW AIR QUALITY levels. Contrarily, HIGH WATER QUALITY levels coincide with values below 25, though values above 75 represent LOW WATER QUALITY levels.

**Average life expectancy in countries with LOW air and water quality**: 61.77
**Average life expectancy in countries with HIGH air and water quality**: 77.98

**Comment:** It's clear the presence of a difference between the average life expectancy among countries with different quality of environmental resources, however this isn't enough to confirm our hypothesis. To be sure that the environmental health acutally plays a role in determining the living years of a countries inhabitants we would need to conduct a statistical test to evaluate if the difference is significant.

<br>

### Question #5: Is there a relation between the change in sustainability measures between 2016-2020 and the GDP of countries?
After a fairly comprehensive investigation of healthcare across countries around the world, I wanted to focus on another topic: **sustainable energy**.

Data on countries' sustainable energy production and consumption were taken from the **Global Data on Sustainable Energy (2000-2020)** dataset. In particular, I focused my attention on countries' share of renewable energy over the total energy consumption (_renewable_energy_share_over_total_energy_consumption_). This field can be helpful in understanding **how** and **whether** countries made changes to their energy consumption regimes following the adoption of the UN's 2015 program, _Agenda 2030_.

To investigate the relationship between changes in renewable energy consumption and the GDP of countries on a global scale, I decided to classify each country based on the magnitude of the change (large positive/moderate positive/negative) and then calculate the average GDP for each sustainability category.

The query used to answer this question can be found in the **uery_question_5.sql** file.

**Sustainability class with associated average GDP**
|   sustainability_trend   | average_gdp_dollars |
| -------------------------|:--------------------:|
|     Descrease            |   120153485340    |
|  Moderate improvement    |   975439583699    |
|  Significant improvement |    97559168828    |

**Comment:** This analysis reveals some interesting results. For example, countries with a "moderate improvement" (0–5% increase in the share of renewable energy in total energy consumption between 2016 and 2020) generated a higher average GDP in 2013 compared to the other two sustainability categories. This could imply that countries gradually increasing their use of renewable energy sources tend to have a high or moderate GDP. On the other hand, it is noteworthy that nations in the "significant improvement" category had an average GDP lower than those of the other two categories. This might suggest that prioritizing renewable energy usage could potentially lead to a reduction in a country’s productive efficiency. However, another possible interpretation of this result is that even countries without highly performing economies are capable of making significant shifts toward greater use of renewable resources.

To deepen this analysis, we would need data describing changes in GDP during the 2016–2020 period. Additionally, it would be interesting to study how these figures have evolved from 2020 to the present day.

