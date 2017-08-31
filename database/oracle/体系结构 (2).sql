----------------------------------------------------------------------------------------
Oracle Server consits Oracle instance(memory and background process) and Oracle database(files�ļ�) 
user process:�û��������ݿ�Ľ���
server process������ͻ����ӵĽ���
�û�����ִ��sql��䣺�û����̸����������̽������ӣ�oracle����server process��������ӣ��Ѹ��û����̵���Ϣ�洢��PGA��UGA�У���侭��PGA����󴫵ݸ�ʵ����ʵ���еĹ���ظ��𻺴桢����������䣬���ݿ⻺����ȥ�ж������η������������Ӳ������������cbo�õ���ִ�мƻ�׼��ִ����䣬��ѯ����еĶ������ڱ�ռ��ָ�����з����ĸ�������ģ������ֵ仺�����õ���Щ��Ϣ����ʼִ�У��ж������ݻ�����data buffer cache���Ƿ񻺴���Ҫd�飬��������ڴ�����ݵõ���ִ�еĽ�����ظ��û���������ǣ�����������̰ѿ�Ӵ��̶��뵽data buffer cache����������undo������Ըÿ�������Ȼ��������е����ݵõ��еĽ�������ظ��û���

files��datafiles  control files   redo log files  parameter file  password file   archived log files  
�鿴SGA��show sga;
--granules : sga�Ļ�����λ
select component,granule_size from V$SGA_DYNAMIC_COMPONENTS;
----------------------------------------------------------------------------------------
ps -ef | grep oracle :�鿴��̨����
ipcs �� �鿴�ڴ�ʹ��
env | grep ORACLE:�鿴��������
Strings spfileSID.ora | grep -i db_block_size; -i:����ʱ�����ִ�Сд
----------------------------------------------------------------------------------------
Manage a oracle server 
1 parameter file(initSID.ora,spfileSID.ora) :startup -> ��ȡ�����ļ�spfile -> control files -> datafiles 
  create pfile from spfile;
  create spfile from pfile;
  �鿴�������ļ�strings spfileSID.ora | more;
  �޸�spfile�ļ���alter system set parameter = value comment='text'(ע��) scope = memory|spfile|both(default) sid=sid ;
  ���ݱ�desc v$parameter;select * from v$parameter;
  ָ����pfile������startup pfile = $ORACLE_HOME/dbs/initSID.ora;
2 ���ݿ�����
  startup restricted;
  alter SYSTEM enable RESTRICTED session; ����״̬��ֻ����Ȩ�޵��û��������ӽ���
  alter system open;
  �����ֵ䣺desc v$session;
  select sid,serial#,username from v$session;
  alter system kill session 'sid,serial#';--���û�T��
  ���⣺����ҳ�ĳһ���û�׼ȷ��sid��serial#?
3 diagnostic file 
  alertSID.log file : background_dump_dest
  background trace files 
  user trace files 
----------------------------------------------------------------------------------------
DD�����ֵ�
col member format a50;�趨memberռ50���ַ� 
select * from DICTIONARY;
select * from user_tables;
select * from all_tables where owner = 'WH11'; 
select * from dba_objects;
select * from user_objects;
select * from v$session;
select * from gv$session;

select * from v$version;
select * from v$database;

select * from v$transaction;

select * from v$process;

select * from v$sql;

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
�����ļ���
select distinct isspecified,a.* from v$spparameter a;
ISSPEC
------
TRUE
FALSE
��Ϊ�����ѡ����true,����������ݿ�ʹ�õ��Ƕ����Ʋ����ļ�.�����޸Ĳ���Ҫʹ����������Ǳ༭
�ļ�,ǧ��Ҫ�༭�����Ʋ����ļ�,��༭�Ժ�ᱨora-00600�Ĵ���
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
���ӿ����ļ�
1 ����shutdown���ݿ⣨�������ܱ�֤���Ƴ����Ŀ����ļ������ٱ仯��
2 �����µĿ����ļ�����Ӧ��Ŀ¼��
3 ����pfile�޸Ĳ�������controlfile���ּ����µ�Ŀ¼������ʹ��alter system �����޸�
4 �����µ�spfile���������ݿ�
������£�
col name for a60
select status,name from v$controlfile;
shutdown immediate

