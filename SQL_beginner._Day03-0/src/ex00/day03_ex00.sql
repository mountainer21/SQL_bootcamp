SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name, person_visits.visit_date
FROM person_visits
JOIN pizzeria
ON pizzeria.id = person_visits.pizzeria_id
JOIN menu
ON menu.pizzeria_id = pizzeria.id
WHERE person_id = '3' AND price BETWEEN 800 AND 1000
ORDER BY  1, 2, 3;

