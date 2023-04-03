-- sales는 일별 매출장부
-- product는 상품id, 상품명, 가격
-- user_table은 유저id, 고객명이 들어있습니다.  

--  Q1. sales 테이블을 출력하는데 위 사진처럼 product 테이블에 있던 상품명, 가격도 함께 출력해봅시다. 
-- ID, 고객번호, 구매날짜, 상품명, 가격
SELECT S.ID, S.고객번호 , S.구매날짜, P.상품명 , P.가격  
FROM SALES S 
INNER JOIN PRODUCT P 
ON S.상품ID = P.ID;

-- 똑같은 결과
SELECT S.ID, S.고객번호 , S.구매날짜, P.상품명 , P.가격  
FROM SALES S , PRODUCT P 
WHERE S.상품ID = P.ID;

SELECT S.ID, S.고객번호 , S.구매날짜, P.상품명 , P.가격  
FROM SALES S 
JOIN PRODUCT P 
ON S.상품ID = P.ID;

-- Q2. sales 테이블을 출력하는데 위 사진처럼 상품명, 가격, 고객명도 함께 출력해봅시다. 
-- ID, 고객번호, 구매날짜, 상품명, 가격, 고객명
SELECT S.ID, S.고객번호 , S.구매날짜 , P.상품명 , P.가격 , UT.고객명  
FROM SALES S 
JOIN PRODUCT P  
ON  P.ID = S.상품ID 
JOIN USER_TABLE UT
ON S.고객번호 = UT.ID
ORDER BY S.ID;

-- Q3. 날짜별 매출 합계를 출력하도록 2번에서 작성한 코드를 업그레이드 해봅시다. 
-- ID, 구매날짜, 일별 합계
SELECT * FROM SALES ;
SELECT S.구매날짜 , SUM(P.가격)
FROM SALES S, PRODUCT P 
WHERE S.상품ID = P.ID
GROUP BY S.구매날짜;
