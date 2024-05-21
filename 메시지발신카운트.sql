SELECT
    fk_issue_ticket,
    JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.frAddr1')) AS �����,
    JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.toAddr1')) AS ������
FROM
    tbl_log_ext_api
where 1=1
and ext_act='REG_RESERVE'
and date_format(fd_regdate, '%Y%m%d') between '20240101' and '20240116'
and JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.frAddr1')) is not null
order by fd_regdate desc
;



-- �쿵�� ���� ����
SELECT
    A.call_id,
    A.�����,
    A.������,
    COALESCE(B.���������, null) AS '���������',
    COALESCE(B.����������, null) AS '����������'
FROM
(
    SELECT
        contact_id AS call_id,
        JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.frAddr1')) AS '�����',
        JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.toAddr1')) AS '������',
        fd_regdate
    FROM
        tbl_log_ext_api
    WHERE 1=1
        AND ext_act='REG_RESERVE'
        AND date_format(fd_regdate, '%Y%m%d') BETWEEN '20230101' AND '20240116'
        AND JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.frAddr1')) IS NOT NULL
) A
LEFT JOIN
(
    SELECT
        contact_id AS call_id,
        JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.frAddr1')) AS '���������',
        JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.toAddr1')) AS '����������'
    FROM
        tbl_log_ext_api
    WHERE 1=1
        AND ext_act='UPDATE_RESERVE'
        AND date_format(fd_regdate, '%Y%m%d') BETWEEN '20230101' AND '20240116'
        AND JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.frAddr1')) IS NOT NULL
) B ON A.call_id = B.call_id
ORDER BY A.fd_regdate DESC
;