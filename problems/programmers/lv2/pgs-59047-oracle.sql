-- 제목 : 이름에 el이 들어가는 동물 찾기
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE 
    ANIMAL_TYPE = 'Dog'
    AND ( NAME LIKE '%el%'
    OR NAME LIKE '%eL%'
    OR NAME LIKE '%EL%'
    OR NAME LIKE '%El%'
    ) 
ORDER BY NAME