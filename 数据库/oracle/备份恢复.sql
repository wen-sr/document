----------------------------------------------------------------------------------
--全备whole database backup
/*
备份所有的数据文件和控制文件
*/
--部分备份partial database backup
/*
tablespace/datafile/control file
*/
--一致性备份consistent backups
--inconsistent backups
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
archive log list;
/*
开归档
startup mount;
alter database archivelog;
alter database open;

*/
--目的地址：闪回区，闪回去最大2G，把地址设在这很容易满
archive destination:use_db_recovery_file_dest ;
--修改地址
show parameter archive;
alter system set log_archive_dest_1='LOCATION=$ORACLE_BASE/oradata/wensr/archive';
--手动切换归档
alter system archive log current;

alter system switch logfile;

select 'alter tablespace '|| tablespace_name ||' begin backup;' from dba_tablespaces;
alter database backup controlfile to '/oracle/ctl.bak';
alter database backup controlfile to trace;
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--rman 备份
rman target sys/oracle@wensr nocatalog
rman target / as sysdba
--分配channel
run {
  allocate channel c1 TYPE disk
    FORMAT = '/u01/backup/userbak.bak';
  backup datafile '/db01/oradata/users01.dbf';
}
--写入rman log,指定rman产生 的日志写入到文件中
log $HOME/ORADATA/u03/rman.log append
--rman一起动就执行脚本
log $HOME/ORADATA/u03/rman.log append @'$HOME/STUDENT/LABS/my_rman_script.rcv'


--here document 
#!/bin/bash

rman target sys/oracle nocatalog <<!
show all;
exit;
!
--rman 常用命令
configure channel device type disk format  '/db01/backup/%U';
configure controlfile autobackup on;
configure controlfile autobackup clear;

list backup of database;
list backup of datafile "/db01/ORADATA/db.dbf"
list backup of tablespace "wh11_data"

report schema;


--rman要点
/**
两种方式，image copy 和 backup sets
1 非常耗资源：shared memory, more processes
show parameter process;
alter system set processes=300 scope=spfile;
2 需要sysdba权限
3 远程连接操做需要密码，密码文件要备份
4 字符集设置
5 必须mount 或 open 
6 only clean backups are usable in noarchivelog mode,只能用image copy，不能增量备份
7 backup sets 支持增量备份
*/

--备份语法
--backup database
backup database format '/u01/backup/md_%U';
sql 'alter system archive log current';
run {
  allocate channel t1 device type disk
  MAXPIECESIZE =4G
  BACKUP 
    FORMAT '/u01/backup/df_%t_%s_%p' FILESPERSET 3
    (tablespace users);
}
--删除备份集(备份集的编号)
delete backupset 1,2,3 

--backup datafile ,tablespaces ,controlfile ,spfile ,archivelog files
select file#,name from v$datafile;
backup datafile 6 format '/u01/backup/bk_%U';
backup datafile '/u01/app/oracle/oradata/wensr/wh11.dbf' format '/u01/backup/bk_%U';
--tablespace
select tablespace_name,contents from dba_tablespaces;
backup tablespace ts1,wh11_data format '/u01/backup/ts_%U';
--controlfiel 
configure controlfile autobackup on;
configure controlfile autobackup format for device type disk to '/u01/backup/ctl_%F';

backup current control file;

backup datafile 4 include current controlfile;

sql "alter database backup controlfile to ''/u01/backup/wensr.bin''";

--spfile
backup spfile format '/u01/backup/sp_%U';
--archivelog files
/*
1 run the alter system archive log current command
2 run the bacup archivelog all command
3 backup the rest of the datafiles specified by the backup database command
4 run the alter system archive log current command 
5 backup the new archive logs generated during the backup operation
*/
backup archivelog all format '/u01/backup/ac_%U' delete all input;

backup archivelog sequence between 99 and 199 thread 1 delete input;

backup archivelog from time "sysdate-15" until time "sysdate-7";

backup database plus archivelog format '/u01/backup/bk_%U';

--并发parallelization of backup sets
run {
  allocate channel c1 type disk;
  allocate channel c2 type disk;
  allocate channel c3 type disk;
  backup
    incremental level = 0
    format '/u01/backup/p_%U'
    (datafile 1 channel c1 tag='sys')
    (datafile 3 channel c2 tag='aux')
    (datafile 2,4,5 channel c3 tag='other' );
  sql 'alter system archive log current';
}

--copies
backup copies 2 datafile 6 format '/u01/backup/b1_%U','/u01/backup/b2_%U';

--Image copies
/*
只能拷贝到磁盘上，可以直接使用不用restore
*/
copy datafile 6 to '/u01/backup/c_%U' tag='wh11';

