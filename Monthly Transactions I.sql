WITH transaction_summary AS(
    SELECT 
        SUBSTR(trans_date, 1, 7) AS month,
        country,
        COUNT(id) as trans_count,
        SUM(case when state = 'approved' THEN 1 ELSE 0 END) as approved_count,
        SUM(amount) as trans_total_amount,
        SUM(case when state = 'approved' THEN amount ELSE 0 END) as approved_total_amount
    FROM Transactions
    GROUP BY 
        SUBSTR(trans_date, 1, 7), country
)
SELECT 
        month,
        country,
        trans_count,
        approved_count,
        trans_total_amount,
        approved_total_amount
        
FROM transaction_summary
