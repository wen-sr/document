--显示回收站的信息,10g之后才有此功能
show recyclebin;

--将回收站的表还原
flashback table t2 to before drop [rename to tt2];

--清空回收站内指定的表
purge table t2;

--清空回收站的所有信息
purge recyclebin;
