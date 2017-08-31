----------------------------------------------------------------------------------------
Oracle Server consits Oracle instance(memory and background process) and Oracle database(files文件) 
user process:用户链接数据库的进程
server process：处理客户链接的进程
用户进程执行sql语句：用户进程跟服务器进程建立连接，oracle分配server process处理此链接，把该用户进程的信息存储到PGA的UGA中，语句经过PGA处理后传递给实例，实例中的共享池负责缓存、处理这条语句，数据库缓存区去判断语句如何分析（软分析，硬分析），根据cbo得到的执行计划准备执行语句，查询语句中的对象存放在表空间的指定的行放在哪个块里面的，数据字典缓存区得到这些信息，开始执行，判断在数据缓存区data buffer cache中是否缓存需要d块，如果是在内存读数据得到需执行的结果返回给用户，如果不是，则服务器进程把块从磁盘读入到data buffer cache缓存下来。undo缓存块会对该块做镜像，然后读镜像中的数据得到行的结果，返回给用户。

files：datafiles  control files   redo log files  parameter file  password file   archived log files  
查看SGA：show sga;
--granules : sga的基本单位
select component,granule_size from V$SGA_DYNAMIC_COMPONENTS;
----------------------------------------------------------------------------------------
ps -ef | grep oracle :查看后台进程
ipcs ： 查看内存使用
env | grep ORACLE:查看环境变量
Strings spfileSID.ora | grep -i db_block_size; -i:查找时不区分大小写
----------------------------------------------------------------------------------------
Manage a oracle server 
1 parameter file(initSID.ora,spfileSID.ora) :startup -> 读取参数文件spfile -> control files -> datafiles 
  create pfile from spfile;
  create spfile from pfile;
  查看二进制文件strings spfileSID.ora | more;
  修改spfile文件：alter system set parameter = value comment='text'(注释) scope = memory|spfile|both(default) sid=sid ;
  数据表：desc v$parameter;select * from v$parameter;
  指定用pfile启动：startup pfile = $ORACLE_HOME/dbs/initSID.ora;
2 数据库启动
  startup restricted;
  alter SYSTEM enable RESTRICTED session; 受限状态，只有有权限的用户才能链接进来
  alter system open;
  数据字典：desc v$session;
  select sid,serial#,username from v$session;
  alter system kill session 'sid,serial#';--将用户T掉
  问题：如何找出某一个用户准确的sid和serial#?
3 diagnostic file 
  alertSID.log file : background_dump_dest
  background trace files 
  user trace files 
----------------------------------------------------------------------------------------
DD数据字典
col member format a50;设定member占50个字符 
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
参数文件：
select distinct isspecified,a.* from v$spparameter a;
ISSPEC
------
TRUE
FALSE
因为上面的选择有true,所以这个数据库使用的是二进制参数文件.我们修改参数要使用命令而不是编辑
文件,千万不要编辑二进制参数文件,你编辑以后会报ora-00600的错误
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
增加控制文件
1 首先shutdown数据库（这样才能保证复制出来的控制文件不会再变化）
2 拷贝新的控制文件到相应的目录下
3 创建pfile修改参数，在controlfile部分加入新的目录，或者使用alter system 命令修改
4 创建新的spfile，启动数据库
语句如下：
col name for a60
select status,name from v$controlfile;
shutdown immediate

减少控制文件
1 修改参数文件或使用alter system命令修改control_files参数，并验证
2 重启数据库
语句如下：
show parameter control
alter system set control_files='/u01/app/oracle/oradata/wensr/control01.ctl','/u01/app/oracle/flash_recovery_area/wensr/control02.ctl'
--验证参数文件已经修改
select name,value from v$spparameter where name='control_files';
startup force
--验证内存被修改了
select name from v$controlfile;
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
联机重做日志文件 ： Maintaining Online Redo Log Files 

checkpoint : a checkpoint is the writing of dirty(modified) blocks from the buffer cache to disk 
--强制发生checkpoint
FAST_START_MTTR_TARGET = 600;--每600秒发生一次checkpoint
alter system CHECKPOINT;

alter system switch logfile;--强制切换redo log 文件

