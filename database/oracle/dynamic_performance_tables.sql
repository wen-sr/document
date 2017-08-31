v$sql��ͼ
select * from v$sql 




/*
1 Buffer cache hit ratio��������ʾbuffer cache��С�Ƿ���ʡ�
��ʽ��1-((physical reads-physical reads direct-physical reads direct (lob)) / session logical reads)
ִ�У�
*/
select 1-((a.value-b.value-c.value)/d.value) 
  from v$sysstat a,v$sysstat b,v$sysstat c,v$sysstat d 
  where a.name='physical reads' and
         b.name='physical reads direct' and
         c.name='physical reads direct (lob)' and
         d.name='session logical reads';

/*
2 Buffer hit ratio��������ʾbuffer�����ʡ�
��ʽ��1-(physical reads/ (db block gets+consistent gets)) 
ִ�У�
*/
select 1 - (sum(decode(name, 'physical reads', value, 0)) /
       (sum(decode(name, 'db block gets', value, 0)) +
       sum(decode(name, 'consistent gets', value, 0)))) 
       "Buffer Hit Ratio"
from v$sysstat;

/*3 Soft parse ratio�������ʾϵͳ�Ƿ���̫��Ӳ��������ֵ������ԭʼͳ�����ݶԱ���ȷ����ȷ�����磬������ʽ�Ϊ0.2���ʾӲ������̫�ߡ�����������ܽ�����(parse count total)ƫ�ͣ�����ֵ���Ա����ԡ�
��ʽ��1 - ( parse count (hard) / parse count (total) )
ִ�У�
*/
select 1-(a.value/b.value) 
  from v$sysstat a,v$sysstat b 
  Where a.name='parse count (hard)' and b.name='parse count (total)';

/*4 In-memory sort ratio��������ʾ�ڴ�����ɵ�������ռ������������״̬�£���OLTPϵͳ�У��󲿷����򲻽�С�����ܹ���ȫ���ڴ����������
��ʽ��sorts (memory) / ( sorts (memory) + sorts (disk) )
ִ�У�
*/
select a.value/(b.value+c.value) 
  from v$sysstat a,v$sysstat b,v$sysstat c 
  where a.name='sorts (memory)' and 
         b.name='sorts (memory)' and c.name='sorts (disk)';

/*5 Parse to execute ratio��������������������״̬��һ��sql���һ�ν����������С�
��ʽ��1 - (parse count/execute count)
ִ�У�
*/
select 1-(a.value/b.value) 
  from v$sysstat a,v$sysstat b 
  where a.name='parse count (total)' and b.name='execute count';

/*6 Parse CPU to total CPU ratio��������ʾ�ܵ�CPU������ִ�м������ϵı��ʡ����������ʽϵͣ�˵��ϵͳִ����̫��Ľ�����
��ʽ��1 - (parse time cpu / CPU used by this session)
ִ�У�
*/
select 1-(a.value/b.value) 
  from v$sysstat a,v$sysstat b 
  where a.name='parse time cpu' and
         b.name='CPU used by this session';

/*7 Parse time CPU to parse time elapsed��ͨ����������ʾ���������ʡ�������ʼ���
�Ƿ�ʱ�仨���ڽ��������CPU������������(����������)������ʱ�仨�Ѳ���CPU��������ͨ����ʾ����������������ʱ�仨��
��ʽ��parse time cpu / parse time elapsed
ִ�У�
*/
select a.value/b.value 
  from v$sysstat a,v$sysstat b 
  where a.name='parse time cpu' and b.name='parse time elapsed';