���ٿ����ļ�
1 �޸Ĳ����ļ���ʹ��alter system�����޸�control_files����������֤
2 �������ݿ�
������£�
show parameter control
alter system set control_files='/u01/app/oracle/oradata/wensr/control01.ctl','/u01/app/oracle/flash_recovery_area/wensr/control02.ctl'
--��֤�����ļ��Ѿ��޸�
select name,value from v$spparameter where name='control_files';
startup force
--��֤�ڴ汻�޸���
select name from v$controlfile;
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
����������־�ļ� �� Maintaining Online Redo Log Files 

checkpoint : a checkpoint is the writing of dirty(modified) blocks from the buffer cache to disk 
--ǿ�Ʒ���checkpoint
FAST_START_MTTR_TARGET = 600;--ÿ600�뷢��һ��checkpoint
alter system CHECKPOINT;

alter system switch logfile;--ǿ���л�redo log �ļ�

--��־�ļ�
select * from v$logfile;
select * from v$log;
select * from v$log_history;
--������־�ļ���
alter database add logfile group 9 '/u01/app/oracle/oradata/wensr/redo09.log' size 5m;
--���ӳ�Ա����ʼ״̬ΪINVALID��
alter database add logfile member '/u01/app/oracle/oradata/wensr/redo09b.log' to group 9;
  ����
  alter database add logfile group 10 ('/u01/app/oracle/oradata/wensr/redo10a.log','/u01/app/oracle/oradata/wensr/redo10b.log') size 5m;

--ɾ����Ա��ɾ�Ĳ�����current��active�飬ɾ��������ļ����ڣ�����ɾ������������һ����Ա��
alter database drop logfile member '/u01/app/oracle/oradata/wensr/redo09.log';
--��ʽ���飨ɾ���ļ���������,�൱�����³�ʼ���飬���鷢���𻵵�ʱ�����ʹ�ã�
alter database clear logfile group 9;
--��־�ļ��ĸ�������Ҫ�Ȳ鿴״̬��ȷ�ϲ���current��active,cp�µ��ļ���,��Ҫ�µ��ļ����Ѵ��ڲ���ִ�У�
alter database rename file '/u01/app/oracle/oradata/wensr/redo09b.log' to '/u01/app/oracle/oradata/wensr/redo09a.log';

--ɾ���飨����ɾ����ǰ�飩
alter database drop logfile group 9;

--SCN��system change number,stop scn (�������ػ���������stop scn�ᱻ����Ϊ���ֵ)
select CURRENT_SCN from v$database;--38908048061
select * from v$log_history;

--�鵵(����)
  --�鿴�Ƿ�Ϊ�鵵ģʽ
select * from v$instance;
select * from v$database;
archive log list;

--Redo logfile ������
multiplexed : ��·���ã���ͬһ����Ĳ�ͬ��Ա���ڲ�ͬ�Ĵ����ϣ�ֻҪһ�����л���һ����Ա���ã�����鼴����������
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
��ռ�������ļ�

Ĭ�ϱ�ռ�(v$tablespace)
select property_value from database_properties where PROPERTY_NAME='DEFAULT_PERMANENT_TABLESPACE';
alter database default tablespace users;
alter user scott default tablespace users;
--��ռ���
alter tablespace temp2 tablespace group group1;
alter user scott temporary tablespace group1;
--�鿴��ռ��Ƿ������־
select tablespace_name,logging,force_logging from dba_tablespaces;
create tablespace  ...... nologging  | force logging;
alter tablespace user1 logging | force logging | nologging; 

--������ռ�
create tablespace ts1 datafile '/u01/app/oracle/oradata/wensr/ts1.dbf' size 2m;
--��ʱ��ռ䣨�����ô�����ݣ�
create temporary tablespace temp2 tempfile '/u01/app/oracle/oradata/wensr/temp2.dbf' size 20m;
create temporary tablespace temp2 tempfile '/u01/app/oracle/oradata/wensr/temp2.dbf' size 20m tablespace group group1;
--ָ��Ĭ��tempspace
alter database default Temporary tablespace temp;
select * from V$tablespace;
select * from database_properties;
select * from v$tempfile;
select * from DBA_TEMP_FILES;
--undo��ռ䣨��ʱ�����Ҫupdate����ʷ���ݣ�
select * from dba_tablespaces;
--���ñ�ռ�
create tablespace ts1 datafile '/u01/app/oracle/oradata/wensr/ts1.dbf' size 2m reuse;
--readonly ��ռ�
alter tablespace ts1 READ Only;
alter tablespace ts1 READ write;
--�޸ı�ռ���
alter tablespace ts2 rename to ts1;
--�޸ı�ռ��С������С��ԭ�����ݵĴ�С��
  --�鿴��ռ��ʹ�����
  select * from Dba_Data_Files;
  select * from Dba_Free_Space;
