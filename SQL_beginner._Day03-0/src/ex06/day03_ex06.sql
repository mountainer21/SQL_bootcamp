SELECT
    menu_1.pizza_name,
    pizzeria_1.name AS pizzeria_name_1,
    pizzeria_2.name AS pizzeria_name_2,
    menu_1.price
FROM menu AS menu_1
JOIN menu AS menu_2
ON menu_1.price = menu_2.price
JOIN pizzeria AS pizzeria_1
ON menu_1.pizzeria_id = pizzeria_1.id
JOIN pizzeria AS pizzeria_2
ON menu_2.pizzeria_id = pizzeria_2.id
WHERE menu_1.id > menu_2.id
AND menu_1.pizza_name = menu_2.pizza_name
ORDER BY pizza_name;


