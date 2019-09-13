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
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (1,'Новый');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (2,'На подписи');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (3,'Подписан'); 
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (4,'На корректировке');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (5,'Принят');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (6,'Отправлен');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (7,'Поступил'); 
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (8,'На подтверждении');  --(у склада - для РН)
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (9,'Аннулирован');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (10,'Подтвержден'); -- (у склада - для РН)
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (11,'На сборке'); 
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (12,'Собран'); 
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (13,'Получен'); 
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (21,'В пути');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (22,'Скорректирован');
Insert into C##ZAYETS.DOCSTATES (ID_DOC_STATE,NAME) values (23,'Оприходован');
--select seq_gen_dict.nextval from dual;

--DocTypes
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (14,'ПН','Приходная накладная','P');
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (15,'РН','Расходная накладная','R');
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (16,'ЗПок','Заявка покупателя',null);
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (17,'ЗП','Заказ поставщику',null);
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (18,'ВПок','Возврат покупателя', 'P');
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (19,'ВПст','Возврат поставщику', 'R');
Insert into C##ZAYETS.DOCTYPES (ID_DOCTYPE,DOCTYPE_CODE,NAME,DOC_DIRECTION) values (20,'Кор','Корректировка', null);

--categories
insert into categories
select seq_gen_categories.nextval, seq_gen_categories.currval, 'Товары', 'Главная категория' from dual;

--doc_states_types
--ПН
insert into doc_states_types (id_docstate, id_doctype, s_number) values (21, 14, 1); --в пути
insert into doc_states_types (id_docstate, id_doctype,s_number) values (7, 14, 2); --поступил
insert into doc_states_types (id_docstate, id_doctype,s_number) values (13, 14, 3); --получен
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 14, 4); --на корректировке
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 14, 5); --аннулирован
insert into doc_states_types (id_docstate, id_doctype,s_number) values (23, 14, 6); --оприходован
--ЗПок
insert into doc_states_types (id_docstate, id_doctype, s_number) values (1, 16, 1); --новый
insert into doc_states_types (id_docstate, id_doctype, s_number) values (5, 16, 2); --принят
insert into doc_states_types (id_docstate, id_doctype, s_number) values (2, 16, 3); --на подписи
insert into doc_states_types (id_docstate, id_doctype, s_number) values (3, 16, 4); --подписан
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 16, 5); --на корректировке
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 16, 6); --аннулирован
--ЗП
insert into doc_states_types (id_docstate, id_doctype, s_number) values (1, 17, 1); --новый
insert into doc_states_types (id_docstate, id_doctype, s_number) values (5, 17, 2); --принят
insert into doc_states_types (id_docstate, id_doctype, s_number) values (2, 17, 3); --на подписи
insert into doc_states_types (id_docstate, id_doctype, s_number) values (3, 17, 4); --подписан
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 17, 5); --на корректировке
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 17, 6); --аннулирован
--РН
insert into doc_states_types (id_docstate, id_doctype, s_number) values (1, 15, 1); --новый
insert into doc_states_types (id_docstate, id_doctype, s_number) values (5, 15, 2); --принят
insert into doc_states_types (id_docstate, id_doctype, s_number) values (8, 15, 3); --на подтверждении
insert into doc_states_types (id_docstate, id_doctype, s_number) values (10, 15, 4); --подтвержден
insert into doc_states_types (id_docstate, id_doctype, s_number) values (11, 15, 5); --на сборке
insert into doc_states_types (id_docstate, id_doctype, s_number) values (12, 15, 6); --собран
insert into doc_states_types (id_docstate, id_doctype, s_number) values (6, 15, 7); --отправлен
insert into doc_states_types (id_docstate, id_doctype, s_number) values (13, 15, 8); --получен
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 15, 9); --на корректировке
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 15, 10); --аннулирован
--ВПок
insert into doc_states_types (id_docstate, id_doctype, s_number) values (1, 18, 1); --новый
insert into doc_states_types (id_docstate, id_doctype, s_number) values (8, 18, 2); --на подтверждении
insert into doc_states_types (id_docstate, id_doctype, s_number) values (10, 18, 3); --подтержден
insert into doc_states_types (id_docstate, id_doctype, s_number) values (21, 18, 4); --в пути
insert into doc_states_types (id_docstate, id_doctype, s_number) values (7, 18, 5); --поступил
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 18, 6); --на корректировке
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 18, 7); --аннулирован
insert into doc_states_types (id_docstate, id_doctype,s_number) values (23, 18, 8); --оприходован
--ВПст
insert into doc_states_types (id_docstate, id_doctype, s_number) values (1, 19, 1); --новый
insert into doc_states_types (id_docstate, id_doctype, s_number) values (8, 19, 2); --на подтверждении
insert into doc_states_types (id_docstate, id_doctype, s_number) values (10, 19, 3); --подтвержден
insert into doc_states_types (id_docstate, id_doctype, s_number) values (6, 19, 4); --отправлен
insert into doc_states_types (id_docstate, id_doctype, s_number) values (13, 19, 5); --получен
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 19, 6); --на корректировке
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 19, 7); --аннулирован
--Кор
insert into doc_states_types (id_docstate, id_doctype, s_number) values (1, 20, 1); --новый
insert into doc_states_types (id_docstate, id_doctype, s_number) values (2, 20, 2); --на подписи
insert into doc_states_types (id_docstate, id_doctype, s_number) values (3, 20, 3); --подписан
insert into doc_states_types (id_docstate, id_doctype, s_number) values (22, 20, 4); --скорректирован
insert into doc_states_types (id_docstate, id_doctype,s_number) values (4, 20, 5); --на корректировке
insert into doc_states_types (id_docstate, id_doctype,s_number) values (9, 20, 6); --аннулирован

update doc_states_types set is_fixed = 'R' 
  where (id_doctype = 16 and id_docstate = 3) or (id_doctype = 19 and id_docstate = 10);
update doc_states_types set is_fixed = 'Y'
  where (id_doctype = 15 and id_docstate = 6)  or (id_doctype = 14 and id_docstate = 23) 
    or (id_doctype = 18 and id_docstate = 23) or (id_doctype = 19 and id_docstate = 6) ;

-- тут update с неявным join
update doc_states_types set is_fixed = 'Y' 
where id_doctype = (select id_doctype from doctypes where doctype_code = 'Кор') 
  and id_docstate = (select id_doc_state from docstates where name = 'Скорректирован');
--paytypes
insert into paytypes values(seq_gen_dict.nextval, 'Наличный');
insert into paytypes values(seq_gen_dict.nextval, 'Безналичный');
insert into paytypes values(seq_gen_dict.nextval, 'Подарочная карта');

--users
insert into users(user_id, login, fullname, position, department) values(seq_gen_users.nextval, 'ROOT_ADMIN', 'ROOT_Admin', 'Admin', 'UIT');