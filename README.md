# Project 3: Data Engineering with Cryptocurrency Data
Lucas Monaco, Christopher Levine, Abel Zemo, Janki Patel, Mark Habeb

### Overview
For this project we chose the data engineering track, using 6 csv's of data about different cryptocurrencies. First reading them into SQL, performing transformations in SQL, then using SQLalchemy to read the SQL tables into Pandas dataframes, checking the data in the dataframes using data validation, and finally creating several visualizations using the cleaned and updated data. <br>
Data source: https://www.kaggle.com/datasets/sudalairajkumar/cryptocurrencypricehistory?select=coin_Bitcoin.csv <br>
The data was split across multiple csv files, each with information on a different cryptocurrency. All of the csv files had the same columns:
* Name: the name of the coin
* Symbol: the symbol of the coin
* Date: the date and time
* Open: the open price on the given day
* Close: the close price on the given day
* High: the highest price on the given day
* Low: the lowest price on the given day
* Volume: the volume of transactions on the given day
* Marketcap: the market capitalization in USD
<br>Where each row corresponds to a particular date. The range of dates across the 6 tables are different, since the different coins were first introduced on different dates.
<br> the data source had more than 20 csv's available, we chose 6 to use a managable amount of data: Bitcoin, Cardano, Dogecoin, Ethereum, Tether, and XRP.

## SQL
The csv's were first read into SQL, using schema which defined the name and symbol columns and character varying variables, the date as timestamp, and the rest of the columns as floating point numbers. Some columns were renamed here to have more descriptive or understandable names; "open" and "close" became "open_price" and "close_price", and "high" and "low" became "daily_high" and "daily_low". SQL was chosen because we wanted access to multiple tables, and the csv's all had data structured easily with rows and columns, making SQL's database an ideal fit. <br> 
Then new columns were created in each table, calculating useful values based on the columns already in the tables:
* daily percent change: calculated using open and close price, this shows the change in open and close price for a given day
* liquidity ratio: calculated using the volume and marketcap, this shows how much of the currency was being spent / was "liquid" on a given day
* true range: calculated using daily high and low, this shows the difference between high and low price for each day
* average true range: calculated using true range, this is in turn used to calculate volatility
* volatility ratio: calculated using true range and average true range, this shows how volatile the currency was on a particular day was relative to the average volatility (meaning difference in price between open and close on a partiuclar date)

## SQL alchemy
The tables were then read into Pandas dataframes using SQLalchemy. Due to the way the engine is created connecting to a single table at a time, this was done separately for each coin (since each have their own table in the SQL database) then exported to new csv files which have the transformations and new column names as performed in SQL. These new csv's were then used to merge into one Pandas dataframe containing information on all the coins, which used a combination of name and date to identify unique rows (so there were multiple rows for each date, with each coin having a row for each date it existed). 

## Pandera: data validation
This merged dataframe was checked for any problems in the data using data validation library Pandera: all columns checked for null values, the name and symbol columns checked that all strings were only within the list of values we expected (the names or symbols of the coins we intended to read in, no misspellings or empty strings), and name and date columns together served as unique identifiers for each row. No errors or otherwise unexpected data was turned up when these checks were performed.

## Visualizations
The merged dataframe was used for two visualizations: marketcap graphed against close price in a bubble chart, where the size and volume of the bubble was determined by volume, and a bar chart with close price on the x axis and showing both daily percent change and close price on the y axis. <br>
There were also visualizations performed using the individual tables that had been saved out to csv's with the transformations: the first shows the distribution over time of the close price for the coin, the second is a histogram showing the frequency of different closing prices for that coin, which for all coins show that despite the several very high peaks, the most common closing price by far was very close to 0 USD, and third is a graph showing the distribution over time of the marketcap of bitcoin, showing a very similar distribution to the close price for most coins. <br>
These three graphs were generated for all 6 coins, showing that most coins had a similar distribution of close price and marketcap over time, with a large spike around dates in 2021. the two exceptions are XRP and Tether; XRP had a larger spike in 2018 and a smaller spike in 2021, and Tether has a completely different shape of distribution of close price over time since it was intended to function with a value matched to the US Dollar, so it has very little variation above or below 1 USD, and the marketcap therefore increases over time presumably due to more Tether coin being created, since the price was so unchanging.

## Ethics
This data was sourced completely ethically, as it is all publicly available information on the prices of different cryptocurrencies. Specifically, the data was found on kaggle and the link is credited above. Moreover, this is information which is not just publicly available but is intended for people to know and share, so there is no ethical concern in using it: the price of cryptocurrencies is not information that needs to be private for any reason that we can think of, so examining these numbers has no particular ethical concern. 