alter database datafile 8 resize 5m;
--�����ļ�
alter tablespace ts1 add datafile '/u01/app/oracle/oradata/wensr/ts1a.dbf' size 2m;
--�Զ���չ��ռ�
select file_id,file_name,autoextensible,maxblocks,increment_by from dba_data_files;
alter database datafile 8 autoextend on next 1m maxsize 100m;
alter database datafile 8 autoextend off;
--����ɾ��Ψһ���ļ�������ɾ����һ���ļ���Ҫɾ��ֻ�ܽ�������ռ�ɾ��
alter tablespace ts1 drop datafile '/u01/app/oracle/oradata/wensr/ts1a.dbf';
--ɾ����ռ�
drop tablespace ts1 (including contents and datafiles);
--���ߣ�����
alter tablespace ts1 online;(offline)
--���ļ���ռ䣨ֻ����һ�������ļ���
select tablespace_name,bigfile from dba_tablespaces;
--����
create bigfile tablespace bigts datafile '/u01/app/oracle/oradata/wensr/bigts.big' size 2m;
--extend�Ĺ���ʽ
--���ع���local:������(�Ƽ�)
--�ֵ����dictionary�����뼯Ȩ
--�ι���
create tablespace ................... segment management auto | manual;

�����ļ�(dba_data_files)
--system��ռ䣨����Ҫ������offline�������������ֵ�Ļ���������������ͼ�������
--sysaux��ռ䣨ϵͳ������ռ䣬��̯һЩӦ�ó�������ݵĴ�ţ�
--���ݱ�ռ䣨�û�������ݵı�ռ䣩
select tablespace_name,FILE_ID,file_name,ceil(bytes/1024/1024) mb from DBA_DATA_FILES order by 1; 
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
�߼��ṹ block-> extent-> segment(table,index) ->datafile ->tablespace ->database
select tablespace_name,segment_name,extent_id,block_id,blocks from dba_extents where segment_name='EMP';
--block��
Strings spfileSID.ora | grep -i db_block_size; -i:����ʱ�����ִ�Сд
show parameter db_block_size;
show parameter db_cache_size;
alter system set db_4k_cache_size=4k;
--����ָ��blocksize��С�ı�ռ�
create tablespace t4k datafile '/u01/app/oracle/oradata/dd.dbf' size 2m blocksize 4k;
--�����ֵ�
desc dba_tablespaces;
select * from dba_tablespaces;
select * from Dba_Extents;
select * from Dba_Segments;
select * from User_Segments where segment_name='T1'; 
--HWM high water mark ��ˮλ�ߣ���ʹ�ù���֮ǰʹ�ù�������ɾ����δʹ�ù��Ŀ�ķֽ��ߣ�Freelist�����б���hwm��
�����������ӣ���Ǯ����ʹ�õ�block�Ŀ���ռ䣩-->�����˻���֮ǰʹ�ù�������delete��block��-->���ڴ���˻�����δʹ�ù���block��
set autotrace on/off stat;--����̨׷�ٴ�
select count(*) from t1;
 -------------------------------------
����100W����¼��Ȼ��ɾ���������ݣ���������HWM�����Է�������ɾ�������ݿ��ѯ�����ݿ�û�иı䣬�����truncate����HWM�ص��ʼ�ĵط�
 begin
 for i in 1 .. 1000000
  loop 
    insert into t1 values(i);
  end loop;
  commit;
 end;
 /
 ---------------------------------
 --pctfree Ԥ���ռ䣬pctsuedʹ����
create table t1 (name varchar2(20)) tablespace system pctfree 20 pctused 30;
insert into t1 values('LiM');
select table_name,pct_free,pct_used,freelists,Ini_Trans,Max_Trans from user_tables where table_name='T1';
select * from user_tables where table_name='T1';
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

