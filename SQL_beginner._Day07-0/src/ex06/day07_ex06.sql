select pizzeria.name, count(pizzeria.name) as count_of_orders,
       round(avg(price), 2) as average_price, max(price) as max, min(price)
from person_order
join menu
on person_order.menu_id = menu.id
join pizzeria
on menu.pizzeria_id = pizzeria.id
group by pizzeria.name
order by 1;
