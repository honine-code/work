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
        AND date_format(fd_regdate, '%Y%m%d') BETWEEN '20240318' AND '20240418'
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
        AND date_format(fd_regdate, '%Y%m%d') BETWEEN '20240318' AND '20240418'
        AND JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.frAddr1')) IS NOT NULL
) B ON A.call_id = B.call_id
ORDER BY A.fd_regdate DESC
;