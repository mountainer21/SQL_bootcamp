SELECT person.name AS person_name1,
	   temp.name AS person_name2,
	   person.address AS common_address
FROM person
JOIN person AS temp
ON person.address = temp.address
WHERE person.id > temp.id
ORDER BY 1, 2, 3;