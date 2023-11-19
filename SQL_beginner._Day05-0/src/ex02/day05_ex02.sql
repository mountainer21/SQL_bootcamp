CREATE INDEX IF NOT EXISTS idx_person_name ON person (UPPER(name));

SET enable_seqscan  = off;
EXPLAIN ANALYSE
SELECT UPPER(name)
FROM person
WHERE UPPER(name) = 'NATALY';