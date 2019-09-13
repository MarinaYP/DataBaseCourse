create or replace PACKAGE BODY PKG_MAIN AS

--*** ��������� ������������� ��� ������� ��� ���������� ����� ��������� DOCS. 
--*** ������� ����� ����������� ��������� ������������ ������ ����������
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
        mes := '�������� ��������� �� � ����� ���������.';  
      elsif (pID is not null) and (pDocType <> DocRow.ID_DOCTYPE) then
        mes := '������ �������� ��� ���������.';
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
        --*** � ����������� ����� ������� ��������� �������� �� ���������������� ������ � ������ ��� � ���������, � �����������
        raise_application_error (-20001, '�������� � ������� ������� ' || pID 
          ||' ��� ��������� ���������� � ������� ������� '|| pLoyProg ||' �� �������.');
      when cannot_change then
        rollback;
        raise_application_error (-20002, '������ ��������� ���������� ���������. '||mes);
      when others then
        rollback;
        raise_application_error (-20003, '������ ��������� ���������. ���������� � �������������.');
    end;    
  END WriteDOCS;

--*** ��������� ������������� ��� ������� � ���������� ������ ����������� ��������� DOC_DETAILS
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
        mes := '����������� ������ ���� ��������� � ���������!';
      end if;
      if pProduct is null then
        mes := '������� �������.';
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
        raise_application_error (-20004, '����������� ��������� � ������� ������� ' || pIDDetail || ' �� �������.');
      when cannot_change then
        rollback;
        raise_application_error (-20005, '������ ��������� ����������� ���������. '||mes); 
    end;
  END WriteDOC_DETAILS;