segment �Ĺ���ʽ
1 auto segment-space management 
2 manual management 
-------------------------------------------------------------------------------------------------------------------
--wait Event ,v$system_event
select sid,event,total_waits,average_wait 
from v$session_event

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
Managing Undo Data (only one undo tablespace can be in assigned to a database at a time )
show parameter undo_management;
show parameter undo_tablespace;
--����undo��ռ�
create undo tablespace undo1 datafile '/u01/oradate/undo1.dbf' size 20M;
--�޸�undo��ռ�
alter tablespace undo1 add datafile '/u01/oradate/undo2.dbf' size 20M;
--�޸�Ĭ�ϱ�ռ�
alter system set undo_tablespace=undotbs2;
-- ɾ��(��activee״̬)
drop tablespace undotbs2;
--�����ֵ�
select begin_time,end_time from V$undostat;
select addr,used_ublk from v$transaction;
select * from dba_rollback_segs;
v$rollname

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
Manage table index
select * from user_objects where object_type='INDEX'; 

----------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------

--�������أ���
--1 exec dbms_flashback.enable_at_system_change_number(1180071);--scn,����
	exec dbms_flashback.disable();
--����1��2 ʹ��pl/sql ��������һ�ű������?
--3��ʱ�����
flashback table tmp to timestamp to_stmestamp('','yyyymmdd')

--DML ͬʱ�������У�ÿ�ж�������־��undo��¼������ֻ��һ��scn����Ϊ��һ������

--���ݱ仯����ʷ��
@/mnt/hgfs/share/xid.sql

--��־�ھ�toad���ߣ�
	--1 sys�û���¼
	--2 ȷ�ϵ�ǰ��־��(select  * from  v$log;)
	--3 �ҵ���־�ļ�(select * from  v$logfile;)
	--4 exec dbms_logmnr.add_logfile('/u01/app/oracle/redo1.log');
	--5 exec dbms_logmnr.start_logmnr(options=>dbms_logmnr.dict_from_online_catalog);
	--6 select scn,sql_undo,sql_redo from v$logmnr_contents where seg_name='T1';
	--7exec dbms_logmnr.end_logmnr();


--�����ԭ�򣨱�����������������Լ��������Ҫͳһ�����п��ܳ���null���з���������������null��ռ�洢�ռ䣩��

--����2��һ�������������У�(660����)

--����3����һ�ű�1W�����ݣ�select ����5�����ڵ��������ݣ�


--�鿴Լ����״̬
select table_name,constraint_name,status,validated from user_constraints;

--���ټ������ݣ�ֻ����һ����־���ٶȿ죩
insert /*+append*/ into t1 select * from emp;

/*����1������һ�ű�����Լ����Ȼ�����Լ����
	�������ݣ���һ���������ݣ�
	��������Լ����һ��ᱨ��
	����exception ��  @?/rdbms/admin/utlexpt1.sql
	�ٴ�����Լ�� alter table t1 enable constraint t1_pk exceptions into exception;
*/
select index_name,index_type,table_name,uniqueness from user_indexes;

create table t1 as select * from emp;
select * from t1 ;
--����
create index i_t1 on t1(empno);
--����
analyze index i_t1 validate structure;
select * from index_stats;
--�ϲ������ն�
alter index i_t1 coalesce;
--�ؽ�����
alter index i_t1 rebuild online;--( �ɼ�nologging)
--�������
alter index i_t1 monitoring usage;
select * from v$object_usage;
select * from t1 where empno='7900';
--ǿ��(��)������
select /*+index(i_t1)*/ * from t1;


/*
����2��ʹ��pl/sql�ؽ�������scott�û���
execute immediate 'alter index i_t1 rebuild online nologging';
--����
wrap iname=name.pl
*/

--��������
create index r_t1 on t1(empno) reverse;

-----------------------------------------------------------------------
--���У�������ˮ�ţ�
create sequence s1_seq cycle noorder cache 20 
maxvalue 99999999 minvalue 1 increment by 5 start with 10;

-----------------------------------------------------------------------
--TX������ÿ����һ�в���һ��tx��
--TM������

