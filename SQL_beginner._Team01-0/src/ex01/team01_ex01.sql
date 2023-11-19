insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

with past as (select coalesce("user".name, 'not defined') as name, 
			  coalesce(lastname, 'not defined') as lastname, money,
			  nc.name as currency_name, balance.updated, max(currency.updated) as date
from balance
join (select distinct id, name from currency) as nc
on nc.id = balance.currency_id
left join currency
on (currency.id = balance.currency_id
and balance.updated > currency.updated)
left join "user"
on "user".id = balance.user_id
group by 1, 2, 3, 4, 5),

future as (select coalesce("user".name, 'not defined') as name, 
			  coalesce(lastname, 'not defined') as lastname, money,
			  nc.name as currency_name, balance.updated, min(currency.updated) as date
from balance
join (select distinct id, name from currency) as nc
on nc.id = balance.currency_id
left join currency
on (currency.id = balance.currency_id
and balance.updated < currency.updated)
left join "user"
on "user".id = balance.user_id
group by 1, 2, 3, 4, 5),

t1 as 
((select past.name, past.lastname, past.money, past.currency_name, future.date from past
join future
on (future.updated = past.updated 
	and
	future.name = past.name
	and 
	future.lastname = past.lastname
	and
	future.currency_name = past.currency_name
	and past.date is null))
	union
	(select past.name, past.lastname, past.money, past.currency_name, past.date 
	 from past
	 where date is not null))

	select t1.name, t1.lastname, t1.currency_name, (rate_to_usd * t1.money) as currency_in_usd
	from t1
	join currency
	on (currency.name = t1.currency_name
	   and
	   currency.updated = t1.date)
	   order by 1 desc, 2, 3;
