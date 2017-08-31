RESTORE DATABASE RESTOCK
FROM DISK = 'D:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\Backup\RESTOCK.bak'   --bak文件路径
with replace,
MOVE 'RESTOCK' TO 'D:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\STOCK.mdf',   --mdf文件路径
MOVE 'RESTOCK_log' TO 'D:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\STOCK.ldf'   --ldf文件路径