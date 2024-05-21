SELECT 
    sa.*,
    d.disp_name AS fd_name,
    e.fd_name as channel,
    DATE_FORMAT(DATE_SUB(sa.order_date1, INTERVAL 9 HOUR), '%Y-%m-%d %H:%i:%s') order_date,
    (
        SELECT GROUP_CONCAT(dial.fd_message SEPARATOR '\n')
        FROM tbl_issue_dialogue dial
        WHERE dial.fd_message IS NOT NULL
          AND dial.fd_message != ''
          AND sa.pk_issue_contact = dial.fk_issue_contact
    ) AS fd_message
FROM (
    SELECT 
        a.ani,
        a.fd_customer_uid,
        DATE_FORMAT(DATE_SUB(a.fd_regdate, INTERVAL 9 HOUR), '%Y-%m-%d %H:%i:%s') AS fd_regdate,
        a.pk_issue_contact,
        a.msg_title,
        a.fk_company,
        b.ai_work_cd,
        a.fd_contact_channel_code,
        CASE 
            WHEN a.fd_regdate IS NOT NULL THEN a.fd_regdate 
            ELSE a.call_dt_from 
        END AS order_date1,
        a.caller_name
    FROM tbl_issue_contact a
    LEFT JOIN tbl_ai_conf_work b ON a.fk_company_staff_ai = b.fk_company_staff_ai AND b.p_ai_work_cd IS NULL AND b.fk_company = 77
    WHERE a.fk_company = 77
      AND a.tb_broker_id IS NOT NULL AND a.tb_broker_id != '0000'
      AND (a.fk_issue_contact_parent IS NULL OR a.fk_issue_contact_parent = '')
      AND a.svc_type <> 'OJT_INTERVIEW'
      AND DATE(a.fd_regdate) BETWEEN '2024-01-21' AND '2024-02-20'
    ORDER BY order_date1 DESC
) sa
LEFT JOIN tbl_ai_policy_work d ON sa.ai_work_cd = d.ai_work_cd
LEFT JOIN tbl_code e ON sa.fd_contact_channel_code = e.pk_code
ORDER BY sa.order_date1 DESC

;
