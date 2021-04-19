-- 제목 : 중성화 여부 파악하기
SELECT 
    ANIMAL_ID,
    NAME,
    CASE 
          WHEN SEX_UPON_INTAKE LIKE 'Spayed%' THEN 'O' 
          WHEN SEX_UPON_INTAKE LIKE 'Neutered%' THEN 'O'
          ELSE 'X'
    END AS "중성화"
FROM ANIMAL_INS
ORDER BY ANIMAL_ID