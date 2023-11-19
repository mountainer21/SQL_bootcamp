#1
SHOW TRANSACTION ISOLATION LEVEL;
#2
SHOW TRANSACTION ISOLATION LEVEL;
#1
begin;
#2
begin;
#1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
#2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
#1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
#2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
#1
commit;
#2
commit;
#1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
#2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';