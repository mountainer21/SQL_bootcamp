((SELECT pizzeria.name
FROM pizzeria
JOIN person_visits
ON pizzeria.id = person_visits.pizzeria_id
JOIN person
ON person.id = person_visits.person_id
WHERE person.gender = 'female')
EXCEPT ALL
(SELECT pizzeria.name
FROM pizzeria
JOIN person_visits
ON pizzeria.id = person_visits.pizzeria_id
JOIN person
ON person.id = person_visits.person_id
WHERE person.gender = 'male'))
UNION ALL
((SELECT pizzeria.name
FROM pizzeria
JOIN person_visits
ON pizzeria.id = person_visits.pizzeria_id
JOIN person
ON person.id = person_visits.person_id
WHERE person.gender = 'male')
EXCEPT ALL
(SELECT pizzeria.name
FROM pizzeria
JOIN person_visits
ON pizzeria.id = person_visits.pizzeria_id
JOIN person
ON person.id = person_visits.person_id
WHERE person.gender = 'female'))
order by 1;





