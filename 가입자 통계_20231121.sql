SELECT 
  a.date,
  a.일반가입_개인,
  a.일반가입_기업,
  a.일반가입_total,
  a.일반탈퇴_total,
  a.QuickStart_개인,
  a.QuickStart_기업,
  a.QuickStart_total,
  a.QuickStart탈퇴_total,
  a.일반가입_total + a.QuickStart_total AS 가입_total,
  b.번호할당,
  c.OJT
FROM (
  SELECT 
    DATE_FORMAT(fd_regdate, '%Y%m%d') AS date,
    SUM(CASE WHEN user_type = 'B2002' AND quick_start_status = -1 THEN 1 ELSE 0 END) AS 일반가입_개인,
    SUM(CASE WHEN user_type = 'B2001' AND quick_start_status = -1 THEN 1 ELSE 0 END) AS 일반가입_기업,
    SUM(CASE WHEN quick_start_status = -1 THEN 1 ELSE 0 END) AS 일반가입_total,
    SUM(CASE WHEN quick_start_status = -1 AND fd_staff_status_code = 'A1103' THEN 1 ELSE 0 END) AS 일반탈퇴_total,
    SUM(CASE WHEN user_type = 'B2002' AND quick_start_status IN (1,2) THEN 1 ELSE 0 END) AS QuickStart_개인,
    SUM(CASE WHEN user_type = 'B2001' AND quick_start_status IN (1,2) THEN 1 ELSE 0 END) AS QuickStart_기업,
    SUM(CASE WHEN quick_start_status IN (1,2) THEN 1 ELSE 0 END) AS QuickStart_total,
    SUM(CASE WHEN quick_start_status IN (1,2) AND fd_staff_status_code = 'A1103' THEN 1 ELSE 0 END) AS QuickStart탈퇴_total
  FROM tbl_company_staff
  WHERE solution_type IN ('B11')
    AND fd_company_master_yn='Y'
    AND DATE_FORMAT(fd_regdate, '%Y%m%d') BETWEEN '20231101' AND '20231116'
  GROUP BY DATE_FORMAT(fd_regdate, '%Y%m%d')
) a
LEFT JOIN (
  SELECT
    DATE_FORMAT(fd_regdate, '%Y%m%d') AS date,
    COUNT(*) AS 번호할당
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