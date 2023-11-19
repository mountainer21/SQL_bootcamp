WITH t1 AS (select name, count(name) as count_of_visits
from person_visits
join person
on person.id = person_visits.person_id
group by name)

select *
from t1
where count_of_visits > 3