/*
COLLECTION 컬렉션
데이터 타입(배열)
같은 데이터 타입을 가진 요소로 구성
여러 ROW를 가질 수 있음.(TABLE)
1. 가변 길이 배열(Variable size array(VARRAY))
        TYPE (타입명) IS {VARRAY|VARYING ARRAY} (크기) OF 요소 데이터 타입 [NOT NULL];
        선언시에 배열의 전체 크기를 명시
        순서대로 참조함.
*/
CREATE OR REPLACE PROCEDURE PROC_COLLECTION 
IS
-- 타입 선언
    TYPE VARR IS VARRAY(3) OF INTEGER;  --INTEGER 타입의 요소 3개
    TYPE NEST IS TABLE OF VARCHAR2(10); --VARCHAR2(10) 타입의 요소, 크기 설정 없음
    TYPE IT_NUMBER IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    -- 키 PLS_INTEGER, 값은 NUMBER 타입의 요소
    TYPE IT_STR1 IS TABLE OF VARCHAR2(32) INDEX BY PLS_INTEGER;
    -- 키 PLS_INTEGER, 값은 VARCHAR 타입의 요소
    TYPE IT_STR2 IS TABLE OF VARCHAR2(32) INDEX BY VARCHAR2(20);
    -- 키 VARCHAR2, 값은 VARCHAR2 타입의 요소
-- 변수 선언
        VARR1 VARR;
        NEST1 NEST;
        ASS1 IT_NUMBER;
        ASS2 IT_STR1;
        ASS3 IT_STR2;
BEGIN
-- 변수에 값 할당
        VARR1:=VARR(1,10,1);
        NEST1:=NEST('A','B','C','D','E');
        ASS1(99):=20230329;
        ASS2(1):='연관 배열 문자열';
        ASS3('HOPE'):='희망';
        ASS3('LOVE'):='사랑';
        -- 값을 읽기        
    DBMS_OUTPUT.PUT_LINE(VARR1(1));
    DBMS_OUTPUT.PUT_LINE(NEST1(2));
    DBMS_OUTPUT.PUT_LINE(ASS1(99));
    DBMS_OUTPUT.PUT_LINE(ASS2(1));
    DBMS_OUTPUT.PUT_LINE(ASS3('LOVE'));
    DBMS_OUTPUT.PUT_LINE(ASS3('HOPE'));

END PROC_COLLECTION;



