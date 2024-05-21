/**
 * ���� ī��Ʈ ��ȸ
 * totalCall: ��ü�� ��
 * totalMoveCall: �̻� ����
 * totalResEtcCall: ��Ÿ ����
 * completeCall: �ϼ���
 * inCompleteCall: �̿ϼ���
 * cleaningCall: ũ����
 * resEtcCall: ��Ÿ
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