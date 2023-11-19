CREATE MATERIALIZED VIEW IF NOT EXISTS mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM person_visits
JOIN pizzeria
ON pizzeria.id = person_visits.pizzeria_id
JOIN menu
ON pizzeria.id = menu.pizzeria_id
WHERE visit_date = '2022-01-08' AND price < 800 AND person_id = 9;
