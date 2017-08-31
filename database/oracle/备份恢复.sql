----------------------------------------------------------------------------------
--ȫ��whole database backup
/*
�������е������ļ��Ϳ����ļ�
*/
--���ֱ���partial database backup
/*
tablespace/datafile/control file
*/
--һ���Ա���consistent backups
--inconsistent backups
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
archive log list;
/*
���鵵
startup mount;
alter database archivelog;
alter database open;

*/
--Ŀ�ĵ�ַ��������������ȥ���2G���ѵ�ַ�������������
archive destination:use_db_recovery_file_dest ;
--�޸ĵ�ַ
show parameter archive;
alter system set log_archive_dest_1='LOCATION=$ORACLE_BASE/oradata/wensr/archive';
--�ֶ��л��鵵
alter system archive log current;

alter system switch logfile;

select 'alter tablespace '|| tablespace_name ||' begin backup;' from dba_tablespaces;
alter database backup controlfile to '/oracle/ctl.bak';
alter database backup controlfile to trace;
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--rman ����
rman target sys/oracle@wensr nocatalog
rman target / as sysdba
--����channel
run {
  allocate channel c1 TYPE disk
    FORMAT = '/u01/backup/userbak.bak';
  backup datafile '/db01/oradata/users01.dbf';
}
--д��rman log,ָ��rman���� ����־д�뵽�ļ���
log $HOME/ORADATA/u03/rman.log append
--rmanһ�𶯾�ִ�нű�
log $HOME/ORADATA/u03/rman.log append @'$HOME/STUDENT/LABS/my_rman_script.rcv'


--here document 
#!/bin/bash

rman target sys/oracle nocatalog <<!
show all;
exit;
!
--rman ��������
configure channel device type disk format  '/db01/backup/%U';
configure controlfile autobackup on;
configure controlfile autobackup clear;

list backup of database;
list backup of datafile "/db01/ORADATA/db.dbf"
list backup of tablespace "wh11_data"

report schema;


--rmanҪ��
/**
���ַ�ʽ��image copy �� backup sets
1 �ǳ�����Դ��shared memory, more processes
show parameter process;
alter system set processes=300 scope=spfile;
2 ��ҪsysdbaȨ��
3 Զ�����Ӳ�����Ҫ���룬�����ļ�Ҫ����
4 �ַ�������
5 ����mount �� open 
6 only clean backups are usable in noarchivelog mode,ֻ����image copy��������������
7 backup sets ֧����������
*/

--�����﷨
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
--ɾ�����ݼ�(���ݼ��ı��)
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

--����parallelization of backup sets
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
ֻ�ܿ����������ϣ�����ֱ��ʹ�ò���restore
*/
copy datafile 6 to '/u01/backup/c_%U' tag='wh11';

--�������� incremental backups(differential incremental backups,cumulative incremental backups )
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

--��¼block�����ı仯,��������������ݵ��ٶȣ����ǻ��������ݿ��ճ����еĸ���
alter database enable block change tracking using file '/u01/track.bin'
alter database disable block change tracking

--�ǹ鵵�µı���
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
noarchivelog rman �ָ�
����restore�Ϳ�����

archivelog rman �ָ�
--������mount״̬
startup mount 
restore database;
recover database;
alter database open;

--��������𻵣������ļ���Ҫ�ָ����µ�Ŀ¼��
startup mount
run {
  set newname for datafile 7 to '/u01/app/oracle/007.dbf';
  restore database;
  switch datafile all;
  recover database;
  alter database open;
}

--����ռ�/�����ļ��ָ�,�����ݿ�open�½���
run{
  sql 'alter database datafile 6 offline';
  restore datafile 6;
  recover datafile 6;
  sql 'alter database datafile 6 online'
}

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--rman incomplete recovery
rman ����ȫ�ָ�
/*
���ͣ�(until ֱ����������)
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
user manager backup  (�ֹ�����)
--�䱸
/*
v$datafile
v$controlfile
v$logfile
dba_data_files
*/
1 noarchivelog model 
/*�ر����ݿ�����䱸����datafiles 
control files 
redologfiles 
parameter file 
password file
����
���裺 1 shutdown immediate
      2 cp $ORACLE_HOME/dbs/spfilewensr.ora .
        cp $ORACLE_HOME/dba/orapwwensr .
        cp $ORACLE_BASE/oradata/wensr .
        tar cvf coldbackup.tar coldbackup/
      3 startup open;
*/
--�����䱸�ű�
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

