--ʹ�ù���
/*
1 alert log
  show parameter dump
  ���log��  cat /dev/null > alert_wensr.log
2 background process trace files:sid_ora_pid.trc
3 user trace file :sid_ora_pid.trc
  show parameter user_dump
4 OEM
5 ��Ϻ͵��Ű�
6 statspack����Ҫ��
7 ��̬������ͼ
8 oracle wait events

*/
--�鿴alert�ļ�
show parameter dump;
--�鿴����vi alert.log ,��/ORA- �ؼ��ֲ�ѯ����

--�鿴������Ϣ��Ĭ�ϼ�����Ϣû��д�뵽alert�ļ�
show parameter log_ch;
--�޸ļ�����Ϣ���ã�������Ϣд�뵽alertlog�ļ�
alter system set log_checkpoints_to_alert=true;

--background trace file
--user trace file(ORACLENAME_ora_Pid.trc),���û������Ĳ�������¼������ļ���
select sid,serial#,username from v$session;
--���⣺��ôȷ���Ǹ����̶�Ӧ�ĸ��û�����ps -ef | grep ora��
alter session set sql_trace = true;--��session����sql
show parameter sql_trace;--ȫ�ֵ�sql_trace��һ����Ϊfalse

--statspack��ʹ���ĵ���spdoc.txt��
spcreate.sql 
--��װ
--1 ������ռ�
create tablespace perfstat datafile='/u01/app/oracle/oradata/perfstat01.pdf' size=100M;
--2 ִ��sql�ű�
@/u01/app/oracle/product/11.2.0/db_1/rdbms/admin/spcreate.sql
@?/rdbms/admin/spcreate.sql
--3 ����perfstat�û��Ŀ��perfstat��
--4 �����ռ� perfstat
--5 ������ʱ��ռ� temp
--ʹ��(����ʹ�ã��м䲻Ҫ�йػ�����)
execute statspack.snap;
execute statspack.snap;
--���ɱ���
@?/rdbms/admin/spreport.sql


--DD and special views 
1 v$sysstat,v$sgastat,v$event_name,v$system_event
select * from v$sysstat 
select * from v$sgastat 
select * from v$event_name 
select * from v$system_event 

--tuning the shared pool ��10g��ʼ�ṩ�Զ��������
library cache ��parse
data dictionary cache �������ֵ�
(user global area ר��ģʽ������)
--��cursor_sharing��Ϊsimilar��force �����Ƶ�sql��乲��Ĭ��Ϊexact��
show parameter cursor 
alter system set cursor_sharing='similar';
alter system set cursor_sharing='exact';
select * from v$sysstat where name like '%parse count (hard)%';
select * from scott.emp;
select * from scott.emp where empno = '7782' ; 
--�󶨱��������ܵ�Ӱ�죬�������£�
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

�ֱ�ִ�������������̣��Ա�ִ�е��ٶ�
set timing on;
exec proc2 ;--��ʱ9.425s
truncate table m;
exec proc1;--��ʱ1.188s
select * from m;
commit;

--��Ҫ��ͼ v$sgastat,v$librarycache,v$sql,v$sqlarea,v$sqltext,v$db_object_cache,v$sql_shared_cursor
select * from v$sgastat;
--GETHITRATIO ����sql�������ʣ�pinhitratioִ�е�������
select namespace,gets,gethits,GETHITRATIO,pins,pinhits,pinhitratio,reloads,INVALIDATIONS from v$librarycache; 
select sql_text,parse_calls,executions��users_executing from v$sqlarea where executions <5 order by upper(sql_text);
select * from v$db_object_cache;
select * from v$sql_shared_cursor;


