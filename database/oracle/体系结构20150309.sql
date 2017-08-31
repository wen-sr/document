--数据闪回（）
--1 exec dbms_flashback.enable_at_system_change_number(1180071);--scn,慎用
	exec dbms_flashback.disable();
--问题1：2 使用pl/sql 彻底闪回一张表的数据?
--3按时间回退
flashback table tmp to timestamp to_stmestamp('','yyyymmdd')

--DML 同时操作多行，每行都会有日志和undo记录，但是只有一个scn，因为算一步操作

--数据变化的历史。
@/mnt/hgfs/share/xid.sql

--日志挖掘（toad工具）
	--1 sys用户登录
	--2 确认当前日志组(select  * from  v$log;)
	--3 找到日志文件(select * from  v$logfile;)
	--4 exec dbms_logmnr.add_logfile('/u01/app/oracle/redo1.log');
	--5 exec dbms_logmnr.start_logmnr(options=>dbms_logmnr.dict_from_online_catalog);
	--6 select scn,sql_undo,sql_redo from v$logmnr_contents where seg_name='T1';
	--7exec dbms_logmnr.end_logmnr();


--建表的原则（表名，列名，索引、约束等名称要统一，将有可能出现null的列放在最后（最后连续的null不占存储空间））

--问题2：一个块内最多多少行？(660左右)

--问题3：建一张表1W行数据，select 出第5个块内的所有数据？


--查看约束的状态
select table_name,constraint_name,status,validated from user_constraints;

--快速加载数据（只产生一条日志，速度快）
insert /*+append*/ into t1 select * from emp;

/*问题1：建立一张表，生成约束，然后禁用约束，
	导入数据，做一个错误数据，
	尝试启动约束，一般会报错
	生成exception 表  @?/rdbms/admin/utlexpt1.sql
	再次启动约束 alter table t1 enable constraint t1_pk exceptions into exception;
*/
select index_name,index_type,table_name,uniqueness from user_indexes;

create table t1 as select * from emp;
select * from t1 ;
--索引
create index i_t1 on t1(empno);
--分析
analyze index i_t1 validate structure;
select * from index_stats;
--合并索引空洞
alter index i_t1 coalesce;
--重建索引
alter index i_t1 rebuild online;--( 可加nologging)
--索引监控
alter index i_t1 monitoring usage;
select * from v$object_usage;
select * from t1 where empno='7900';
--强行(不)走索引
select /*+index(i_t1)*/ * from t1;


/*
问题2：使用pl/sql重建索引（scott用户）
execute immediate 'alter index i_t1 rebuild online nologging';
--加密
wrap iname=name.pl
*/

--反键索引
create index r_t1 on t1(empno) reverse;

-----------------------------------------------------------------------
--序列（生成流水号）
create sequence s1_seq cycle noorder cache 20 
maxvalue 99999999 minvalue 1 increment by 5 start with 10;

-----------------------------------------------------------------------
--TX行锁：每锁定一行产生一个tx锁
--TM表锁：

--阻塞会话
select * from v$session_wait;
select sid,serial#,username from  v$session where sid in ( select blocking_session from v$ssion);
alter system kill session 'sid,serial#' immediate;

--挂起的事物（资源不够）
/*
  1 默认回退，rollback工作量很大
  2 数据库将事物挂起，暂停状态，等待资源到来，来了后继续工作
  3 
*/
--设定等待时间（s）
alter session enable resumable timeout 3600;
select * from dba_resumable;

-----------------------------------------------------------------------
--数据库字符集：数据库内的字段类型char varchar long clob 编码
--国家语言字符集 utf8  al16

--修改数据库字符集
alter database "orcl" character ZHS16CGB231280;
--修改国家语言字符集
alter database "orcl" national character set ZHS16CGB231280;
--查看字符集
SELECT * from V$NLS_VALID_VALUES where parameter='LANGUAGE' ORDER BY 2;
show parameter nls;
/*
ZHS16GBK
区域+位数+iso标准
*/
--nls_language  提示语言种类
alter session set nls_language ='AMERICAN' ;--当时有效,SIMPLIFIED CHINESE
--在bash_profile中可永久修改

--数据库的语言
select * from NLS_DATABASE_PARAMETERS;
--实例的语言
select * from NLS_INSTANCE_PARAMETERS;
--当前会话的语言
select * from NLS_SESSION_PARAMETERS;

-----------------------------------------------------------------------
--监听:lsnrctl service;
-----------------------------------------------------------------------
--压缩表
/*
块内相同的数据只存一次，建立表的时候最好是排序
大的静态表(数据很少改变)压缩存储，能省大量空间，提高I/O效率,
但是动态表不适合做压缩处理
*/
select * from scott.t1;
conn scott/tiger;
create table t2 compress as select * from t1 order by ename;
create table t3 as select * from t1;
--查看这两张表有多少块
select segment_name,blocks from user_segments where segment_name in ('T3','T2');

--移动表至其他表空间
alter table t3 move tablespace users;
--行迁移
alter table t1 enable row movement;
alter table t1 shrink space compact;
select num_rows,blocks,empty_blocks from tabs where table_name='T1';
-----------------------------------------------------------------------
--聚簇表cluster
/*
1 多张表经常因为某一列而进行关联查询，关联列很少被修改，
聚簇表将相互关联的表存到相同的block，减少block的占用
2 经常在某个表上进行完全搜索，不要建聚簇表
3 对block操作块越少越优化
*/
select * from emp a,dept b where a.DEPTNO=b.DEPTNO;
--建立聚簇表和索引
create cluster clu1(deptno number(2));--(size 1024)
-- 每个聚簇键值大约1024个字节，oracle会在数据块上设置每个块最多能放下多少个聚簇键值，8k的块7个
create index idx_clu1 on cluster clu1;
--聚簇表无法在簇索引建立之前使用,所以必须先建索引
create table cemp cluster clu1(deptno) as select * from emp;
create table cdept cluster clu1(deptno) as select * from dept;
select cluster_name,table_name from user_tables where cluster_name is not null ;
select rowid,deptno from cemp;
select rowid,deptno from cdept;
-----------------------------------------------------------------------
--IOT表，索引组织表：索引+表
/*
1 堆表数据无序，插入数据是哪里有空间哪里放
2 IOT表数据有序，但是对应用程序来说跟普通表妹有任何区别
3 IOT表节省了少量硬盘空间，降低了I/O，提高了内存使用率和工作效率
4 适用于 a 完全由主键组成的表 
        b 代码查找表，一般只会通过一个主键来访问一张表
        c 想让某些数据保证存放到某个位置上，或者希望数据a按某些特定顺序存放
pctthreshold 20 :指定一个数据块的百分比，当一行数据大于该尺寸的时候，将溢出列放入溢出段
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
keep buffer pool :缓存经常要查询的对象，又容易被默认缓冲区刷出去
recycle buffer pool : 存临时使用，不被经常使用的较大的对象

*/
show parameter db_keep_cache;
-----------------------------------------------------------------------
/**
分区表:range,list,hash,compsite 
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