--日志文件
select * from v$logfile;
select * from v$log;
select * from v$log_history;
--增加日志文件组
alter database add logfile group 9 '/u01/app/oracle/oradata/wensr/redo09.log' size 5m;
--增加成员（初始状态为INVALID）
alter database add logfile member '/u01/app/oracle/oradata/wensr/redo09b.log' to group 9;
  或者
  alter database add logfile group 10 ('/u01/app/oracle/oradata/wensr/redo10a.log','/u01/app/oracle/oradata/wensr/redo10b.log') size 5m;

--删除成员（删的不能是current和active组，删完后物理文件还在，不能删除组里面的最后一个成员）
alter database drop logfile member '/u01/app/oracle/oradata/wensr/redo09.log';
--格式化组（删除文件重新生成,相当于重新初始化组，当组发生损坏的时候可以使用）
alter database clear logfile group 9;
--日志文件的改名（需要先查看状态，确认不是current和active,cp新的文件名,需要新的文件名已存在才能执行）
alter database rename file '/u01/app/oracle/oradata/wensr/redo09b.log' to '/u01/app/oracle/oradata/wensr/redo09a.log';

--删除组（不能删除当前组）
alter database drop logfile group 9;

--SCN：system change number,stop scn (非正常关机，开机后stop scn会被设置为最大值)
select CURRENT_SCN from v$database;--38908048061
select * from v$log_history;

--归档(待续)
  --查看是否为归档模式
select * from v$instance;
select * from v$database;
archive log list;

--Redo logfile 的配置
multiplexed : 多路复用，将同一个组的不同成员放在不同的磁盘上，只要一个组中还有一个成员可用，这个组即可正常运行
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
表空间和数据文件

默认表空间(v$tablespace)
select property_value from database_properties where PROPERTY_NAME='DEFAULT_PERMANENT_TABLESPACE';
alter database default tablespace users;
alter user scott default tablespace users;
--表空间组
alter tablespace temp2 tablespace group group1;
alter user scott temporary tablespace group1;
--查看表空间是否产生日志
select tablespace_name,logging,force_logging from dba_tablespaces;
create tablespace  ...... nologging  | force logging;
alter tablespace user1 logging | force logging | nologging; 

--创建表空间
create tablespace ts1 datafile '/u01/app/oracle/oradata/wensr/ts1.dbf' size 2m;
--临时表空间（不永久存放数据）
create temporary tablespace temp2 tempfile '/u01/app/oracle/oradata/wensr/temp2.dbf' size 20m;
create temporary tablespace temp2 tempfile '/u01/app/oracle/oradata/wensr/temp2.dbf' size 20m tablespace group group1;
--指定默认tempspace
alter database default Temporary tablespace temp;
select * from V$tablespace;
select * from database_properties;
select * from v$tempfile;
select * from DBA_TEMP_FILES;
--undo表空间（暂时存放需要update的历史数据）
select * from dba_tablespaces;
--重用表空间
create tablespace ts1 datafile '/u01/app/oracle/oradata/wensr/ts1.dbf' size 2m reuse;
--readonly 表空间
alter tablespace ts1 READ Only;
alter tablespace ts1 READ write;
--修改表空间名
alter tablespace ts2 rename to ts1;
--修改表空间大小（不能小于原有数据的大小）
  --查看表空间的使用情况
  select * from Dba_Data_Files;
  select * from Dba_Free_Space;
alter database datafile 8 resize 5m;
--增加文件
alter tablespace ts1 add datafile '/u01/app/oracle/oradata/wensr/ts1a.dbf' size 2m;
--自动扩展表空间
select file_id,file_name,autoextensible,maxblocks,increment_by from dba_data_files;
alter database datafile 8 autoextend on next 1m maxsize 100m;
alter database datafile 8 autoextend off;
--不能删除唯一的文件，不能删除第一个文件，要删除只能将整个表空间删除
alter tablespace ts1 drop datafile '/u01/app/oracle/oradata/wensr/ts1a.dbf';
--删除表空间
drop tablespace ts1 (including contents and datafiles);
--连线，断线
alter tablespace ts1 online;(offline)
--大文件表空间（只能有一个数据文件）
select tablespace_name,bigfile from dba_tablespaces;
--创建
create bigfile tablespace bigts datafile '/u01/app/oracle/oradata/wensr/bigts.big' size 2m;
--extend的管理方式
--本地管理local:自治区(推荐)
--字典管理dictionary：中央集权
--段管理
create tablespace ................... segment management auto | manual;

