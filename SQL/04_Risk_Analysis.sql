--04_ Risk Analysis
-------------------------------------------
SELECT
    Risk_Rating,
    COUNT(*) AS TotalTrades,
    AVG(Trade_Value_USD) AS AverageTradeValue
FROM TradeOperations
GROUP BY Risk_Rating
ORDER BY AverageTradeValue DESC;