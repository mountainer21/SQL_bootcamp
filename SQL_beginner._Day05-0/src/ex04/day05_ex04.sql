CREATE UNIQUE INDEX if not exists idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET enable_seqscan = off;
EXPLAIN ANALYSE
    SELECT pizzeria_id, pizza_name
    FROM menu
    ORDER BY pizzeria_id, pizza_name;