--��־�ļ�
select * from v$logfile;
select * from v$log;
--������־�ļ�
alter database add logfile group 9 '/u01/app/oracle/oradata/wensr/redo09.log' size 5m;
--���ӳ�Ա����ʼ״̬ΪINVALID��
alter database add logfile member '/u01/app/oracle/oradata/wensr/redo09b.log' to group 9;
alter system switch logfile;

--ɾ����Ա��ɾ�Ĳ�����current��active�飬ɾ��������ļ����ڣ�
alter database drop logfile member '/u01/app/oracle/oradata/wensr/redo09b.log';
--��ʽ���飨ɾ���ļ��������ɣ�
alter database clear logfile group 9;
--��־�ļ��ĸ�������Ҫ�Ȳ鿴״̬��ȷ�ϲ���current��active,cp�µ��ļ���,��Ҫ�µ��ļ����Ѵ��ڲ���ִ�У�
alter database rename file '/u01/app/oracle/oradata/wensr/redo09b.log' to '/u01/app/oracle/oradata/wensr/redo09a.log';

--SCN��system change number,stop scn (�������ػ���������stop scn�ᱻ����Ϊ���ֵ)
select CURRENT_SCN from v$database;--38908048061
select * from v$log_history;
--����
select * from v$datafile;
--�л�
alter system checkpoint;
--�ֶ��л�
alter system switch logfile;
--�鵵
archive log list;