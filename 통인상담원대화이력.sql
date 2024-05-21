select
    DATE_FORMAT(fd_regdate, '%Y%m%d') as date,
    group_concat(fd_message SEPARATOR '\n'),
    fd_customer_uid
from tbl_issue_dialogue
where 1=1
and fd_message is not null
and fd_message != ''
and session_type_cd='B1011'
AND DATE_FORMAT(fd_regdate, '%Y%m%d') BETWEEN '20240116' AND '20240131'
GROUP BY fd_call_broker_id
;