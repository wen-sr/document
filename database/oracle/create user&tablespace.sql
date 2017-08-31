--1 创建用户临时表空间(也可以不创建，直接使用默认的temp临时表空间)
create temporary tablespace statspack_tmp  
tempfile '$ORACLE_BASE/oradata/wensr/statspack_tmp.dbf' 
size 100m  
autoextend on  
next 100m maxsize 2048m  
extent management local;  
 
--2 创建用户表空间
create tablespace statspack_data   
datafile '$ORACLE_BASE/oradata/wensr/statspack.dbf'
size 100m  
autoextend on  
next 100m maxsize 2048m 
segment space management auto 
extent management local uniform;
 
--3 创建用户
create user wh11 identified by oracle  
default tablespace wh11_data  
temporary tablespace wh11_tmp;  
 
--4 分配权限
grant connect,resource,dba to wh11;

--删除用户
drop user wh11 cascade;

--删除表空间
DROP TABLESPACE wh11_tmp INCLUDING CONTENTS AND DATAFILES;

--授予访问底层视图
grant select on v_$fixed_table to wh11;

--设置账户密码永不过期
--1、查看用户的proifle是哪个，一般是default：
SELECT username,PROFILE FROM dba_users;
 
-- 2、查看指定概要文件（如default）的密码有效期设置：
 
SELECT * FROM dba_profiles s WHERE s.profile='DEFAULT' AND resource_name='PASSWORD_LIFE_TIME';
 
-- 3、将密码有效期由默认的180天修改成“无限制”：
 
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
 
--修改之后不需要重启动数据库，会立即生效。
 
-- 4、修改后，还没有被提示ORA-28002警告的帐户不会再碰到同样的提示；
 
--已经被提示的帐户必须再改一次密码，举例如下：中华考试网
alter user smsc identified by <原来的密码> ----不用换新密码




