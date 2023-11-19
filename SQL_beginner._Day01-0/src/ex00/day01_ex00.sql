SELECT id AS object_id, name AS object_name
from person 
UNION ALL 
SELECT id, pizza_name 
FROM menu
order by 1,2;