--�����Ự
select * from v$session_wait;
select sid,serial#,username from  v$session where sid in ( select blocking_session from v$ssion);
alter system kill session 'sid,serial#' immediate;

--����������Դ������
/*
  1 Ĭ�ϻ��ˣ�rollback�������ܴ�
  2 ���ݿ⽫���������ͣ״̬���ȴ���Դ���������˺��������
  3 
*/
--�趨�ȴ�ʱ�䣨s��
alter session enable resumable timeout 3600;
select * from dba_resumable;

-----------------------------------------------------------------------
--���ݿ��ַ��������ݿ��ڵ��ֶ�����char varchar long clob ����
--���������ַ��� utf8  al16

--�޸����ݿ��ַ���
alter database "orcl" character ZHS16CGB231280;
--�޸Ĺ��������ַ���
alter database "orcl" national character set ZHS16CGB231280;
--�鿴�ַ���
SELECT * from V$NLS_VALID_VALUES where parameter='LANGUAGE' ORDER BY 2;
show parameter nls;
/*
ZHS16GBK
����+λ��+iso��׼
*/
--nls_language  ��ʾ��������
alter session set nls_language ='AMERICAN' ;--��ʱ��Ч,SIMPLIFIED CHINESE
--��bash_profile�п������޸�

--���ݿ������
select * from NLS_DATABASE_PARAMETERS;
--ʵ��������
select * from NLS_INSTANCE_PARAMETERS;
--��ǰ�Ự������
select * from NLS_SESSION_PARAMETERS;

-----------------------------------------------------------------------
--����:lsnrctl service;
-----------------------------------------------------------------------
--ѹ����
/*
������ͬ������ֻ��һ�Σ��������ʱ�����������
��ľ�̬��(���ݺ��ٸı�)ѹ���洢����ʡ�����ռ䣬���I/OЧ��,
���Ƕ�̬���ʺ���ѹ������
*/
select * from scott.t1;
conn scott/tiger;
create table t2 compress as select * from t1 order by ename;
create table t3 as select * from t1;
--�鿴�����ű��ж��ٿ�
select segment_name,blocks from user_segments where segment_name in ('T3','T2');

--�ƶ�����������ռ�
alter table t3 move tablespace users;
--��Ǩ��
alter table t1 enable row movement;
alter table t1 shrink space compact;
select num_rows,blocks,empty_blocks from tabs where table_name='T1';
-----------------------------------------------------------------------
--�۴ر�cluster
/*
1 ���ű�����Ϊĳһ�ж����й�����ѯ�������к��ٱ��޸ģ�
�۴ر��໥�����ı�浽��ͬ��block������block��ռ��
2 ������ĳ�����Ͻ�����ȫ��������Ҫ���۴ر�
3 ��block������Խ��Խ�Ż�
*/
select * from emp a,dept b where a.DEPTNO=b.DEPTNO;
--�����۴ر������
create cluster clu1(deptno number(2));--(size 1024)
-- ÿ���۴ؼ�ֵ��Լ1024���ֽڣ�oracle�������ݿ�������ÿ��������ܷ��¶��ٸ��۴ؼ�ֵ��8k�Ŀ�7��
create index idx_clu1 on cluster clu1;
--�۴ر��޷��ڴ���������֮ǰʹ��,���Ա����Ƚ�����
create table cemp cluster clu1(deptno) as select * from emp;
create table cdept cluster clu1(deptno) as select * from dept;
select cluster_name,table_name from user_tables where cluster_name is not null ;
select rowid,deptno from cemp;
select rowid,deptno from cdept;
-----------------------------------------------------------------------
--IOT��������֯������+��
/*
1 �ѱ��������򣬲��������������пռ������
2 IOT���������򣬵��Ƕ�Ӧ�ó�����˵����ͨ�������κ�����
3 IOT���ʡ������Ӳ�̿ռ䣬������I/O��������ڴ�ʹ���ʺ͹���Ч��
4 ������ a ��ȫ��������ɵı� 
        b ������ұ�һ��ֻ��ͨ��һ������������һ�ű�
        c ����ĳЩ���ݱ�֤��ŵ�ĳ��λ���ϣ�����ϣ������a��ĳЩ�ض�˳����
pctthreshold 20 :ָ��һ�����ݿ�İٷֱȣ���һ�����ݴ��ڸóߴ��ʱ�򣬽�����з��������
*/
create table iot1(
  id varchar2(10),
  name varchar2(10),
  sal NUMBER(5),
  constraint pk_iot1 primary key (id,name)
)
organization index
compress 1 
pctthreshold 20
overflow tablespace system
including name;

