create or replace TRIGGER TBIU_DOCS 
BEFORE INSERT OR UPDATE ON DOCS
for each row
declare 
  pLoyProg LOYALTY_PROGRAM%rowtype;
  pFixState DOCSTATES.ID_DOC_STATE%type;
  cnt number;
BEGIN
  begin
    if inserting then
    --*** ����������� ID � ����� ��������� � ��������� ���� �� ���������
      if :new.ID_DOC is null then 
       :new.ID_DOC := seq_gen_DOCS.nextval;
      end if;
      select DOCTYPE_CODE ||'_'||:new.ID_DOC into :new.DOC_NUMBER from DOCTYPES where ID_DOCTYPE = :new.ID_DOCTYPE;
      :new.ID_DOCSTATE := 1; /*�����*/
      :new.DOC_SUM := 0;
      :new.DOC_SUM_LOYPROG := 0;
    end if;

    if updating then 
    --*** ��������� ����� �� ����������� ��������� �� ������ ��������� DOC_SUM � ����� �� ��������� ���������� DOC_SUM_LOYPROG
      select SUM(FULL_PRICE * PROD_COUNT), SUM(PRICE_LOYPROG * PROD_COUNT) into :new.DOC_SUM, :new.DOC_SUM_LOYPROG
        from DOC_DETAILS where ID_DOC = :new.ID_DOC;
      --*** ��� �������������� ��������� ��������� ����������� ���� �������� (������������� ��������� ��� ������� ��������� ������ ����!)
      select count(ID_DOCSTATE) into cnt
        from DOC_STATES_TYPES where ID_DOCTYPE = :new.ID_DOCTYPE and IS_FIXED = 'Y';
      if (cnt > 0 /*��������� �������������*/) and (:new.ID_DOCSTATE <> :old.ID_DOCSTATE) then :new.DOC_FIXED_DATE := sysdate;
      end if;
    end if;
    
    --*** ����������� ���� � ������� ��������� ���������� � ��������
    select * into pLoyProg from LOYALTY_PROGRAM where ID_LOYPROG = :new.ID_LOYPROG and APPLY_TO_DOCS = 'Y';
    :new.AMOUNT := pLoyProg.VALUE;
    :new.CODE := pLoyProg.CODE;
    --*** ����������, ��� � ����� ������� �������� (��� ����� �������� ����������� � ��������� �������)
    if :new.user_id is null then
      select USER_ID into :new.user_id from USERS where LOGIN = user;
    end if;
    :new.CHANGE_DATE := sysdate;
  exception 
  when others then
  raise;
  end;
END;