-- ==========================================
-- 02. BUSINESS ANALYSIS
-- ==========================================
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