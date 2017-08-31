v$sql视图
select * from v$sql 




/*
1 Buffer cache hit ratio：该项显示buffer cache大小是否合适。
公式：1-((physical reads-physical reads direct-physical reads direct (lob)) / session logical reads)
执行：
*/
select 1-((a.value-b.value-c.value)/d.value) 
  from v$sysstat a,v$sysstat b,v$sysstat c,v$sysstat d 
  where a.name='physical reads' and
         b.name='physical reads direct' and
         c.name='physical reads direct (lob)' and
         d.name='session logical reads';

/*
2 Buffer hit ratio：该项显示buffer命中率。
公式：1-(physical reads/ (db block gets+consistent gets)) 
执行：
*/
select 1 - (sum(decode(name, 'physical reads', value, 0)) /
       (sum(decode(name, 'db block gets', value, 0)) +
       sum(decode(name, 'consistent gets', value, 0)))) 
       "Buffer Hit Ratio"
from v$sysstat;

/*3 Soft parse ratio：这项将显示系统是否有太多硬解析。该值将会与原始统计数据对比以确保精确。例如，软解析率仅为0.2则表示硬解析率太高。不过，如果总解析量(parse count total)偏低，这项值可以被忽略。
公式：1 - ( parse count (hard) / parse count (total) )
执行：
*/
select 1-(a.value/b.value) 
  from v$sysstat a,v$sysstat b 
  Where a.name='parse count (hard)' and b.name='parse count (total)';

/*4 In-memory sort ratio：该项显示内存中完成的排序所占比例。最理想状态下，在OLTP系统中，大部分排序不仅小并且能够完全在内存里完成排序。
公式：sorts (memory) / ( sorts (memory) + sorts (disk) )
执行：
*/
select a.value/(b.value+c.value) 
  from v$sysstat a,v$sysstat b,v$sysstat c 
  where a.name='sorts (memory)' and 
         b.name='sorts (memory)' and c.name='sorts (disk)';

/*5 Parse to execute ratio：在生产环境，最理想状态是一条sql语句一次解析多数运行。
公式：1 - (parse count/execute count)
执行：
*/
select 1-(a.value/b.value) 
  from v$sysstat a,v$sysstat b 
  where a.name='parse count (total)' and b.name='execute count';

/*6 Parse CPU to total CPU ratio：该项显示总的CPU花费在执行及解析上的比率。如果这项比率较低，说明系统执行了太多的解析。
公式：1 - (parse time cpu / CPU used by this session)
执行：
*/
select 1-(a.value/b.value) 
  from v$sysstat a,v$sysstat b 
  where a.name='parse time cpu' and
         b.name='CPU used by this session';

/*7 Parse time CPU to parse time elapsed：通常，该项显示锁竞争比率。这项比率计算
是否时间花费在解析分配给CPU进行周期运算(即生产工作)。解析时间花费不在CPU周期运算通常表示由于锁竞争导致了时间花费
公式：parse time cpu / parse time elapsed
执行：
*/
select a.value/b.value 
  from v$sysstat a,v$sysstat b 
  where a.name='parse time cpu' and b.name='parse time elapsed';