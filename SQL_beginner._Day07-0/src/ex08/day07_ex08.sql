select address, pizzeria.name, count(pizzeria.name) as count_of_orders
from person
join person_order
on person.id = person_order.person_id
join menu
on person_order.menu_id = menu.id
join pizzeria
on menu.pizzeria_id = pizzeria.id
group by address, pizzeria.name
order by 1, 2;