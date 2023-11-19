WITH pizzeria_general AS (
    SELECT person_order.person_id, person_order.menu_id, person_order.order_date, 
	person.name, person.gender, pizzeria.name AS pizzeria_name
    FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)
(SELECT pizzeria_name FROM pizzeria_general
EXCEPT
SELECT pizzeria_name FROM pizzeria_general
WHERE gender = 'male')
UNION
(SELECT pizzeria_name FROM pizzeria_general
EXCEPT
SELECT pizzeria_name FROM pizzeria_general
WHERE gender = 'female')
ORDER BY pizzeria_name;





