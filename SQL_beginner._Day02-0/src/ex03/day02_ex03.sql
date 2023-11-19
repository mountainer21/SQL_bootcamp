WITH Missing_date AS 
    (SELECT missing_date::date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
LEFT JOIN (SELECT visit_date FROM person_visits
     WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-10'
     AND person_id = 1 OR person_id = 2) AS  visit_id
ON visit_id.visit_date = missing_date
WHERE visit_id.visit_date is NULL
ORDER BY 1)
SELECT missing_date FROM Missing_date;

