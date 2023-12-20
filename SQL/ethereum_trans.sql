-- Adding percent change column
ALTER TABLE ethereum ADD COLUMN daily_percent_change FLOAT;

UPDATE ethereum
SET daily_percent_change = (((close_price - open_price)/close_price) * 100);

-- Adding liquidity ratio column
ALTER TABLE ethereum ADD COLUMN liquidity_ratio FLOAT;

UPDATE ethereum
SET liquidity_ratio  = (volume / marketcap) ;

-- Adding true range
ALTER TABLE ethereum ADD COLUMN true_range FLOAT;

UPDATE ethereum
SET true_range = (daily_high - daily_low);

-- Adding average true range
ALTER TABLE ethereum ADD COLUMN average_true_range FLOAT;

WITH atr_data AS (
	SELECT
		date,
		AVG(true_range) OVER (ORDER BY date) AS atr
		
	FROM
		ethereum
)
UPDATE ethereum
SET average_true_range = atr_data.atr
FROM atr_data
WHERE ethereum.date = atr_data.date;

-- Adding volatility ratio
ALTER TABLE ethereum ADD COLUMN volatility_ratio FLOAT;

UPDATE ethereum
SET volatility_ratio = (true_range / average_true_range);

-- Adding percent change between min and max
ALTER TABLE ethereum ADD COLUMN daily_percent_change_min_max FLOAT;

UPDATE ethereum
SET daily_percent_change_min_max = (((daily_high - daily_low)/daily_high) * 100);

SELECT * FROM ethereum;