数据文件(dba_data_files)
--system表空间（最重要，不能offline），包含数据字典的基表，包，函数，视图，定义等
--sysaux表空间（系统辅助表空间，分摊一些应用程序的数据的存放）
--数据表空间（用户存放数据的表空间）
select tablespace_name,FILE_ID,file_name,ceil(bytes/1024/1024) mb from DBA_DATA_FILES order by 1; 
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
逻辑结构 block-> extent-> segment(table,index) ->datafile ->tablespace ->database
select tablespace_name,segment_name,extent_id,block_id,blocks from dba_extents where segment_name='EMP';
--block块
Strings spfileSID.ora | grep -i db_block_size; -i:查找时不区分大小写
show parameter db_block_size;
show parameter db_cache_size;
alter system set db_4k_cache_size=4k;
--创建指定blocksize大小的表空间
create tablespace t4k datafile '/u01/app/oracle/oradata/dd.dbf' size 2m blocksize 4k;
--数据字典
desc dba_tablespaces;
select * from dba_tablespaces;
select * from Dba_Extents;
select * from Dba_Segments;
select * from User_Segments where segment_name='T1'; 
--HWM high water mark 高水位线，是使用过或之前使用过现在已删除和未使用过的块的分界线，Freelist空闲列表，在hwm下
辅助理解的例子：零钱（已使用的block的空余空间）-->活期账户（之前使用过现在已delete的block）-->定期大额账户（还未使用过的block）
set autotrace on/off stat;--将后台追踪打开
select count(*) from t1;
 -------------------------------------
插入100W条记录，然后删除所有数据，用来测试HWM，可以发现数据删除后数据库查询的数据块没有改变，如果用truncate，则HWM回到最开始的地方
 begin
 for i in 1 .. 1000000
  loop 
    insert into t1 values(i);
  end loop;
  commit;
 end;
 /
 ---------------------------------
 --pctfree 预留空间，pctsued使用率
create table t1 (name varchar2(20)) tablespace system pctfree 20 pctused 30;
insert into t1 values('LiM');
select table_name,pct_free,pct_used,freelists,Ini_Trans,Max_Trans from user_tables where table_name='T1';
select * from user_tables where table_name='T1';
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

segment 的管理方式
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
--创建undo表空间
create undo tablespace undo1 datafile '/u01/oradate/undo1.dbf' size 20M;
--修改undo表空间
alter tablespace undo1 add datafile '/u01/oradate/undo2.dbf' size 20M;
--修改默认表空间
alter system set undo_tablespace=undotbs2;
-- 删除(非activee状态)
drop tablespace undotbs2;
--数据字典
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
----------------------------------------------------------------------------------------

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
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
数据完整性data integrity
--not null,unique,primary key,foreign key,check 
constraint ck_bonus check (bonus > 0);
alter table tt add constraint ck_bonus check (bonus > 0 );
alter table drop constraint ck_bonus;

----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
数据导入：
1
insert /*+ APPEND*/ into emp select * from t_employees;
注：这种方式（直接在高水位之上插入数据）插入数据后commit之前进行查询将会报错

2 SQL*Loader 工具
alter session enable parallel DML;

-----------------------------------------------------------------------
-----------------------------------------------------------------------
ORACLE 网络
Listener配置($ORACLE_HOME/network/admin)：
修改oracle用户的display，用图形界面配置：export DISPLAY=141.168.40.188:0.0
listener name:
port:
protocols:
sid name:
host name:

动态注册(不需要listener.ora文件)
在spfile文件中配置instance_name和service_names
show parameter service
alter system set service_names='wensr' scope=spfile;
show parameter instance
alter system set instance_name='wensr' scope=spfile;


shared server process (对应的为dedicated server process)
优点：
1 减少了数据库实例的进程数量
2 增加了可链接的用户的数量
3 实现了负载均衡
4 减少了空闲服务器进程的数量
5 减少了内存的使用和系统资源的花销

配置共享服务器：设置：DISPATCHERS,SHARED_SERVERS
参数文件中没有配置dispatchers参数时，不能使用alter system set dispatchers 命令修改，只能修改spfile文件，在spfile文件中加入
*.DISPATCHERS="(PROTOCOL=TCP)(DISPATCHERS=2)(PROTOCOL=ICP)(DISPATCHERS=1)";
加入此行后才可以使用alter system set 命令


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
