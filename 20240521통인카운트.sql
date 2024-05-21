/**
 * 통인 카운트 조회
 * totalCall: 전체콜 수
 * totalMoveCall: 이사 접수
 * totalResEtcCall: 기타 접수
 * completeCall: 완성콜
 * inCompleteCall: 미완성콜
 * cleaningCall: 크리닝
 * resEtcCall: 기타
 */
select
  totalCall
  ,SUM(completeCall + inCompleteCall) AS totalMoveCall
  ,SUM(cleaningCall + resEtcCall) AS totalResEtcCall
  ,completeCall
  ,inCompleteCall
  ,cleaningCall
  ,resEtcCall
  ,transferCall
  ,MIN(totalCall - completeCall - inCompleteCall - cleaningCall - resEtcCall - transferCall) AS etcCall
from
(
select
    count(*) as totalCall
from tbl_issue_contact
where 1=1
and dnis=45000079
and bound_io='in'
and pk_issue_contact not like 'junit%'
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
) as totalCall,
(
select
    COUNT(*) as completeCall
from tbl_log_ext_api
where 1=1
and ext_act='REG_RESERVE'
and JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.itemCds')) in ('P00617')
and contact_id not like 'junit%'
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
) as completeCall,
(
select
    count(*) as inCompleteCall
from tbl_log_ext_api
where 1=1
and ext_act='CALLBACK_RESERVE'
and JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.itemCds')) in ('P00617')
and contact_id not like 'junit%'
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
) as inCompleteCall,
(
select
    count(*) as cleaningCall
from tbl_log_ext_api
where 1=1
and ext_act='MANUAL_RESERVE'
and JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.itemCds')) in ('P01338')
and contact_id not like 'junit%'
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
) as cleaningCall,
(
select
    count(*) as resEtcCall
from tbl_log_ext_api
where 1=1
and ext_act='MANUAL_RESERVE'
and JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.itemCds')) in ('P01462')
and contact_id not like 'junit%'
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
) as resEtcCall,
(
select
  count(*) as transferCall
from tbl_issue_contact
where 1=1
and fk_company=13733
and date_format(fd_regdate, '%Y%m%d') between 20240501 and 20240515
and reaction_type_last='transferCall'
) as transferCall
;