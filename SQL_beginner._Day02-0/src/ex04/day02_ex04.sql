SELECT pizza_name, name AS pizzeria_name, price
FROM menu
JOIN pizzeria
ON pizzeria.id = menu.pizzeria_id
WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY 1,2;


