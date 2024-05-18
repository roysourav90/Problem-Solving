WITH FIRSTLogins AS(
    SELECT player_id, MIN(event_date) AS first_login
    FROM
    Activity
    GROUP BY player_id
),
NextDayLogins AS (
    SELECT DISTINCT a.player_id
    FROM Activity a
    JOIN FIRSTLogins as f1 ON a.player_id = f1.player_id
    WHERE a.event_date = DATE_ADD(f1.first_login, INTERVAL 1 DAY)
)
SELECT
    ROUND(COUNT(DISTINCT NextDayLogins.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) as fraction
FROM 
    NextDayLogins
