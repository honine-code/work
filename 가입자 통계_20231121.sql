SELECT 
  a.date,
  a.�Ϲݰ���_����,
  a.�Ϲݰ���_���,
  a.�Ϲݰ���_total,
  a.�Ϲ�Ż��_total,
  a.QuickStart_����,
  a.QuickStart_���,
  a.QuickStart_total,
  a.QuickStartŻ��_total,
  a.�Ϲݰ���_total + a.QuickStart_total AS ����_total,
  b.��ȣ�Ҵ�,
  c.OJT
FROM (
  SELECT 
    DATE_FORMAT(fd_regdate, '%Y%m%d') AS date,
    SUM(CASE WHEN user_type = 'B2002' AND quick_start_status = -1 THEN 1 ELSE 0 END) AS �Ϲݰ���_����,
    SUM(CASE WHEN user_type = 'B2001' AND quick_start_status = -1 THEN 1 ELSE 0 END) AS �Ϲݰ���_���,
    SUM(CASE WHEN quick_start_status = -1 THEN 1 ELSE 0 END) AS �Ϲݰ���_total,
    SUM(CASE WHEN quick_start_status = -1 AND fd_staff_status_code = 'A1103' THEN 1 ELSE 0 END) AS �Ϲ�Ż��_total,
    SUM(CASE WHEN user_type = 'B2002' AND quick_start_status IN (1,2) THEN 1 ELSE 0 END) AS QuickStart_����,
    SUM(CASE WHEN user_type = 'B2001' AND quick_start_status IN (1,2) THEN 1 ELSE 0 END) AS QuickStart_���,
    SUM(CASE WHEN quick_start_status IN (1,2) THEN 1 ELSE 0 END) AS QuickStart_total,
    SUM(CASE WHEN quick_start_status IN (1,2) AND fd_staff_status_code = 'A1103' THEN 1 ELSE 0 END) AS QuickStartŻ��_total
  FROM tbl_company_staff
  WHERE solution_type IN ('B11')
    AND fd_company_master_yn='Y'
    AND DATE_FORMAT(fd_regdate, '%Y%m%d') BETWEEN '20231101' AND '20231116'
  GROUP BY DATE_FORMAT(fd_regdate, '%Y%m%d')
) a
LEFT JOIN (
  SELECT
    DATE_FORMAT(fd_regdate, '%Y%m%d') AS date,
    COUNT(*) AS ��ȣ�Ҵ�
  FROM tbl_company_dnis
  WHERE DATE_FORMAT(fd_regdate, '%Y%m%d') BETWEEN '20231101' AND '20231116'
  GROUP BY DATE_FORMAT(fd_regdate, '%Y%m%d')
) b ON a.date = b.date
LEFT JOIN (
  SELECT
    DATE_FORMAT(fd_regdate, '%Y%m%d') AS date,
    COUNT(*) AS OJT
  FROM tbl_ai_conf_work
  WHERE DATE_FORMAT(fd_regdate, '%Y%m%d') BETWEEN '20231101' AND '20231116'
    AND front_status = 'COMPLETE'
  GROUP BY DATE_FORMAT(fd_regdate, '%Y%m%d')
) c ON a.date = c.date
;