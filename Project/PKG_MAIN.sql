    
create or replace PACKAGE BODY PKG_MAIN AS

--*** Процедура предназначена для вставки или обновления шапки документа DOCS. 
--*** Переход между состояниями документа производится другой процедурой
  procedure WriteDOCS(pID DOCS.ID_DOC%type, pDocType DOCS.ID_DOCTYPE%type, pPartner PARTNERS.ID_PARTNER%type,
                      pWareHouse WAREHOUSE.ID_WAREHOUSE%type, pComments DOCS.COMMENTS%type, 
                      pIndividual INDIVIDUALS.ID_INDIVID%type, pPayType PAYTYPES.ID_PAYTYPE%type, 
                      pLoyProg LOYALTY_PROGRAM.ID_LOYPROG%type, pRecipient DOCS.RECIPIENT%type, 
                      pRecTel DOCS.REC_TELEPHONE%type, pIsPickup DOCS.IS_PICKUP%type, pUserID USERS.USER_ID%type)  AS
    IDDoc DOCS.ID_DOC%type;
    DocRow DOCS%rowtype;
    cannot_change EXCEPTION;
    mes varchar2(500);
  BEGIN
    mes := null;
    begin      
      if pID is null then IDDoc := seq_gen_docs.nextval;
      else
        select * into DocRow from DOCS where ID_DOC = pID for update;
      end if;
      if DocRow.ID_DOCSTATE <> 1 /*NEW*/ then
        mes := 'Документ находится не в Новом состоянии.';  
      elsif (pID is not null) and (pDocType <> DocRow.ID_DOCTYPE) then
        mes := 'Нельзя изменить тип документа.';
      end if;
      if mes is not null then
        raise cannot_change;
      end if;
    
      if pID is null then
        insert into DOCS(ID_DOC, ID_DOCTYPE, ID_PARTNER, ID_WAREHOUSE, COMMENTS, ID_INDIVIDUAL, 
                         ID_PAYTYPE, ID_LOYPROG, RECIPIENT, REC_TELEPHONE, IS_PICKUP, USER_ID)
        values          (IDDoc, pDocType, pPartner, pWareHouse, pComments , pIndividual ,
                         pPayType, pLoyProg, pRecipient, pRecTel, pIsPickup, pUserID);
      else
        update DOCS set ID_PARTNER = pPartner, ID_WAREHOUSE = pWareHouse, COMMENTS = pComments,
                        ID_INDIVIDUAL = pIndividual, ID_PAYTYPE = pPayType, ID_LOYPROG = pLoyProg,
                        RECIPIENT = pRecipient, REC_TELEPHONE = pRecTel, IS_PICKUP = pIsPickup, USER_ID = pUserID where ID_DOC = pID;
      end if;
      commit;
    exception
      when no_data_found then
        rollback;
        --*** в перспективе можно завести отдельную табличку на пользовательские ошибки с полями код и сообщение, и вытаскивать
        raise_application_error (-20001, 'Документ с учетным номером ' || pID 
          ||' или программа лояльности с учетным номером '|| pLoyProg ||' не найдены.');
      when cannot_change then
        rollback;
        raise_application_error (-20002, 'Ошибка изменения реквизитов документа. '||mes);
      when others then
        rollback;
        raise_application_error (-20003, 'Ошибка изменения документа. Обратитесь к разработчикам.');
    end;    
  END WriteDOCS;

