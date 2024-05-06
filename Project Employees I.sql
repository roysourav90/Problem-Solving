# Write your MySQL query statement below

WITH project_employee AS(
SELECT p.project_id,
       e.experience_years
FROM Project p
JOIN Employee e ON p.employee_id = e.employee_id
)
SELECT project_id, 
       ROUND(AVG(experience_years), 2) as average_years
FROM project_employee
GROUP BY project_id
