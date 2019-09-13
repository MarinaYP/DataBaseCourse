--DELETE
delete from categories;
delete from doc_details;
delete from doc_states_types;
delete from docs;
delete from docstates;
delete from doctypes;
delete from history_prices;
delete from individuals;
delete from loyalty_program;
delete from loyprog_by_products;
delete from partners;
delete from paytypes;
delete from products;
delete from products_by_categories;
delete from products_by_spec;
delete from products_in_warehouse;
delete from products_moving;
delete from specifications;
delete from users;
delete from warehouse;

--INSERT VALUES 
--DocStates
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (1,'�����');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (2,'�� �������');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (3,'��������'); 
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (4,'�� �������������');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (5,'������');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (6,'���������');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (7,'��������'); 
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (8,'�� �������������');  --(� ������ - ��� ��)
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (9,'�����������');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (10,'�����������'); -- (� ������ - ��� ��)
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (11,'�� ������'); 
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (12,'������'); 
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (13,'�������'); 
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (21,'� ����');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (22,'��������������');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (23,'�����������');
--select seq_gen_dict.nextval from dual;

--DocTypes
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (14,'��','��������� ���������','P');
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (15,'��','��������� ���������','R');
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (16,'����','������ ����������',null);
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (17,'��','����� ����������',null);
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (18,'����','������� ����������', 'P');
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (19,'����','������� ����������', 'R');
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (20,'���','�������������', null);

--categories
insert into categories
select seq_gen_categories.nextval, seq_gen_categories.currval, '������', '������� ���������' from dual;

--doc_states_types
--��
insert into doc_states_types (id_docstate, id_doctype, s_number) values (21, 14, 1); --� ����
insert into doc_states_types (id_docstate, id_doctype,s_number) values (7, 14, 2); --��������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (13, 14, 3); --�������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 14, 4); --�� �������������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 14, 5); --�����������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (23, 14, 6); --�����������
--����
insert into doc_states_types (id_docstate, id_doctype, s_number) values (1, 16, 1); --�����
insert into doc_states_types (id_docstate, id_doctype, s_number) values (5, 16, 2); --������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (2, 16, 3); --�� �������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (3, 16, 4); --��������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 16, 5); --�� �������������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 16, 6); --�����������
--��
insert into doc_states_types (id_docstate, id_doctype, s_number) values (1, 17, 1); --�����
insert into doc_states_types (id_docstate, id_doctype, s_number) values (5, 17, 2); --������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (2, 17, 3); --�� �������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (3, 17, 4); --��������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 17, 5); --�� �������������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 17, 6); --�����������
--��
insert into doc_states_types (id_docstate, id_doctype, s_number) values (1, 15, 1); --�����
insert into doc_states_types (id_docstate, id_doctype, s_number) values (5, 15, 2); --������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (8, 15, 3); --�� �������������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (10, 15, 4); --�����������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (11, 15, 5); --�� ������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (12, 15, 6); --������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (6, 15, 7); --���������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (13, 15, 8); --�������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 15, 9); --�� �������������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 15, 10); --�����������
--����
insert into doc_states_types (id_docstate, id_doctype, s_number) values (1, 18, 1); --�����
insert into doc_states_types (id_docstate, id_doctype, s_number) values (8, 18, 2); --�� �������������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (10, 18, 3); --����������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (21, 18, 4); --� ����
insert into doc_states_types (id_docstate, id_doctype, s_number) values (7, 18, 5); --��������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 18, 6); --�� �������������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 18, 7); --�����������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (23, 18, 8); --�����������
--����
insert into doc_states_types (id_docstate, id_doctype, s_number) values (1, 19, 1); --�����
insert into doc_states_types (id_docstate, id_doctype, s_number) values (8, 19, 2); --�� �������������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (10, 19, 3); --�����������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (6, 19, 4); --���������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (13, 19, 5); --�������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 19, 6); --�� �������������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 19, 7); --�����������
--���
insert into doc_states_types (id_docstate, id_doctype, s_number) values (1, 20, 1); --�����
insert into doc_states_types (id_docstate, id_doctype, s_number) values (2, 20, 2); --�� �������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (3, 20, 3); --��������
insert into doc_states_types (id_docstate, id_doctype, s_number) values (22, 20, 4); --��������������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 20, 5); --�� �������������
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 20, 6); --�����������

update doc_states_types set is_fixed = 'R' 
  where (id_doctype = 16 and id_docstate = 3) or (id_doctype = 19 and id_docstate = 10);
update doc_states_types set is_fixed = 'Y'
  where (id_doctype = 15 and id_docstate = 6)  or (id_doctype = 14 and id_docstate = 23) 
    or (id_doctype = 18 and id_docstate = 23) or (id_doctype = 19 and id_docstate = 6) ;

-- ��� update � ������� join
update doc_states_types set is_fixed = 'Y' 
where id_doctype = (select id_doctype from doctypes where doctype_code = '���') 
  and id_docstate = (select id_doc_state from docstates where name = '��������������');
--paytypes
insert into paytypes values(seq_gen_dict.nextval, '��������');
insert into paytypes values(seq_gen_dict.nextval, '�����������');
insert into paytypes values(seq_gen_dict.nextval, '���������� �����');

--users
insert into users(user_id, login, fullname, position, department) values(seq_gen_users.nextval, 'ROOT_ADMIN', 'ROOT_Admin', 'Admin', 'UIT');