# global-health-sustainability-analysis

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

Top 5 countries for healthcare quality:
- San Marino
- Japan
- Switzerland
- Spain
- Singapore

Bottom 5 countries for healthcare quality:
- Central African Republic
- Lesotho
- Chad
- Nigeria
- Sierra Leone 

#### Comments:
The countries with the highest life expectancy values seem to be dominated by ‘small’ countries, for example San Marino, Switzerland, and Singapore. However, two of the five countries can be considered pretty extended, this is the case of Spain, and Japan.

**Interesting follow-up question:**At this point, an interesting follow-up question could be: Does the extent of the country (in Km^2) has something to do with the life expectancy levels? Is there a correlation? What about the size of the population?

On the countries with the lowest life expectancy standards, not surprisingly, are all located in Africa, suggesting that the health levels within this continent are way below the standard. 


### Question #2: Do these countries maintain their 5 best/worst positions when the healthcare indicator changes?
With the second question, I wanted to check whether changing the public health indicator from _life expectancy_ to _infant mortality_ would result in the same rankings for the countries with the highest and lowest healthcare standards.

**What is the purpose of this analysis?** 
The question behind this analysis was whether _life expectancy_ is truly a good metric for measuring the overall quality of healthcare across countries. In fact, a good general healthcare indicator should remain relatively consistent across metrics related to the health levels of citizens. The indicator I chose is _infant mortality_, which refers to the number of children who die within the first year of life per 1,000 births.

The queries used to investigate this question are available in the**query_question_2.sql** file.

5 countries with the highest _infant mortality_ rates:
- Central African Republic
- Sierra Leone
- Somalia
- Nigeria
- Chad

5 countries with the lowest _infant mortality_ rates:
- Finland
- Iceland
- San Marino
- Slovenia 
- Japan

#### Comments:
Interestingly, among the countries with the lowest infant mortality rate in the first year of life are San Marino and Japan, which also appeared in the ranking of the 5 countries with the highest life expectancy. Finland and Iceland are two other countries present in the result of this last query, along with, surprisingly, Slovenia.

In the ranking derived from this query, 4 out of 5 countries are also part of the list of countries with the lowest life expectancy. This result is highly informative, as it suggests a relationship between life expectancy and infant mortality. It’s not surprising to think that in a country with low life expectancy — meaning (according to our interpretation of this value) a low overall healthcare level — the proportion of infants who do not survive their first year of life would be high.


### Question #3: Is there a relationship between healthcare levels and economic prosperity indicators?
With this question, I aimed to investigate whether there is a relationship between healthcare levels, represented by _life expectancy_, and the _GDP_ of countries around the world. This question arose from my belief that countries with the lowest healthcare levels are also the poorest.

I structured this analysis to test my hypothesis, focusing only on the 5 countries with the lowest healthcare levels. To find an answer, I decided to calculate the percentile associated with each of the countries among the 5 with the lowest life expectancy values.

**Note:** The percentile calculation was done by sorting the data in ascending order, with the poorest countries (those with the lowest GDP) corresponding to percentiles closest to 0.

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

