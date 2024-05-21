--미완성 콜
select count(*) from tbl_log_ext_api
where 1=1
and date_format(fd_regdate, '%Y%m%d') between 20240116 and 20240131
and ext_act in ('MANUAL_RESERVE')
;

--완성 콜
select count(*) from tbl_log_ext_api
where 1=1
and date_format(fd_regdate, '%Y%m%d') between 20240116 and 20240131
and ext_act in ('REG_RESERVE')
;

--상담원 연결
select count(fd_call_broker_id) from tbl_issue_dialogue
where dnis=45000079
and session_type_cd='B1011'
and date_format(fd_regdate, '%Y%m%d') between 20240116 and 20240131
group by fd_call_broker_id
;

--전체
select * from tbl_issue_dialogue where fd_call_broker_id in (
select tb_broker_id from tbl_issue_contact
where fk_company=13733
and date_format(fd_regdate, '%Y%m%d') between 20240116 and 20240131
and fk_issue_contact_parent is null
group by tb_broker_id
) group by session_type_cd
;


20240101 - 20240106
Total : 1212건
완성콜 : 238건
미완성콜 : 507건
상담원 연결 : 278건
이외 건 : 189건



--통계낼때 참고
select * from tbl_form_input_data where fk_issue_ticket in(
select
    fk_issue_ticket
from tbl_form_input_data
where 1=1
and fk_form_code='FORM_CONSULT_EXPRESS'
and input_value=""
and input_key='FORM_INPUT_ITEMCD'
and date_format(fd_regdate, '%Y%m%d') between 20240401 and 20240416
order by fd_regdate desc
)
and date_format(fd_regdate, '%Y%m%d') between 20240316 and 20240416
order by fd_regdate desc
;

select
    count(*)
from tbl_form_input_data
where 1=1
and fk_form_code='FORM_CONSULT_EXPRESS'
and input_key='FORM_INPUT_ROUTE'
and input_value != ''
and date_format(fd_regdate, '%Y%m%d') between 20240101 and 20240131
group by input_value
order by fd_regdate desc
;

select * from tbl_form_input_data
where 1=1
and fk_form_code='FORM_CONSULT_EXPRESS'
and input_key='FORM_INPUT_ITEMCD'
and date_format(fd_regdate, '%Y%m%d') between 20240101 and 20240131
;



--전체 통계
select
    *
from tbl_form_input_data
where 1=1
and fk_form_code='FORM_CONSULT_EXPRESS'
and input_key='FORM_INPUT_ITEMCD'
and date_format(fd_regdate, '%Y%m%d') between 20240101 and 20240131
group by input_value
order by fd_regdate desc
;



select * from tbl_issue_contact where fk_issue_ticket=97681;
20240102-16040523-1-01023507997-07045000079	79fa8bf8-8499-4c66-a785-ac5d91176099



select * from tbl_issue_dialogue where fk_issue_contact='20240102-16040523-1-01023507997-07045000079';


20240401 ~ 20240430
Total : 3934

