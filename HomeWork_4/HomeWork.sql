--Создаем индексы
--categories
create index idx_categ_name on categories (name); --поиск по названию категории 
--doc_details
create index idx_doc_det_prod_count on doc_details (prod_count); --самый запрашиваемый товар
create index idx_doc_det_prod_ship on doc_details (prod_shipped); --самый продаваемый товар или самый закупаемый
--docs
create index idx_docs_doc_numb on docs (doc_number) reverse; --необходим для поиска документов по номеру (номер в виде <префикс>_<номер>)
--history_prices
--индексы для получения истории цен по товару
create index idx_his_pr_sel_pur_pr on history_prices (selling_price - purchase_price);--индекс на разницу цен
create index idx_his_pr_prod_sel_pr on history_prices (id_prod_wh, selling_price); --индекс по товару на складе и цене продажи
create index idx_his_pr_prod_pur_pr on history_prices (id_prod_wh, purchase_price); --индекс по товару на складе и цене поставки
--individuals
create bitmap index idx_individ_gender on individuals (gender);--значения только F или M
create index idx_individ_dob on individuals (extract(year from date_of_birth)); -- делаем индекс по году
--loyalty_program
create unique index idx_loy_prog_code on loyalty_program (code); --купон должен быть уникальным
--loyprog_by_products
create index idx_loypr_prod_prod_loy_act_date on loyprog_by_products (id_product, id_loyprog, actual_date); --по продукту, программе лояльности и дате актуальности (может быть несколько строчек, поэтому не уникальный)
create index idx_loypr_prod_prod_amount on loyprog_by_products (id_product, amount); --товар, продаваемый с наибольшей скидкой
--partners
--поиск юр.лиц по ИНН, ОГРН, названию
create index idx_partners_inn on partners (inn);
create index idx_partners_ogrn on partners (ogrn);
create index idx_partners_name on partners (name);
--products
create index idx_products_art on products (article); --для поиска по артиклу
create index idx_products_name on products (name); --для поиска по названию
--products_by_spec
--поиск спецификаций по значению
create index idx_prod_by_spec_text on products_by_spec (text_value);
create index idx_prod_by_spec_numb on products_by_spec (number_value);
--products_in_warehouse
create unique index idx_prod_in_wh_pro_wh_sup on products_in_warehouse (id_product, id_warehouse, id_supplier); --уникальность строчки
create index idx_prod_in_wh_prod_pur_pr on products_in_warehouse (id_product, purchase_price); --товар и цена покупки
create index idx_prod_in_wh_prod_sel_pr on products_in_warehouse (id_product, selling_price); -- товар и цена продажи
--specifications
create bitmap index idx_spec_is_search on specifications (is_search); --значения только Y или N
--users
create unique index idx_users_login on users (login); -- логин пользователя должен быть уникальным
--warehouse
create bitmap index  idx_wh_pickup on warehouse (pickup); --значения только Y или N
-----------------------------------------------------------------------
--Создаем ограничения (здесь отражены дополнительные ограничения. NOT NULL создавались вместе с полями, их можно посмотреть в схеме БД (обязательные отмечены красной точкой) 
--users
ALTER TABLE USERS
ADD CONSTRAINT chk_users_login CHECK (length(login) >= 5);
--doc_details
ALTER TABLE DOC_DETAILS
ADD CONSTRAINT chk_doc_det_prod_count CHECK (prod_count >= 0)
add constraint chk_doc_det_prod_res check (prod_reserve >= 0)
add constraint chk_doc_det_prod_ship check (prod_shipped >= 0)
add constraint chk_doc_det_full_price check (full_price >= 0)
add constraint chk_doc_det_price_loypr check (price_loyprog >= 0)
add constraint chk_doc_det_dd_sum check (doc_detail_sum >= 0);
--docs
alter table docs
add constraint chk_doc_is_pick check (is_pickup in ('Y', 'N'))
add constraint chk_doc_dd_dfd check (doc_date <= doc_fixed_date)
add constraint chk_doc_dsum check (doc_sum  >= 0)
add constraint chk_doc_dsum_loypr check (doc_sum_loyprog >=0);
--doc_states_types
alter table doc_states_types
add constraint chk_dst_is_fix check (is_fixed in ('Y', 'N', 'R'));
--doctypes
alter table doctypes
add constraint chk_dt_ddir check (doc_direction is null or doc_direction in ('P', 'R'));
--history_prices
alter table history_prices
add constraint chk_his_pr_pur_pr check (purchase_price >= 0)
add constraint chk_his_pr_sel_pr check (selling_price >= 0);
--individuals
alter table individuals
add constraint chk_indiv_login check (length(login) >= 5)
add constraint chk_indiv_pas check (ltrim(password,'1234567890') is not null)
add constraint ck_indiv_gen check (gender is null or gendr in ('M', 'F'))
add constraint ck_indiv_sub check (subscription in ('Y', 'N'));
--products_in_warehouse
ALTER TABLE products_in_warehouse
ADD CONSTRAINT chk_pr_wh_prod_count CHECK (prod_count >= 0)
add constraint chk_pr_wh_prod_res check (prod_reserve >= 0)
add constraint chk_pr_wh_pur_pr check (purchase_price >= 0)
add constraint chk_pr_wh_sel_pr check (selling_price >= 0);
--product_moving
ALTER TABLE product_moving
ADD CONSTRAINT chk_pr_mov_prod_count CHECK (prod_count >= 0)
add constraint chk_pr_mov_prod_res check (prod_reserve >= 0);
--specifications
ALTER TABLE specifications
ADD CONSTRAINT chk_spec_is_search CHECK (is_search in ('Y', 'N'));
--warehouse
ALTER TABLE warehouse
ADD CONSTRAINT chk_wh_pickup CHECK (pickup in ('Y', 'N'));