--增量备份 incremental backups(differential incremental backups,cumulative incremental backups )
run{
  allocate channel d1 type disk;
  backup incremental level 0 database format '/u01/backup/l0_%U';
  }
  
run{
  allocate channel d1 type disk;
  backup incremental level 1 database format '/u01/backup/l1_%U';
  }

run{
  allocate channel d1 type disk;
  backup incremental level 1 cumulative database format '/u01/backup/l1c_%U';
  }

--记录block产生的变化,可以提高增量备份的速度，但是会增加数据库日常运行的负担
alter database enable block change tracking using file '/u01/track.bin'
alter database disable block change tracking

--非归档下的备份
/*
1 ensure sufficient space for the backup
2 shutdown using the normal or immediate clause
3 mount the database 
4 allocate multiple channels if not using automatic
5 run the backup command 
6 verify that the backup is finished and cataloged
7 open the database for normal use
*/
--tags for backups
list backup tag='AUX';  

--RMAN dynamic views
v$archived_log 
v$backup_corruption
v$copy_corruption
v$database_block_corruption
v$backup_datafile
v$backup_redolog
v$backup_set 
v$backup_piece

--monitoring rman backups
select sid,username,client_info from v$session;
/*
*/
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--rman complete recovery 
noarchivelog rman 恢复
就是restore就可以了

archivelog rman 恢复
--启动到mount状态
startup mount 
restore database;
recover database;
alter database open;

--如果磁盘损坏，数据文件需要恢复到新的目录下
startup mount
run {
  set newname for datafile 7 to '/u01/app/oracle/007.dbf';
  restore database;
  switch datafile all;
  recover database;
  alter database open;
}

--按表空间/数据文件恢复,在数据库open下进行
run{
  sql 'alter database datafile 6 offline';
  restore datafile 6;
  recover datafile 6;
  sql 'alter database datafile 6 online'
}

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--rman incomplete recovery
rman 不完全恢复
/*
类型：(until 直到但不包括)
until time
until sequence
until scn
*/
run {
  allocate channel c1 type disk;
  allocate channel c2 type disk;
  set until time "to_date('2015-03-28:20:19:19','yyyy-mm-dd:hh24:mi:ss')";
  restore database;
  recover database;
  alter database open resetlogs;
}

run {
  set until sequence 120 thread 1;
  restore database;
  recover database;
  alter database open resetlogs;
}
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
user manager backup  (手工备份)
--冷备
/*
v$datafile
v$controlfile
v$logfile
dba_data_files
*/
1 noarchivelog model 
/*关闭数据库进行冷备，将datafiles 
control files 
redologfiles 
parameter file 
password file
拷贝
步骤： 1 shutdown immediate
      2 cp $ORACLE_HOME/dbs/spfilewensr.ora .
        cp $ORACLE_HOME/dba/orapwwensr .
        cp $ORACLE_BASE/oradata/wensr .
        tar cvf coldbackup.tar coldbackup/
      3 startup open;
*/
--生成冷备脚本
vi wb.sql
**********************************************************
set feedback off heading off verify off trimspool off
set pagesize 0 linesize 200
define dir='/tmp/wb'
define ws='/tmp/ws.sql'
spool &ws
select '! cp ' || name || ' &dir' from v$datafile order by 1;
select '! cp ' || member || ' &dir' from v$logfile order by 1;
select '! cp ' || name || ' &dir' from v$controlfile order by 1;
select '! cp ' || name || ' &dir' from v$tempfile order by 1;
spool off
shutdown immediate
@&ws
startup
**********************************************************

--热备(必须要archivelog mode) can be done at a tablespace or datafile level
/*
热备
1 数据库需要处于归档模式
2 数据库打开的状态下，可以进行表空间、数据文件的备份
3 归档对数据库的性能还是有一定影响的
4 归档下可以不去丢失任何数据
*/
**********************************************************
alter tablespace users begin backup;
!cp $ORACLE_BASE/oradata/wensr/users01.dbf /backup/users01.dbf
alter tablespace users end backup;
alter system archive log current;--切换归档，备份归档日志文件，控制文件
**********************************************************
backup模式的工作原理
1 the tablespace is checkpointed ,所有的脏数据都写入了datafile中
2 datafile文件头中的checkpoint SCN 不在增加
3 当某个数据块的数据改变了，这个块的所有数据都写入redo中
--实验
select file_name,tablespace_name from dba_data_files;
create user u1 identified by oracle default tablespace ts1;
grant connect,resource to u1;
conn u1/oracle;
show user;
create table fruit(name varchar2(32));
insert into fruit values('orange');
--查fruit所在的块
select dbms_rowid.rowid_block_number(rowid) blk,name from fruit;//148
show parameter blocksize;
--从147块读取两个块
dd if=ts1.dbf ibs=8192 skip=147 count=2 | strings 
alter tablespace ts1 begin backup;
update fruit set name='apple';
alter system checkpoint;
--更改后，继续查看，可以看到apple已经写入了datafile
dd if=ts1.dbf ibs=8192 skip=147 count=2 | strings 
alter tablespace ts1 end backup;

