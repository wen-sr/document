 select * from v$session;
select * from gv$session;

select * from v$version;
select * from v$database;

select * from v$transaction;

select * from v$process;

select * from v$sql;
show user;
----------------------------------------------------------------------------------------

--��ͼ
--������ͼ�����
select view_definition from v$fixed_view_definition where view_name='GV$FIXED_TABLE';
select view_definition from v$fixed_view_definition a where a.VIEW_NAME='V$PARAMETER';

select * from v$sga;
select * from v_$sga;

alter session set sql_trace = false;
select * from bootstrap$ order by line#;
--��ȡ������ͼ
select * from v$fixed_table where name like 'V$%'
--AWR
Select occupant_name, occupant_desc, space_usage_kbytes from v$sysaux_occupants where occupant_name like '%AWR%';

----------------------------------------------------------------------------------------

--��־�ļ�
select * from v$logfile;
select * from v$log;
--������־�ļ�
alter database add logfile group 9 '/u01/app/oracle/oradata/wensr/redo09.log' size 5m;
--���ӳ�Ա����ʼ״̬ΪINVALID��
alter database add logfile member '/u01/app/oracle/oradata/wensr/redo09b.log' to group 9;
alter system switch logfile;

--ɾ����Ա��ɾ�Ĳ�����current��active�飬ɾ��������ļ����ڣ�
alter database drop logfile member '/u01/app/oracle/oradata/wensr/redo09b.log';
--��ʽ���飨ɾ���ļ��������ɣ�
alter database clear logfile group 9;
--��־�ļ��ĸ�������Ҫ�Ȳ鿴״̬��ȷ�ϲ���current��active,cp�µ��ļ���,��Ҫ�µ��ļ����Ѵ��ڲ���ִ�У�
alter database rename file '/u01/app/oracle/oradata/wensr/redo09b.log' to '/u01/app/oracle/oradata/wensr/redo09a.log';

--SCN��system change number,stop scn (�������ػ���������stop scn�ᱻ����Ϊ���ֵ)
select CURRENT_SCN from v$database;--38908048061
select * from v$log_history;
--����
select * from v$datafile;
--�л�
alter system checkpoint;
--�ֶ��л�
alter system switch logfile;
--�鵵
archive log list;

----------------------------------------------------------------------------------------

--�����ļ�
--system��ռ䣨����Ҫ������offline�������������ֵ�Ļ���������������ͼ�������
--sysaux��ռ䣨ϵͳ������ռ䣬��̯һЩӦ�ó�������ݵĴ�ţ�
--���ݱ�ռ䣨�û�������ݵı�ռ䣩
select tablespace_name,FILE_ID,file_name,ceil(bytes/1024/1024) mb from DBA_DATA_FILES order by 1; 
--��ʱ��ռ䣨�����ô�����ݣ�
create temporary tablespace temp2 tempfile '/u01/app/oracle/oradata/wensr/temp2.dbf' size 20m;
create temporary tablespace temp2 tempfile '/u01/app/oracle/oradata/wensr/temp2.dbf' size 20m tablespace group group1;
select * from v$tempfile;
select * from DBA_TEMP_FILES;
--undo��ռ䣨��ʱ�����ʷ���ݣ�
select * from dba_tablespaces;
  --1 ������ʷ����
  --2 ���ݵĻָ�
  --3 ��һ����
  --4 ���������ģ�������ʷ����
  select * from V$ROLLNAME;
  --���лع���
  select * from DBA_ROLLBACK_SEGS;
  select * from v$mystat where rownum=1;
  select * from v$session;
  --�鿴����ʹ�õĻع���
  select xidusn from V$TRANSACTION;
  select * from v$undostat;
  create undo TABLESPACE undo2 datafile '/u01/app/oracle/oradata/wensr/undo2.dbf' size 10m;
  --��������
    --ORA-01555 snapshot too old;����̫��
    --ORA-01650 unable to extend rollback segment 
  --�����ڵ�����
  alter tablespace undo2 retention GUARANTEE;--no GUARANTEE
  
--Ĭ�ϱ�ռ�
select property_value from database_properties where PROPERTY_NAME='DEFAULT_PERMANENT_TABLESPACE';
alter database default tablespace users;
alter user scott default tablespace users;
--��ռ���
alter tablespace temp2 tablespace group group1;
alter user scott temporary tablespace group1;
alter user scott temporary tablespace temp1;
--�鿴��ռ��Ƿ������־
select tablespace_name,logging,force_logging from dba_tablespaces;
create tablespace  ...... nologging  | force logging;
alter tablespace user1 logging | force logging | nologging; 

