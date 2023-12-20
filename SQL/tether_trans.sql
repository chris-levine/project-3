-- Adding percent change column
ALTER TABLE tether ADD COLUMN daily_percent_change FLOAT;

UPDATE tether
SET daily_percent_change = (((close_price - open_price)/close_price) * 100);

-- Adding liquidity ratio column
ALTER TABLE tether ADD COLUMN liquidity_ratio FLOAT;

UPDATE tether
SET liquidity_ratio  = (volume / marketcap) ;

-- Adding true range
ALTER TABLE tether ADD COLUMN true_range FLOAT;

UPDATE tether
SET true_range = (daily_high - daily_low);

-- Adding average true range
ALTER TABLE tether ADD COLUMN average_true_range FLOAT;

WITH atr_data AS (
	SELECT
		date,
		AVG(true_range) OVER (ORDER BY date) AS atr
		
	FROM
		tether
)
UPDATE tether
SET average_true_range = atr_data.atr
FROM atr_data
WHERE tether.date = atr_data.date;

-- Adding volatility ratio
ALTER TABLE tether ADD COLUMN volatility_ratio FLOAT;

UPDATE tether
SET volatility_ratio = (true_range / average_true_range);

-- Adding percent change between min and max
ALTER TABLE tether ADD COLUMN daily_percent_change_min_max FLOAT;

UPDATE tether
SET daily_percent_change_min_max = (((daily_high - daily_low)/daily_high) * 100);

SELECT * FROM tether;















