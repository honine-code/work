SELECT
    A.call_id,
    A.출발지,
    A.도착지,
    COALESCE(B.수정출발지, null) AS '수정출발지',
    COALESCE(B.수정도착지, null) AS '수정도착지'
FROM
(
    SELECT
        contact_id AS call_id,
        JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.frAddr1')) AS '출발지',
        JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.toAddr1')) AS '도착지',
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
        JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.frAddr1')) AS '수정출발지',
        JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.toAddr1')) AS '수정도착지'
    FROM
        tbl_log_ext_api
    WHERE 1=1
        AND ext_act='UPDATE_RESERVE'
        AND date_format(fd_regdate, '%Y%m%d') BETWEEN '20240318' AND '20240418'
        AND JSON_UNQUOTE(JSON_EXTRACT(req_data, '$.frAddr1')) IS NOT NULL
) B ON A.call_id = B.call_id
ORDER BY A.fd_regdate DESC
;