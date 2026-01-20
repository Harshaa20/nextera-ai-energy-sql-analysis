/* =========================================================
   QUERY 2: 30-DAY ROLLING VOLATILITY
   =========================================================

   PURPOSE:
   Measure how market-perceived risk changes over time.

   WHY THIS IS NEEDED:
   Volatility is a proxy for investor uncertainty.
   Rolling windows reveal structural risk shifts.

   OUTPUT:
   - Date
   - Daily_Return
   - Rolling_30D_Volatility
   ========================================================= */

SELECT
    Date,
    Daily_Return,
    STDDEV(Daily_Return) OVER (
        ORDER BY Date
        ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
    ) AS Rolling_30D_Volatility
FROM test.nextera_daily_returns
WHERE Daily_Return IS NOT NULL
ORDER BY Date;
