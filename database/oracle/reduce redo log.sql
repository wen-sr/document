--查看数据库是否强制生成日志
select force_logging from v$database;
如果为yes，则需要改为no force logging
alter database no force logging;

set autotrace trace stat;
/**
	如果执行报错，
	SP2-0618: Cannot find the Session Identifier.  Check PLUSTRACE role is enabled
    SP2-0611: Error enabling STATISTICS report
	需要进行以下设置：
SQL> create role plustrace;

Role created.

SQL> grant select on v_$sesstat to plustrace;

Grant succeeded.

SQL> grant select on v_$statname to plustrace;

Grant succeeded.

SQL> grant select on v_$mystat to plustrace;

Grant succeeded.

SQL> grant plustrace to dba with admin option;

Grant succeeded.

SQL> grant plustrace to public ;

Grant succeeded.

SQL> conn scott/tiger
Connected.
SQL> set autotrace trace stat;
*/

insert /*+ append*/into t2 select * from t1 nologging;
