WITH customer_msg AS (
  SELECT 
    A.fk_issue_contact,
    COALESCE(A.fd_message, t.fd_comment) AS message,
    A.dt_edit_msg_body,
    A.fd_regdate
  FROM tbl_issue_dialogue A
  INNER JOIN tbl_issue_contact ic ON A.fk_issue_contact = ic.pk_issue_contact
  LEFT JOIN tbl_issue_ticket t ON ic.fk_issue_ticket = t.pk_issue_ticket
  WHERE A.fd_dialogue_message_code = 'B1301'
  ORDER BY A.fd_regdate desc
)
SELECT
  DATE_FORMAT(A.fd_regdate, '%Y%m%d') AS date,
  B.fk_issue_ticket AS 티켓ID,
  A.fd_message AS AI,
  (
    SELECT 
      message
    FROM customer_msg
    WHERE customer_msg.fk_issue_contact = A.fk_issue_contact 
    AND customer_msg.fd_regdate > A.fd_regdate 
    ORDER BY customer_msg.fd_regdate ASC
    LIMIT 1
  ) AS 고객,
  (
    SELECT
      CASE
        WHEN dt_edit_msg_body IS NOT NULL THEN 'Y'
        WHEN dt_edit_msg_body IS NULL THEN 'N'
        ELSE 'N'
      END
    FROM customer_msg
    WHERE customer_msg.fk_issue_contact = A.fk_issue_contact 
    AND customer_msg.fd_regdate > A.fd_regdate 
    ORDER BY customer_msg.fd_regdate ASC
    LIMIT 1
  ) AS 수정여부,
  DATE_FORMAT(A.fd_regdate, '%H:%i:%s') AS time,
  A.fd_customer_uid AS customer
FROM 
  tbl_issue_dialogue A
INNER JOIN
  tbl_issue_contact B ON A.fk_issue_contact = B.pk_issue_contact
WHERE 1=1
  AND B.fk_company = 13733
  AND A.fd_dialogue_message_code = 'B1302'
  AND A.fd_dialogue_status_code != 'B1704'
  AND (A.fd_message IS NOT NULL AND A.fd_message != '')
  AND DATE_FORMAT(A.fd_regdate, '%Y%m%d') BETWEEN '20231001' AND '20231130'
ORDER BY 
  A.fk_issue_contact DESC, DATE_FORMAT(A.fd_regdate, '%H:%i:%s') ASC
;