--�鿴����ס�Ľ���
select object_name,machine,s.sid,s.serial#
from v$locked_object l,dba_objects o ,v$session s
where l.object_id��=��o.object_id and l.session_id=s.sid;
--ɱ������
alter system kill session '250,1913'; --(����24,111�ֱ��������ѯ����sid,serial#)