select JSON_OBJECTAGG (e.dname VALUE
         select JSON_ARRAYAGG(JSON {e.ename} )
         from emp e
         where e.deptno = d.deptno )
       from dept d
/