--�ȱ�(����Ҫarchivelog mode) can be done at a tablespace or datafile level
/*
�ȱ�
1 ���ݿ���Ҫ���ڹ鵵ģʽ
2 ���ݿ�򿪵�״̬�£����Խ��б�ռ䡢�����ļ��ı���
3 �鵵�����ݿ�����ܻ�����һ��Ӱ���
4 �鵵�¿��Բ�ȥ��ʧ�κ�����
*/
**********************************************************
alter tablespace users begin backup;
!cp $ORACLE_BASE/oradata/wensr/users01.dbf /backup/users01.dbf
alter tablespace users end backup;
alter system archive log current;--�л��鵵�����ݹ鵵��־�ļ��������ļ�
**********************************************************
backupģʽ�Ĺ���ԭ��
1 the tablespace is checkpointed ,���е������ݶ�д����datafile��
2 datafile�ļ�ͷ�е�checkpoint SCN ��������
3 ��ĳ�����ݿ�����ݸı��ˣ��������������ݶ�д��redo��
--ʵ��
select file_name,tablespace_name from dba_data_files;
create user u1 identified by oracle default tablespace ts1;
grant connect,resource to u1;
conn u1/oracle;
show user;
create table fruit(name varchar2(32));
insert into fruit values('orange');
--��fruit���ڵĿ�
select dbms_rowid.rowid_block_number(rowid) blk,name from fruit;//148
show parameter blocksize;
--��147���ȡ������
dd if=ts1.dbf ibs=8192 skip=147 count=2 | strings 
alter tablespace ts1 begin backup;
update fruit set name='apple';
alter system checkpoint;
--���ĺ󣬼����鿴�����Կ���apple�Ѿ�д����datafile
dd if=ts1.dbf ibs=8192 skip=147 count=2 | strings 
alter tablespace ts1 end backup;

--�鿴��Щ�ļ�������begin backup״̬
select * from v$backup;
/*
�����begin backupʱ��ͻȻ�ϵ磬����ʱ���ᱨ��
����Ҫ��mountʱ�����ļ�end backup
�磺alter database end backup; 
alter database datafile 3 end backup;
*/


--ֻ����ռ�ı���
--1 ����ռ�����read only ״̬
alter tablespace ts1 read only;
--2 ��datafile�����߾�����,ͬʱ���ݿ����ļ�
--3
alter tablespace ts1 read write;

--�����ļ��ı���
alter database backup controlfile to '/tmp/control01.ctl';
alter database backup controlfile to trace as '/tmp/c2.ctl';

--�����ļ��ı���
create pfile from spfile;

--DBverify ���߼�������ļ��Ƿ�����
dbv file=/u01/app/oracle/oradata/wensr/ts1.dbf feedback=100;

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--user managed complete recovery 
noarchivelog mode ���ֹ���ȫ�ָ���
/*
1 restored datafiles
2 redo applied
3 database containing committed and uncommitted transactions
4 undo applied
5 recovered database 

�ڷǹ鵵�£�һ���ļ��𻵣���Ҫrestore���������ļ��������ļ�������Ҫ��recovery������
����ֻ�ָܻ������һ���䱸�µ����ݣ�û�б��ݵ����ݽ��ᶪʧ

��������𻵣���Ҫ�������ļ�����������·���£�
��Ҫ���Ӵ��̺��޸�spfile�ļ�controlfile ��·����Ϣ�Ϳ����ļ���datafile��redolog file��temp file��·����Ϣ

�޸�spfile��Ҫ����pfile
�޸�controlfile ��Ҫ��mount״̬�£�����
select file#,name from v$datafile;
alter database rename file '/u01/app/oracle/oradata/wensr/system01.dbf' 
to '/u01/app/oracle/oradata/md/system01.dbf'

select file#,name from v$tempfile;
select group#,member from v$logfile;

���û�б���redo log file,�ָ���ʱ����Ҫ���²���redo log file
startup mount 
recovery database until cancel using backup controlfile;
cancel
alter database open resetlogs;
*/


