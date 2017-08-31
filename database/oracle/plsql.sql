--anonoymous block 匿名块
show user;
set serverout on ;
declare
v_fname varchar2(20);
begin 
  select first_name into v_fname from employees where employee_id = 100;
  dbms_output.put_line('the result is ' || v_fname );
end;

--variables 
 --定义变量 identifier [constant] datatype [not null] [:= | default expr] 
 v_event := q'!father's day!'--特殊字符用q'!!' 区分
  identifier table.column_name%type; --变量类型与表中某一个字段的类型一致
  或
  balance number(7,2);
  min_balance balance%type;--和balance的类型一致
  
环境绑定变量
variable b_salary number;
begin 
  select salary into :b_salary from employees where employee_id = 178;
end;
print b_salary;
select first_name,last_name from employees where salary=:b_salary;


