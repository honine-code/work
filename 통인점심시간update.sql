update tbl_ai_conf_day_on set time_from_hh=12, time_to_hh=13, time_type='REST_LUNCH', work_type='R' where pk_ai_conf_day_on in
(
11840
,11841
,11842
,11843
,11844
,11845
,11846
);




비트 업무시간
update tbl_ai_conf_day_on set time_from_hh=9, time_to_hh=18 WHERE pk_ai_conf_day_on IN 
(
5129
,5130
,5134
,5135
) AND fk_company=77;

비트 점심시간

update tbl_ai_conf_day_on set time_from_hh=12, time_to_hh=13 WHERE pk_ai_conf_day_on IN 
(
215
218
221
224
227
230
) AND fk_company=77;



insert into tbl_ai_conf_day_on
(fk_company, fk_company_staff_ai, week_num, time_from_hh, time_from_min, time_to_hh, time_to_min, work_type, time_type, enable_yn, use_yn)
values
(3181, 7793, 1, 12, 0, 13, 0, 'R', 'REST_LUNCH', 'Y', 'Y');

insert into tbl_ai_conf_day_on
(fk_company, fk_company_staff_ai, week_num, time_from_hh, time_from_min, time_to_hh, time_to_min, work_type, time_type, enable_yn, use_yn)
values
(3181, 7793, 2, 12, 0, 13, 0, 'R', 'REST_LUNCH', 'Y', 'Y');

insert into tbl_ai_conf_day_on
(fk_company, fk_company_staff_ai, week_num, time_from_hh, time_from_min, time_to_hh, time_to_min, work_type, time_type, enable_yn, use_yn)
values
(3181, 7793, 3, 12, 0, 13, 0, 'R', 'REST_LUNCH', 'Y', 'Y');

insert into tbl_ai_conf_day_on
(fk_company, fk_company_staff_ai, week_num, time_from_hh, time_from_min, time_to_hh, time_to_min, work_type, time_type, enable_yn, use_yn)
values
(3181, 7793, 4, 12, 0, 13, 0, 'R', 'REST_LUNCH', 'Y', 'Y');

insert into tbl_ai_conf_day_on
(fk_company, fk_company_staff_ai, week_num, time_from_hh, time_from_min, time_to_hh, time_to_min, work_type, time_type, enable_yn, use_yn)
values
(3181, 7793, 5, 12, 0, 13, 0, 'R', 'REST_LUNCH', 'Y', 'Y');

insert into tbl_ai_conf_day_on
(fk_company, fk_company_staff_ai, week_num, time_from_hh, time_from_min, time_to_hh, time_to_min, work_type, time_type, enable_yn, use_yn)
values
(3181, 7793, 6, 12, 0, 13, 0, 'R', 'REST_LUNCH', 'Y', 'Y');

insert into tbl_ai_conf_day_on
(fk_company, fk_company_staff_ai, week_num, time_from_hh, time_from_min, time_to_hh, time_to_min, work_type, time_type, enable_yn, use_yn)
values
(3181, 7793, 7, 12, 0, 13, 0, 'R', 'REST_LUNCH', 'Y', 'Y');


update tbl_ai_conf_day_on set time_from_hh=12, time_to_hh=13, time_type='REST_LUNCH', work_type='R' where pk_ai_conf_day_on in
(
84685
,84686
,84687
,84688
,84689
,84690
,84691
);