SELECT
  fd_message AS 원본,
  fd_message_to AS 수정후,
  DATE_FORMAT(fd_regdate, '%Y%m%d %H:%i:%s') AS 생성일자,
  DATE_FORMAT(fd_moddate, '%Y%m%d %H:%i:%s') AS 수정일자
FROM tbl_issue_dialogue_log
WHERE DATE_FORMAT(fd_regdate, '%Y%m%d %H') BETWEEN '20231121 09' AND '20231122 09'
AND fk_issue_contact IN ( SELECT pk_issue_contact FROM tbl_issue_contact WHERE fk_company=13733 )
ORDER BY fd_regdate
;