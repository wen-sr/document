--日志文件
select * from v$logfile;
select * from v$log;
select * from v$log_history;
alter system switch logfile;
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