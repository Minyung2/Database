-- 기본 IF 문법
-- IF(조건식 , 참일때 , 거짓일때)
-- IF (1+2=3, 'Correct!', 'Wrong!');
SELECT IF (1+2=3, 'Correct!', 'Wrong!'); -- Correct
SELECT IF (1+2=4, 'Correct!', 'Wrong!'); -- Wrong
-- 김응용
SELECT ename, if(sal>2500, '급여 도둑','노예'),job FROM emp;	

-- IF문의 단점 위처럼 급여도둑, 노예 즉, 2가지 경우만 가능.
/* -> 
*CASE 
*	WHEN CONDITION 
*	THEN RESULT 
*	WHEN.. THEN...~ 
*	ELSE
*END  
* 
*/
SELECT ENAME, 
CASE
	WHEN SAL>=4500 THEN '주급 살인범'
	WHEN SAL>3000 THEN '주급 강도'
	WHEN SAL>1500 THEN '주급 도둑'
	ELSE '거지' 
	END AS '주급 판단기'
FROM EMP;
-- 자바에서 IF ELSE IF ELSE 라고 생각하면 될 것 같다. 마지막에 END로 반드시 마무리!
SELECT * FROM EMP;
SELECT SUM(
CASE
	WHEN SAL>4500 THEN 4
	WHEN SAL>3000 THEN 3
	WHEN SAL>1500 THEN 2
	ELSE 1
END 
) AS '30점 이상이면 회사 망함' FROM EMP;
