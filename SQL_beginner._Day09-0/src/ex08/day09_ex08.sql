CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
RETURNS TABLE(num integer) AS $$
    WITH RECURSIVE fib_recurs (num1, num2) AS (
        VALUES (0, 1)
        UNION ALL
            SELECT
            GREATEST(num1, num2), num1 + num2
        FROM fib_recurs
            WHERE num2 < pstop
    )
    SELECT num1 FROM fib_recurs;
$$ LANGUAGE sql;

SELECT * from fnc_fibonacci(100);
SELECT * from fnc_fibonacci();
