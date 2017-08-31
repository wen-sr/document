--将control file 备份成文本文件
alter database backup controlfile to trace as '/u01/backup/c.trc';
--可以根据这个trc脚本分noresetlogs和resetlogs两种情况制作脚本进行重构控制文件
--在还没启动数据库的情况下执行c1脚本
@/u01/backup/c1.sql

--使用之前备份的老的控制文件进行恢复
--1 将老的控制文件按照参数文件的目录进行restore
--2 启动数据库到mount状态
--3 执行recover database using backup controlfile until cancel;
	--如果在上次备份控制文件之后，数据库的结构发生过改变,在归档日志中不存在需要的文件，则需要尝试用某一个redo log文件进行恢复，如果没有redolog文件，则输入cancel进行不完全恢复，如果有新的表空间和新的文件需要使用alter database rename file 'UNNAMED..'   to '/u01/....';
--4 打开数据库
alter database open resetlogs;
