--1
alter tablespace users begin backup
--2 
!cp ...users.dbf /tmp/hb
--3
alter tablespace users end backup

--backup mode 下：1 发生checkpoint 2 SCN号冻结，被标记 3 在此期间发生改变时，改变的整个数据块记录在redo log文件或归档文件中

--当进行热备过程中发生突然断电的情况，重新启动数据库至mount时报错时，执行下面语句，会发现有文件处于active状态
select * from v$backup;
--此时需要将热备状态结束才能启动数据库
alter database end backup;
alter database open;

--read-only表空间的备份
alter tablespace example read only ;
! cp ....example.dbf /tmp
alter tablespace example read write;

--控制文件的备份
alter database backup controlfile to '/tmp/hb/c.ctl';

 