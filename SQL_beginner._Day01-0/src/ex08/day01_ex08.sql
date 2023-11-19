SELECT order_date, CONCAT(person.name, ' (Age:', person.age, ')') AS person_information
FROM person
NATURAL JOIN
 (
	 SELECT order_date, person_id AS id
	 FROM person_order
 ) AS person_order
ORDER BY 1, 2;