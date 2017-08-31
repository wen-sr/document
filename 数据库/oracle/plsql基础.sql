--1 块
declare --变量声明，可以没有
begin--逻辑处理开始标记，必须有
exception--异常处理，可以没有
end--结束标记，必须有

--2 使用plsql的好处
--便于维护（模块化）
--提高数据安全性和完整性（通过程序操作数据）
--提高性能（编译好的）
--简化代码（反复调用）

--3 anonoymous block 匿名块
show user;
set serveroutput on ;
declare
v_fname varchar2(20);
begin 
  select first_name into v_fname from employees where employee_id = 100;
  dbms_output.put_line('the result is ' || v_fname );
end;

--4 variables 
 --定义变量 identifier [constant] datatype [not null] [:= | default expr] 
 v_event := q'!father''s day!'
 --特殊字符用q'!!' 区分
  identifier table.column_name%type; --变量类型与表中某一个字段的类型一致
--或
  balance number(7,2);
  min_balance balance%type;--和balance的类型一致
--记录类型
type person is record  
v emp%rowtype 
  
--5 使用隐式游标的属性来控制dml，有四种隐式的游标。
SQL%ROWCOUNT
SQL%FOUND
SQL%NOTFOUND
SQL%ISOPEN

--6 循环
loop .... exit when ... end loop
while ... loop ... end loop 
for v1 in [reverse] 1..9 loop ... end loop

--7 游标
DECLARE--定义
CURSOR c1 is select ename,sal from emp order by sal desc;
v1 c1%rowtype;
BEGIN
open c1;--打开
fetch c1 into v1;--抓取
dbms_output.put_line(v1.ename||v1.sal);
close c1;--关闭 
END; 
-- 游标的属性，前缀为游标的名称
-- %isopen，测试该游标是否打开，返回真或假
-- %rowcount，游标已经操作了多少行， 返回数值
-- %found，游标是否找到记录，返回真或假
-- %notfound，游标是否找到记录，返回真或假