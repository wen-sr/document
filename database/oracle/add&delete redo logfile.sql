--��־�ļ�
select * from v$logfile;
select * from v$log;
select * from v$log_history;
alter system switch logfile;
--������־�ļ���
alter database add logfile group 9 '/u01/app/oracle/oradata/wensr/redo09.log' size 5m;
--���ӳ�Ա����ʼ״̬ΪINVALID��
alter database add logfile member '/u01/app/oracle/oradata/wensr/redo09b.log' to group 9;
  ����
  alter database add logfile group 10 ('/u01/app/oracle/oradata/wensr/redo10a.log','/u01/app/oracle/oradata/wensr/redo10b.log') size 5m;

--ɾ����Ա��ɾ�Ĳ�����current��active�飬ɾ��������ļ����ڣ�����ɾ������������һ����Ա��
alter database drop logfile member '/u01/app/oracle/oradata/wensr/redo09.log';
--��ʽ���飨ɾ���ļ���������,�൱�����³�ʼ���飬���鷢���𻵵�ʱ�����ʹ�ã�
alter database clear logfile group 9;
--��־�ļ��ĸ�������Ҫ�Ȳ鿴״̬��ȷ�ϲ���current��active,cp�µ��ļ���,��Ҫ�µ��ļ����Ѵ��ڲ���ִ�У�
alter database rename file '/u01/app/oracle/oradata/wensr/redo09b.log' to '/u01/app/oracle/oradata/wensr/redo09a.log';

--ɾ���飨����ɾ����ǰ�飩
alter database drop logfile group 9;