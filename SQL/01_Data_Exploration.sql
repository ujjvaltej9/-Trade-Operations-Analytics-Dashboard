-- ======================================================
-- 01. DATA EXPLORATION
-- ======================================================

-- 1. Total Number of Trades
-------------------------------------------------------
SELECT COUNT(*) AS TotalTrades
FROM TradeOperations;
GO


-- 2. Total Trade Value
-------------------------------------------------------

SELECT
SUM(Trade_Value_USD) AS TotalTradeValue
FROM TradeOperations;
GO


-- 3. Average Trade Value
-------------------------------------------------------

SELECT
AVG(Trade_Value_USD) AS AverageTradeValue
FROM TradeOperations;
GO

