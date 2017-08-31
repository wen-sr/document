--10g之后的版本scott用户不能创建view，hr用户可以
--创建视图
create view v_1 as select first_name,min(salary) salary  from employees group by first_name;

--查看视图
select view_name,text from user_views;

--修改视图
create or replace view as select * from employees;

--删除视图
drop view v_1;

--在视图上运行DML语句等同于在基表上操作

