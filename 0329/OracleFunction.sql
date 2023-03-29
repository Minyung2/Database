/*  CHAR FUNCTION
    UPPER LOWER INITCAP
*/
SELECT ENAME,UPPER(ENAME),LOWER(ENAME),INITCAP(ENAME)
FROM EMP;

SELECT * FROM EMP WHERE LOWER(ENAME)='james';

SELECT ENAME,LENGTH(ENAME),SAL,LENGTH(SAL)
    ,LENGTH('한글'),LENGTHB('한글')
FROM EMP;

SELECT JOB,SUBSTR(JOB,1,2),SUBSTR(JOB,3,2),SUBSTR(JOB,5)
    ,SUBSTR(JOB,-LENGTH(JOB)),SUBSTR(JOB,-LENGTH(JOB),2)
    ,SUBSTR(JOB,-3)
FROM EMP;

SELECT INSTR('HELLO, ORACLE','L') INS1
    ,INSTR('HELLO, ORACLE','L',5) INS2
    ,INSTR('HELLO, ORACLE','L',2,2) INS3
FROM DUAL;

SELECT JOB,INSTR(JOB,'A',1,2)
FROM EMP
WHERE INSTR(JOB,'A')>0;

SELECT JOB,INSTR(JOB,'A',1,2)
FROM EMP
WHERE JOB LIKE '%A%';

SELECT '010-1234-1234' AS ORIGIN
    ,REPLACE('010-1234-4567','-',' ')AS RE1
    ,REPLACE('010-1234-4567','-')AS RE2
FROM DUAL;

SELECT 'Oracle'
    ,LPAD('oracle',10,'#')AS LPAD1
    ,RPAD('Oracle',10,'#')AS RPAD1
    ,LPAD('oracle',10)AS LPAD2
    ,RPAD('Oracle',10)AS RPAD2
FROM DUAL;

SELECT '011230-3122332' AS ORI
    ,RPAD(SUBSTR('011230-3122332',1,7),14,'*')AS BLOCK
    ,CONCAT(SUBSTR('011230-3122332',1,7),'*******') AS CON
    ,'SDFASDF'||'SDFASDF'||'ASDFASDF'||'ASDFASDF' AS EN
FROM DUAL;

SELECT '['||TRIM('    ^ ORA CLE ^     ')||']' AS TRIM
    ,'['||TRIM(LEADING FROM'    Ora cle     ')||']' AS TLEAD
    ,'['||TRIM(TRAILING FROM'    Ora cle     ')||']' AS TTRAIL
    ,'['||TRIM(BOTH FROM'    Ora cle     ')||']' AS TBOTH
FROM DUAL;
SELECT '['||TRIM('^'FROM'^^ ^ ORA CLE ^  ^^')||']' AS TRIM
    ,'['||TRIM(LEADING '^' FROM'^^  Ora cle   ^^')||']' AS TLEAD
    ,'['||TRIM(TRAILING '^' FROM'^^  Ora cle   ^^')||']' AS TTRAIL
    ,'['||TRIM(BOTH '^' FROM'^^  Ora cle   ^^')||']' AS TBOTH
FROM DUAL;
SELECT '['||TRIM(' ^ORACLE^ ')||']' AS TRIM
    ,'['||LTRIM(' ^ORACLE^ ')||']' AS LTRIM
    ,'['||LTRIM(' <^ORACLE^> ','^< ')||']' AS LTRIM2
    ,'['||RTRIM(' ^ORACLE^ ')||']' AS RTRIM
    ,'['||RTRIM(' <^ORACLE^> ','>^ ')||']' AS RTRIM2
FROM DUAL;
/*NUMBER FUNCTION*/
SELECT ROUND(1234.5648) AS R
    ,ROUND(1234.4567,2) AS R1
    ,ROUND(1234.4567,-2) AS R2
FROM DUAL;
SELECT TRUNC(1234.5345) AS R
    ,TRUNC(1234.5678,2) AS R1
