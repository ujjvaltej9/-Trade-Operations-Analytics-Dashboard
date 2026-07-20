--03_Settlement Analysis
--------------------------------------

SELECT
    Region,
    COUNT(*) AS TotalTrades
FROM TradeOperations
GROUP BY Region
ORDER BY TotalTrades DESC;


SELECT
    Region,
    SUM(Trade_Value_USD) AS TotalTradeValue
FROM TradeOperations
GROUP BY Region
ORDER BY TotalTradeValue DESC;


SELECT
    Asset_Class,
    COUNT(*) AS NumberOfTrades
FROM TradeOperations
GROUP BY Asset_Class
ORDER BY NumberOfTrades DESC;


SELECT
    Asset_Class,
    SUM(Trade_Value_USD) AS TotalValue
FROM TradeOperations
GROUP BY Asset_Class
ORDER BY TotalValue DESC;


SELECT
    Settlement_Status,
    COUNT(*) AS TotalTrades
FROM TradeOperations
GROUP BY Settlement_Status
ORDER BY TotalTrades DESC;


SELECT
    Operations_Team,
    COUNT(*) AS TotalTrades
FROM TradeOperations
GROUP BY Operations_Team
ORDER BY TotalTrades DESC;


SELECT TOP 10
    Trade_ID,
    Region,
    Asset_Class,
    Trade_Value_USD
FROM TradeOperations
ORDER BY Trade_Value_USD DESC;


SELECT
    Asset_Class,
    AVG(Trade_Value_USD) AS AverageTradeValue
FROM TradeOperations
GROUP BY Asset_Class
ORDER BY AverageTradeValue DESC;


SELECT
    Region,
    AVG(Settlement_Time_Hours) AS AvgSettlementTime
FROM TradeOperations
GROUP BY Region
ORDER BY AvgSettlementTime DESC;


