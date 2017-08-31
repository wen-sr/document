--连接到rman必须以最高用户
--在操作系统下运行
rman target sys/oracle nocatalog
show all;
--命令以分号结束,Report告诉我们应该做什么
report schema;

--告诉我三天以上没有备份的文件
report need backup days 3;

--List，告诉我门已经有什么了,这是一对命令,一个告诉我们应该做什么,一个告诉我们已经存在了什么.
list copy of datafile 6;
list backup of datafile 9;

--备份前将控制文件和参数文件自动备份打开，并设路径
RMAN> configure controlfile autobackup on;
RMAN> configure controlfile autobackup format for device type disk to '/u01/backup/archDemo/ctl_%F';
--还原参数rman默认设置
configure controlfile autobackup clear;

--可以备份整个数据库，也可以按表空间，数据文件分别备份
backup tablespace users format='/u01/oracle/backup/archDemo/df_%U';

backup database format='/u01/oracle/backup/archDemo/df_%U';

backup datafile 4 include current controlfile;

--backup controlfile
RMAN>backup current controlfile format='/u01/backup/archDemo/controlbk.ctl';
RMAN> sql "alter database backup controlfile to ''/u01/backup/archDemo/control.ctl''";

--backup server parameter file ,控制文件和spfile会一起备份
backup spfile format='/u01/backup/archDemo/%U';

--备份归档日志，delete all input 表示归档完就删除掉原来的归档日志
RMAN> backup archivelog all format='/u01/backup/archDemo/arc_%U' delete all input;
--一条语句备份数据文件和归档日志
backup database plus archivelog format='/u01/backup/archDemo/arc_%U';

--也可以执行程序块，指定备份piece最大100M，每个backupset最多包含3个文件
RMAN> run{
2> allocate channel c1 type disk maxpiecesize=100M;
3> backup tablespace system format '/u01/backup/archDemo/df_%U' filesperset = 3;
4> }

--删除备份,可以指定bs号删除，也可以删除所有
delete backupset;
delete backupset 1,2,3,4;

--增加并发度
CONFIGURE DEVICE TYPE DISK PARALLELISM 3 BACKUP TYPE TO BACKUPSET; 

--多路备份
backup copies 2 datafile 1 '/u01/b1/b1_%U','/u01/b2/b2_%U'

--image copy ,等同于冷备,list copy;
copy datafile 5 to '/u01/backup/archDemo/df5.dbf',datafile 3 to '/u01/backup/archDemo/df3.dbf';

--增量备份：差异性备份（differential,备份<=n级的增量）,累积性备份（cumulative，备份<=n-1级的增量）
RMAN> backup database incremental level 0 format='/u01/backup/archDemo/l0_%U';
RMAN> backup database incremental level 1 format='/u01/backup/archDemo/l1_%U';
RMAN> backup database incremental level 2 cumulative format='/u01/backup/archDemo/l0_%U';
--备份计划：
-- sun:lev 0
-- mon:lev 2
-- tue:lev 2
-- wed:lev 1c
-- thu:lev 2 
-- fri:lev 2 
-- sta:lev 2 
-- sun:lev 0

--优化，在oracle10g之后，提供将数据块更改的信息写入到一个文件中，使得在做增量备份的时候大大的提高速度，但是同时平常使用oracle的速度就会变慢
alter database enable block change tracking using file '/tmp/track.log';

--noarchivelog 下的备份，需要在mount下执行
backup database format='/u01/backup/archDemo/%U';

--tag 标记，手动指定标签在backup命令最后加上tag=''
backup spfile format='/u01/backup/archDemo/%U' tag='mybk';

--视图
-- V$ARCHIVED_LOG
-- • V$BACKUP_CORRUPTION
-- • V$COPY_CORRUPTION
-- • V$DATABASE_BLOCK_CORRUPTION
-- • V$BACKUP_DATAFILE
-- • V$BACKUP_REDOLOG
-- • V$BACKUP_SET
-- • V$BACKUP_PIECE
-- V$PROCESS
-- V$SESSION
-- V$SESSION_LONGOPS

--rman 工作的监控
SELECT sid, spid, client_info
FROM v$process p, v$session s
WHERE p.addr = s.paddr
AND client_info LIKE '%id=rman%';


--rman恢复
rman target sys/oracle 
--startup mount 
restore database;
recover database;
alter database open;

--如果需要restore到一个新的目录下
run{
set newname for datafile 7 to '/u01/backup/archDemo/app.dbf';
restore database;
switch datafile all;
recover database;
alter database open;
}

--恢复表空间或datafile,如果需要修改tablespace的名字，需要使用set newname命令
run{
sql "alter tablespace users offline";
restore tablespace users;
recover tablespace users;
sql "alter tablespace users online";
}

--不完全恢复
RUN {
ALLOCATE CHANNEL c1 TYPE DISK;
ALLOCATE CHANNEL c2 TYPE DISK;
SET UNTIL TIME  "to_date('2001-12-09:11:44:00','yyyy-mm-dd:hh24:mi:ss')";
--SET UNTIL SEQUENCE 120 THREAD 1;
RESTORE DATABASE;
RECOVER DATABASE;
ALTER DATABASE OPEN RESETLOGS; 
}


--retention Policy :保留政策，将旧的备份集标记为过期
CONFIGURE RETENTION POLICY TO REDUNDANCY 2;--保留2份备份文件为有效
CONFIGURE RETENTION POLICY TO recovery window of 7 days;--保留7天之内的备份文件为有效
CONFIGURE RETENTION POLICY TO none;--不使用retention policy，所有文件有效
change backupset 12 keep forever nologs;--手动保留，不收retention policy 影响
change backupset 12 until 'sysdate+60';
DELETE OBSOLETE;--obsolete:不需要了
--CROSSCHECK BACKUPSET OF DATABASE;交叉检查备份集
crosscheck backupset of database;
DELETE NOPROMPT EXPIRED BACKUP OF TABLESPACE users;
delete expired;--未找到或已损坏
--手动将backupset 12 置为不可用
change backupset 12 unavilable;
