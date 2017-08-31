create or replace trigger TR_DEL_JOBS
 before delete on wh1.jobs_xso
 for each row
begin
  insert into TB_DEL_JOBS(doc_number,del_ip,del_host,del_date) values(:old.doc_number,(select sys_context('userenv','ip_address') from dual),(select sys_context('userenv','host') from dual ),sysdate);
end;