--member_snum : 2911

--����ȸ����
select * from tb_member_person order by regist_dt desc;

--���ȸ����
select * from tb_member_company order by regist_dt desc;

--ȸ���÷�ϾȻ�
select * from tb_ploonian order by regist_dt desc;

--ȸ�����ǳ���
select * from tb_member_agree order by regist_dt desc;

--ȸ�����õ��ǳ���
select * from tb_member_agree_optional order by regist_dt desc;

--ȸ���Ϸù�ȣ��
select * from tb_member_snum where member_snum=2911;

--ȸ��SNS�����⺻
select * from tb_member_sns where member_snum=2911;

--Ż��ȸ��������
select * from tb_member_cancel order by regist_dt desc;

--�޸�ȸ����������
select member_snum from tb_member_sleeper group by member_snum order by regist_dt desc;

--�޸�ȸ�����Ϲ߼۳���
select * from tb_sleeper_sendmail order by regist_dt desc;

--�����ڵ�⺻
select * from tb_code;

--÷��ȭ�ϻ�
select * from tb_file order by regist_dt desc;

--�������
select * from tb_terms;

--�������۳���
select * from tb_auth_send order by regist_dt desc;

--�ϴ��Ϲ��ǳ���
select * from tb_qna order  by regist_dt desc;

--�������������ݻ�
select * from tb_enterprise;

--����ũ�����⺻
select * from tb_credit;

--ȸ��ũ�������޳���
select * from tb_credit_member order by regist_dt desc;

--��ڱ⺻
select * from tb_operator order by regist_dt desc;

--��ڱ��ѱ⺻
select * from tb_operator_role order by regist_dt desc;

--�޴��⺻
select * from tb_menu;

--���ұ⺻
select * from tb_role;

--���Ҹ޴���
select * from tb_role_menu;

--���Ӱ��ɾ����ǻ�
select * from tb_admin_ip;

--���޹��ǳ���
select * from tb_qna_partnership order by regist_dt desc;

--��������
select * from tb_notice;

--�˾�����
select * from tb_popup;

--��ʳ���
select * from tb_banner;

--���񽺻���Ʈ����
select * from tb_service_site;

--ȸ�翬������
select * from tb_company_history;

--���Ǵ���ڻ�
select * from tb_contact_email;

--���ηα�
select * from tb_admin_log;

--��ġ�α�
select * from tb_batch_log order by regist_dt desc;

--����ŸƮ ȸ������
select * from tb_member_quickstart order by regist_dt desc;