WITH all_union AS (
(select name, count(name) as count
from person_visits
join pizzeria
on person_visits.pizzeria_id = pizzeria.id
group by name
order by 2 desc)
UNION ALL
(select name, count(name)  as count
from person_order
join menu
on person_order.menu_id = menu.id
join pizzeria
on pizzeria_id = pizzeria.id
group by pizzeria.name
order by 2 desc))

select name, sum(count) as total_count
from all_union
GROUP BY name
ORDER BY total_count DESC;

