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