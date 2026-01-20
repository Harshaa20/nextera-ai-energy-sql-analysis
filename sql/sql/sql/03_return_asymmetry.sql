/* =========================================================
   QUERY 3: UPSIDE VS DOWNSIDE RETURNS
   =========================================================

   PURPOSE:
   Compare positive and negative return behavior.

   WHY THIS IS NEEDED:
   Infrastructure assets typically show downside protection.

   OUTPUT:
   - Return_Type
   - Avg_Daily_Return
   - Trading_Days
   ========================================================= */

SELECT
    CASE
        WHEN Daily_Return > 0 THEN 'Positive Return Days'
        WHEN Daily_Return < 0 THEN 'Negative Return Days'
    END AS Return_Type,
    AVG(Daily_Return) AS Avg_Daily_Return,
    COUNT(*) AS Trading_Days
FROM test.nextera_daily_returns
WHERE Daily_Return IS NOT NULL
  AND Daily_Return <> 0
GROUP BY Return_Type;
