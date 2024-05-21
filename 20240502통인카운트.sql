--전체콜
select
    count(*)
from tbl_issue_contact
where 1=1
and dnis=45000079
and bound_io='in'
and pk_issue_contact not like 'junit%'
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
;

--완성콜
select
    COUNT(*)
from tbl_log_ext_api
where 1=1
and ext_act='REG_RESERVE'
and JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.itemCds')) in ('P00617')
and contact_id not like 'junit%'
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
;

--미완성콜
select
    count(*)
from tbl_log_ext_api
where 1=1
and ext_act='CALLBACK_RESERVE'
and JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.itemCds')) in ('P00617')
and contact_id not like 'junit%'
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
;

--크리닝 접수
select
    count(*)
from tbl_log_ext_api
where 1=1
and ext_act='MANUAL_RESERVE'
and JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.itemCds')) in ('P01338')
and contact_id not like 'junit%'
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
;

--기타 접수
select
    count(*)
from tbl_log_ext_api
where 1=1
and ext_act='MANUAL_RESERVE'
and JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.itemCds')) in ('P01462')
and contact_id not like 'junit%'
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
;


select * from tb_notification_msg_record
where 1=1
and fk_company=13733
and template_code='tongin006'
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
;


select * from tb_notification_msg_record
where id in (
  select
      contact_id
  from tbl_log_ext_api
  where 1=1
  and ext_act='MANUAL_RESERVE'
  and JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.itemCds')) in ('P01462')
  and contact_id not like 'junit%'
  and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
  group by contact_id
)
;


select
    count(*)
from tbl_log_ext_api
where 1=1
and ext_act='MANUAL_RESERVE'
and JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.itemCds')) in ('P01462')
and contact_id not like 'junit%'
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
group by contact_id
;


--상담원 연결
select
  count(*)
from tbl_issue_contact
where 1=1
and fk_company=13733
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
and reaction_type_last='transferCall'
;