-- 取出的元数据都没有分号和斜杠,这样就不能批量运行,我们在取完元数据的语法后加上.

--table
select dbms_metadata.get_ddl('TABLE','EMP') FROM DUAL;
--index
select dbms_metadata.get_ddl('INDEX','PK_EMP') FROM DUAL;
--sequence
select dbms_metadata.get_ddl('SEQUENCE','SYSTEM_GRANT','SYS') FROM DUAL;
--tablespace
select dbms_metadata.get_ddl('TABLESPACE','UNDOTBS1') FROM DUAL;