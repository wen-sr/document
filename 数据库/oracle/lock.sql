--查看杯锁住的进程
select object_name,machine,s.sid,s.serial#
from v$locked_object l,dba_objects o ,v$session s
where l.object_id　=　o.object_id and l.session_id=s.sid;
--杀死进程
alter system kill session '250,1913'; --(其中24,111分别是上面查询出的sid,serial#)