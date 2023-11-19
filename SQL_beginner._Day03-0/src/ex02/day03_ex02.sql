SELECT pizza_name, price, pizzeria.name
FROM menu
LEFT JOIN person_order
ON menu.id = person_order.menu_id
JOIN pizzeria
ON pizzeria.id = menu.pizzeria_id
WHERE menu_id IS NULL
ORDER BY 1, 2;



