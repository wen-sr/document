-- 冷备份的执行步骤
-- 1。一致性(consistent)停止数据库（shutdown immediate）
-- 2。拷贝数据文件，控制文件，日志文件
--密码文件，参数文件，临时文件（可选）【将oradata目录下和dbs目录下的文件拷贝】
-- 也可以将文件打包
-- tar -cvf abc.tar * 将所有文件压缩到bac.tar下
-- tar -xvf abc.tar 解压
-- tar -zcvf abc.tar.gz * 
-- tar -zxvf abs.tar.gz
-- tar -tf abc.tar 查看abc.tar的内容
-- tar文件只是把多个文件或文件夹打包合成一个文件，本身并没有进行压缩。
-- gz是进行过压缩的文件。
--将该目录下的所有文件拷贝到当前目录，如下命令
--cp -R /u01/app/oracle/oradata/archDemo/ .

-- 3。启动数据库
-- 书写冷备份脚本
set feedback off heading off verify off trimspool off 
set pagesize 0 linesize 200
define dir='/tmp/coldbackup'
define ws='/tmp/ws.sql'
spool $ws  
select '!cp '||name||' &dir' from v$datafile
union all
select '!cp '||name||' &dir' from v$controlfile
union all
select '!cp '||name||' &dir' from v$tempfile
union all
select '!cp '||member||' &dir' from v$logfile;
spool off
shutdown immediate
@&ws
startup


--恢复(归档模式下才能做完全恢复【complete recovery】),只有当损坏的是系统表空间，undo表空间，整个数据库文件的时候必须在数据库closed的状态下恢复，其他情况都可以在open下恢复
-- 将新的磁盘挂载到一个新的用来存放数据文件的目录（newd）下，或者命名为原来存放数据文件的文件夹名字，然后将备份好的文件拷贝到该目录下，将数据库启动到mount下，修改参数文件和控制文件的信息，将控制文件，数据文件的正确位置写入到对应的文件中
--1 修改参数文件
create pfile from spfile;
--2 修改控制文件
select * from v$datafile;
alter database rename file '' to '';
--3 如果redo文件没有备份，可以用如下命令重新生成redo文件
recover database until cancel using backup controlfile;
alter database open resetlogs;
--4 如果目录跟之前的目录名一致，则restore文件后只需要恢复v$recover_file中的文件
select * from v$recover_file;
recover database;
recover datafile 3;
--5 如果在数据库open的时候数据文件发生损坏（或者数据库文件损坏后急需对外工作必须马上open，可以先将该损坏文件offline，再open数据库）则在restore（可用冷备文件也可以用热备文件）文件后，需要将该损坏的文件offline，然后进行recover命令操作
select * from v$recover_file;
alter database datafile 6 offline;
recover datafile 6;
alter database datafile 6 online;
--6 在没有备份的情况下，数据文件损坏，在归档日志文件和redo logfile全部存在，且损坏的文件不是系统表空间的文件的前提下可以恢复全部存在，且损坏的文件不是系统表空间的文件的前提下可以恢复
alter database datafile 7 offline;
alter database create datafile '/u01/oradata/archDemo/app_1.dbf';--或者
alter database create datafile '/u01/oradata/archDemo/app_1.dbf' as '/u01/ora/archDemo/app_1.dbf';
recover datafile 7;
alter database datafile 7 online; 

