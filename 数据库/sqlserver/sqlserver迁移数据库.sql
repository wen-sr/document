RESTORE DATABASE RESTOCK
FROM DISK = 'D:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\Backup\RESTOCK.bak'   --bak�ļ�·��
with replace,
MOVE 'RESTOCK' TO 'D:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\STOCK.mdf',   --mdf�ļ�·��
MOVE 'RESTOCK_log' TO 'D:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\STOCK.ldf'   --ldf�ļ�·��