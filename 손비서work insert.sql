insert into tbl_ai_conf_work
(fk_company, fk_company_staff_ai, ai_work_cd, front_status, bot_status, enable_yn, open_company_yn, open_company_addr_yn, open_company_level_yn, open_email_yn, open_birth_yn, use_yn, fd_regdate)
values
(3172, 7742, 'CTGR1_HANDS', 'INIT', 'INIT', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', now());

insert into tbl_ai_conf_work
(fk_company, fk_company_staff_ai, ai_work_cd, p_ai_work_cd, front_status, bot_status, enable_yn, open_company_yn, open_company_addr_yn, open_company_level_yn, open_email_yn, open_birth_yn, use_yn, fd_regdate)
values
(3172, 7742, 'CTGR2_HANDS_MAIN', 'CTGR1_HANDS', 'INIT', 'INIT', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', now());



insert into tbl_ai_conf_work_task
(fk_company, fk_company_staff_ai, ai_work_cd, p_ai_work_cd, enable_yn, fk_company_staff, term_val, task_val, use_yn) values
 (3172, 7742, 'CTGR3_HANDS_NICKNAME', 'CTGR2_HANDS_MAIN', 'Y', 7741, 0, (select fd_staff_name from tbl_company_staff where pk_company_staff = 7741), 'Y')
,(3172, 7742, 'CTGR3_HANDS_COMPANY_NAME', 'CTGR2_HANDS_MAIN', 'N', 7741, 0, null, 'Y')
,(3172, 7742, 'CTGR3_HANDS_COMPANY_POSITION', 'CTGR2_HANDS_MAIN', 'N', 7741, 0, null, 'Y')
,(3172, 7742, 'CTGR3_HANDS_COMPANY_ADDR', 'CTGR2_HANDS_MAIN', 'N', 7741, 0, null, 'Y')
,(3172, 7742, 'CTGR3_HANDS_BIRTH', 'CTGR2_HANDS_MAIN', 'N', 7741, 0, null, 'Y')
,(3172, 7742, 'CTGR3_HANDS_COMPANY_PHONE', 'CTGR2_HANDS_MAIN', 'N', 7741, 0, null, 'Y')
,(3172, 7742, 'CTGR3_HANDS_EMAIL', 'CTGR2_HANDS_MAIN', 'N', 7741, 0, null, 'Y'))
;


insert into tbl_ai_conf_day_on (fk_company,fk_company_staff_ai,week_num,time_from_hh,time_from_min,time_to_hh,time_to_min,work_type,time_type,msg_intro,msg_close,use_yn,fd_regdate) values
 (3172,7742,1,0,0,0,0,'W','WORK_ON',null,null,'Y',now())
,(3172,7742,1,0,0,0,0,'R','REST_LUNCH',null,null,'Y',now())
,(3172,7742,1,0,0,0,0,'R','REST_DINNER',null,null,'Y',now())
,(3172,7742,2,9,0,18,0,'W','WORK_ON',null,null,'Y',now())
,(3172,7742,2,12,0,13,0,'R','REST_LUNCH',null,null,'Y',now())
,(3172,7742,2,0,0,0,0,'R','REST_DINNER',null,null,'Y',now())
,(3172,7742,3,9,0,18,0,'W','WORK_ON',null,null,'Y',now())
,(3172,7742,3,12,0,13,0,'R','REST_LUNCH',null,null,'Y',now())
,(3172,7742,3,0,0,0,0,'R','REST_DINNER',null,null,'Y',now())
,(3172,7742,4,9,0,18,0,'W','WORK_ON',null,null,'Y',now())
,(3172,7742,4,12,0,13,0,'R','REST_LUNCH',null,null,'Y',now())
,(3172,7742,4,0,0,0,0,'R','REST_DINNER',null,null,'Y',now())
,(3172,7742,5,9,0,18,0,'W','WORK_ON',null,null,'Y',now())
,(3172,7742,5,12,0,13,0,'R','REST_LUNCH',null,null,'Y',now())
,(3172,7742,5,0,0,0,0,'R','REST_DINNER',null,null,'Y',now())
,(3172,7742,6,9,0,18,0,'W','WORK_ON',null,null,'Y',now())
,(3172,7742,6,12,0,13,0,'R','REST_LUNCH',null,null,'Y',now())
,(3172,7742,6,0,0,0,0,'R','REST_DINNER',null,null,'Y',now())
,(3172,7742,7,0,0,0,0,'W','WORK_ON',null,null,'Y',now())
,(3172,7742,7,0,0,0,0,'R','REST_LUNCH',null,null,'Y',now())
,(3172,7742,7,0,0,0,0,'R','REST_DINNER',null,null,'Y',now())
,(3172,7742,99,0,0,0,0,'W','WORK_ON',null,null,'Y',now())
,(3172,7742,99,0,0,0,0,'R','REST_LUNCH',null,null,'Y',now())
;


insert into tbl_ai_conf_intro (fk_company,fk_company_staff_ai,msg_before,msg_body,default_yn,warn_yn,use_yn,fd_regdate) values
(3172,7742,null,null,'Y','N','Y',now());