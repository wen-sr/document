Alter tablespace  WH1_DATA 
add datafile '/oracle/oradata/PRD1/WH1DAT1.DBF'
size 100M autoextend on next 500M maxsize 10000M

--查看表空间
select tablespace_name,file_name,ceil(bytes/1024/1024) mb from dba_data_files order by 1 ;

数据文件的自动扩展
select FILE_NAME,AUTOEXTENSIBLE,MAXBLOCKS,
INCREMENT_BY from dba_data_files;
改为自动扩展
alter database datafile 'D:\ORACLE\ORADATA\O10\TS1.1'
autoextend on next 1m maxsize 100m;
改为手工扩展
alter database datafile 'D:\ORACLE\ORADATA\O10\TS1.1'
Autoextend off;
表空间只读
Alter tablespace users read only;

Offline表空间
alter tablespace users offline;

在线
alter tablespace users online;

select TABLESPACE_NAME,SEGMENT_NAME,EXTENT_ID,BLOCKS
from dba_extents
where SEGMENT_NAME='EMP';

--移动表空间
Alter table t1 move tablespace users;