--*** Процедура предназначена для вставки и обновления данных детализации документа DOC_DETAILS
  procedure WriteDOC_DETAILS (pIDDetail DOC_DETAILS.ID_DOCDETAIL%type, pID DOCS.ID_DOC%type, pProduct PRODUCTS.ID_PRODUCT%type,
                              pCount DOC_DETAILS.PROD_COUNT%type, pPrice DOC_DETAILS.FULL_PRICE%type, 
                              pPriceLoyProg DOC_DETAILS.PRICE_LOYPROG%type, pUserID USERS.USER_ID%type
                              )  AS
   IDDetail DOC_DETAILS.ID_DOCDETAIL%type;
   DocDetailRow DOC_DETAILS%rowtype;
   cannot_change EXCEPTION;
   mes varchar2(500);
  BEGIN
    mes := null;
    begin
      if pID is null then
        mes := 'Детализация должна быть привязана к документу!';
      end if;
      if pProduct is null then
        mes := 'Укажите продукт.';
      end if;
      if mes is not null then
        raise cannot_change;
      end if;
      
      if pIDDetail is null then 
        IDDetail := seq_gen_doc_details.nextval;
      else
        select * into DocDetailRow from DOC_DETAILS where ID_DOCDETAIL = IDDetail for update;
      end if;
      
      if pIDDetail is null then
        insert into DOC_DETAILS(ID_DOCDETAIL, ID_DOC, ID_PRODUCT, PROD_COUNT, FULL_PRICE, PRICE_LOYPROG, DOC_DETAIL_SUM, USER_ID)
          values               (IDDetail, pID, pProduct, pCount, pPrice, pPriceLoyProg, pCount* pPriceLoyProg, pUserID);
      else
        update DOC_DETAILS set ID_PRODUCT = pProduct, PROD_COUNT = pCount, FULL_PRICE = pPrice, PRICE_LOYPROG = pPriceLoyProg,
                                DOC_DETAIL_SUM = pCount * pPriceLoyProg, USER_ID = pUserID where ID_DOCDETAIL = pIDDetail;
      end if;
      commit;
    exception
      when no_data_found then
        rollback;
        raise_application_error (-20004, 'Детализация документа с учетным номером ' || pIDDetail || ' не найдена.');
      when cannot_change then
        rollback;
        raise_application_error (-20005, 'Ошибка изменения детлаизации документа. '||mes); 
    end;
  END WriteDOC_DETAILS;

