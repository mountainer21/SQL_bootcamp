SELECT temp.name AS pizzeria_name
FROM person_visits
JOIN (SELECT name, pizza_name, pizzeria_id, price
	  FROM pizzeria
	  JOIN menu ON menu.pizzeria_id = pizzeria.id
	  WHERE price < 800) AS temp
ON temp.pizzeria_id = person_visits.pizzeria_id
WHERE visit_date = '2022-01-08' 
AND person_id = 9;




