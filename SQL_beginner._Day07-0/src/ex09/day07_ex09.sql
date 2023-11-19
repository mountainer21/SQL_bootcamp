select address, round((MAX(age) - CAST(MIN(age) AS DEC(8, 2)) / MAX(age)), 2) AS formula,
       round(avg(age), 2) as average, ((max(age) - (min(age)/max(age))) > avg(age)) as comprasion
from person
group by address
order by 1;