select * from IOT1;
alter table iot add overflow tablespace;
alter table iot pctthreshold 15 including name;
-----------------------------------------------------------------------
alter table t1 storage (buffer_pool keep);
alter table t1 storage (buffer_pool recycle);
alter table t1 storage (buffer_pool DEFAULT);

select table_name from dba_tables where buffer_pool='KEEP';
select table_name from dba_tables where table_name='T1';

ALTER TABLE t2 modify lob(c2) (storage(buffer_pool keep))cache;
/*
keep buffer pool :���澭��Ҫ��ѯ�Ķ��������ױ�Ĭ�ϻ�����ˢ��ȥ
recycle buffer pool : ����ʱʹ�ã���������ʹ�õĽϴ�Ķ���

*/
show parameter db_keep_cache;
-----------------------------------------------------------------------
/**
������:range,list,hash,compsite 
*/
create table test(a number,b number)
partition by range(a)
(partition p10 values less than(10) tablespace ts1,
partition p20 values less than(20) tablespace ts2,
partition p30 values less than(maxvalue) tablespace users);

select table_name,partitioned from user_tables;
SELECT segment_name,partition_name,tablespace_name,segment_type
from user_segments where segment_name='TEST';
SELECT TABLE_NAMe,tablespace_name,high_value,partition_name
from user_tab_partitions ;

create table test2
partition by hash(empno)
(partition p10 tablespace ts1,
partition p20 tablespace ts1,
partition p30  tablespace users) 
as select * from scott.emp;

select * from test2 partition(p30);
-----------------------------------------------------------------------
select * from dba_tablespaces;
select * from dba_tables where owner='WH11';
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
����������data integrity
--not null,unique,primary key,foreign key,check 
constraint ck_bonus check (bonus > 0);
alter table tt add constraint ck_bonus check (bonus > 0 );
alter table drop constraint ck_bonus;

----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
���ݵ��룺
1
insert /*+ APPEND*/ into emp select * from t_employees;
ע�����ַ�ʽ��ֱ���ڸ�ˮλ֮�ϲ������ݣ��������ݺ�commit֮ǰ���в�ѯ���ᱨ��

2 SQL*Loader ����
alter session enable parallel DML;

-----------------------------------------------------------------------
-----------------------------------------------------------------------
ORACLE ����
Listener����($ORACLE_HOME/network/admin)��
�޸�oracle�û���display����ͼ�ν������ã�export DISPLAY=141.168.40.188:0.0
listener name:
port:
protocols:
sid name:
host name:

��̬ע��(����Ҫlistener.ora�ļ�)
��spfile�ļ�������instance_name��service_names
show parameter service
alter system set service_names='wensr' scope=spfile;
show parameter instance
alter system set instance_name='wensr' scope=spfile;


shared server process (��Ӧ��Ϊdedicated server process)
�ŵ㣺
1 ���������ݿ�ʵ���Ľ�������
2 �����˿����ӵ��û�������
3 ʵ���˸��ؾ���
4 �����˿��з��������̵�����
5 �������ڴ��ʹ�ú�ϵͳ��Դ�Ļ���

���ù�������������ã�DISPATCHERS,SHARED_SERVERS
�����ļ���û������dispatchers����ʱ������ʹ��alter system set dispatchers �����޸ģ�ֻ���޸�spfile�ļ�����spfile�ļ��м���
*.DISPATCHERS="(PROTOCOL=TCP)(DISPATCHERS=2)(PROTOCOL=ICP)(DISPATCHERS=1)";
������к�ſ���ʹ��alter system set ����


-----------------------------------------------------------------------

-----------------------------------------------------------------------

-----------------------------------------------------------------------
-----------------------------------------------------------------------

-----------------------------------------------------------------------

-----------------------------------------------------------------------

-----------------------------------------------------------------------

-----------------------------------------------------------------------

-----------------------------------------------------------------------

-----------------------------------------------------------------------

-----------------------------------------------------------------------
