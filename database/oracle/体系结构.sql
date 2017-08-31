 select * from v$session;
select * from gv$session;

select * from v$version;
select * from v$database;

select * from v$transaction;

select * from v$process;

select * from v$sql;
show user;
----------------------------------------------------------------------------------------

--视图
--定义视图的语句
select view_definition from v$fixed_view_definition where view_name='GV$FIXED_TABLE';
select view_definition from v$fixed_view_definition a where a.VIEW_NAME='V$PARAMETER';

select * from v$sga;
select * from v_$sga;

alter session set sql_trace = false;
select * from bootstrap$ order by line#;
--获取所有视图
select * from v$fixed_table where name like 'V$%'
--AWR
Select occupant_name, occupant_desc, space_usage_kbytes from v$sysaux_occupants where occupant_name like '%AWR%';

----------------------------------------------------------------------------------------

--日志文件
select * from v$logfile;
select * from v$log;
--增加日志文件
alter database add logfile group 9 '/u01/app/oracle/oradata/wensr/redo09.log' size 5m;
--增加成员（初始状态为INVALID）
alter database add logfile member '/u01/app/oracle/oradata/wensr/redo09b.log' to group 9;
alter system switch logfile;

--删除成员（删的不能是current和active组，删完后物理文件还在）
alter database drop logfile member '/u01/app/oracle/oradata/wensr/redo09b.log';
--格式化组（删除文件重新生成）
alter database clear logfile group 9;
--日志文件的改名（需要先查看状态，确认不是current和active,cp新的文件名,需要新的文件名已存在才能执行）
alter database rename file '/u01/app/oracle/oradata/wensr/redo09b.log' to '/u01/app/oracle/oradata/wensr/redo09a.log';

--SCN：system change number,stop scn (非正常关机，开机后stop scn会被设置为最大值)
select CURRENT_SCN from v$database;--38908048061
select * from v$log_history;
--检查点
select * from v$datafile;
--切换
alter system checkpoint;
--手动切换
alter system switch logfile;
--归档
archive log list;

----------------------------------------------------------------------------------------

--数据文件
--system表空间（最重要，不能offline），包含数据字典的基表，包，函数，视图，定义等
--sysaux表空间（系统辅助表空间，分摊一些应用程序的数据的存放）
--数据表空间（用户存放数据的表空间）
select tablespace_name,FILE_ID,file_name,ceil(bytes/1024/1024) mb from DBA_DATA_FILES order by 1; 
--临时表空间（不永久存放数据）
create temporary tablespace temp2 tempfile '/u01/app/oracle/oradata/wensr/temp2.dbf' size 20m;
create temporary tablespace temp2 tempfile '/u01/app/oracle/oradata/wensr/temp2.dbf' size 20m tablespace group group1;
select * from v$tempfile;
select * from DBA_TEMP_FILES;
--undo表空间（暂时存放历史数据）
select * from dba_tablespaces;
  --1 回退历史数据
  --2 数据的恢复
  --3 读一致性
  --4 （有条件的）闪回历史数据
  select * from V$ROLLNAME;
  --所有回滚段
  select * from DBA_ROLLBACK_SEGS;
  select * from v$mystat where rownum=1;
  select * from v$session;
  --查看正在使用的回滚段
  select xidusn from V$TRANSACTION;
  select * from v$undostat;
  create undo TABLESPACE undo2 datafile '/u01/app/oracle/oradata/wensr/undo2.dbf' size 10m;
  --常见错误：
    --ORA-01555 snapshot too old;快照太旧
    --ORA-01650 unable to extend rollback segment 
  --保留期的设置
  alter tablespace undo2 retention GUARANTEE;--no GUARANTEE
  
--默认表空间
select property_value from database_properties where PROPERTY_NAME='DEFAULT_PERMANENT_TABLESPACE';
alter database default tablespace users;
alter user scott default tablespace users;
--表空间组
alter tablespace temp2 tablespace group group1;
alter user scott temporary tablespace group1;
alter user scott temporary tablespace temp1;
--查看表空间是否产生日志
select tablespace_name,logging,force_logging from dba_tablespaces;
create tablespace  ...... nologging  | force logging;
alter tablespace user1 logging | force logging | nologging; 

