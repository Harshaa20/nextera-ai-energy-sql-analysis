/* =========================================================
   QUERY 1: DAILY RETURNS CALCULATION
   =========================================================

   PURPOSE:
   Convert raw stock prices into daily percentage returns
   to normalize price changes over time.

   WHY THIS IS NEEDED:
   Raw prices are not comparable across decades.
   Returns reflect relative changes in investor confidence.

   OUTPUT:
   - Date
   - Adj_Close
   - Daily_Return
   ========================================================= */

SELECT
    Date,
    Adj_Close,
    (Adj_Close - LAG(Adj_Close) OVER (ORDER BY Date))
        / LAG(Adj_Close) OVER (ORDER BY Date) AS Daily_Return
FROM test.NEXTera_stocks_data_1973_2026
ORDER BY Date;
