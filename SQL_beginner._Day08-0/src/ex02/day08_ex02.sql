-- #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- #1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- #1
commit;
-- #2
commit;
-- #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';