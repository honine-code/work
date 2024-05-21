select company_name, count(company_name) from tbl_issue_contact
where msg_title='요약 없음'
and date_format(fd_regdate, '%Y%m%d') = 20240118
and pk_issue_contact in (select fk_issue_contact from tbl_issue_dialogue group by fk_issue_contact having count(fk_issue_contact) > 2)
group by company_name
;