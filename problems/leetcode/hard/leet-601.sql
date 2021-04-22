-- 제목 : Human Traffic of Stadium
SELECT 
     id, 
     TO_CHAR(visit_date,'YYYY-MM-DD') AS visit_date, 
     people
FROM (
    SELECT 
        id, visit_date,people,
        LAG(people,2)OVER (ORDER BY id) AS lag_2,
        LAG(people,1)OVER (ORDER BY id) AS lag_1,
        LEAD(people,1) OVER (ORDER BY id) AS lead_1,
        LEAD(people,2) OVER (ORDER BY id) AS lead_2
    FROM stadium
)
WHERE
    (people >= 100 AND lead_1 >= 100 AND lead_2 >= 100)
    OR (people>= 100 AND lead_1 >= 100 AND lag_1 >= 100)
    OR (people >= 100 AND lag_1 >= 100 AND lag_2 >= 100)