--user manage complete recovery  archivelog mode ��ȫ�ָ�
/*
�鵵�£�ֻ��Ҫ�ָ��𻵵��Ǹ��ļ��Ϳ����ˣ�����û�𻵵Ĳ���Ҫ��
*/
--�鿴��Ҫ�ָ����ļ�
select * from v$recover_file;
--�鿴alert�ļ�
tail -f /u01/app/oracle/diag/rdbms/wensr/wensr/trace/alert_wensr.log

--*database closed �»ָ�����
--1 �����ݵ��ļ�restore,set autorecovery on/off;
--2 mount״̬��redo ��archivelog ����������
recovery database; 
--��
recover datafile 1;
recover datafile 2;
--3 alter database open;

--**database open �»ָ�����
--1�Ƚ��𻵵������ļ�����offline
alter database datafile 6 offline;
--2 cp ���ݺõ��ļ�
--3 ���лָ�
recovery datafile 6;
--4 ���ָ�����ļ�����online
alter database datafile online;

--***��database�ر��£�hardware failure Ӳ���𻵣���Ҫ��open�»ָ�
--1 starup mount 
--2 ���𻵵��ļ�����
alter database datafile 6 offline;
--3 alter database open;��ʱֻ�в��漰��datafile�����ݿ���������
--4 cp ���ݺõ�datafile 6
--5 �ָ�
recovery datafile 6;

--****�����ļ���ʧ����û�б��ݣ�������ϵͳ�ļ���
/*
��ʱ�ָܻ�������:
1 ���еĹ鵵��־�ļ�������
2 �����ļ������𻵵������ļ�������
3 �𻵵��ļ�������ϵͳ��ռ���ļ�
*/
--1 ���𻵵��ļ�����
alter database datafile 6 offline;
--2 ����һ���հ׵��ļ�
alter database create datafile '/u01/app/oracle/oradata/wensr/t1.dbf';
--3 �ָ�
recovery datafile 6;
--4 ����
alter database datafile 6 online;

--�����ļ��𻵵Ļָ�
/*
��Ҫ�ؽ������ļ��������
1 ���еĿ����ļ�����ʧ
2 ��Ҫ�޸����ݿ������
3 ��Ҫ�޸Ŀ����ļ��ڵ���Ϣ
*/
--�鿴control file��scn��
select file#,checkpoint_change# from v$datafile;
--�鿴datafile��scn��
select file#,checkpoint_change# from v$datafile_header;

--����֮ǰ���ݵĿ����ļ���trace�ļ�(�ı��ļ�)�ع������ļ�
alter database backup controlfile to trace as '/tmp/c2.ctl';
--1 �鿴֮ǰcontrol file��trace�ļ�c2.ctl,����NORESETLOGS��RESETLOGS �������ִ��c2.ctl�����sql������sql�ű�c1.sql
conn / as sysdba
@/tmp/c1.sql
--2 ͨ��ִ�����sql�ű��������ؽ�control file

--����control�ļ��ı����ļ����������ļ������лָ�
alter database backup controlfile to '/tmp/control01.ctl';
--1 �����ݵ�control file ������Ӧ���ڵ�λ��
--2 ���ñ��ݵ��ϵ�control file �����ݿ�������mount״̬��startup mount;
recover database using backup controlfile;
--3 ����в�������û�й鵵����Ҫʹ��redolog �ļ�
���� /u01/app/oracle/oradata/wensr/redo01.log �����Ƿ��ָܻ�
������µ������ļ��ڱ��ݵĿ����ļ�����û�м�¼����recover ʱ�ı�����Ϣ������ʾ��ȷ��
�ļ��������alert��־�ļ������ļ����ļ����ҳ�������v$datafile �������UNNAMED����
�ļ�rename����ȷ���ļ�����Ȼ����ʹ��archivelog��redo���лָ�
--4 alter database open resetlogs;

--ֻ����ռ�Ļָ�
--*һ�������
--1 restore
--2 recovery datafile 7

--**�����ļ����ˣ��ع��˿����ļ��������
�ڿ����ļ��ı���trace�ļ�������ֻ���ļ��ָ��Ĳ���

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
user managed incomplete recovery 
�ֹ�����ȫ�ָ�
/*
ʹ�������
1 ���ֹ鵵��־��ʧ
2 û�й鵵�������ļ���ʧ

����
time-based recovery
cancel-based recovery
change-based recovery

����
1 shutdown and backup the database
2 restore all datafiles
3 mount the database 
4 recover the datafiles to a point before the time of failure 
5 open the database with resetlogs
6 perform a closed database backup
*/

