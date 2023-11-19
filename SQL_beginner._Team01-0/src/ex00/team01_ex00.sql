with max_cur as (
select *
from currency
order by updated DESC
limit 3),
t1 as (
select COALESCE("user".name, 'not defined') as name,
       COALESCE("user".lastname, 'not defined') as lastname,
       type,
       money as volume,
       COALESCE(max_cur.name, 'not defined') as currency_name,
       COALESCE(max_cur.rate_to_usd, 1) as last_rate_to_usd
from balance
left join max_cur
on balance.currency_id = max_cur.id
left join "user" on balance.user_id = "user".id
)
select name, lastname, type, sum(volume) as volume,
       currency_name, last_rate_to_usd, sum(volume * last_rate_to_usd) as total_volume_in_usd
from t1
group by 1, 2, 3, 5, 6
order by 1 desc, 2, 3;
