SELECT
    pk_ai_conf_day_on
    ,fk_company
    ,fk_company_staff_ai
    ,CASE
        WHEN fk_company = 77 THEN '서울, 닥터비트'
        WHEN fk_company = 6143 THEN '서울, 병원사업부'
        WHEN fk_company = 8109 THEN '부산, 닥터비트'
        ELSE fk_company
    END AS company_name_ko
    ,CASE
        WHEN week_num = 1 THEN '일'
        WHEN week_num = 2 THEN '월'
        WHEN week_num = 3 THEN '화'
        WHEN week_num = 4 THEN '수'
        WHEN week_num = 5 THEN '목'
        WHEN week_num = 6 THEN '금'
        WHEN week_num = 7 THEN '토'
        ELSE week_num 
    END AS week_num_ko
    ,time_from_hh
    ,time_from_min
    ,time_to_hh
    ,time_to_min
    ,CASE
        WHEN time_type = 'WORK_ON' THEN '업무시간'
        WHEN time_type = 'REST_LUNCH' THEN '점심시간'
        WHEN time_type = 'REST_DINNER' THEN '저녁시간'
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