--time-based recovery
--1 �ر����ݿ⣬�����ݺõ������ļ���������Ӧ��Ŀ¼��
--2 startup mount 
--3 ��ʱ��ָ�
recover database until time '2015-03-28:19:51:51';
--4 �����ݿ�
alter database open resetlogs;

--cancel-based recovery
--1 ͨ�������ļ���trace�ļ��ĵڶ��ַ�ʽ��resetlogs���ؽ�control file
--2 
recover database using backup controlfile until cancel
--3 
alter database open resetlogs;

--change-based recovery
recover database until change 2454343;
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--recovery catalog creation and maintenance
rman �ָ�Ŀ¼�Ĵ�����ά��
/*
rman ����ʹ�ò�ʹ��catalog�����Ὣrman���ݵ���Ϣд�뵽Ŀ�����ݿ�Ŀ����ļ���
���ÿ��ʹ��rman��ʹ��catalog���ݿ⣬��catalog���ݿ��control file
����Ϣһֱ��һ�µģ���������е�ʱ��û�ã���ô��Ҫ�ֹ�ͬ��control file��catalog���ݿ�
���resync catalog
report schema;
list incarnation;

catalog������
1 datafile and archived redo log file backup sets and backup pieces
2 datafile copies
3 archived redo log files
4 the physical structure of the target database 
5 persistent RMAN configuration settings
6 stored job scripts
*/
--����cata��ռ�
create tablespace cata datafile '/u01/app/oracle/oradata/wensr/catalog_01.dbf' 
size 1024m segment space management auto extent management local uniform;
--�����û�
create user cata identified by oracle 
default tablespace cata quota unlimited on cata;
--����Ȩ��
grant connect,resource to cata;
grant recovery_catalog_owner to cata;

--rman����catalog���ݿ⣬������catalog
rman catalog cata/oracle@wensr
create catalog tablespace cata;

--����Ŀ�����ݿ��catalog���ݿ⣬��Ŀ�����ݿ�ע�ᵽcatalog��
rman target sys/oracle@wensr
connect catalog cata/oracle@wensr
register database;

--store scripts
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--rman maintenance
rman ά��
--retention policy  ��������
configure retention policy to 
1 recovery window of 7 days
2 redundancy 2;
3 none;

--crosscheck ���rman��¼�ı�����Ϣ�Ƿ��ڴ������ж�Ӧ�ı����ļ�
crosscheck backup;
list backup;
/*
obsolete means not needed,expired means not found 
*/

--ɾ�����ڵı���
delete backupset 47;
delete obsolete;
delete expired backup; 
backup archivelog all delete input;
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
export and import utilities
/*
����ģʽ
1 table mode
2 user mode 
3 tablespace mode
4 full database mode
*/
--������ҪȨ�ޣ�grant exp_full_database to hr;
--����ʹ��ͨ��� �磺tables=%p%
exp hr/hr tables=employees,departments rows=y file=exp.dmp log=exp.log full=y grants=y
exp system/oracle owner=hr direct=y file=expdat.dmp log=exp.log rows=n
--ʹ�ò����ļ�
exp hr/hr parfile=t.txt;

--�ַ�������
desc NLS_DATABASE_PARAMETERS;
SELECT * from nls_database_parameters;
����nls_language : NLS_LANGUAGE_NLS_TERRITORY_NLS.CHARACTERSET
eg:AMERICAN_AMERICA.ZHS16GBK
--�ڵ��뵼��֮ǰ��������ϵͳ���ַ��������ɺ����ݿ�һ��
set nls_lang=AMERICAN_AMERICA.ZHS16GBK
--���dmp�ļ����ַ���
imp hr/hr show=y file=t.dmp;

--direct path ֱ��ģʽ���ȳ���ģʽ�ٶȿ�:sql �������Ż�
direct=y

--imp ����
grant imp_full_database to hr;
imp \'sys/oracle as sysdba \' fromuser=hr file=t.dmp touser=scott tables=(*) rows=y
----------------------------------------------------------------------------------
select * from user_objects;
