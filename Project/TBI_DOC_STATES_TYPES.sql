CREATE OR REPLACE TRIGGER TBI_DOC_STATES_TYPES 
BEFORE INSERT ON DOC_STATES_TYPES
for each row
declare
cnt number;
--*** ������������ ��� ��������, ��� ������������� ��������� � ����������� ���� ��������� ������ ����!
BEGIN
  if :new.is_fixed = 'Y' then
    select count(*) into cnt from doc_states_types where id_doctype = :new.id_doctype and is_fixed = 'Y'; 
    if cnt > 0 then 
      raise_application_error(-20001, '������ �������� ��� ���� ������������� �������� ��� ���� ���������: '||:new.id_doctype);
    end if;
  end if;
END;