CREATE OR REPLACE TRIGGER TAU_PRODUCTS_IN_WH 
AFTER UPDATE ON PRODUCTS_IN_WAREHOUSE 
for each row
--*** триггер нужен для ведения истории цен
BEGIN
  if (:old.purchase_price <> :new.purchase_price)
    or (:old.selling_price <> :new.selling_price) then
    
    insert into history_prices values(:old.id_prod_wh, :old.purchase_price, :old.selling_price, :old.change_date, :old.user_id);
  end if;
END;