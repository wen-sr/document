set feedback off heading off verify off trimspool off
set pagesize 0 linesize 200
define dir='/tmp/wb'
define ws='/tmp/ws.sql'
spool &ws
select '!cp' || name || '&dir' from v$datafile order by 1;
select '!cp' || member || '&dir' from v$logfile order by 1;
select '!cp' || name || '&dir' from v$controlfile order by 1;
select '!cp' || name || '&dir' from v$tempfile order by 1;
spool off
shutdown immediate
@&ws
startup
/*
SQL>set colsep' '; //-域输出分隔符
SQL>set echo off; //显示start启动的脚本中的每个sql命令，缺省为on
SQL> set echo on //设置运行命令是是否显示语句
SQL> set feedback on; //设置显示“已选择XX行”
SQL>set feedback off; //回显本次sql命令处理的记录条数，缺省为on
SQL>set heading off; //输出域标题，缺省为on
SQL>set pagesize 0; //输出每页行数，缺省为24,为了避免分页，可设定为0。
SQL>set linesize 80; //输出一行字符个数，缺省为80
SQL>set numwidth 12; //输出number类型域长度，缺省为10
SQL>set termout off; //显示脚本中的命令的执行结果，缺省为on
SQL>set trimout on; //去除标准输出每行的拖尾空格，缺省为off
SQL>set trimspool on; //去除重定向（spool）输出每行的拖尾空格，缺省为off
SQL>set serveroutput on; //设置允许显示输出类似dbms_output
SQL> set timing on; //设置显示“已用时间：XXXX”
SQL> set autotrace on-; //设置允许对执行的sql进行分析
set verify off //可以关闭和打开提示确认信息old 1和new 1的显示.
*/