--查看哪些文件正处于begin backup状态
select * from v$backup;
/*
如果在begin backup时，突然断电，重启时将会报错
，需要在mount时将该文件end backup
如：alter database end backup; 
alter database datafile 3 end backup;
*/


--只读表空间的备份
--1 将表空间置于read only 状态
alter tablespace ts1 read only;
--2 将datafile拷贝走就行了,同时备份控制文件
--3
alter tablespace ts1 read write;

--控制文件的备份
alter database backup controlfile to '/tmp/control01.ctl';
alter database backup controlfile to trace as '/tmp/c2.ctl';

--参数文件的备份
create pfile from spfile;

--DBverify 工具检查数据文件是否有损坏
dbv file=/u01/app/oracle/oradata/wensr/ts1.dbf feedback=100;

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--user managed complete recovery 
noarchivelog mode （手工完全恢复）
/*
1 restored datafiles
2 redo applied
3 database containing committed and uncommitted transactions
4 undo applied
5 recovered database 

在非归档下，一个文件损坏，需要restore所有数据文件、控制文件，不需要做recovery动作，
数据只能恢复到最后一次冷备下的数据，没有备份的数据将会丢失

如果磁盘损坏，需要将备份文件考到其他的路径下，
需要增加磁盘和修改spfile文件controlfile 的路径信息和控制文件中datafile、redolog file、temp file的路径信息

修改spfile需要理由pfile
修改controlfile 需要在mount状态下，利用
select file#,name from v$datafile;
alter database rename file '/u01/app/oracle/oradata/wensr/system01.dbf' 
to '/u01/app/oracle/oradata/md/system01.dbf'

select file#,name from v$tempfile;
select group#,member from v$logfile;

如果没有备份redo log file,恢复的时候，需要重新产生redo log file
startup mount 
recovery database until cancel using backup controlfile;
cancel
alter database open resetlogs;
*/


--user manage complete recovery  archivelog mode 完全恢复
/*
归档下，只需要恢复损坏的那个文件就可以了，其他没损坏的不需要动
*/
--查看需要恢复的文件
select * from v$recover_file;
--查看alert文件
tail -f /u01/app/oracle/diag/rdbms/wensr/wensr/trace/alert_wensr.log

--*database closed 下恢复命令
--1 将备份的文件restore,set autorecovery on/off;
--2 mount状态（redo 和archivelog 必须完整）
recovery database; 
--或
recover datafile 1;
recover datafile 2;
--3 alter database open;

--**database open 下恢复命令
--1先将损坏的数据文件下线offline
alter database datafile 6 offline;
--2 cp 备份好的文件
--3 进行恢复
recovery datafile 6;
--4 将恢复后的文件上线online
alter database datafile online;

--***在database关闭下，hardware failure 硬件损坏，需要在open下恢复
--1 starup mount 
--2 将损坏的文件下线
alter database datafile 6 offline;
--3 alter database open;此时只有不涉及到datafile，数据库正常运行
--4 cp 备份好的datafile 6
--5 恢复
recovery datafile 6;

--****数据文件丢失而且没有备份（不能是系统文件）
/*
此时能恢复的条件:
1 所有的归档日志文件都存在
2 控制文件包含损坏的数据文件的名字
3 损坏的文件不能是系统表空间的文件
*/
--1 将损坏的文件下线
alter database datafile 6 offline;
--2 创建一个空白的文件
alter database create datafile '/u01/app/oracle/oradata/wensr/t1.dbf';
--3 恢复
recovery datafile 6;
--4 上线
alter database datafile 6 online;

--控制文件损坏的恢复
/*
需要重建控制文件的情况：
1 所有的控制文件都丢失
2 需要修改数据库的名字
3 需要修改控制文件内的信息
*/
--查看control file的scn号
select file#,checkpoint_change# from v$datafile;
--查看datafile的scn号
select file#,checkpoint_change# from v$datafile_header;

--利用之前备份的控制文件的trace文件(文本文件)重构控制文件
alter database backup controlfile to trace as '/tmp/c2.ctl';
--1 查看之前control file的trace文件c2.ctl,根据NORESETLOGS，RESETLOGS 两种情况执行c2.ctl里面的sql，生成sql脚本c1.sql
conn / as sysdba
@/tmp/c1.sql
--2 通过执行这个sql脚本，就能重建control file

