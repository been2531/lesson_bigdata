-- IMPORT_EXCEL.SQL
-- excel_exam.xlsx 파일을 import하여 EXAM 테이블 생성하기

--1 [1] TABLE 만들기
CREATE TABLE MAN (
    PROBLEM   VARCHAR2(40) PRIMARY KEY,
    VICTIM    NUMBER(3,1),
    ATTACKER  NUMBER(3,1)
);

DESC MAN

DROP TABLE MAN; 

-- [2] 엑셀 데이터를 IMPORT 하기
-- Toad에서 Database --> Import --> Import Table Data 실행
-- Object Name : EXAM 선택후 --> NEXT
-- Excel file을 체크 선택하고 excel_exam.xlsx 파일을 선택해준다 --> NEXT
-- First Row:2(헤더는 삭제), Last Row : 입력안하거나 원하는 값 입력 후 --> NEXT
-- 이후 계속 NEXT나 OK를 눌러 완료한다.

SELECT * 
FROM MAN
ORDER BY VICTIM, ATTACKER;

-- 데이터 분석하기

-- (1) 프로젝션 : 열 추출하기 
SELECT PROBLEM, VICTIM
FROM MAN;

-- (2) 셀렉션 : 행 추출하기 
SELECT PROBLEM, VICTIM, ATTACKER
FROM MAN
WHERE VICTIM >= 40;

-- (3) 총점과 평균의 컬럼을 추가, 평균을 오름차순 
SELECT PROBLEM, VICTIM, ATTACKER,
    (VICTIM + ATTACKER) AS "남자의총점", 
    ROUND((VICTIM + ATTACKER)/2) AS "남자의 평균"
FROM MAN
ORDER BY ROUND((VICTIM + ATTACKER)/2);

-- (4) 각각의 컬럼 평균 구하기 
SELECT AVG(VICTIM) AS "피해자평균",
       AVG(ATTACKER) AS "가해자평균"
FROM MAN;

-- (5) 문제별 평균 구하기 
SELECT PROBLEM, AVG(VICTIM) AS "피해자평균"
FROM MAN
GROUP BY PROBLEM;

SELECT PROBLEM, AVG(ATTACKER) AS "가해자평균"
FROM MAN
GROUP BY PROBLEM;


------------------------------------------------------------------------------

--1 [1] TABLE 만들기
CREATE TABLE WOMAN (
    PROBLEM   VARCHAR2(40) PRIMARY KEY,
    VICTIM    NUMBER(3,1),
    ATTACKER  NUMBER(3,1)
);

DESC WOMAN

DROP TABLE WOMAN; 

SELECT * 
FROM WOMAN
ORDER BY VICTIM, ATTACKER;

-- 데이터 분석하기

-- (1) 프로젝션 : 열 추출하기 
SELECT PROBLEM, VICTIM
FROM WOMAN;

-- (2) 셀렉션 : 행 추출하기 
SELECT PROBLEM, VICTIM, ATTACKER
FROM WOMAN
WHERE VICTIM >= 40;

-- (3) 총점과 평균의 컬럼을 추가, 평균을 오름차순 
SELECT PROBLEM, VICTIM, ATTACKER,
    (VICTIM + ATTACKER) AS "여자의 총점", 
    ROUND((VICTIM + ATTACKER)/2) AS "여자의 평균"
FROM WOMAN
ORDER BY ROUND((VICTIM + ATTACKER)/2);

-- (4) 각각의 컬럼 평균 구하기 
SELECT AVG(VICTIM) AS "피해자평균",
       AVG(ATTACKER) AS "가해자평균"
FROM WOMAN;

-- (5) 문제별 평균 구하기 
SELECT PROBLEM, AVG(VICTIM) AS "피해자평균"
FROM WOMAN
GROUP BY PROBLEM;

SELECT PROBLEM, AVG(ATTACKER) AS "가해자평균"
FROM WOMAN
GROUP BY PROBLEM;



----------------------------------------------------------------------------

-- 등가 조인 

SELECT *
FROM MAN;

SELECT *
FROM WOMAN;

SELECT MAN.PROBLEM, MAN.VICTIM AS MAN_VICTIM, MAN.ATTACKER AS MAN_ATTACKER,
       WOMAN.VICTIM AS WOMAN_VICTIM, WOMAN.ATTACKER AS WOMAN_ATTACKER
    FROM MAN, WOMAN
WHERE MAN.PROBLEM = WOMAN.PROBLEM;


