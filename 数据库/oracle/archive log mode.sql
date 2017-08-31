-- 1 查看归档参数
archive log list
Database log mode	       No Archive Mode
Automatic archival	       Disabled
Archive destination	       USE_DB_RECOVERY_FILE_DEST
Oldest online log sequence     5
Current log sequence	       7

oracle 默认的归档目录为参数DB_RECOVERY_FILE_DEST设定的目录
show parameter DB_RECOVERY_FILE_DEST;
db_recovery_file_dest string /u01/app/oracle/flash_recovery_area
默认为flash recovery area(该参数在参数文件中设置)的路径，里面存放有归档日志、闪回日志以及rman的备份文件等文件

修改默认归档路径：
alter system set log_archive_dest_1='location=/u01/app/oracle/oradata/archDemo/archive_log' scope=both;
alter system archive log current;--手动归档
设回系统默认的路径：
alter system archive log current;
alter system set log_archive_dest_1='' scope=both;
alter system arvhive log current; 

参数设置完毕之后，将数据库修改为归档模式步骤如下：
1 shutdown immediate
2 startup mount
3 alter database arvhivelog
4 alter database open
5 full database backup 


查看归档目录
select * from v$archive_processes;
select * from v$archived_log;
Select * from v$log;
如果归档进程报错
archive log stop;
archive log start;
--手动归档
alter system archive log current;


关闭归档
alter database noarchivelog;
