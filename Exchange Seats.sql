
WITH SwappedSeats AS(
    SELECT
        CASE
            WHEN id % 2 = 1 AND id + 1 <= (SELECT MAX(id) FROM Seat) THEN id + 1
            WHEN id % 2 = 0 THEN id - 1
            Else id
        END AS id,
        student
    FROM Seat
)
SELECT id, student
FROM SwappedSeats
ORDER BY id