--利用control文件的备份文件（二进制文件）进行恢复
alter database backup controlfile to '/tmp/control01.ctl';
--1 将备份的control file 拷贝到应该在的位置
--2 利用备份的老的control file 将数据库启动到mount状态，startup mount;
recover database using backup controlfile;
--3 如果有部分数据没有归档，需要使用redolog 文件
输入 /u01/app/oracle/oradata/wensr/redo01.log 尝试是否能恢复
如果有新的数据文件在备份的控制文件里面没有记录，在recover 时的报错信息会有提示正确的
文件名或查找alert日志文件将此文件的文件名找出来，将v$datafile 查出来的UNNAMED数据
文件rename成正确的文件名，然后再使用archivelog或redo进行恢复
--4 alter database open resetlogs;

--只读表空间的恢复
--*一般情况下
--1 restore
--2 recovery datafile 7

--**控制文件损坏了，重构了控制文件的情况下
在控制文件的备份trace文件里面有只读文件恢复的步骤

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
user managed incomplete recovery 
手工不完全恢复
/*
使用情况：
1 部分归档日志丢失
2 没有归档，数据文件丢失

类型
time-based recovery
cancel-based recovery
change-based recovery

步骤
1 shutdown and backup the database
2 restore all datafiles
3 mount the database 
4 recover the datafiles to a point before the time of failure 
5 open the database with resetlogs
6 perform a closed database backup
*/

--time-based recovery
--1 关闭数据库，将备份好的数据文件拷贝到相应的目录下
--2 startup mount 
--3 按时间恢复
recover database until time '2015-03-28:19:51:51';
--4 打开数据库
alter database open resetlogs;

--cancel-based recovery
--1 通过控制文件的trace文件的第二种方式（resetlogs）重建control file
--2 
recover database using backup controlfile until cancel
--3 
alter database open resetlogs;

--change-based recovery
recover database until change 2454343;
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--recovery catalog creation and maintenance
rman 恢复目录的创建和维护
/*
rman 不管使用不使用catalog，都会将rman备份的信息写入到目标数据库的控制文件中
如果每次使用rman都使用catalog数据库，那catalog数据库和control file
的信息一直是一致的，但是如果有的时候没用，那么需要手工同步control file和catalog数据库
命令：resync catalog
report schema;
list incarnation;

catalog的内容
1 datafile and archived redo log file backup sets and backup pieces
2 datafile copies
3 archived redo log files
4 the physical structure of the target database 
5 persistent RMAN configuration settings
6 stored job scripts
*/
--创建cata表空间
create tablespace cata datafile '/u01/app/oracle/oradata/wensr/catalog_01.dbf' 
size 1024m segment space management auto extent management local uniform;
--创建用户
create user cata identified by oracle 
default tablespace cata quota unlimited on cata;
--赋予权限
grant connect,resource to cata;
grant recovery_catalog_owner to cata;

--rman连接catalog数据库，并创建catalog
rman catalog cata/oracle@wensr
create catalog tablespace cata;

--连接目标数据库和catalog数据库，把目标数据库注册到catalog上
rman target sys/oracle@wensr
connect catalog cata/oracle@wensr
register database;

--store scripts
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--rman maintenance
rman 维护
--retention policy  保留策略
configure retention policy to 
1 recovery window of 7 days
2 redundancy 2;
3 none;

--crosscheck 检查rman记录的备份信息是否在磁盘上有对应的备份文件
crosscheck backup;
list backup;
/*
obsolete means not needed,expired means not found 
*/

--删除过期的备份
delete backupset 47;
delete obsolete;
delete expired backup; 
backup archivelog all delete input;
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
export and import utilities
/*
导出模式
1 table mode
2 user mode 
3 tablespace mode
4 full database mode
*/
--导出需要权限：grant exp_full_database to hr;
--可以使用通配符 如：tables=%p%
exp hr/hr tables=employees,departments rows=y file=exp.dmp log=exp.log full=y grants=y
exp system/oracle owner=hr direct=y file=expdat.dmp log=exp.log rows=n
--使用参数文件
exp hr/hr parfile=t.txt;

--字符集问题
desc NLS_DATABASE_PARAMETERS;
SELECT * from nls_database_parameters;
设置nls_language : NLS_LANGUAGE_NLS_TERRITORY_NLS.CHARACTERSET
eg:AMERICAN_AMERICA.ZHS16GBK
--在导入导出之前，将操作系统的字符集调整成和数据库一致
set nls_lang=AMERICAN_AMERICA.ZHS16GBK
--获得dmp文件的字符集
imp hr/hr show=y file=t.dmp;

--direct path 直接模式，比常规模式速度快:sql 进行了优化
direct=y

--imp 导入
grant imp_full_database to hr;
imp \'sys/oracle as sysdba \' fromuser=hr file=t.dmp touser=scott tables=(*) rows=y
----------------------------------------------------------------------------------
select * from user_objects;
