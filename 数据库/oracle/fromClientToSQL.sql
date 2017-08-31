--常用视图
select saddr,sid,username,paddr,sql_address,prev_sql_addr,status from v$session s;
select addr,ses_addr from v$transaction t;
select addr,spid from v$process p;
select * from v$sql sql;
--关联
s.saddr=t.ses_addr
s.sql_address=sql.address
s.paddr=p.addr
p.spid=netstat.pid

--Linux下netstat -anp的用法
--根据Foreign Address的信息找到对应的pid和端口号（比如：3797/1069）
--然后根据pid，使用ps -ef | grep 3797 找到客户端连接的进程
--根据端口号，可以在windows客户端使用netstat -b,可以查到客户端本机的程序


--查看正在运行的事物的用户名和进程（客户端）
select addr,sid,username,s.status,process,program 
from V$TRANSACTION t,v$session s
where T.SES_ADDR=s.saddr;

select sql_fulltext,address,hash_value
from v$sql q,v$session s 
where Q.ADDRESS=S.PREV_SQL_ADDR and s.sid=24

select A.SADDR,a.paddr,a.sql_address,a.status
from v$session a,v$transaction b,v$process c,v$sql d
where a.saddr=B.SES_ADDR 
      and a.paddr=C.SPID 
      and A.SQL_ADDRESS=D.ADDRESS; 