--创建表空间
create tablespace ts1 datafile '/u01/app/oracle/oradata/wensr/ts1.dbf' size 2m;
--重用表空间
create tablespace ts1 datafile '/u01/app/oracle/oradata/wensr/ts1.dbf' size 2m reuse;
--修改表空间名
alter tablespace ts2 rename to ts1;
--增加文件
alter tablespace ts1 add datafile '/u01/app/oracle/oradata/wensr/ts1a.dbf' size 2m;
--修改表空间大小（不能小于原有数据的大小）
alter database datafile 8 resize 5m;
--自动扩展表空间
select file_id,file_name,autoextensible,maxblocks,increment_by from dba_data_files;
alter database datafile 8 autoextend on next 1m maxsize 100m;
alter database datafile 8 autoextend off;
--不能删除唯一的文件，不能删除第一个文件，要删除只能将整个表空间删除
alter tablespace ts1 drop datafile '/u01/app/oracle/oradata/wensr/ts1a.dbf';
--删除表空间
drop tablespace ts1;
--连线，断线
alter tablespace ts1 online;(offline)
--大文件表空间（只能有一个数据文件）
select tablespace_name,bigfile from dba_tablespaces;
--创建
create bigfile tablespace bigts datafile '/u01/app/oracle/oradata/wensr/bigts.big' size 2m;
--表空间，管理方式
--本地管理local
--字典管理dictionary
--段管理
create tablespace ................... segment management auto | manual;

----------------------------------------------------------------------------------------
--逻辑结构 block-> extent-> segment ->tablespace ->database
select tablespace_name,segment_name,extent_id,block_id,blocks from dba_extents where segment_name='EMP';
--block块
show parameter block_size;--标准块（8k）
show parameter cache_size;
--修改成非标准块（4k）
alter system set db_4k_cache_size=4k;
--建立非标准块使用的表空间
create tablespace t4k datafile '/u01/app/oracle/oradata/dd.dbf' size 2m blocksize 4k;
select tablespace_name,block_size from dba_tablespaces;
--表空间是否默认产生日志
select tablespace_name,logging,force_logging from dba_tablespaces;
  --设置方式
    --1 create tablespace ...... nologging | force logging;
    --2 alter tablespace tsname logging;
  
--HWM high water mark 高水位线，是使用过和未使用过的块的分界线，Freelist空闲列表，在hwm下
SELECT hwm1.name,
       hwm1.highwater,
       hwm1.last_value
FROM   dba_high_water_mark_statistics hwm1
WHERE  hwm1.version = (SELECT MAX(hwm2.version)
                       FROM   dba_high_water_mark_statistics hwm2
                       WHERE  hwm2.name = hwm1.name)
ORDER BY hwm1.name;
--pctfree 预留空间，pctsued使用率
create table t1 (name varchar2(20)) tablespace system pctfree 20 pctused 30;
insert into t1 values('LiM');
select table_name,pct_free,pct_used,freelists from user_tables where table_name='T1';
--表insert(1 查找freelists获取空间信息，2 找到可用的数据块 3 插入数据到pctfree 4 将该块从freelist中挪走 5 继续寻找下一个可用块，循环到结束)
--delete（1 删除数据后>pctused 不能插入新数据，因为没达到pctused的标准，没有加入到freelist中 3 <pctused加入等待插入的新数据）

--extent区，一次性的分配的连续的block块
select tablespace_name,segment_name,extent_id,file_id,block_id,blocks from dba_extents where SEGMENT_NAME='T1'
select tablespace_name,initial_extent,next_extent,min_extents,max_extents from dba_tablespaces;
--手动设置区分配大小
ALTER table t1 allocate extent; 
alter table t1 allocate extent(datafile '/u01/app/oracle/oradata/wensr/users01.dbf' size 10m);
alter table t1 deallocate unused;

--创建表空间时设置每次分配区有多少个块
create tablespace uni datafile '/u01/app/oracle/oradata/wensr/uni.dbf' size  10m uniform size 1m;
--查看每个表空间的空余空间
select * from DBA_TABLESPACE_USAGE_METRICS;
select * from dba_free_space;
--每个数据文件的空闲空间
----------------------------------------------------------------------------------------
--wait Event ,v$system_event
select sid,event,total_waits,average_wait 
from v$session_event



----------------------------------------------------------------------------------------
--1、确认是否存在scott用户
select USERNAME,ACCOUNT_STATUS,DEFAULT_TABLESPACE,TEMPORARY_TABLESPACE,CREATED from dba_users 
where USERNAME = 'SCOTT';
--2、使用$ORACLE_HOME/rdbms/admin/utlsampl.sql创建scott用户和样本数据
@?/rdbms/admin/utlsampl.sql
alter user scott account unlock;
conn scott/tiger;
select * from scott.emp;
----------------------------------------------------------------------------------------

--参数文件spSID.ora
--修改参数
show parameter pga 
alter system set pga_aggregate_target=30m scope=memory;



----------------------------------------------------------------------------------------
undo 闪回
select * from scott.emp
exec DBMS_FLASHBACK.GET_SYSTEM_CHANGE_NUMBER(1180027)

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------