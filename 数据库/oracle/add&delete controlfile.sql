���ӿ����ļ�
1 ����shutdown���ݿ⣨�������ܱ�֤���Ƴ����Ŀ����ļ������ٱ仯��
2 �����µĿ����ļ�����Ӧ��Ŀ¼��
3 ����pfile�޸Ĳ�������controlfile���ּ����µ�Ŀ¼������ʹ��alter system �����޸�
4 �����µ�spfile���������ݿ�
������£�
col name for a60
select status,name from v$controlfile;
shutdown immediate

���ٿ����ļ�
1 �޸Ĳ����ļ���ʹ��alter system�����޸�control_files����������֤
2 �������ݿ�
������£�
show parameter control
alter system set control_files='/u01/app/oracle/oradata/wensr/control01.ctl','/u01/app/oracle/flash_recovery_area/wensr/control02.ctl'
--��֤�����ļ��Ѿ��޸�
select name,value from v$spparameter where name='control_files';
startup force
--��֤�ڴ汻�޸���
select name from v$controlfile;