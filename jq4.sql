set pause on
set echo on
select json_object (empno, ename) from emp 
/
select json_object ('id' value empno, 'name' value ename) from emp 
/
set echo off
set pause off