--������ռ�
create tablespace ts1 datafile '/u01/app/oracle/oradata/wensr/ts1.dbf' size 2m;
--���ñ�ռ�
create tablespace ts1 datafile '/u01/app/oracle/oradata/wensr/ts1.dbf' size 2m reuse;
--�޸ı�ռ���
alter tablespace ts2 rename to ts1;
--�����ļ�
alter tablespace ts1 add datafile '/u01/app/oracle/oradata/wensr/ts1a.dbf' size 2m;
--�޸ı�ռ��С������С��ԭ�����ݵĴ�С��
alter database datafile 8 resize 5m;
--�Զ���չ��ռ�
select file_id,file_name,autoextensible,maxblocks,increment_by from dba_data_files;
alter database datafile 8 autoextend on next 1m maxsize 100m;
alter database datafile 8 autoextend off;
--����ɾ��Ψһ���ļ�������ɾ����һ���ļ���Ҫɾ��ֻ�ܽ�������ռ�ɾ��
alter tablespace ts1 drop datafile '/u01/app/oracle/oradata/wensr/ts1a.dbf';
--ɾ����ռ�
drop tablespace ts1;
--���ߣ�����
alter tablespace ts1 online;(offline)
--���ļ���ռ䣨ֻ����һ�������ļ���
select tablespace_name,bigfile from dba_tablespaces;
--����
create bigfile tablespace bigts datafile '/u01/app/oracle/oradata/wensr/bigts.big' size 2m;
--��ռ䣬����ʽ
--���ع���local
--�ֵ����dictionary
--�ι���
create tablespace ................... segment management auto | manual;

----------------------------------------------------------------------------------------
--�߼��ṹ block-> extent-> segment ->tablespace ->database
select tablespace_name,segment_name,extent_id,block_id,blocks from dba_extents where segment_name='EMP';
--block��
show parameter block_size;--��׼�飨8k��
show parameter cache_size;
--�޸ĳɷǱ�׼�飨4k��
alter system set db_4k_cache_size=4k;
--�����Ǳ�׼��ʹ�õı�ռ�
create tablespace t4k datafile '/u01/app/oracle/oradata/dd.dbf' size 2m blocksize 4k;
select tablespace_name,block_size from dba_tablespaces;
--��ռ��Ƿ�Ĭ�ϲ�����־
select tablespace_name,logging,force_logging from dba_tablespaces;
  --���÷�ʽ
    --1 create tablespace ...... nologging | force logging;
    --2 alter tablespace tsname logging;
  
--HWM high water mark ��ˮλ�ߣ���ʹ�ù���δʹ�ù��Ŀ�ķֽ��ߣ�Freelist�����б���hwm��
SELECT hwm1.name,
       hwm1.highwater,
       hwm1.last_value
FROM   dba_high_water_mark_statistics hwm1
WHERE  hwm1.version = (SELECT MAX(hwm2.version)
                       FROM   dba_high_water_mark_statistics hwm2
                       WHERE  hwm2.name = hwm1.name)
ORDER BY hwm1.name;
--pctfree Ԥ���ռ䣬pctsuedʹ����
create table t1 (name varchar2(20)) tablespace system pctfree 20 pctused 30;
insert into t1 values('LiM');
select table_name,pct_free,pct_used,freelists from user_tables where table_name='T1';
--��insert(1 ����freelists��ȡ�ռ���Ϣ��2 �ҵ����õ����ݿ� 3 �������ݵ�pctfree 4 ���ÿ��freelist��Ų�� 5 ����Ѱ����һ�����ÿ飬ѭ��������)
--delete��1 ɾ�����ݺ�>pctused ���ܲ��������ݣ���Ϊû�ﵽpctused�ı�׼��û�м��뵽freelist�� 3 <pctused����ȴ�����������ݣ�

--extent����һ���Եķ����������block��
select tablespace_name,segment_name,extent_id,file_id,block_id,blocks from dba_extents where SEGMENT_NAME='T1'
select tablespace_name,initial_extent,next_extent,min_extents,max_extents from dba_tablespaces;
--�ֶ������������С
ALTER table t1 allocate extent; 
alter table t1 allocate extent(datafile '/u01/app/oracle/oradata/wensr/users01.dbf' size 10m);
alter table t1 deallocate unused;

--������ռ�ʱ����ÿ�η������ж��ٸ���
create tablespace uni datafile '/u01/app/oracle/oradata/wensr/uni.dbf' size  10m uniform size 1m;
--�鿴ÿ����ռ�Ŀ���ռ�
select * from DBA_TABLESPACE_USAGE_METRICS;
select * from dba_free_space;
--ÿ�������ļ��Ŀ��пռ�
----------------------------------------------------------------------------------------
--wait Event ,v$system_event
select sid,event,total_waits,average_wait 
from v$session_event



----------------------------------------------------------------------------------------
--1��ȷ���Ƿ����scott�û�
select USERNAME,ACCOUNT_STATUS,DEFAULT_TABLESPACE,TEMPORARY_TABLESPACE,CREATED from dba_users 
where USERNAME = 'SCOTT';
--2��ʹ��$ORACLE_HOME/rdbms/admin/utlsampl.sql����scott�û�����������
@?/rdbms/admin/utlsampl.sql
alter user scott account unlock;
conn scott/tiger;
select * from scott.emp;
----------------------------------------------------------------------------------------

--�����ļ�spSID.ora
--�޸Ĳ���
show parameter pga 
alter system set pga_aggregate_target=30m scope=memory;



----------------------------------------------------------------------------------------
undo ����
select * from scott.emp
exec DBMS_FLASHBACK.GET_SYSTEM_CHANGE_NUMBER(1180027)

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------