--*** Переход между состояниями документа
--*** Возврат документа возможен без возврата по складу ( то есть если документ еще не дошел до стадии изменения складких остатков)
--*** В противном случае изменение складских остатков производится с помощью документа Корректировка (Только на том же складе! В случае перемещения товара использовать РН - ПН)
--*** Также есть документы Возврат покупателя и Возврат поставщику
  procedure TransferDocToState(pID DOCS.ID_DOC%type, pIDDocState DOCSTATES.ID_DOC_STATE%type /*ID нового состояния*/, 
                               pUserID USERS.USER_ID%type) as
    NewDocState DOC_STATES_TYPES%rowtype;
    DocType DOCTYPES%rowtype;
    DocRow DOCS%rowtype;
    ProdInWH PRODUCTS_IN_WAREHOUSE%rowtype;
    balance number; /*Остаток по строчке документа*/
	pw_reserve number; /*Количество возможного резерва по данной строчке на складе*/
	cnt number;
  begin
    begin
      select * into DocRow from DOCS where ID_DOC = pID for update;
      select * into NewDocState from DOC_STATES_TYPES where ID_DOCSTATE = pIDDocState and ID_DOCTYPE = DocRow.ID_DOCTYPE;
      select * into DocType from DOCTYPES where ID_DOCTYPE = DocRow.ID_DOCTYPE;
      
      --*** ТУТ меняем СОСТОЯНИЕ ДОКУМЕНТА 
	  --*** Отдельным алгоритмом будет регулироваться последовательность состояний каждого документа,
	  --*** всяческие проверки и подписи, а также перевод в аннулированное состояние из закрытого.
      update DOCS set ID_DOCSTATE = pIDDocState where ID_DOC = pID;
      -------for DOC_DETAILS
	  --*** для каждой строчки в детализации
      for v in (select * from DOC_DETAILS where ID_DOC = pID for update) loop
      --*** если состояние фиксированное , то:
        
	------	ПРИХОД ТОВАРА (ПН или ВПок - возврат покупателя)
		if  (NewDocState.IS_FIXED = 'Y') and (DocType.DOC_DIRECTION = 'P'/*приход товара*/) 
		    and (DocType.DOCTYPE_CODE <> 'Кор')/*с Корректировкой отдельная ветка*/ then 
        --***ищем строчку с товаром на складе и добавляем товар (если нет - создаем)
          begin
            select * into ProdInWH 
            from PRODUCTS_IN_WAREHOUSE 
            where ID_PRODUCT = v.ID_PRODUCT and ID_SUPPLIER /*поставщик*/ = DocRow.ID_PARTNER
              and ID_WAREHOUSE = DocRow.ID_WAREHOUSE for update;
           --*** при изменении цены товара на складе срабатывает триггер на внесение изменений в таблицу история цен
            update PRODUCTS_IN_WAREHOUSE pw
              set PROD_COUNT = PROD_COUNT + v.PROD_COUNT, PURCHASE_PRICE = v.PRICE_LOYPROG, USER_ID = pUserID
              where pw.ID_PROD_WH = ProdInWH.ID_PROD_WH ;
           --*** заполняем движение товара (таблица как бы отражает по какому документу сколько товара оприходовано или зарезервировано)	
            insert into PRODUCTS_MOVING (ID_PROD_WH, ID_DOCDETAIL, PROD_COUNT, PROD_RESERVE, PROD_SHIPPED, CHANGE_DATE, USER_ID) 
			  values(ProdInWH.ID_PROD_WH, v.ID_DOCDETAIL, v.PROD_COUNT /*Количество товара по документу!*/, 0 /*резерв - только для расхода*/, 
			           0 /*списанного нет*/, sysdate, pUserID);		   
          exception
            when no_data_found then
              insert into PRODUCTS_IN_WAREHOUSE(ID_PROD_WH, ID_PRODUCT, ID_WAREHOUSE, PROD_COUNT, ID_SUPPLIER, PURCHASE_PRICE, SELLING_PRICE, USER_ID)
                values (seq_gen_prod_in_wh.nextval, v.ID_PRODUCT, DocRow.ID_WAREHOUSE, v.PROD_COUNT, DocRow.ID_PARTNER, v.PRICE_LOYPROG, v.PRICE_LOYPROG, pUserID);
              --*** заполняем движение товара (таблица как бы отражает по какому документу сколько товара оприходовано или списано)	
              insert into PRODUCTS_MOVING (ID_PROD_WH, ID_DOCDETAIL, PROD_COUNT, PROD_RESERVE, PROD_SHIPPED, CHANGE_DATE, USER_ID) 
			    values(seq_gen_prod_in_wh.currval, v.ID_DOCDETAIL, v.PROD_COUNT /*Количество товара по документу!*/, 
				         0 /*резерв - только для расхода*/, 0 /*списанного нет*/, sysdate, pUserID);					
            when too_many_rows then
              rollback;
              raise_application_error (-20007, 'Произошло задвоение строчек на складе (уч.номер) '||DocRow.ID_WAREHOUSE||
                  ' с продуктом (уч.номер) '||v.ID_PRODUCT||' и поставщиком (уч.номер)'||DocRow.ID_PARTNER);
          end;
		  
	------	РАСХОД ТОВАРА - резерв  (документы ЗПок, ВПст.)
        elsif (NewDocState.IS_FIXED = 'R') and (DocType.DOC_DIRECTION = 'R'/*расход товара*/)
             and (DocType.DOCTYPE_CODE <> 'Кор')/*с Корректировкой отдельная ветка*/ then
          --*** перевести нужное количество товара в резерв
          balance := v.prod_count - v.prod_shipped - v.prod_reserve;
		  if balance <= 0 then --*** сколько осталось дорезервировать
		    dbms_output.put_line('Количество запрашиваемого товара для резерва должно быть больше нуля!');
			return;
		  end if;
		  
		  --*** Находим строчки на складе по Складу в документе, продукту (производитель уже заложен в ID) и по заявленной в документе цене (мы другую не можем выбрать)
		  for ss in (select * from PRODUCTS_IN_WAREHOUSE pw where pw.ID_WAREHOUSE = DocRow.ID_WAREHOUSE and pw.ID_PRODUCT = v.ID_PRODUCT
		               and v.full_price = pw.selling_price order by pw.change_date asc) loop
			if balance <= 0 then exit; end if;
			pw_reserve := 0; --*** сколько по данной строчке склада будет товара
			
			--*** вычисляем сколько можно зарезервировать по данной складской строчке		   
		    if ss.prod_count - ss.prod_reserve >= balance then
			  pw_reserve := balance;
			else pw_reserve := ss.prod_count - ss.prod_reserve;
			end if;
			
			--*** резервируем количество на складе
			update PRODUCTS_IN_WAREHOUSE pw set prod_reserve = prod_reserve + pw_reserve where pw.ID_PROD_WH = ss.ID_PROD_WH;
			--*** сразу переводим в резерв в документе
			update DOC_DETAILS dd set prod_reserve = prod_reserve + pw_reserve where ID_DOCDETAIL = v.ID_DOCDETAIL;
			--*** заполняем движение товара (таблица как бы отражает по какому документу сколько товара оприходовано или зарезервировано)	
            insert into PRODUCTS_MOVING (ID_PROD_WH, ID_DOCDETAIL, PROD_COUNT, PROD_RESERVE, PROD_SHIPPED, CHANGE_DATE, USER_ID) 
			  values(ss.ID_PROD_WH, v.ID_DOCDETAIL, v.PROD_COUNT /*Количество товара по документу!*/, pw_reserve /*резерв по документу*/, 
			           0 /*ничего не списано*/, sysdate, pUserID);
			
			balance := balance - pw_reserve;
		  end loop; --for ss
		  if balance > 0 then 
		    dbms_output.put_line('Не весь товар удалось зарезервировать! Осталось дорезервировать товара: '||balance);
		  end if;
    
	-------РАСХОД ТОВАРА - списание (документы: РН, ВПст)
        elsif (NewDocState.IS_FIXED = 'Y') and (DocType.DOC_DIRECTION = 'R'/*расход товара*/) 
		  and (DocType.DOCTYPE_CODE <> 'Кор')/*с Корректировкой отдельная ветка*/ then
        --*** ищем строчку с товаром на складе и убавляем товар. Если нет строчки и не хватает товара - ошибка + ищем резерв
          balance := v.prod_reserve; --*** отгружаем только количество в резерве
		  if balance <= 0 then --*** нет товара для отгрузки
		    rollback;
		    raise_application_error(-20001, 'Нет зарезервированного товара для отгрузки!');
		  end if;
		  --*** выбираем строчки склада с резервом
		  for ss in (select * from PRODUCTS_IN_WAREHOUSE pw where pw.ID_WAREHOUSE = DocRow.ID_WAREHOUSE and pw.ID_PRODUCT = v.ID_PRODUCT
		               and v.full_price = pw.selling_price and pw.prod_reserve > 0 
					   --*** списываем те, что были зарезервированы по этому документу!
					   and exists (select * from PRODUCTS_MOVING mov where mov.ID_PROD_WH = pw.ID_PROD_WH and mov.ID_DOCDETAIL = v.ID_DOCDETAIL 
					                 and mov.PROD_RESERVE > 0) order by pw.change_date asc) loop
					   
			if balance <= 0 then exit; end if;
			pw_reserve := 0; --*** сколько по данной строчке склада будет товара
			
			--*** вычисляем сколько можно отгрузить по данной складской строчке		   
		    if ss.prod_reserve >= balance then
			  pw_reserve := balance;
			else pw_reserve := ss.prod_reserve;
			end if;
			
			--*** отгружаем количество на складе
			update PRODUCTS_IN_WAREHOUSE pw set prod_reserve = prod_reserve - pw_reserve, 
			                                    prod_count = prod_count - pw_reserve
			  where pw.ID_PROD_WH = ss.ID_PROD_WH;
			--*** сразу отгружаем в документе
			update DOC_DETAILS dd set prod_reserve = prod_reserve - pw_reserve, prod_shipped = prod_shipped + pw_reserve where ID_DOCDETAIL = v.ID_DOCDETAIL;
			--*** заполняем движение товара (таблица как бы отражает по какому документу сколько товара оприходовано или зарезервировано)	
            insert into PRODUCTS_MOVING (ID_PROD_WH, ID_DOCDETAIL, PROD_COUNT, PROD_RESERVE, PROD_SHIPPED, CHANGE_DATE, USER_ID) 
			  values(ss.ID_PROD_WH, v.ID_DOCDETAIL, v.PROD_COUNT /*Количество товара по документу!*/, pw_reserve /*резерв по документу*/, 
			           pw_reserve /*списано по идее - столько же, сколько и в резерве*/, sysdate, pUserID);
			
			balance := balance - pw_reserve;
	      end loop; --for ss
		  
		  --*** когда не все отгружено, то ошибка, чтобы оповестить менеджера! При этом откат, тк списывать нельзя часть.
		  if balance > 0 then 
		    rollback;
		    raise_application_error(-20002, 'Не весь товар удалось отгрузить! Осталось догрузить товара: '||balance);
		  end if;
		  
		elsif (NewDocState.IS_FIXED = 'Y') and (DocType.DOCTYPE_CODE = 'Кор')/*с Корректировкой отдельная ветка*/  then
		--*** С Корректировкой не все так просто: на самом деле, нужен еще флажок, отвечающий какая будет корректировка Прихода или Расхода,
		--*** но я решила не создавать, а регулировать это так: 
		--*** если у Корректировки заполнено поле PROD_SHIPPED значит расход и надо списать, если нет - приход и надо оприходовать		  
		  if v.PROD_SHIPPED > 0 /*списываем*/ then
		  --*** Причем в Корректировке идет привязка к поставщику, тк скорректировать мы должны ни какой-то товар, а конкретного поставщика!
		   begin
		     select * into ProdInWH 
              from PRODUCTS_IN_WAREHOUSE 
              where ID_PRODUCT = v.ID_PRODUCT and ID_SUPPLIER /*поставщик*/ = DocRow.ID_PARTNER
                and ID_WAREHOUSE = DocRow.ID_WAREHOUSE 
				and PROD_RESERVE = 0 /*Обязательно без резерва! Иначе при изменении цены на товар, изменится цена в документе у клиента!*/for update;
			 
             --*** меняем на складе
			 update PRODUCTS_IN_WAREHOUSE set PROD_COUNT = PROD_COUNT - v.PROD_SHIPPED,
											  PURCHASE_PRICE = v.PURCHASE_PRICE,
											  SELLING_PRICE = v.SELLING_PRICE
	           WHERE ID_PROD_WH = ProdInWH.ID_PROD_WH;
             --***заполняем движение товара 
			 insert into PRODUCTS_MOVING (ID_PROD_WH, ID_DOCDETAIL, PROD_COUNT, PROD_RESERVE, PROD_SHIPPED, CHANGE_DATE, USER_ID) 
			  values(ProdInWH.ID_PROD_WH, v.ID_DOCDETAIL, v.PROD_COUNT /*Количество товара по документу!*/, v.PROD_RESERVE /*резерв по документу*/, 
			           v.PROD_SHIPPED /*списано по идее - столько же, сколько и в резерве*/, sysdate, pUserID);
             			 
		   exception
		    when too_many_rows then
              rollback;
              raise_application_error (-20007, 'Произошло задвоение строчек на складе (уч.номер) '||DocRow.ID_WAREHOUSE||
                  ' с продуктом (уч.номер) '||v.ID_PRODUCT||' и поставщиком (уч.номер)'||DocRow.ID_PARTNER); 
		    when no_data_found then
			  rollback;
              raise_application_error (-20006, 'Нет строчек для возможной корректировк на складе (уч.номер) '||DocRow.ID_WAREHOUSE||
                  ' с продуктом (уч.номер) '||v.ID_PRODUCT||' и поставщиком (уч.номер)'||DocRow.ID_PARTNER); 
			when others then
			  rollback;
			  raise_application_error(-20008, 'Неизвестная ошибка при Корректировке документа ' ||DocRow.ID_DOC||'(строчка документа: '||v.ID_DOCDETAIL||') ! Обратитесь к разработчикам!');
           end;		   
			
		  else /*приходуем*/
		    begin
			  select * into ProdInWH 
              from PRODUCTS_IN_WAREHOUSE 
              where ID_PRODUCT = v.ID_PRODUCT and ID_SUPPLIER /*поставщик*/ = DocRow.ID_PARTNER
                and ID_WAREHOUSE = DocRow.ID_WAREHOUSE for update;
			   
			   --*** меняем на складе
			   update PRODUCTS_IN_WAREHOUSE set PROD_COUNT = PROD_COUNT + v.PROD_COUNT,
											  PURCHASE_PRICE = v.PURCHASE_PRICE,
											  SELLING_PRICE = v.SELLING_PRICE
	           WHERE ID_PROD_WH = ProdInWH.ID_PROD_WH;
			   --***заполняем движение товара 
			 insert into PRODUCTS_MOVING (ID_PROD_WH, ID_DOCDETAIL, PROD_COUNT, PROD_RESERVE, PROD_SHIPPED, CHANGE_DATE, USER_ID) 
			  values(ProdInWH.ID_PROD_WH, v.ID_DOCDETAIL, v.PROD_COUNT /*Количество товара по документу!*/, v.PROD_RESERVE /*резерв по документу*/, 
			           v.PROD_SHIPPED /*списано по идее - столько же, сколько и в резерве*/, sysdate, pUserID);	
			exception
			  when too_many_rows then
              rollback;
              raise_application_error (-20007, 'Произошло задвоение строчек на складе (уч.номер) '||DocRow.ID_WAREHOUSE||
                  ' с продуктом (уч.номер) '||v.ID_PRODUCT||' и поставщиком (уч.номер)'||DocRow.ID_PARTNER); 
		      when no_data_found then
			  rollback;
              raise_application_error (-20006, 'Нет строчек для возможной корректировк на складе (уч.номер) '||DocRow.ID_WAREHOUSE||
                  ' с продуктом (уч.номер) '||v.ID_PRODUCT||' и поставщиком (уч.номер)'||DocRow.ID_PARTNER); 
			  when others then
			  rollback;
			  raise_application_error(-20008, 'Неизвестная ошибка при Корректировке документа ' ||DocRow.ID_DOC||'(строчка документа: '||v.ID_DOCDETAIL||') ! Обратитесь к разработчикам!');
			end;
		  end if;
        end if;
      end loop; --for v
      commit;
    exception
      when no_data_found then
      rollback;
      raise_application_error (-20006, 'Данные по документу или состоянию не найдены.');
    end;
  end TransferDocToState;
END PKG_MAIN;
