# Write your MySQL query statement below

WITH avg_experience AS(
SELECT  p.project_id,
        avg(e.experience_years) as average_years
FROM Project p
JOIN Employee e ON p.employee_id = e.employee_id
Group BY p.project_id
)  
SELECT * FROM avg_experience
