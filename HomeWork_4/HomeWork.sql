--������� �������
--categories
create index idx_categ_name on categories (name); --����� �� �������� ���������
--doc_details
create index idx_doc_det_prod_count on doc_details (id_product, prod_count); --����� ������������� �����
create index idx_doc_det_prod_ship on doc_details (id_product, prod_shipped); --����� ����������� ����� ��� ����� ����������
--docs
create index idx_docs_doc_numb on docs (doc_number) reverse; --��������� ��� ������ ���������� �� ������ (����� � ���� <�������>_<�����>)
--history_prices
--������� ��� ��������� ������� ��� �� ������
create index idx_his_pr_sel_pur_pr on history_prices (selling_price - purchase_price);--������ �� ������� ���
create index idx_his_pr_prod_sel_pr on history_prices (id_prod_wh, selling_price); --������ �� ������ �� ������ � ���� �������
create index idx_his_pr_prod_pur_pr on history_prices (id_prod_wh, purchase_price); --������ �� ������ �� ������ � ���� ��������
--individuals
create bitmap index idx_individ_gender on individuals (gender);--�������� ������ F ��� M
create index idx_individ_dob on individuals (extract(year from date_of_birth)); -- ������ ������ �� ����
--loyalty_program
create unique index idx_loy_prog_code on loyalty_program (code); --����� ������ ���� ����������
--loyprog_by_products
create index idx_loypr_prod_prod_loy_act_date on loyprog_by_products (id_product, id_loyprog, actual_date); --�� ��������, ��������� ���������� � ���� ������������ (����� ���� ��������� �������, ������� �� ����������)
create index idx_loypr_prod_prod_amount on loyprog_by_products (id_product, amount); --�����, ����������� � ���������� �������
--partners
--����� ��.��� �� ���, ����, ��������
create index idx_partners_inn on partners (inn);
create index idx_partners_ogrn on partners (ogrn);
create index idx_partners_name on partners (name);
--products
create index idx_products_art on products (article); --��� ������ �� �������
create index idx_products_name on products (name); --��� ������ �� ��������
--products_by_spec
--����� ������������ �� ��������
create index idx_prod_by_spec_text on products_by_spec (text_value);
create index idx_prod_by_spec_numb on products_by_spec (number_value);
--products_in_warehouse
create unique index idx_prod_in_wh_pro_wh_sup on products_in_warehouse (id_product, id_warehouse, id_supplier); --������������ �������
create index idx_prod_in_wh_prod_pur_pr on products_in_warehouse (id_product, purchase_price); --����� � ���� �������
create index idx_prod_in_wh_prod_sel_pr on products_in_warehouse (id_product, selling_price); -- ����� � ���� �������
--specifications
create bitmap index idx_spec_is_search on specifications (is_search); --�������� ������ Y ��� N
--users
create unique index idx_users_login on users (login); -- ����� ������������ ������ ���� ����������
--warehouse
create bitmap index  idx_wh_pickup on warehouse (pickup); --�������� ������ Y ��� N
-----------------------------------------------------------------------
--������� ����������� (����� �������� �������������� �����������. NOT NULL ����������� ������ � ������, �� ����� ���������� � ����� �� (������������ �������� ������� ������) 
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