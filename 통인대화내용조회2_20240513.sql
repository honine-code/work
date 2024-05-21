SELECT
    DATE_FORMAT(sa.fd_regdate, '%Y%m%d') AS date
    ,DATE_FORMAT(sa.fd_regdate, '%H:%i:%s') AS time
    ,sa.ani AS callerNumber
    #,sa.fd_regdate AS fd_regdate
    ,sa.fk_issue_ticket
    #,sa.pk_issue_contact
    ,sa.msg_title
    #,sa.fk_company
    #,sa.ai_work_cd
    #,sa.fd_contact_channel_code
    #,sa.order_date1
    #,sa.caller_name AS callerName
    #,ifnull(sa.tb_broker_id, '')
    #,ifnull(d.disp_name, '') AS category
    #,ifnull(e.fd_name, '') AS channel
    #,ifnull(ct.fd_company_name, '') AS companyName
    #,sa.order_date1 AS order_date
    ,(
        SELECT
            GROUP_CONCAT(
                CASE
                  WHEN dial.fd_dialogue_message_code = 'B1302' THEN
                    CONCAT('AI : ', dial.fd_message)
                  WHEN dial.fd_dialogue_message_code = 'B1301' THEN
                    CASE
                      WHEN dial.session_type_cd IS NULL OR dial.session_type_cd = 'B1011' THEN
                        CONCAT('°í°´ : ', dial.fd_message)
                      WHEN dial.session_type_cd = 'B1012' THEN
                        CONCAT('»ó´ã»ç : ', dial.fd_message)
                      ELSE
                        CONCAT('°í°´ : ', dial.fd_message)
                    END
                  ELSE
                    dial.fd_message
                END SEPARATOR '
'
                )
        FROM tbl_issue_dialogue dial
        WHERE dial.fd_message IS NOT NULL
          AND dial.fd_message != ''
          AND sa.tb_broker_id = dial.fd_call_broker_id
    ) AS dialogue
    ,(SELECT fd_comment FROM tbl_issue_ticket it WHERE sa.fk_issue_ticket = it.pk_issue_ticket)
FROM (
    SELECT
        a.ani
        ,a.fd_customer_uid
        ,a.fd_regdate
        ,a.pk_issue_contact
        ,a.msg_title
        ,a.fk_company
        ,b.ai_work_cd
        ,a.fd_contact_channel_code
        ,CASE
            WHEN a.fd_regdate IS NOT NULL THEN a.fd_regdate
            ELSE a.call_dt_from
        END AS order_date1
        ,a.caller_name
        ,a.tb_broker_id
        ,a.channel_cd
        ,a.fk_issue_ticket
    FROM tbl_issue_contact a
    LEFT JOIN tbl_ai_conf_work b ON a.fk_company_staff_ai = b.fk_company_staff_ai
        AND b.p_ai_work_cd IS NULL
        AND b.fk_company = 13733
    WHERE 1=1
      AND a.fk_company = 13733
      AND a.tb_broker_id IS NOT NULL
      AND a.tb_broker_id != '0000'
      AND (a.fk_issue_contact_parent IS NULL OR a.fk_issue_contact_parent = '')
      AND a.svc_type != 'OJT_INTERVIEW'
     #AND DATE(a.fd_regdate) > COALESCE(DATE(NULL), DATE_SUB(NOW(), INTERVAL 3 MONTH))
      AND date_format(a.fd_regdate, '%Y%m%d') between 20240503 and 20240513
    ORDER BY order_date1 DESC
) sa
LEFT JOIN tbl_ai_policy_work d ON sa.ai_work_cd = d.ai_work_cd
LEFT JOIN tbl_code e ON sa.fd_contact_channel_code = e.pk_code
LEFT JOIN tbl_company_customer ct ON (sa.ani = ct.fd_customer_mobile OR sa.ani = ct.fd_customer_phone)
    AND ct.fk_company = 13733
ORDER BY sa.order_date1 DESC;