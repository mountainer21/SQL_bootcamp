WITH visits AS
(select name, count(name) as count, 'visit' as action_type
from person_visits
join pizzeria
on person_visits.pizzeria_id = pizzeria.id
group by name
order by 2 desc
limit 3)
, orders AS
(select name, count(name) as count, 'order' as action_type
from person_order
join menu
on person_order.menu_id = menu.id
join pizzeria
on pizzeria_id = pizzeria.id
group by pizzeria.name
order by 2 desc
limit 3)

select *
from orders
union all
select *
from visits