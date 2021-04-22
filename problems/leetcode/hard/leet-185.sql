-- 제목 : Department Top Three Salaries
SELECT 
    d_name AS Department,
    e_name AS Employee,
    e_salary AS Salary
FROM (
    SELECT 
        d.name AS d_name,
        e.name AS e_name,
        e.salary AS e_salary,
        DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS rank
    FROM employee e
    INNER JOIN department d on e.departmentid = d.id 
    ) sub
WHERE sub.rank <=3 