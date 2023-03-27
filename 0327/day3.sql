/**
 * TCL(Transaction Control Language)
 */

DROP TABLE SAL_TCL;
CREATE TABLE SAL_TCL AS SELECT * FROM SCOTT.SALGRADE;
SELECT * FROM sal_tcl;
INSERT INTO sal_tcl(grade,losal,hisal) values(6,5000,7000);
UPDATE sal_tcl SET losal=3001, hisal=4999 WHERE grade=5;
DELETE FROM sal_tcl WHERE grade=3;
ROLLBACK;
COMMIT;


/**
 * DCL(Data Control Language)
 */
-- CREATE USER [USER NAME] IDENTIFIED BY [PASSWORD]
SELECT * FROM SCOTT.SAL_DML sd ;
CREATE USER STU IDENTIFIED BY 1234;
ALTER USER STU IDENTIFIED BY 12345;
COMMIT;
GRANT CREATE SESSION TO STU; 
GRANT SELECT ON scott.sal_dml TO stu;	-- SELECT 권한 부여
GRANT INSERT ON scott.SAL_DML TO stu;	-- INSERT 권한 부여

REVOKE SELECT,INSERT ON scott.sal_dml FROM stu;	-- 권한 회수

SELECT * FROM USER_SYS_PRIVS ;

CREATE ROLE school;
GRANT CONNECT, RESOURCE, CREATE VIEW TO school;
GRANT CONNECT,RESOURCE,CREATE VIEW TO SCHOOL;
GRANT school TO stu;
COMMIT;

SELECT * FROM dba_sys_privs WHERE grantee='school';
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE='SCHOOL';