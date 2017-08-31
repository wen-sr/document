--使用工具
/*
1 alert log
  show parameter dump
  清空log：  cat /dev/null > alert_wensr.log
2 background process trace files:sid_ora_pid.trc
3 user trace file :sid_ora_pid.trc
  show parameter user_dump
4 OEM
5 诊断和调优包
6 statspack（重要）
7 动态性能视图
8 oracle wait events

*/
--查看alert文件
show parameter dump;
--查看错误：vi alert.log ,用/ORA- 关键字查询错误

--查看检查点信息，默认检查点信息没有写入到alert文件
show parameter log_ch;
--修改检查点信息设置，将该信息写入到alertlog文件
alter system set log_checkpoints_to_alert=true;

--background trace file
--user trace file(ORACLENAME_ora_Pid.trc),该用户所做的操作都记录在这个文件中
select sid,serial#,username from v$session;
--问题：怎么确定那个进程对应哪个用户？（ps -ef | grep ora）
alter session set sql_trace = true;--本session跟踪sql
show parameter sql_trace;--全局的sql_trace，一般设为false

--statspack（使用文档：spdoc.txt）
spcreate.sql 
--安装
--1 创建表空间
create tablespace perfstat datafile='/u01/app/oracle/oradata/perfstat01.pdf' size=100M;
--2 执行sql脚本
@/u01/app/oracle/product/11.2.0/db_1/rdbms/admin/spcreate.sql
@?/rdbms/admin/spcreate.sql
--3 输入perfstat用户的口令（perfstat）
--4 输入表空间 perfstat
--5 输入临时表空间 temp
--使用(两次使用，中间不要有关机操作)
execute statspack.snap;
execute statspack.snap;
--生成报告
@?/rdbms/admin/spreport.sql


--DD and special views 
1 v$sysstat,v$sgastat,v$event_name,v$system_event
select * from v$sysstat 
select * from v$sgastat 
select * from v$event_name 
select * from v$system_event 

--tuning the shared pool ：10g开始提供自动管理机制
library cache ：parse
data dictionary cache ：数据字典
(user global area 专用模式不考虑)
--将cursor_sharing改为similar或force 将相似的sql语句共享（默认为exact）
show parameter cursor 
alter system set cursor_sharing='similar';
alter system set cursor_sharing='exact';
select * from v$sysstat where name like '%parse count (hard)%';
select * from scott.emp;
select * from scott.emp where empno = '7782' ; 
--绑定变量对性能的影响，举例如下：
create table m(m int);
create or replace procedure proc1 
as 
begin 
for i in 1..10000
loop 
  execute immediate
  'insert into m values(:x)' using i;
end loop;
end;

create or replace procedure proc2 
as 
begin 
for i in 1..10000
loop 
  execute immediate
  'insert into m values('||i||')';
end loop;
end;

分别执行上面两个过程，对比执行的速度
set timing on;
exec proc2 ;--用时9.425s
truncate table m;
exec proc1;--用时1.188s
select * from m;
commit;

--重要视图 v$sgastat,v$librarycache,v$sql,v$sqlarea,v$sqltext,v$db_object_cache,v$sql_shared_cursor
select * from v$sgastat;
--GETHITRATIO 查找sql的命中率，pinhitratio执行的命中率
select namespace,gets,gethits,GETHITRATIO,pins,pinhits,pinhitratio,reloads,INVALIDATIONS from v$librarycache; 
select sql_text,parse_calls,executions，users_executing from v$sqlarea where executions <5 order by upper(sql_text);
select * from v$db_object_cache;
select * from v$sql_shared_cursor;


