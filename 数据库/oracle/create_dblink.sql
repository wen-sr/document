--创建dblink
select * from dba_db_links;
drop public database link wms;
create public database link wms connect to wh1 identified by wh1 using  '(DESCRIPTION =
(ADDRESS_LIST =
(ADDRESS = (PROTOCOL = TCP)(HOST = 141.168.1.11)(PORT = 1521))
)
(CONNECT_DATA =
(SERVICE_NAME =PRD1)
)
)';
select * from sku@wms; 