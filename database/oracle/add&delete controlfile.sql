增加控制文件
1 首先shutdown数据库（这样才能保证复制出来的控制文件不会再变化）
2 拷贝新的控制文件到相应的目录下
3 创建pfile修改参数，在controlfile部分加入新的目录，或者使用alter system 命令修改
4 创建新的spfile，启动数据库
语句如下：
col name for a60
select status,name from v$controlfile;
shutdown immediate

减少控制文件
1 修改参数文件或使用alter system命令修改control_files参数，并验证
2 重启数据库
语句如下：
show parameter control
alter system set control_files='/u01/app/oracle/oradata/wensr/control01.ctl','/u01/app/oracle/flash_recovery_area/wensr/control02.ctl'
--验证参数文件已经修改
select name,value from v$spparameter where name='control_files';
startup force
--验证内存被修改了
select name from v$controlfile;