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

-----------------------------------------------------------------------

-----------------------------------------------------------------------
