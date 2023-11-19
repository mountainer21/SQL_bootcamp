CREATE TABLE IF NOT EXISTS roads (
    node_1 VARCHAR,
    node_2 VARCHAR,
    cost INTEGER
);
INSERT INTO roads (node_1, node_2, cost)
VALUES ('a', 'b', 10),
      ('b', 'a', 10),
      ('a', 'c', 15),
      ('c', 'a', 15),
      ('a', 'd', 20),
      ('d', 'a', 20),
      ('b', 'd', 25),
      ('d', 'b', 25),
      ('d', 'c', 30),
      ('c', 'd', 30),
      ('b', 'c', 35),
      ('c', 'b', 35);

WITH RECURSIVE recurs_list AS
(
     SELECT
        node_1 as tour,
        node_1,
        node_2,
        cost,
        cost AS total_cost
     FROM roads
     WHERE
     node_1 = 'a'

    UNION

    SELECT
        CONCAT (prev.tour, ',' , next.node_1) AS trace,
        next.node_1,
        next.node_2,
        next.cost,
        prev.total_cost + next.cost AS total_cost
    FROM
    roads AS next
        JOIN recurs_list AS prev ON  next.node_1 = prev.node_2
    WHERE tour NOT LIKE CONCAT('%' , next.node_1 , '%')
)
   ,all_traces as
(
    SELECT *
    FROM recurs_list
    WHERE length(tour)= 7 AND node_2 ='a'
)

SELECT total_cost, CONCAT ('{', tour, ',a}') as tour
FROM all_traces
WHERE total_cost= (SELECT min(total_cost) FROM all_traces)
ORDER BY 1,2;
