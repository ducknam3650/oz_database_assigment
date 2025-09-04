-- 과제용 데이터베이스 생성
CREATE DATABASE oz_assigment;

-- 데이터 베이스를 사용
USE oz_assigment;

-- employes 테이블 생성
CREATE TABLE employees(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10,2)
    );

-- 직원 데이터를 추가
INSERT INTO employees(name, position, salary) VALUES
	('혜린', 'PM', 90000),
    ('혜린', 'Frontend', 80000),
    ('가을', 'Backend', 92000),
    ('지수', 'Frontend', 78000),
    ('민혁', 'Frontend', 96000),
    ('하온', 'Backend', 130000);

-- 모든 직원의 이름과 연봉 정보만을 조회하는 쿼리
SELECT name, salary FROM employees;
   
-- Frontend 직책을 가진 직원 중에서 연봉이 90000 이하인 직원의 이름과 연봉을 조회하세요
SELECT * FROM employees WHERE position = 'Frontend';

-- 세이브 모드를 비활성화
SET SQL_SAFE_UPDATES = 0;

-- PM 직책을 가진 모든 직원의 연봉을 10% 인상한 후 그 결과를 확인하세요.
UPDATE employees
SET salary =  salary * 1.1
WHERE position = 'Pm';
SELECT ROW_COUNT();

-- 모든 Backend 직책을 가진 직원의 연봉을 5%인상하세요.
UPDATE employees
SET salary =  salary * 1.05
WHERE position = 'Backend';

-- 민혁 사원의 데이터를 삭제하세
DELETE FROM employees WHERE name = '민혁';

-- 모든 직원을 position 별로 그룹화하여 각 직책의 평균 연봉을 계산하세요
SELECT position,                -- SELECT 여기의 컬럼에서
AVG(salary)                     -- AVG(평균을 구할 부분)
AS average_salary               -- AS 구한 평균을 담을 컬럼 
FROM employees                   -- FROM 테이블명 
GROUP BY position;              -- GROUP BY  기준이 되어 그룹으로 묶을 컬럼
이해한 코드: 셀렉트 부분의 컬럼의 평균을 보여줘 프롬 테이블에서 그룹을 기준으로 같은 것 끼리

-- employees 테이블을 삭제
DROP TABLE employees;

-- 테이블 확인
SELECT * FROM employees