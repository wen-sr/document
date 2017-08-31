CREATE [UNIQUE] | [BITMAP] INDEX index_name
ON table_name([column1 [ASC|DESC],column2 [ASC|DESC],…] | [express])
[TABLESPACE tablespace_name]
[PCTFREE n1]
[COMPUTE STATISTICS]
[STORAGE (INITIAL n2)]
[NOLOGGING]
[NOSORT]
[PATITION | GLOBAL PATITION <settings>];

相关说明 
1)UNIQUE | BITMAP : unique是指唯一值索引，bitmap为位图索引，省略为B-Tree索引
2)[column1 [ASC|DESC],column2 [ASC|DESC],…] | [express]:可以对多列进行联合索引，当为expression时即基于函数的索引 
3) tablespace : 表示索引存放的表空间（索引和原表不在同一个表空间时效率更高）
4) storage：设置表空间的存储参数
5) logging | nologging : 设置索引是否产生重做日志（对大表尽量使用nologging来减少占用的空间并提高效率）
6) nosort | reverse: nosort 表示与表中相同的顺序创建索引,reverse表示相反的顺序存储索引值
7) 创建索引时收集统计信息

--隐式索引：当建立或删除主键和唯一性约束的时候，会自动创建或删除索引
