--member_snum : 2911

--개인회원상세
select * from tb_member_person order by regist_dt desc;

--기업회원상세
select * from tb_member_company order by regist_dt desc;

--회원플루니안상세
select * from tb_ploonian order by regist_dt desc;

--회원동의내역
select * from tb_member_agree order by regist_dt desc;

--회원선택동의내역
select * from tb_member_agree_optional order by regist_dt desc;

--회원일련번호상세
select * from tb_member_snum where member_snum=2911;

--회원SNS연동기본
select * from tb_member_sns where member_snum=2911;

--탈퇴회원정보상세
select * from tb_member_cancel order by regist_dt desc;

--휴면회원정보내역
select member_snum from tb_member_sleeper group by member_snum order by regist_dt desc;

--휴면회원메일발송내역
select * from tb_sleeper_sendmail order by regist_dt desc;

--공통코드기본
select * from tb_code;

--첨부화일상세
select * from tb_file order by regist_dt desc;

--약관내역
select * from tb_terms;

--인증전송내역
select * from tb_auth_send order by regist_dt desc;

--일대일문의내역
select * from tb_qna order  by regist_dt desc;

--엔터프라이즈요금상세
select * from tb_enterprise;

--수동크레딧기본
select * from tb_credit;

--회원크레딧지급내역
select * from tb_credit_member order by regist_dt desc;

--운영자기본
select * from tb_operator order by regist_dt desc;

--운영자권한기본
select * from tb_operator_role order by regist_dt desc;

--메뉴기본
select * from tb_menu;

--역할기본
select * from tb_role;

--역할메뉴상세
select * from tb_role_menu;

--접속가능아이피상세
select * from tb_admin_ip;

--제휴문의내역
select * from tb_qna_partnership order by regist_dt desc;

--공지내역
select * from tb_notice;

--팝업내역
select * from tb_popup;

--배너내역
select * from tb_banner;

--서비스사이트내역
select * from tb_service_site;

--회사연혁내역
select * from tb_company_history;

--문의담당자상세
select * from tb_contact_email;

--어드민로그
select * from tb_admin_log;

--배치로그
select * from tb_batch_log order by regist_dt desc;

--퀵스타트 회원정보
select * from tb_member_quickstart order by regist_dt desc;