--*** ������� ����� ����������� ���������
--*** ������� ��������� �������� ��� �������� �� ������ ( �� ���� ���� �������� ��� �� ����� �� ������ ��������� �������� ��������)
--*** � ��������� ������ ��������� ��������� �������� ������������ � ������� ��������� �������������
--*** ����� ���� ��������� ������� ���������� � ������� ����������
  procedure TransferDocToState(pID DOCS.ID_DOC%type, pIDDocState DOCSTATES.ID_DOC_STATE%type /*ID ������ ���������*/, 
                               pUserID USERS.USER_ID%type) as
    NewDocState DOC_STATES_TYPES%rowtype;
    DocType DOCTYPES%rowtype;
    DocRow DOCS%rowtype;
    ProdInWH PRODUCTS_IN_WAREHOUSE%rowtype;
    balance number; /*������� �� ������� ���������*/
	pw_reserve number; /*���������� ���������� ������� �� ������ ������� �� ������*/
  begin
    begin
      select * into DocRow from DOCS where ID_DOC = pID for update;
      select * into NewDocState from DOC_STATES_TYPES where ID_DOCSTATE = pIDDocState and ID_DOCTYPE = DocRow.ID_DOCTYPE;
      select * into DocType from DOCTYPES where ID_DOCTYPE = DocRow.ID_DOCTYPE;
      
      --*** ������ ��������� ���������
      update DOCS set ID_DOCSTATE = pIDDocState where ID_DOC = pID;
      -------for DOC_DETAILS
	  --*** ��� ������ ������� � �����������
      for v in (select * from DOC_DETAILS where ID_DOC = pID for update) loop
      --*** ���� ��������� ������������� , ��:
        
	------	������ ������ (�� ��� ���� - ������� ����������)
		if  (NewDocState.IS_FIXED = 'Y') and (DocType.DOC_DIRECTION = 'P'/*������ ������*/) 
		    and (DocType.DOCTYPE_CODE <> '���')/*� �������������� ��������� �����*/ then 
        --***���� ������� � ������� �� ������ � ��������� ����� (���� ��� - �������)
          begin
            select * into ProdInWH 
            from PRODUCTS_IN_WAREHOUSE 
            where ID_PRODUCT = v.ID_PRODUCT and ID_SUPPLIER /*���������*/ = DocRow.ID_PARTNER
              and ID_WAREHOUSE = DocRow.ID_WAREHOUSE for update;
           --*** ��� ��������� ���� ������ �� ������ ����������� ������� �� �������� ��������� � ������� ������� ���
            update PRODUCTS_IN_WAREHOUSE pw
              set PROD_COUNT = PROD_COUNT + v.PROD_COUNT, PURCHASE_PRICE = v.PRICE_LOYPROG, USER_ID = pUserID
              where pw.ID_PROD_WH = ProdInWH.ID_PROD_WH ;
           --*** ��������� �������� ������ (������� ��� �� �������� �� ������ ��������� ������� ������ ������������ ��� ���������������)	
            insert into PRODUCTS_MOVING (ID_PROD_WH, ID_DOCDETAIL, PROD_COUNT, PROD_RESERVE, PROD_SHIPPED, CHANGE_DATE, USER_ID) 
			  values(ProdInWH.ID_PROD_WH, v.ID_DOCDETAIL, v.PROD_COUNT /*���������� ������ �� ���������!*/, 0 /*������ - ������ ��� �������*/, 
			           0 /*���������� ���*/, sysdate, pUserID);		   
          exception
            when no_data_found then
              insert into PRODUCTS_IN_WAREHOUSE(ID_PROD_WH, ID_PRODUCT, ID_WAREHOUSE, PROD_COUNT, ID_SUPPLIER, PURCHASE_PRICE, SELLING_PRICE, USER_ID)
                values (seq_gen_prod_in_wh.nextval, v.ID_PRODUCT, DocRow.ID_WAREHOUSE, v.PROD_COUNT, DocRow.ID_PARTNER, v.PRICE_LOYPROG, v.PRICE_LOYPROG, pUserID);
              --*** ��������� �������� ������ (������� ��� �� �������� �� ������ ��������� ������� ������ ������������ ��� �������)	
              insert into PRODUCTS_MOVING (ID_PROD_WH, ID_DOCDETAIL, PROD_COUNT, PROD_RESERVE, PROD_SHIPPED, CHANGE_DATE, USER_ID) 
			    values(seq_gen_prod_in_wh.currval, v.ID_DOCDETAIL, v.PROD_COUNT /*���������� ������ �� ���������!*/, 
				         0 /*������ - ������ ��� �������*/, 0 /*���������� ���*/, sysdate, pUserID);					
            when too_many_rows then
              rollback;
              raise_application_error (-20007, '��������� ��������� ������� �� ������ (��.�����) '||DocRow.ID_WAREHOUSE||
                  ' � ��������� (��.�����) '||v.ID_PRODUCT||' � ����������� (��.�����)'||DocRow.ID_PARTNER);
          end;
		  
	------	������ ������ - ������  (��������� ����, ����.)
        elsif (NewDocState.IS_FIXED = 'R') and (DocType.DOC_DIRECTION = 'R'/*������ ������*/)
             and (DocType.DOCTYPE_CODE <> '���')/*� �������������� ��������� �����*/ then
          --*** ��������� ������ ���������� ������ � ������
          balance := v.prod_count - v.prod_shipped - v.prod_reserve;
		  if balance <= 0 then --*** ������� �������� ���������������
		    dbms_output.put_line('���������� �������������� ������ ��� ������� ������ ���� ������ ����!');
			return;
		  end if;
		  
		  --*** ������� ������� �� ������ �� ������ � ���������, �������� (������������� ��� ������� � ID) � �� ����������  ��������� ���� (�� ������ �� ����� �������)
		  for ss in (select * from PRODUCTS_IN_WAREHOUSE pw where pw.ID_WAREHOUSE = DocRow.ID_WAREHOUSE and pw.ID_PRODUCT = v.ID_PRODUCT
		               and v.full_price = pw.selling_price order by pw.change_date asc) loop
			if balance <= 0 then exit; end if;
			pw_reserve := 0; --*** ������� �� ������ ������� ������ ����� ������
			
			--*** ��������� ������� ����� ��������������� �� ������ ��������� �������		   
		    if ss.prod_count - ss.prod_reserve >= balance then
			  pw_reserve := balance;
			else pw_reserve := ss.prod_count - ss.prod_reserve;
			end if;
			
			--*** ����������� ���������� �� ������
			update PRODUCTS_IN_WAREHOUSE pw set prod_reserve = prod_reserve + pw_reserve where ProdInWH.ID_PROD_WH = ss.ID_PROD_WH;
			--*** ����� ��������� � ������ � ���������
			update DOC_DETAILS dd set prod_reserve = prod_reserve + pw_reserve where ID_DOCDETAIL = v.ID_DOCDETAIL;
			--*** ��������� �������� ������ (������� ��� �� �������� �� ������ ��������� ������� ������ ������������ ��� ���������������)	
            insert into PRODUCTS_MOVING (ID_PROD_WH, ID_DOCDETAIL, PROD_COUNT, PROD_RESERVE, PROD_SHIPPED, CHANGE_DATE, USER_ID) 
			  values(ProdInWH.ID_PROD_WH, v.ID_DOCDETAIL, v.PROD_COUNT /*���������� ������ �� ���������!*/, pw_reserve /*������ �� ���������*/, 
			           0 /*������ �� �������*/, sysdate, pUserID);
			
			balance := balance - pw_reserve;
		  end loop; --for ss
		  if balance > 0 then 
		    dbms_output.put_line('�� ���� ����� ������� ���������������! �������� ��������������� ������: '||balance);
		  end if;
    
	-------������ ������ - �������� (���������: ��, ����)
        elsif (NewDocState.IS_FIXED = 'Y') and (DocType.DOC_DIRECTION = 'R'/*������ ������*/) 
		  and (DocType.DOCTYPE_CODE <> '���')/*� �������������� ��������� �����*/ then
        --*** ���� ������� � ������� �� ������ � �������� �����. ���� ��� ������� � �� ������� ������ - ������ + ���� ������
          balance := v.prod_reserve; --*** ��������� ������ ���������� � �������
		  if balance <= 0 then --*** ��� ������ ��� ��������
		    rollback;
		    raise_application_error(-20001, '��� ������������������ ������ ��� ��������!');
		  end if;
		  --*** �������� ������� ������ � ��������
		  for ss in (select * from PRODUCTS_IN_WAREHOUSE pw where pw.ID_WAREHOUSE = DocRow.ID_WAREHOUSE and pw.ID_PRODUCT = v.ID_PRODUCT
		               and v.full_price = pw.selling_price and pw.prod_reserve > 0 order by pw.change_date asc) loop
					   
			if balance <= 0 then exit; end if;
			pw_reserve := 0; --*** ������� �� ������ ������� ������ ����� ������
			
			--*** ��������� ������� ����� ��������� �� ������ ��������� �������		   
		    if ss.prod_reserve >= balance then
			  pw_reserve := balance;
			else pw_reserve := ss.prod_reserve;
			end if;
			
			--*** ��������� ���������� �� ������
			update PRODUCTS_IN_WAREHOUSE pw set prod_reserve = prod_reserve - pw_reserve, 
			                                    prod_count = prod_count - pw_reserve
			  where pw.ID_PROD_WH = ss.ID_PROD_WH;
			--*** ����� ��������� � ���������
			update DOC_DETAILS dd set prod_reserve = prod_reserve - pw_reserve, prod_shipped = prod_shipped + pw_reserve where ID_DOCDETAIL = v.ID_DOCDETAIL;
			--*** ��������� �������� ������ (������� ��� �� �������� �� ������ ��������� ������� ������ ������������ ��� ���������������)	
            insert into PRODUCTS_MOVING (ID_PROD_WH, ID_DOCDETAIL, PROD_COUNT, PROD_RESERVE, PROD_SHIPPED, CHANGE_DATE, USER_ID) 
			  values(ProdInWH.ID_PROD_WH, v.ID_DOCDETAIL, v.PROD_COUNT /*���������� ������ �� ���������!*/, pw_reserve /*������ �� ���������*/, 
			           pw_reserve /*������� �� ���� - ������� ��, ������� � � �������*/, sysdate, pUserID);
			
			balance := balance - pw_reserve;
	      end loop; --for ss
		  
		  --*** ����� �� ��� ���������, �� ������, ����� ���������� ���������! ��� ���� �����, �� ��������� ������ �����.
		  if balance > 0 then 
		    rollback;
		    raise_application_error(-20002, '�� ���� ����� ������� ���������! �������� ��������� ������: '||balance);
		  end if;
		  
		elsif (DocType.DOCTYPE_CODE = '���')/*� �������������� ��������� �����*/  then
         
         null;
        end if;
      end loop; --for v
      commit;
    exception
      when no_data_found then
      rollback;
      raise_application_error (-20006, '������ �� ��������� ��� ��������� �� �������.');
    end;
  end TransferDocToState;
END PKG_MAIN;