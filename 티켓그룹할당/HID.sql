--HID 담당자 오프라인 변경
UPDATE tbl_company_staff SET fd_staff_response_status_code='A1207' WHERE pk_company_staff IN
(
12611
,12613
,12634
,21716
,21717
,21718
,21720
,23810
,23811
) AND fk_company=6143
;