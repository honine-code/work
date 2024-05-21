SELECT
    pk_ai_conf_day_on
    ,fk_company
    ,fk_company_staff_ai
    ,CASE
        WHEN fk_company = 77 THEN '����, ���ͺ�Ʈ'
        WHEN fk_company = 6143 THEN '����, ���������'
        WHEN fk_company = 8109 THEN '�λ�, ���ͺ�Ʈ'
        ELSE fk_company
    END AS company_name_ko
    ,CASE
        WHEN week_num = 1 THEN '��'
        WHEN week_num = 2 THEN '��'
        WHEN week_num = 3 THEN 'ȭ'
        WHEN week_num = 4 THEN '��'
        WHEN week_num = 5 THEN '��'
        WHEN week_num = 6 THEN '��'
        WHEN week_num = 7 THEN '��'
        ELSE week_num 
    END AS week_num_ko
    ,time_from_hh
    ,time_from_min
    ,time_to_hh
    ,time_to_min
    ,CASE
        WHEN time_type = 'WORK_ON' THEN '�����ð�'
        WHEN time_type = 'REST_LUNCH' THEN '���ɽð�'
        WHEN time_type = 'REST_DINNER' THEN '����ð�'
        ELSE time_type
    END AS time_type_ko
    ,msg_intro
    ,msg_close
    ,use_yn
    ,fd_regdate
    ,fd_moddate
FROM tbl_ai_conf_day_on
WHERE 1=1
    AND fk_company_staff_ai IN (290, 12612, 16578)
ORDER BY fk_company, week_num
;