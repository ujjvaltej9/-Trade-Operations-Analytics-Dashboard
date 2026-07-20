-- ==========================================
-- 05. ADVANCED SQL
-- ==========================================


--------------------------------------------------------
-- 1. Top 10 Highest Value Trades
--------------------------------------------------------

SELECT TOP 10
    Trade_ID,
    Region,
    Asset_Class,
    Trade_Value_USD
FROM TradeOperations
ORDER BY Trade_Value_USD DESC;
GO


--------------------------------------------------------
-- 2. Rank Trades Within Each Region
--------------------------------------------------------

SELECT
    Trade_ID,
    Region,
    Asset_Class,
    Trade_Value_USD,

    RANK() OVER
    (
        PARTITION BY Region
        ORDER BY Trade_Value_USD DESC
    ) AS RegionalRank

FROM TradeOperations;
GO


--------------------------------------------------------
-- 3. Highest Trade in Every Region
--------------------------------------------------------

WITH RankedTrades AS
(
    SELECT
        Trade_ID,
        Region,
        Asset_Class,
        Trade_Value_USD,

        RANK() OVER
        (
            PARTITION BY Region
            ORDER BY Trade_Value_USD DESC
        ) AS RegionalRank

    FROM TradeOperations
)

SELECT *
FROM RankedTrades
WHERE RegionalRank = 1;
GO


--------------------------------------------------------
-- 4. Compare Trade Value to Overall Average
--------------------------------------------------------

SELECT
    Trade_ID,
    Asset_Class,
    Trade_Value_USD,

    CASE
        WHEN Trade_Value_USD >
            (
                SELECT AVG(Trade_Value_USD)
                FROM TradeOperations
            )
        THEN 'Above Average'

        ELSE 'Below Average'

    END AS TradeCategory

FROM TradeOperations;
GO


--------------------------------------------------------
-- 5. Running Total of Trade Value
--------------------------------------------------------

SELECT
    Trade_Date,
    Trade_ID,
    Trade_Value_USD,

    SUM(Trade_Value_USD)
    OVER
    (
        ORDER BY Trade_Date
    ) AS RunningTotal

FROM TradeOperations
ORDER BY Trade_Date;
GO


--------------------------------------------------------
-- 6. Region Contribution Percentage
--------------------------------------------------------

SELECT
    Region,

    SUM(Trade_Value_USD) AS RegionValue,

    ROUND
    (
        SUM(Trade_Value_USD) * 100.0 /
        (
            SELECT SUM(Trade_Value_USD)
            FROM TradeOperations
        ),
        2
    ) AS PercentageContribution

FROM TradeOperations

GROUP BY Region

ORDER BY PercentageContribution DESC;
GO