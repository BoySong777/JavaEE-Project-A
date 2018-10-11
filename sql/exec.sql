-- SQL 练习题

-- 工资 = 基本工资 + 奖金  (sal + comm) nvl (MySQL ifnull)
select sal, comm, sal + comm
from EMP;
-- PART I

-- 1. 查找部门 30 中员工的详细信息
select *
from EMP
where DEPTNO = 30;

-- 2. 找出从事 clerk 工作的员工的编号、姓名、部门号
select EMPNO, ENAME, DEPTNO
from EMP
where job = 'CLERK';

-- 3. 检索出奖金多于基本工资的员工信息
select *
from EMP
where comm > sal;

-- 4. 检索出奖金多于基本工资 30% 员工信息
select *
from EMP
where comm > sal * 0.3;

-- 5. 希望看到 10 部门的经理 manager 或者 20 部门的职员 clerk 的信息
select *
from EMP
where ((DEPTNO = 10 and job = 'MANAGER')or((DEPTNO = 20) and (job = 'CLERK')));

-- 6. 找出 10 部门的经理、20 部门的职员或者既不是经理也不是职员但是基本工资高于 2000 元的员工信息
select *
from EMP
where (
          (DEPTNO = 10 and job = 'MANAGER')
            or
          ((DEPTNO = 20) and (job = 'CLERK'))
            or ((JOB <> 'MANAGER')and(JOB <> 'CLERK') and(SAL > 2000))
          );

-- 7. 找出获得奖金的员工的工作
select *
from EMP
where comm > 0;

-- 8. 找出奖金少于100或者没有获得奖金的员工的信息
select *
from EMP
where comm < 100
   or comm is null;

-- 9. 查找员工雇佣日期是当月的最后一天雇佣的 last_day()
select *
from EMP
where HIREDATE = last_day(HIREDATE);

select *
from EMP;

-- 10. 检索出雇佣年限超过 35 年的员工信息
select *
from EMP
where months_between(current_date, HIREDATE) > 12 * 37;

-- 11. 找出姓名以 A、B、S 开始的员工信息
select *
from EMP
where ENAME like 'A%'
   or ENAME like 'B%'
   or ENAME like 'C%';

select *
from EMP
where substr(ENAME, 0, 1) in ('A', 'B', 'S');

-- 12. 找到名字长度为 4 个字符的员工信息
select *
from EMP
where length(ENAME) = 4;

-- 13. 名字中不包含 R 字符的员工信息
select *
from EMP
where ENAME not like '%R%';

-- 14. 找出员工名字的前3个字符
select ENAME, substr(ENAME, 0, 3)
from EMP;

-- 15. 将名字中 A 改为
select ENAME, translate(ENAME, 'A', 'a')
from EMP;

-- DML insert update delete

-- 16. 将员工的雇佣日期拖后10年
select HIREDATE, add_months(HIREDATE, 12 * 10)
from EMP;

-- 17. 返回员工的详细信息并按姓名排序
select *
from EMP
order by ENAME;

-- 18. 返回员工的信息并按员工的工作年限降序排列
select *
from EMP
order by HIREDATE;

-- 19. 返回员工的信息并按工作降序、工资升序排列
select *
from EMP
order by JOB desc, (sal + nvl(comm, 0));

-- 20. 返回员工的姓名、雇佣年份和月份，并按月份和雇佣日期排序
select ENAME, extract(year from HIREDATE), extract(month from HIREDATE), HIREDATE
from EMP
order by extract(MONTH from HIREDATE), HIREDATE;

-- 21. 计算员工的日薪，每月按30天
select round((sal + nvl(COMM, 0) / 30), 2)
from EMP;

-- 22. 找出2月份雇佣的员工
select *
from EMP
where extract(month from HIREDATE) = 2;

-- 23. 至今为止，员工被雇佣的天数
select round(current_date - HIREDATE, 0)
from EMP;

-- 24. 找出姓名中包含 A 的员工信息
select *
from EMP
where ENAME like '%A%';

-- PART II

-- 1. 返回拥有员工的部门名、部门号

-- 2. 工资多于 scott 的员工信息

-- 3. 返回员工和所属经理的姓名

-- 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名

-- 5. 返回员工姓名及其所在的部门名称

-- 6. 返回从事 clerk 工作的员工姓名和所在部门名称

-- 7. 返回部门号及其本部门的最低工资

-- 8. 返回销售部 sales 所有员工的姓名

-- 9. 返回工资多于平均工资的员工

-- 10. 返回与 scott 从事相同工作的员工

-- 11. 返回工资高于30部门所有员工工资水平的员工信息

-- 12. 返回部门号及每个部门的员工总数

-- 13. 返回员工的姓名、所在部门名及其工资

-- 14. 返回雇员表中不在同一部门但是从事相同工作的员工信息

-- 15. 返回员工的详细信息，包括部门名

-- 16. 返回员工工作及其从事此工作的最低工资

-- 17. 返回不同部门经理的最低工资

-- 18. 计算出员工的年薪，并且以年薪排序

-- 19. 返回工资处于第4级别的员工的姓名