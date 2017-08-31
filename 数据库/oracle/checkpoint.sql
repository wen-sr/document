--regulating checkpoint queue 调整dirty buffer queue 的长度
show parameter FAST_START_MTTR_TARGET

--查看数据写入到了那个块上
select dbms_rowid.rowid_block_number(rowid) blk,ename from emp;
--在shell下用dd命令查看块上的内容
dd if=example01.dbf ibs=8192 skip=150 count=1 | strings
--dd 读取example01.dbf文件，每个块的大小是8192，跳过前150个块，往后读取一个块，输出可用字符串