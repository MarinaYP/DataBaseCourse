create or replace PACKAGE PKG_MAIN AS 

--*** ��������� ������������� ��� ������� ��� ���������� ����� ��������� DOCS. 
--*** ������� ����� ����������� ��������� ������������ ���������� TransferDocToState
  procedure WriteDOCS(pID DOCS.ID_DOC%type, pDocType DOCS.ID_DOCTYPE%type, pPartner PARTNERS.ID_PARTNER%type,
                      pWareHouse WAREHOUSE.ID_WAREHOUSE%type, pComments DOCS.COMMENTS%type, 
                      pIndividual INDIVIDUALS.ID_INDIVID%type, pPayType PAYTYPES.ID_PAYTYPE%type, 
                      pLoyProg LOYALTY_PROGRAM.ID_LOYPROG%type, pRecipient DOCS.RECIPIENT%type, 
                      pRecTel DOCS.REC_TELEPHONE%type, pIsPickup DOCS.IS_PICKUP%type, pUserID USERS.USER_ID%type) ;
 
 --*** ��������� ������������� ��� ������� � ���������� ������ ����������� ��������� DOC_DETAILS                     
  procedure WriteDOC_DETAILS (pIDDetail DOC_DETAILS.ID_DOCDETAIL%type, pID DOCS.ID_DOC%type, pProduct PRODUCTS.ID_PRODUCT%type,
                              pCount DOC_DETAILS.PROD_COUNT%type, pPrice DOC_DETAILS.FULL_PRICE%type, 
                              pPriceLoyProg DOC_DETAILS.PRICE_LOYPROG%type, pUserID USERS.USER_ID%type
                              ) ;
  --*** ������� ����� ����������� ���������
  procedure TransferDocToState(pID DOCS.ID_DOC%type, pIDDocState DOCSTATES.ID_DOC_STATE%type);

END PKG_MAIN;