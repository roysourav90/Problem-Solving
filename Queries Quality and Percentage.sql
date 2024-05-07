WITH Quality_Calculation AS (
    SELECT 
        query_name,
        SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) AS poor_query_count,
        SUM(CAST(rating AS DECIMAL) / position) AS total_quality,
        COUNT(*) AS total_queries
    FROM Queries
    WHERE query_name IS NOT NULL
    GROUP BY query_name
)
SELECT 
    query_name,
    ROUND(total_quality / total_queries, 2) AS quality,
    ROUND((poor_query_count / CAST(total_queries As DECIMAL)) * 100, 2) AS poor_query_percentage
FROM Quality_Calculation;
