--anonoymous block ������
show user;
set serverout on ;
declare
v_fname varchar2(20);
begin 
  select first_name into v_fname from employees where employee_id = 100;
  dbms_output.put_line('the result is ' || v_fname );
end;

--variables 
 --������� identifier [constant] datatype [not null] [:= | default expr] 
 v_event := q'!father's day!'--�����ַ���q'!!' ����
  identifier table.column_name%type; --�������������ĳһ���ֶε�����һ��
  ��
  balance number(7,2);
  min_balance balance%type;--��balance������һ��
  
�����󶨱���
variable b_salary number;
begin 
  select salary into :b_salary from employees where employee_id = 178;
end;
print b_salary;
select first_name,last_name from employees where salary=:b_salary;