FROM DUAL;
SELECT CEIL(3.14)
    ,FLOOR(3.14)
    ,CEIL(-3.14)
    ,FLOOR(-3.14)
FROM DUAL;
SELECT MOD(15,6),MOD(10,2),MOD(11,2) FROM DUAL;--%
/*DATE FUNCTION*/
SELECT SYSDATE AS NOW
    ,SYSDATE-1 AS YESTERDAY
    ,SYSDATE+1 AS TOMORROW
    ,(SELECT HIREDATE FROM EMP WHERE EMPNO=7934)
    -(SELECT HIREDATE FROM EMP WHERE EMPNO=7902) AS DIFF
FROM DUAL;
SELECT SYSDATE
    ,ADD_MONTHS(SYSDATE,3)
FROM DUAL;
SELECT EMPNO,ENAME,HIREDATE,
    ADD_MONTHS(HIREDATE,120) AS WORK10YEAR
FROM EMP;
SELECT EMPNO,ENAME,HIREDATE
FROM EMP
WHERE ADD_MONTHS(HIREDATE,384)> SYSDATE;

SELECT EMPNO,ENAME,HIREDATE,SYSDATE
    ,MONTHS_BETWEEN(HIREDATE,SYSDATE) AS MONTHS1
    ,MONTHS_BETWEEN(SYSDATE,HIREDATE) AS MONTHS2
    ,TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS MONTHS3
FROM EMP;

SELECT SYSDATE,
    NEXT_DAY(SYSDATE,1),
    LAST_DAY(SYSDATE)
FROM DUAL;

SELECT SYSDATE,
    ROUND(SYSDATE,'YYYY') AS FROMAT_YYYY,
    ROUND(SYSDATE,'DDD') AS FROMAT_DDD,
    ROUND(SYSDATE,'HH') AS FROMAT_HH,
    ROUND(SYSDATE,'MM') AS FROMAT_MM,
    TRUNC(SYSDATE,'MM') AS FROMAT_MM2
FROM DUAL;
/*TYPE CONVERSION*/
DESC EMP;
SELECT EMPNO,ENAME
    ,EMPNO+'500'
    --,EMPNO+'ABCD'
    ,ENAME||'SDKJF'
    ,ENAME||500
FROM EMP;

SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS') AS NOW
FROM DUAL;

SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'MM') AS MM,
    TO_CHAR(SYSDATE,'MON','NLS_DATE_LANGUAGE=KOREAN') AS MON_KOR,
    TO_CHAR(SYSDATE,'MON','NLS_DATE_LANGUAGE=ENGLISH') AS MON_ENG,
    TO_CHAR(SYSDATE,'MONTH','NLS_DATE_LANGUAGE=KOREAN') AS MONTH_KOR,
    TO_CHAR(SYSDATE,'MONTH','NLS_DATE_LANGUAGE=ENGLISH') AS MONTH_ENG,
    TO_CHAR(SYSDATE,'DAY') AS DAY,
    TO_CHAR(SYSDATE,'DAY','NLS_DATE_LANGUAGE=ENGLISH') AS DAY_ENG    
FROM DUAL;

/* 숫자 표기 양식 9 숫자 한자리 0 빈자리에 채움 L 지역 단위 */
SELECT SAL,
       TO_CHAR(SAL, '$999,999') AS SAL_$,
       TO_CHAR(SAL, 'L999,999') AS SAL_L,
       TO_CHAR(SAL, '999,999.00') AS SAL_1,
       TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
       TO_CHAR(SAL, '000999999.99') AS SAL_3,
       TO_CHAR(SAL, '999,999,00') AS SAL_4
FROM EMP;
SELECT TO_NUMBER('1,300','999,999')-TO_NUMBER('1,500','999,999')
FROM DUAL;

SELECT TO_DATE('2018-07-14','YYYY-MM-DD') AS TODATE
    ,TO_DATE('20180714','YYYY-MM-DD') AS TODATE2
FROM DUAL;

SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE('06/01/1981','MM/DD/YYYY');

/*NULL FUNCTION NVL NVL2 COALESCE */
SELECT EMPNO,ENAME,SAL,COMM
    ,SAL+COMM AS PAY
    ,NVL(COMM,0)
    ,SAL+NVL(COMM,0)
    ,NVL2(COMM,'O','X')
    ,NVL2(COMM,SAL*12+COMM,SAL*12) AS ANNSAL
FROM EMP;

/*CONDITION FUNCTION*/
SELECT EMPNO,ENAME,JOB,SAL,COMM
    ,CASE
        WHEN JOB='MANAGER' THEN SAL*1.1
        WHEN JOB='SALESMAN' THEN SAL*1.05
        WHEN JOB='ANALYST' THEN SAL
        ELSE SAL*1.03
    END AS UPSAL
    ,CASE
        WHEN COMM IS NULL THEN '해당없음'
        WHEN COMM=0 THEN '수당없음'
        WHEN COMM>0 THEN '수당:'||COMM
    END AS COMM_TEXT
FROM EMP;
SELECT EMPNO,ENAME,JOB,SAL,COMM
    ,DECODE(JOB,
        'MANAGER', SAL*1.1,
        'SALESMAN', SAL*1.05,
        'ANALYST', SAL,
        SAL*1.03) AS UPSAL
FROM EMP;
--Q1.EMP 테이블에서 사번, 사번앞 두자리 뒤에는 *로 마스킹
--   이름, 이름 첫자리 뒤로는 *로 마스킹
SELECT EMPNO,RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKING_EMPNO
    ,ENAME,RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME)=5;
--Q2.EMP 테이블에서 사번,사원명,월급, 일당(월 근무일수는 20.5일로 계산)
--  ,시급(하루 근무시간은 8시간으로 계산)
SELECT EMPNO,ENAME,SAL
    ,TRUNC(SAL/20.5,2) AS DAY_PAY
    ,ROUND(SAL/20.5/8,1) AS TIME_PAY
FROM EMP;
--Q3.EMP 테이블에서 사번,사원명,입사일(연도(4자리)/월/일로 표시)
--  ,입사일로부터 세달 뒤 다음 월요일의 날자(연도(4자리)-월-일로 표시)
--  ,수당(COMM이 없는 사람은 N/A로 표시)
SELECT EMPNO,ENAME,TO_CHAR(HIREDATE,'YYYY/MM/DD') AS HIREDATE
    ,TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일'),'YYYY-MM-DD') AS HM
    ,NVL(TO_CHAR(COMM),'N/A') AS COMM
FROM EMP;
DESC EMP;
--Q4.EMP 테이블에서 사번,사원명,관리자사번(없으면 ' '으로 표시)
--  ,대체 관리자(관리자 사번의 첫 두자리 값이 
--      없으면 '0000', '75'이면'5555','76'이면'6666','77'이면'7777'
--      ,'78'이면 '8888', 그 외에는 기존 관리자 사번으로 표시 )
SELECT EMPNO,ENAME,NVL(TO_CHAR(MGR),' '),NVL2(MGR,TO_CHAR(MGR),' ')
    ,CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(MGR,1,2)='75' THEN '5555'
        WHEN SUBSTR(MGR,1,2)='76' THEN '6666'
        WHEN SUBSTR(MGR,1,2)='77' THEN '7777'
        WHEN SUBSTR(MGR,1,2)='78' THEN '8888'
        ELSE TO_CHAR(MGR)
    END AS CHG_MGR
FROM EMP;
SELECT EMPNO,ENAME,NVL(TO_CHAR(MGR),' '),NVL2(MGR,TO_CHAR(MGR),' ')
    ,DECODE(SUBSTR(MGR,1,2),NULL,'0000'
        ,'75','5555'
        ,'76','6666'
        ,'77','7777'
        ,'78','8888'
        ,TO_CHAR(MGR)
    ) AS CHG_MGR
FROM EMP;







