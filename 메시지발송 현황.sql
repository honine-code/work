SELECT
    b.fk_company,
    a.fd_company_name,
    CASE 
        WHEN a.user_type = 'B2001' THEN '���'
        WHEN a.user_type = 'B2002' THEN '����'
        ELSE '�˼�����'
    END AS '��������',
    CASE
        WHEN b.message_type = 'B1001' THEN '�˸���'
        WHEN b.message_type = 'B1002' THEN '�̹��� �˸���'
        WHEN b.message_type = 'B1003' THEN 'ģ����'
        WHEN b.message_type = 'B1004' THEN '�̹��� ģ����'
        WHEN b.message_type = 'B1005' THEN '���̵� �̹��� ģ����'
        WHEN b.message_type = 'B1006' THEN 'SMS'
        WHEN b.message_type = 'B1007' THEN 'LMS'
        WHEN b.message_type = 'B1008' THEN 'MMS'
        WHEN b.message_type = 'B1009' THEN 'E-mail'
        ELSE 'Ȯ���ʿ�'
    END AS '�߽�����',
    count(b.fk_company)
from tbl_company a
INNER JOIN tb_notification_msg_record b ON a.pk_company = b.fk_company
WHERE 1=1
AND DATE_FORMAT(b.fd_regdate, '%Y%m') BETWEEN '202401' AND '202402'
AND a.solution_type='B11'
GROUP BY b.fk_company, message_type
ORDER BY a.user_type, message_type, a.pk_company
;