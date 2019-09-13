--------------------------------------------------------
--  File created - суббота-августа-10-2019   
--------------------------------------------------------
DROP SEQUENCE "C##ZAYETS"."SEQ_GEN_CATEGORIES";
DROP SEQUENCE "C##ZAYETS"."SEQ_GEN_DICT";
DROP SEQUENCE "C##ZAYETS"."SEQ_GEN_DOC_DETAILS";
DROP SEQUENCE "C##ZAYETS"."SEQ_GEN_DOCS";
DROP SEQUENCE "C##ZAYETS"."SEQ_GEN_INDIVIDUALS";
DROP SEQUENCE "C##ZAYETS"."SEQ_GEN_LOYPROG";
DROP SEQUENCE "C##ZAYETS"."SEQ_GEN_PARTNERS";
DROP SEQUENCE "C##ZAYETS"."SEQ_GEN_PROD_IN_WH";
DROP SEQUENCE "C##ZAYETS"."SEQ_GEN_PRODUCTS";
DROP SEQUENCE "C##ZAYETS"."SEQ_GEN_SPECIFIC";
DROP TABLE "C##ZAYETS"."CATEGORIES" cascade constraints;
DROP TABLE "C##ZAYETS"."DOC_DETAILS" cascade constraints;
DROP TABLE "C##ZAYETS"."DOCS" cascade constraints;
DROP TABLE "C##ZAYETS"."DOCSTATES" cascade constraints;
DROP TABLE "C##ZAYETS"."DOC_STATES_TYPES" cascade constraints;
DROP TABLE "C##ZAYETS"."DOCTYPES" cascade constraints;
DROP TABLE "C##ZAYETS"."HISTORY_PRICES" cascade constraints;
DROP TABLE "C##ZAYETS"."INDIVIDUALS" cascade constraints;
DROP TABLE "C##ZAYETS"."LOYALTY_PROGRAM" cascade constraints;
DROP TABLE "C##ZAYETS"."LOYPROG_BY_PRODUCTS" cascade constraints;
DROP TABLE "C##ZAYETS"."PARTNERS" cascade constraints;
DROP TABLE "C##ZAYETS"."PAYTYPES" cascade constraints;
DROP TABLE "C##ZAYETS"."PRODUCTS" cascade constraints;
DROP TABLE "C##ZAYETS"."PRODUCTS_BY_CATEGORIES" cascade constraints;
DROP TABLE "C##ZAYETS"."PRODUCTS_BY_SPEC" cascade constraints;
DROP TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" cascade constraints;
DROP TABLE "C##ZAYETS"."PRODUCTS_MOVING" cascade constraints;
DROP TABLE "C##ZAYETS"."SPECIFICATIONS" cascade constraints;
DROP TABLE "C##ZAYETS"."USERS" cascade constraints;
DROP TABLE "C##ZAYETS"."WAREHOUSE" cascade constraints;
DROP PACKAGE "C##ZAYETS"."PKG_MAIN";
DROP PACKAGE BODY "C##ZAYETS"."PKG_MAIN";
--------------------------------------------------------
--  DDL for Sequence SEQ_GEN_CATEGORIES
--------------------------------------------------------

   CREATE SEQUENCE  "C##ZAYETS"."SEQ_GEN_CATEGORIES"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GEN_DICT
--------------------------------------------------------

   CREATE SEQUENCE  "C##ZAYETS"."SEQ_GEN_DICT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GEN_DOC_DETAILS
--------------------------------------------------------

   CREATE SEQUENCE  "C##ZAYETS"."SEQ_GEN_DOC_DETAILS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GEN_DOCS
--------------------------------------------------------

   CREATE SEQUENCE  "C##ZAYETS"."SEQ_GEN_DOCS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GEN_INDIVIDUALS
--------------------------------------------------------

   CREATE SEQUENCE  "C##ZAYETS"."SEQ_GEN_INDIVIDUALS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GEN_LOYPROG
--------------------------------------------------------

   CREATE SEQUENCE  "C##ZAYETS"."SEQ_GEN_LOYPROG"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GEN_PARTNERS
--------------------------------------------------------

   CREATE SEQUENCE  "C##ZAYETS"."SEQ_GEN_PARTNERS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GEN_PROD_IN_WH
--------------------------------------------------------

   CREATE SEQUENCE  "C##ZAYETS"."SEQ_GEN_PROD_IN_WH"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GEN_PRODUCTS
--------------------------------------------------------

   CREATE SEQUENCE  "C##ZAYETS"."SEQ_GEN_PRODUCTS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GEN_SPECIFIC
--------------------------------------------------------

   CREATE SEQUENCE  "C##ZAYETS"."SEQ_GEN_SPECIFIC"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
-- DDL for Sequence SEQ_GEN_USERS
--------------------------------------------------------

 CREATE SEQUENCE "C##ZAYETS"."SEQ_GEN_USERS" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
 --------------------------------------------------------
-- DDL for Sequence SEQ_GEN_WH
--------------------------------------------------------

 CREATE SEQUENCE "C##ZAYETS"."SEQ_GEN_WH" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CATEGORIES
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."CATEGORIES" 
   (	"ID_CATEGORY" NUMBER(9,0), 
	"ID_PARENT" NUMBER(9,0), 
	"NAME" VARCHAR2(400 BYTE), 
	"DETAILS" VARCHAR2(2000 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."CATEGORIES"."ID_CATEGORY" IS 'Уникальный идентификатор категории товара';
   COMMENT ON COLUMN "C##ZAYETS"."CATEGORIES"."ID_PARENT" IS 'Уникальный идентификатор родительской категории';
   COMMENT ON COLUMN "C##ZAYETS"."CATEGORIES"."NAME" IS 'Название категории';
   COMMENT ON COLUMN "C##ZAYETS"."CATEGORIES"."DETAILS" IS 'Описание категории';
--------------------------------------------------------
--  DDL for Table DOC_DETAILS
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."DOC_DETAILS" 
   (	"ID_DOCDETAIL" NUMBER(15,0), 
	"ID_DOC" NUMBER(12,0), 
	"ID_PRODUCT" NUMBER(12,0), 
	"PROD_COUNT" NUMBER(12,4), 
	"PROD_RESERVE" NUMBER(12,4) DEFAULT 0, 
	"PROD_SHIPPED" NUMBER(12,4) DEFAULT 0, 
	"FULL_PRICE" NUMBER(15,4), 
	"PRICE_LOYPROG" NUMBER(15,4), 
	"DOC_DETAIL_SUM" NUMBER(15,4), 
	"USER_ID" NUMBER(12,0), 
	"CHANGE_DATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."DOC_DETAILS"."ID_DOCDETAIL" IS 'Уникальный идентификатор детализации документа';
   COMMENT ON COLUMN "C##ZAYETS"."DOC_DETAILS"."ID_DOC" IS 'Уникальный идентификатор шапки документа';
   COMMENT ON COLUMN "C##ZAYETS"."DOC_DETAILS"."ID_PRODUCT" IS 'Уникальный идентификатор продукта';
   COMMENT ON COLUMN "C##ZAYETS"."DOC_DETAILS"."PROD_COUNT" IS 'Общее количество товара';
   COMMENT ON COLUMN "C##ZAYETS"."DOC_DETAILS"."PROD_RESERVE" IS 'Количество товара в резерве';
   COMMENT ON COLUMN "C##ZAYETS"."DOC_DETAILS"."PROD_SHIPPED" IS 'Количество отгруженного товара';
   COMMENT ON COLUMN "C##ZAYETS"."DOC_DETAILS"."FULL_PRICE" IS 'Полная цена';
   COMMENT ON COLUMN "C##ZAYETS"."DOC_DETAILS"."PRICE_LOYPROG" IS 'Цена по программе лояльности (со скидкой)';
   COMMENT ON COLUMN "C##ZAYETS"."DOC_DETAILS"."DOC_DETAIL_SUM" IS 'Сумма по строчке по программе лояльности';
   COMMENT ON COLUMN "C##ZAYETS"."DOC_DETAILS"."USER_ID" IS 'Уникальный идентификатор пользователя, кто поменял';
   COMMENT ON COLUMN "C##ZAYETS"."DOC_DETAILS"."CHANGE_DATE" IS 'Дата изменения';
--------------------------------------------------------
--  DDL for Table DOCS
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."DOCS" 
   (	"ID_DOC" NUMBER(12,0), 
	"ID_DOCTYPE" NUMBER(6,0), 
	"ID_DOCSTATE" NUMBER(6,0), 
	"ID_PARTNER" NUMBER(9,0), 
	"ID_WAREHOUSE" NUMBER(9,0), 
	"COMMENTS" VARCHAR2(2000 BYTE), 
	"ID_INDIVIDUAL" NUMBER(12,0), 
	"DOC_NUMBER" VARCHAR2(100 BYTE), 
	"ID_PAYTYPE" NUMBER(6,0), 
	"ID_LOYPROG" NUMBER(12,0), 
	"AMOUNT" NUMBER(12,4), 
	"RECIPIENT" VARCHAR2(400 BYTE), 
	"REC_TELEPHONE" VARCHAR2(40 BYTE), 
	"IS_PICKUP" VARCHAR2(1 BYTE) DEFAULT 'N', 
	"DOC_DATE" DATE DEFAULT sysdate, 
	"DOC_FIXED_DATE" DATE DEFAULT sysdate, 
	"CODE" VARCHAR2(200 BYTE), 
	"DOC_SUM" NUMBER(15,4) DEFAULT 0, 
	"DOC_SUM_LOYPROG" NUMBER(15,4) DEFAULT 0, 
	"USER_ID" NUMBER(12,0), 
	"CHANGE_DATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."ID_DOC" IS 'Уникальный идентификатор документа';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."ID_DOCTYPE" IS 'Уникальный идентификатор типа документа';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."ID_DOCSTATE" IS 'Уникальный идентификатор состояния документа';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."ID_PARTNER" IS 'Уникальный идентификатор юр.лица (поставщика или покупателя)';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."ID_WAREHOUSE" IS 'Уникальный идентификатор склада';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."COMMENTS" IS 'Комментарии';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."ID_INDIVIDUAL" IS 'Уникальный идентификатор физ.лица (поставщика или покупателя)';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."DOC_NUMBER" IS 'Номер документа';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."ID_PAYTYPE" IS 'Уникальный идентификатор типа оплаты';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."ID_LOYPROG" IS 'Уникальный идентификатор программы лояльности';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."AMOUNT" IS 'Количественный показатель по программе лояльности';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."RECIPIENT" IS 'Получатель';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."REC_TELEPHONE" IS 'Телефон получателя';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."IS_PICKUP" IS 'Самовывоз по заказу (Y или N)';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."DOC_DATE" IS 'Дата создания документа';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."DOC_FIXED_DATE" IS 'Дата фиксированного состояния документа';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."CODE" IS 'Код купона программы лояльности';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."DOC_SUM" IS 'Полная сумма документа';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."DOC_SUM_LOYPROG" IS 'Полная сумма документа с учетом программы лояльности';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."USER_ID" IS 'Уникальный идентификатор пользователя, кто изменил';
   COMMENT ON COLUMN "C##ZAYETS"."DOCS"."CHANGE_DATE" IS 'Дата изменения';
--------------------------------------------------------
--  DDL for Table DOCSTATES
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."DOCSTATES" 
   (	"ID_DOC_STATE" NUMBER(6,0), 
	"NAME" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."DOCSTATES"."ID_DOC_STATE" IS 'Уникальный идентификатор состояния';
   COMMENT ON COLUMN "C##ZAYETS"."DOCSTATES"."NAME" IS 'Название состояния документа';
--------------------------------------------------------
--  DDL for Table DOC_STATES_TYPES
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."DOC_STATES_TYPES" 
   (	"ID_DOCSTATE" NUMBER(6,0), 
	"ID_DOCTYPE" NUMBER(6,0), 
	"IS_FIXED" VARCHAR2(1 BYTE) DEFAULT 'N'
	"S_NUMBER" NUMBER(6,0) 
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."DOC_STATES_TYPES"."ID_DOCSTATE" IS 'Уникальный идентификатор состояния документа';
   COMMENT ON COLUMN "C##ZAYETS"."DOC_STATES_TYPES"."IS_FIXED" IS 'Фиксированное состояние документа? (Y, N, R - добавить товар в резерв)';
   COMMENT ON COLUMN "C##ZAYETS"."DOC_STATES_TYPES"."S_NUMBER" IS 'Порядковый номер состояния для конкретного типа документа';
--------------------------------------------------------
--  DDL for Table DOCTYPES
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."DOCTYPES" 
   (	"ID_DOCTYPE" NUMBER(6,0), 
	"DOCTYPE_CODE" VARCHAR2(10 BYTE), 
	"NAME" VARCHAR2(200 BYTE), 
	"DOC_DIRECTION" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."DOCTYPES"."ID_DOCTYPE" IS 'Уникальный идентификатор типов документов';
   COMMENT ON COLUMN "C##ZAYETS"."DOCTYPES"."DOCTYPE_CODE" IS 'Код документа';
   COMMENT ON COLUMN "C##ZAYETS"."DOCTYPES"."NAME" IS 'Полное название';
   COMMENT ON COLUMN "C##ZAYETS"."DOCTYPES"."DOC_DIRECTION" IS 'Направление документа (приход, расход). Если пусто, то добавления или списания со склада/на склад нет.';
--------------------------------------------------------
--  DDL for Table HISTORY_PRICES
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."HISTORY_PRICES" 
   (	"ID_PROD_WH" NUMBER(15,0), 
	"PURCHASE_PRICE" NUMBER(12,4), 
	"SELLING_PRICE" NUMBER(12,4), 
	"CHANGE_DATE" DATE DEFAULT sysdate, 
	"USER_ID" NUMBER(12,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."HISTORY_PRICES"."ID_PROD_WH" IS 'Уникальный идентификатор товара на складе';
   COMMENT ON COLUMN "C##ZAYETS"."HISTORY_PRICES"."PURCHASE_PRICE" IS 'Цена закупки';
   COMMENT ON COLUMN "C##ZAYETS"."HISTORY_PRICES"."SELLING_PRICE" IS 'Цена продажи';
   COMMENT ON COLUMN "C##ZAYETS"."HISTORY_PRICES"."CHANGE_DATE" IS 'Дата изменения';
   COMMENT ON COLUMN "C##ZAYETS"."HISTORY_PRICES"."USER_ID" IS 'Кто изменил';
--------------------------------------------------------
--  DDL for Table INDIVIDUALS
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."INDIVIDUALS" 
   (	"ID_INDIVID" NUMBER(12,0), 
	"FULLNAME" VARCHAR2(400 BYTE), 
	"LOGIN" VARCHAR2(40 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"DATE_OF_BIRTH" DATE, 
	"GENDER" VARCHAR2(1 BYTE), 
	"EMAIL" VARCHAR2(40 BYTE), 
	"ADDRESS" VARCHAR2(1000 BYTE), 
	"TELEPHONE" VARCHAR2(40 BYTE), 
	"TELEPHONE2" VARCHAR2(40 BYTE), 
	"SUBSCRIPTION" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."INDIVIDUALS"."ID_INDIVID" IS 'Уникальный идентификатор физического лица (покупателя)';
   COMMENT ON COLUMN "C##ZAYETS"."INDIVIDUALS"."FULLNAME" IS 'ФИО';
   COMMENT ON COLUMN "C##ZAYETS"."INDIVIDUALS"."LOGIN" IS 'Логин';
   COMMENT ON COLUMN "C##ZAYETS"."INDIVIDUALS"."PASSWORD" IS 'Пароль';
   COMMENT ON COLUMN "C##ZAYETS"."INDIVIDUALS"."DATE_OF_BIRTH" IS 'Дата рождения';
   COMMENT ON COLUMN "C##ZAYETS"."INDIVIDUALS"."GENDER" IS 'Пол (F, M)';
   COMMENT ON COLUMN "C##ZAYETS"."INDIVIDUALS"."EMAIL" IS 'E-mail';
   COMMENT ON COLUMN "C##ZAYETS"."INDIVIDUALS"."ADDRESS" IS 'Адрес для доставки';
   COMMENT ON COLUMN "C##ZAYETS"."INDIVIDUALS"."TELEPHONE" IS 'Телефон';
   COMMENT ON COLUMN "C##ZAYETS"."INDIVIDUALS"."TELEPHONE2" IS 'Дополнительный телефон';
   COMMENT ON COLUMN "C##ZAYETS"."INDIVIDUALS"."SUBSCRIPTION" IS 'Подписка на новости (Y, N)';
--------------------------------------------------------
--  DDL for Table LOYALTY_PROGRAM
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."LOYALTY_PROGRAM" 
   (	"ID_LOYPROG" NUMBER(12,0), 
	"NAME" VARCHAR2(200 BYTE), 
	"CODE" VARCHAR2(200 BYTE), 
	"VALUE" NUMBER(12,4), 
	"APPLY_TO_DOCS" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."LOYALTY_PROGRAM"."ID_LOYPROG" IS 'Уникальный идентификатор программы лояльности';
   COMMENT ON COLUMN "C##ZAYETS"."LOYALTY_PROGRAM"."NAME" IS 'Название программы лояльности';
   COMMENT ON COLUMN "C##ZAYETS"."LOYALTY_PROGRAM"."CODE" IS 'Буквенный код купона';
   COMMENT ON COLUMN "C##ZAYETS"."LOYALTY_PROGRAM"."VALUE" IS 'Числовое значение программы лояльности (% скидки, денежный размер скидки по купону и т.д.)';
   COMMENT ON COLUMN "C##ZAYETS"."LOYALTY_PROGRAM"."APPLY_TO_DOCS" IS 'Применяется к документу? (Y или N)';
--------------------------------------------------------
--  DDL for Table LOYPROG_BY_PRODUCTS
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."LOYPROG_BY_PRODUCTS" 
   (	"ID_PRODUCT" NUMBER(12,0), 
	"ID_LOYPROG" NUMBER(12,0), 
	"AMOUNT" NUMBER(12,4), 
	"ACTUAL_DATE" DATE, 
	"USER_ID" NUMBER(12,0), 
	"CHANGE_DATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."LOYPROG_BY_PRODUCTS"."ID_PRODUCT" IS 'Уникальный идентификатор товара';
   COMMENT ON COLUMN "C##ZAYETS"."LOYPROG_BY_PRODUCTS"."ID_LOYPROG" IS 'Уникальный идентификатор программы лояльности';
   COMMENT ON COLUMN "C##ZAYETS"."LOYPROG_BY_PRODUCTS"."AMOUNT" IS 'Размер лояльности (% скидки)';
   COMMENT ON COLUMN "C##ZAYETS"."LOYPROG_BY_PRODUCTS"."ACTUAL_DATE" IS 'Актуальна до даты';
   COMMENT ON COLUMN "C##ZAYETS"."LOYPROG_BY_PRODUCTS"."USER_ID" IS 'Уникальный идентификатор пользователя, кто изменил';
   COMMENT ON COLUMN "C##ZAYETS"."LOYPROG_BY_PRODUCTS"."CHANGE_DATE" IS 'Когда изменил';
--------------------------------------------------------
--  DDL for Table PARTNERS
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."PARTNERS" 
   (	"ID_PARTNER" NUMBER(9,0), 
	"FULL_NAME" VARCHAR2(1000 BYTE), 
	"NAME" VARCHAR2(200 BYTE), 
	"LEGAL_ADDRESS" VARCHAR2(1000 BYTE), 
	"ACTUAL_ADDRESS" VARCHAR2(1000 BYTE), 
	"MAIL_ADDRESS" VARCHAR2(1000 BYTE), 
	"TELEPHONE" VARCHAR2(200 BYTE), 
	"EMAIL" VARCHAR2(200 BYTE), 
	"INN" NUMBER(10,0), 
	"KPP" NUMBER(9,0), 
	"OGRN" NUMBER(13,0), 
	"OKPO" NUMBER(8,0), 
	"OKATO" NUMBER(11,0), 
	"OKVED" VARCHAR2(5 BYTE), 
	"BANK" VARCHAR2(200 BYTE), 
	"CHECKING_ACC" VARCHAR2(20 BYTE), 
	"CORR_ACC" VARCHAR2(20 BYTE), 
	"BIK" NUMBER(9,0), 
	"GENERAL_DIRECTOR" VARCHAR2(200 BYTE), 
	"GENERAL_ACCOUNTANT" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."ID_PARTNER" IS 'Идентификатор юр.лица (поставщики, производители, покупатели-юр.лица)';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."FULL_NAME" IS 'Полное наименование';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."NAME" IS 'Сокращенное наименование';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."LEGAL_ADDRESS" IS 'Юридический адрес';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."ACTUAL_ADDRESS" IS 'Фактический адрес';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."MAIL_ADDRESS" IS 'Почтовый адрес';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."TELEPHONE" IS 'Телефон';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."EMAIL" IS 'e-mail';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."INN" IS 'ИНН';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."KPP" IS 'КПП';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."OGRN" IS 'ОГРН';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."OKPO" IS 'ОКПО';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."OKATO" IS 'ОКАТО';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."OKVED" IS 'ОКВЭД';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."BANK" IS 'Банк';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."CHECKING_ACC" IS 'Расчетный счет';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."CORR_ACC" IS 'Кор.счет';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."BIK" IS 'БИК';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."GENERAL_DIRECTOR" IS 'Генеральный директор';
   COMMENT ON COLUMN "C##ZAYETS"."PARTNERS"."GENERAL_ACCOUNTANT" IS 'Главный бухгалтер';
--------------------------------------------------------
--  DDL for Table PAYTYPES
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."PAYTYPES" 
   (	"ID_PAYTYPE" NUMBER(6,0), 
	"NAME" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."PAYTYPES"."ID_PAYTYPE" IS 'Уникальный идентификатор типа оплаты';
   COMMENT ON COLUMN "C##ZAYETS"."PAYTYPES"."NAME" IS 'Название типа оплаты';
--------------------------------------------------------
--  DDL for Table PRODUCTS
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."PRODUCTS" 
   (	"ID_PRODUCT" NUMBER(12,0), 
	"NAME" VARCHAR2(400 BYTE), 
	"DETAILS" VARCHAR2(2000 BYTE), 
	"ARTICLE" VARCHAR2(40 BYTE), 
	"ID_MANUFACTURER" NUMBER(9,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS"."ID_PRODUCT" IS 'Уникальный идентификатор товара';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS"."NAME" IS 'Название товара';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS"."DETAILS" IS 'Описание товара';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS"."ARTICLE" IS 'Артикул товара';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS"."ID_MANUFACTURER" IS 'Уникальный идентификатор производителя';
--------------------------------------------------------
--  DDL for Table PRODUCTS_BY_CATEGORIES
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."PRODUCTS_BY_CATEGORIES" 
   (	"ID_PRODUCT" NUMBER(12,0), 
	"ID_CATEGORY" NUMBER(9,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_BY_CATEGORIES"."ID_PRODUCT" IS 'Уникальный идентификатор товара';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_BY_CATEGORIES"."ID_CATEGORY" IS 'Уникальный идентификатор категории';
--------------------------------------------------------
--  DDL for Table PRODUCTS_BY_SPEC
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."PRODUCTS_BY_SPEC" 
   (	"ID_PRODUCT" NUMBER(12,0), 
	"ID_SPEC" NUMBER(12,0), 
	"TEXT_VALUE" VARCHAR2(200 BYTE), 
	"NUMBER_VALUE" NUMBER(12,4)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_BY_SPEC"."ID_PRODUCT" IS 'Уникальный идентификатор товара';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_BY_SPEC"."ID_SPEC" IS 'Уникальный идентификатор характеристики';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_BY_SPEC"."TEXT_VALUE" IS 'Текстовое значение характеристики';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_BY_SPEC"."NUMBER_VALUE" IS 'Числовое значение характеристики';
--------------------------------------------------------
--  DDL for Table PRODUCTS_IN_WAREHOUSE
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" 
   (	"ID_PRODUCT" NUMBER(12,0), 
	"ID_WAREHOUSE" NUMBER(6,0), 
	"PROD_COUNT" NUMBER(12,4), 
	"PROD_RESERVE" NUMBER(12,4) DEFAULT 0, 
	"PURCHASE_PRICE" NUMBER(15,4), 
	"ID_SUPPLIER" NUMBER(9,0), 
	"SELLING_PRICE" NUMBER(15,4), 
	"USER_ID" NUMBER(12,0), 
	"CHANGE_DATE" DATE DEFAULT sysdate, 
	"ID_PROD_WH" NUMBER(15,0), 
	"CREATE_DATE" DATE DEFAULT sysdate, 
	"USER_CREATED" NUMBER(12,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE"."ID_PRODUCT" IS 'Уникальный идентификатор товара';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE"."ID_WAREHOUSE" IS 'Уникальный идентификатор склада';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE"."PROD_COUNT" IS 'Общее количество товара на складе';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE"."PROD_RESERVE" IS 'Количество товара в резерве';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE"."PURCHASE_PRICE" IS 'Цена покупки товара (поставки)';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE"."ID_SUPPLIER" IS 'Уникальный идентификатор поставщика (юр.лица)';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE"."SELLING_PRICE" IS 'Цена продажи (базовая)';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE"."USER_ID" IS 'Уникальный идентификатор пользователя, кто изменил';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE"."CHANGE_DATE" IS 'Дата изменения';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE"."ID_PROD_WH" IS 'Уникальный идентификатор товара на складе';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE"."CREATE_DATE" IS 'Дата создания (заведения)';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE"."USER_CREATED" IS 'Кто создал (завел)';
--------------------------------------------------------
--  DDL for Table PRODUCTS_MOVING
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."PRODUCTS_MOVING" 
   (	"ID_PROD_WH" NUMBER(15,0), 
	"ID_DOCDETAIL" NUMBER(15,0), 
	"PROD_COUNT" NUMBER(12,4), 
	"PROD_RESERVE" NUMBER(12,4), 
	"CHANGE_DATE" DATE DEFAULT sysdate, 
	"USER_ID" NUMBER(12,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_MOVING"."ID_PROD_WH" IS 'Уникальный идентификатор товаров на складе';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_MOVING"."ID_DOCDETAIL" IS 'Уникальный идентификатор строчки документа';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_MOVING"."PROD_COUNT" IS 'Общее количество товара';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_MOVING"."PROD_RESERVE" IS 'Количество товара  резерве';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_MOVING"."CHANGE_DATE" IS 'Дата изменения';
   COMMENT ON COLUMN "C##ZAYETS"."PRODUCTS_MOVING"."USER_ID" IS 'Кто изменит';
--------------------------------------------------------
--  DDL for Table SPECIFICATIONS
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."SPECIFICATIONS" 
   (	"ID_SPEC" NUMBER(12,0), 
	"NAME" VARCHAR2(400 BYTE), 
	"DETAILS" VARCHAR2(2000 BYTE), 
	"IS_SEARCH" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"   NO INMEMORY ;

   COMMENT ON COLUMN "C##ZAYETS"."SPECIFICATIONS"."ID_SPEC" IS 'Уникальный идентификатор характеристики товара';
   COMMENT ON COLUMN "C##ZAYETS"."SPECIFICATIONS"."NAME" IS 'Название характеристики';
   COMMENT ON COLUMN "C##ZAYETS"."SPECIFICATIONS"."DETAILS" IS 'Описание характеристики товара';
   COMMENT ON COLUMN "C##ZAYETS"."SPECIFICATIONS"."IS_SEARCH" IS 'Доступна для поиска (Y, N)';
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."USERS" 
   (	"USER_ID" NUMBER(12,0), 
	"LOGIN" VARCHAR2(20 BYTE), 
	"FULLNAME" VARCHAR2(1000 BYTE), 
	"POSITION" VARCHAR2(1000 BYTE), 
	"DEPARTMENT" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."USERS"."USER_ID" IS 'Уникальный идентификатор пользователя';
   COMMENT ON COLUMN "C##ZAYETS"."USERS"."LOGIN" IS 'Логин';
   COMMENT ON COLUMN "C##ZAYETS"."USERS"."FULLNAME" IS 'ФИО';
   COMMENT ON COLUMN "C##ZAYETS"."USERS"."POSITION" IS 'Должность';
   COMMENT ON COLUMN "C##ZAYETS"."USERS"."DEPARTMENT" IS 'Отдел';
--------------------------------------------------------
--  DDL for Table WAREHOUSE
--------------------------------------------------------

  CREATE TABLE "C##ZAYETS"."WAREHOUSE" 
   (	"ID_WAREHOUSE" NUMBER(6,0), 
	"ADDRESS" VARCHAR2(1000 BYTE), 
	"PICKUP" VARCHAR2(1 BYTE), 
	"NAME" VARCHAR2(400 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "C##ZAYETS"."WAREHOUSE"."ID_WAREHOUSE" IS 'Уникальный идентификатор склада';
   COMMENT ON COLUMN "C##ZAYETS"."WAREHOUSE"."ADDRESS" IS 'Адрес склада';
   COMMENT ON COLUMN "C##ZAYETS"."WAREHOUSE"."PICKUP" IS 'Есть ли у склада самовывоз (Y, N)';
   COMMENT ON COLUMN "C##ZAYETS"."WAREHOUSE"."NAME" IS 'Название склада';
--------------------------------------------------------
--  DDL for Index CATEGORIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."CATEGORIES_PK" ON "C##ZAYETS"."CATEGORIES" ("ID_CATEGORY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DOCSTATES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."DOCSTATES_PK" ON "C##ZAYETS"."DOCSTATES" ("ID_DOC_STATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DOCS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."DOCS_PK" ON "C##ZAYETS"."DOCS" ("ID_DOC") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DOCTYPES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."DOCTYPES_PK" ON "C##ZAYETS"."DOCTYPES" ("ID_DOCTYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DOC_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."DOC_DETAILS_PK" ON "C##ZAYETS"."DOC_DETAILS" ("ID_DOCDETAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DOC_STATES_TYPES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."DOC_STATES_TYPES_PK" ON "C##ZAYETS"."DOC_STATES_TYPES" ("ID_DOCSTATE", "ID_DOCTYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index INDIVIDUALS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."INDIVIDUALS_PK" ON "C##ZAYETS"."INDIVIDUALS" ("ID_INDIVID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOYALTY_PROGRAM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."LOYALTY_PROGRAM_PK" ON "C##ZAYETS"."LOYALTY_PROGRAM" ("ID_LOYPROG") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOYPROG_BY_PRODUCTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."LOYPROG_BY_PRODUCTS_PK" ON "C##ZAYETS"."LOYPROG_BY_PRODUCTS" ("ID_PRODUCT", "ID_LOYPROG") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PARTNERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."PARTNERS_PK" ON "C##ZAYETS"."PARTNERS" ("ID_PARTNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PAYTYPES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."PAYTYPES_PK" ON "C##ZAYETS"."PAYTYPES" ("ID_PAYTYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCTS_BY_CATEGORIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."PRODUCTS_BY_CATEGORIES_PK" ON "C##ZAYETS"."PRODUCTS_BY_CATEGORIES" ("ID_PRODUCT", "ID_CATEGORY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCTS_BY_SPEC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."PRODUCTS_BY_SPEC_PK" ON "C##ZAYETS"."PRODUCTS_BY_SPEC" ("ID_PRODUCT", "ID_SPEC") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCTS_IN_WAREHOUSE_PK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE_PK1" ON "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ("ID_PROD_WH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCTS_MOVING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."PRODUCTS_MOVING_PK" ON "C##ZAYETS"."PRODUCTS_MOVING" ("ID_PROD_WH", "ID_DOCDETAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."PRODUCTS_PK" ON "C##ZAYETS"."PRODUCTS" ("ID_PRODUCT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SPECIFICATIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."SPECIFICATIONS_PK" ON "C##ZAYETS"."SPECIFICATIONS" ("ID_SPEC") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."USERS_PK" ON "C##ZAYETS"."USERS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index WAREHOUSE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."WAREHOUSE_PK" ON "C##ZAYETS"."WAREHOUSE" ("ID_WAREHOUSE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_PARTNERS_NAME
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_PARTNERS_NAME" ON "C##ZAYETS"."PARTNERS" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_PROD_IN_WH_PRO_WH_SUP
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."IDX_PROD_IN_WH_PRO_WH_SUP" ON "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ("ID_PRODUCT", "ID_WAREHOUSE", "ID_SUPPLIER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_CATEG_NAME
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_CATEG_NAME" ON "C##ZAYETS"."CATEGORIES" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_DOC_DET_PROD_COUNT
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_DOC_DET_PROD_COUNT" ON "C##ZAYETS"."DOC_DETAILS" ("ID_PRODUCT", "PROD_COUNT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_PARTNERS_INN
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_PARTNERS_INN" ON "C##ZAYETS"."PARTNERS" ("INN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_HIS_PR_PROD_PUR_PR
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_HIS_PR_PROD_PUR_PR" ON "C##ZAYETS"."HISTORY_PRICES" ("ID_PROD_WH", "PURCHASE_PRICE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_PROD_BY_SPEC_TEXT
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_PROD_BY_SPEC_TEXT" ON "C##ZAYETS"."PRODUCTS_BY_SPEC" ("TEXT_VALUE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_HIS_PR_SEL_PUR_PR
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_HIS_PR_SEL_PUR_PR" ON "C##ZAYETS"."HISTORY_PRICES" ("SELLING_PRICE"-"PURCHASE_PRICE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_LOY_PROG_CODE
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."IDX_LOY_PROG_CODE" ON "C##ZAYETS"."LOYALTY_PROGRAM" ("CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_PRODUCTS_ART
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_PRODUCTS_ART" ON "C##ZAYETS"."PRODUCTS" ("ARTICLE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_PROD_BY_SPEC_NUMB
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_PROD_BY_SPEC_NUMB" ON "C##ZAYETS"."PRODUCTS_BY_SPEC" ("NUMBER_VALUE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_HIS_PR_PROD_SEL_PR
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_HIS_PR_PROD_SEL_PR" ON "C##ZAYETS"."HISTORY_PRICES" ("ID_PROD_WH", "SELLING_PRICE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_PRODUCTS_NAME
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_PRODUCTS_NAME" ON "C##ZAYETS"."PRODUCTS" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_PARTNERS_OGRN
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_PARTNERS_OGRN" ON "C##ZAYETS"."PARTNERS" ("OGRN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_DOCS_DOC_NUMB
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_DOCS_DOC_NUMB" ON "C##ZAYETS"."DOCS" ("DOC_NUMBER") REVERSE 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_INDIVID_GENDER
--------------------------------------------------------

  CREATE BITMAP INDEX "C##ZAYETS"."IDX_INDIVID_GENDER" ON "C##ZAYETS"."INDIVIDUALS" ("GENDER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_LOYPR_PROD_PROD_AMOUNT
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_LOYPR_PROD_PROD_AMOUNT" ON "C##ZAYETS"."LOYPROG_BY_PRODUCTS" ("ID_PRODUCT", "AMOUNT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_USERS_LOGIN
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ZAYETS"."IDX_USERS_LOGIN" ON "C##ZAYETS"."USERS" ("LOGIN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_INDIVID_DOB
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_INDIVID_DOB" ON "C##ZAYETS"."INDIVIDUALS" (EXTRACT(YEAR FROM "DATE_OF_BIRTH")) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_WH_PICKUP
--------------------------------------------------------

  CREATE BITMAP INDEX "C##ZAYETS"."IDX_WH_PICKUP" ON "C##ZAYETS"."WAREHOUSE" ("PICKUP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_PROD_IN_WH_PROD_SEL_PR
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_PROD_IN_WH_PROD_SEL_PR" ON "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ("ID_PRODUCT", "SELLING_PRICE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_SPEC_IS_SEARCH
--------------------------------------------------------

  CREATE BITMAP INDEX "C##ZAYETS"."IDX_SPEC_IS_SEARCH" ON "C##ZAYETS"."SPECIFICATIONS" ("IS_SEARCH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_PROD_IN_WH_PROD_PUR_PR
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_PROD_IN_WH_PROD_PUR_PR" ON "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ("ID_PRODUCT", "PURCHASE_PRICE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_LOYPR_PROD_PROD_LOY_ACT_DATE
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_LOYPR_PROD_PROD_LOY_ACT_DATE" ON "C##ZAYETS"."LOYPROG_BY_PRODUCTS" ("ID_PRODUCT", "ID_LOYPROG", "ACTUAL_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_DOC_DET_PROD_SHIP
--------------------------------------------------------

  CREATE INDEX "C##ZAYETS"."IDX_DOC_DET_PROD_SHIP" ON "C##ZAYETS"."DOC_DETAILS" ("ID_PRODUCT", "PROD_SHIPPED") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger TBIU_DOCS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##ZAYETS"."TBIU_DOCS" 
BEFORE INSERT OR UPDATE ON DOCS
for each row
declare 
  pLoyProg LOYALTY_PROGRAM%rowtype;
  pFixState DOCSTATES.ID_DOC_STATE%type;
  cnt number;
BEGIN
  begin
    if inserting then
    --*** проставляет ID и номер документа и заполняем поля по умолчанию
      if :new.ID_DOC is null then 
       :new.ID_DOC := seq_gen_DOCS.nextval;
      end if;
      select DOCTYPE_CODE ||'_'||:new.ID_DOC into :new.DOC_NUMBER from DOCTYPES where ID_DOCTYPE = :new.ID_DOCTYPE;
      :new.ID_DOCSTATE := 1; /*NEW*/
      :new.DOC_SUM := 0;
      :new.DOC_SUM_LOYPROG := 0;
    end if;

    if updating then 
    --*** Вычисляем сумму по детализации документа по полной стоимости DOC_SUM и сумму по программе лояльности DOC_SUM_LOYPROG
      select SUM(FULL_PRICE * PROD_COUNT), SUM(PRICE_LOYPROG * PROD_COUNT) into :new.DOC_SUM, :new.DOC_SUM_LOYPROG
        from DOC_DETAILS where ID_DOC = :new.ID_DOC;
      --*** Для фиксированного состояния документа проставляем дату фиксации (фиксированное состояние для каждого документа только одно!)
      select count(ID_DOCSTATE) into cnt
        from DOC_STATES_TYPES where ID_DOCTYPE = :new.ID_DOCTYPE and IS_FIXED = 'Y';
      if (cnt > 0 /*состояние фиксированное*/) and (:new.ID_DOCSTATE <> :old.ID_DOCSTATE) then :new.DOC_FIXED_DATE := sysdate;
      end if;
    end if;
    
    --*** подстановка кода и размера программы лояльности в документ
    select * into pLoyProg from LOYALTY_PROGRAM where ID_LOYPROG = :new.ID_LOYPROG and APPLY_TO_DOCS = 'Y';
    :new.AMOUNT := pLoyProg.VALUE;
    :new.CODE := pLoyProg.CODE;
    --*** запоминаем, кто и когда изменил документ (Тут можно добавить логирование в отдельную таблицу)
    if :new.user_id is null then
      select USER_ID into :new.user_id from USERS where LOGIN = user;
    end if;
    :new.CHANGE_DATE := sysdate;
  exception 
  when others then
  raise;
  end;
END;
/
ALTER TRIGGER "C##ZAYETS"."TBIU_DOCS" ENABLE;
--------------------------------------------------------
--  DDL for Package PKG_MAIN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "C##ZAYETS"."PKG_MAIN" AS 

--*** Процедура предназначена для вставки или обновления шапки документа DOCS. 
--*** Переход между состояниями документа производится процедурой TransferDocToState
  procedure WriteDOCS(pID DOCS.ID_DOC%type, pDocType DOCS.ID_DOCTYPE%type, pPartner PARTNERS.ID_PARTNER%type,
                      pWareHouse WAREHOUSE.ID_WAREHOUSE%type, pComments DOCS.COMMENTS%type, 
                      pIndividual INDIVIDUALS.ID_INDIVID%type, pPayType PAYTYPES.ID_PAYTYPE%type, 
                      pLoyProg LOYALTY_PROGRAM.ID_LOYPROG%type, pRecipient DOCS.RECIPIENT%type, 
                      pRecTel DOCS.REC_TELEPHONE%type, pIsPickup DOCS.IS_PICKUP%type, pUserID USERS.USER_ID%type) ;
 
 --*** Процедура предназначена для вставки и обновления данных детализации документа DOC_DETAILS                     
  procedure WriteDOC_DETAILS (pIDDetail DOC_DETAILS.ID_DOCDETAIL%type, pID DOCS.ID_DOC%type, pProduct PRODUCTS.ID_PRODUCT%type,
                              pCount DOC_DETAILS.PROD_COUNT%type, pPrice DOC_DETAILS.FULL_PRICE%type, 
                              pPriceLoyProg DOC_DETAILS.PRICE_LOYPROG%type, pUserID USERS.USER_ID%type
                              ) ;
  --*** Переход между состояниями документа
  procedure TransferDocToState(pID DOCS.ID_DOC%type, pIDDocState DOCSTATES.ID_DOC_STATE%type /*ID нового состояния*/, 
                               pUserID USERS.USER_ID%type);

END PKG_MAIN;

/
--------------------------------------------------------
--  DDL for Package Body PKG_MAIN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "C##ZAYETS"."PKG_MAIN" AS

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
  procedure TransferDocToState(pID DOCS.ID_DOC%type, pIDDocState DOCSTATES.ID_DOC_STATE%type /*ID нового состояния*/, 
                               pUserID USERS.USER_ID%type) as
    NewDocState DOC_STATES_TYPES%rowtype;
    DocType DOCTYPES%rowtype;
    DocRow DOCS%rowtype;
    ProdInWH PRODUCTS_IN_WAREHOUSE%rowtype;
    balance number; /*Ostatok*/
  begin
    begin
      select * into DocRow from DOCS where ID_DOC = pID for update;
      select * into NewDocState from DOC_STATES_TYPES where ID_DOCSTATE = pIDDocState and ID_DOCTYPE = DocRow.ID_DOCTYPE;
      select * into DocType from DOCTYPES where ID_DOCTYPE = DocRow.ID_DOCTYPE;
      
      --*** меняем состояние документа
      update DOCS set ID_DOCSTATE = pIDDocState where ID_DOC = pID;
      --*** для каждой строчки в детализации
      for v in (select * from DOC_DETAILS where ID_DOC = pID for update) loop
      --*** если состояние фиксированное , то:
        if  (NewDocState.IS_FIXED = 'Y') and (DocType.DOC_DIRECTION = 'P'/*приход товара*/) then 
        --***ищем строчку с товаром на складе и добавляем товар (если нет - создаем)
          begin
            select * into ProdInWH 
            from PRODUCTS_IN_WAREHOUSE 
            where ID_PRODUCT = v.ID_PRODUCT and ID_SUPPLIER /*поставщик*/ = DocRow.ID_PARTNER
              and ID_WAREHOUSE = DocRow.ID_WAREHOUSE for update;
           --*** для сохранения истории цены можно сделать отдельную таблицу логов 
            update PRODUCTS_IN_WAREHOUSE 
              set PROD_COUNT = PROD_COUNT + v.PROD_COUNT, PURCHASE_PRICE = v.PRICE_LOYPROG, USER_ID = pUserID
              where ID_PRODUCT = v.ID_PRODUCT and ID_SUPPLIER /*поставщик*/ = DocRow.ID_PARTNER
                and ID_WAREHOUSE = DocRow.ID_WAREHOUSE;  
          exception
            when no_data_found then
              insert into PRODUCTS_IN_WAREHOUSE(ID_PROD_WH, ID_PRODUCT, ID_WAREHOUSE, PROD_COUNT, ID_SUPPLIER, PURCHASE_PRICE, SELLING_PRICE, USER_ID)
                values (seq_gen_prod_in_wh.nextval, v.ID_PRODUCT, DocRow.ID_WAREHOUSE, v.PROD_COUNT, DocRow.ID_PARTNER, v.PRICE_LOYPROG, v.PRICE_LOYPROG, pUserID); 
            when too_many_rows then
              rollback;
              raise_application_error (-20007, 'Произошло задвоение строчек на складе (уч.номер) '||DocRow.ID_WAREHOUSE||
                  ' с продуктом (уч.номер) '||v.ID_PRODUCT||' и поставщиком (уч.номер)'||DocRow.ID_PARTNER);
          end;
        elsif (NewDocState.IS_FIXED = 'R') and (DocType.DOC_DIRECTION = 'R'/*расход товара*/) then
          --*** perevesti nugnoe koli4estvo v rezerv
          null;
        elsif (NewDocState.IS_FIXED = 'Y') and (DocType.DOC_DIRECTION = 'R'/*расход товара*/) then
        --*** ищем строчку с товаром на складе и убавляем товар. Если нет строчки и не хватает товара - ошибка + ищем резерв
        begin
          balance := 0; /*Ostatok*/  
          savepoint my_save;
          for s in (select * from PRODUCTS_IN_WAREHOUSE 
                        where ID_PRODUCT = v.ID_PRODUCT and ID_WAREHOUSE = DocRow.ID_WAREHOUSE and PROD_RESERVE > 0 for update) loop
            --izmenuaem po stro4no iz reserva
            null;
            --balance := s.Prod;
            --update set 
            -- SDELAT i ALGORITM na rezerv i spisanie???
            -- a kak budet delatsia vozvrat ???
            --cnt := cnt + s.PROD_COUNT-s.PROD_RESERVE;
            --if cnt >= v.PROD_COUNT then
          end loop;
            --copypast iz prihoda. proverit, ne nugno vozmogno
            select * into ProdInWH 
            from PRODUCTS_IN_WAREHOUSE 
            where ID_PRODUCT = v.ID_PRODUCT and ID_WAREHOUSE = DocRow.ID_WAREHOUSE and rownum < 2 for update;
           --*** для сохранения истории цены можно сделать отдельную таблицу логов 
            update PRODUCTS_IN_WAREHOUSE 
              set PROD_COUNT = PROD_COUNT + v.PROD_COUNT, PURCHASE_PRICE = v.PRICE_LOYPROG, USER_ID = pUserID
              where ID_PRODUCT = v.ID_PRODUCT and ID_SUPPLIER /*поставщик*/ = DocRow.ID_PARTNER
                and ID_WAREHOUSE = DocRow.ID_WAREHOUSE;  
          exception
            when no_data_found then
              insert into PRODUCTS_IN_WAREHOUSE(ID_PRODUCT, ID_WAREHOUSE, PROD_COUNT, ID_SUPPLIER, PURCHASE_PRICE, SELLING_PRICE, USER_ID)
                values (v.ID_PRODUCT, DocRow.ID_WAREHOUSE, v.PROD_COUNT, DocRow.ID_PARTNER, v.PRICE_LOYPROG, v.PRICE_LOYPROG, pUserID); 
            when too_many_rows then
              rollback;
              raise_application_error (-20007, 'Произошло задвоение строчек на складе (уч.номер) '||DocRow.ID_WAREHOUSE||
                  ' с продуктом (уч.номер) '||v.ID_PRODUCT||' и поставщиком (уч.номер)'||DocRow.ID_PARTNER);
          end;
       
        end if;
      end loop;
      commit;
    exception
      when no_data_found then
      rollback;
      raise_application_error (-20006, 'Данные по документу или состоянию не найдены.');
    end;
  end TransferDocToState;
END PKG_MAIN;

/
--------------------------------------------------------
--  Constraints for Table PRODUCTS_MOVING
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."PRODUCTS_MOVING" MODIFY ("ID_PROD_WH" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_MOVING" MODIFY ("ID_DOCDETAIL" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_MOVING" MODIFY ("PROD_COUNT" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_MOVING" MODIFY ("PROD_RESERVE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_MOVING" ADD CONSTRAINT "PRODUCTS_MOVING_PK" PRIMARY KEY ("ID_PROD_WH", "ID_DOCDETAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_MOVING" MODIFY ("CHANGE_DATE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_MOVING" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SPECIFICATIONS
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."SPECIFICATIONS" MODIFY ("ID_SPEC" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."SPECIFICATIONS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."SPECIFICATIONS" ADD CONSTRAINT "SPECIFICATIONS_PK" PRIMARY KEY ("ID_SPEC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##ZAYETS"."SPECIFICATIONS" MODIFY ("IS_SEARCH" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."SPECIFICATIONS" ADD CONSTRAINT "CHK_SPEC_IS_SEARCH" CHECK (is_search in ('Y', 'N')) ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCTS_IN_WAREHOUSE
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" MODIFY ("SELLING_PRICE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" MODIFY ("ID_PRODUCT" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" MODIFY ("ID_WAREHOUSE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" MODIFY ("PROD_COUNT" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" MODIFY ("PURCHASE_PRICE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" MODIFY ("CHANGE_DATE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" MODIFY ("ID_SUPPLIER" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" MODIFY ("PROD_RESERVE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" MODIFY ("ID_PROD_WH" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ADD CONSTRAINT "PRODUCTS_IN_WAREHOUSE_PK" PRIMARY KEY ("ID_PROD_WH")
  USING INDEX (CREATE UNIQUE INDEX "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE_PK1" ON "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ("ID_PROD_WH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" )  ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" MODIFY ("USER_CREATED" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ADD CONSTRAINT "CHK_PR_WH_PROD_COUNT" CHECK (prod_count >= 0) ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ADD CONSTRAINT "CHK_PR_WH_PROD_RES" CHECK (prod_reserve >= 0) ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ADD CONSTRAINT "CHK_PR_WH_PUR_PR" CHECK (purchase_price >= 0) ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ADD CONSTRAINT "CHK_PR_WH_SEL_PR" CHECK (selling_price >= 0) ENABLE;
--------------------------------------------------------
--  Constraints for Table INDIVIDUALS
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."INDIVIDUALS" ADD CONSTRAINT "CHK_INDIV_PAS" CHECK (ltrim(password,'1234567890') is not null) ENABLE;
  ALTER TABLE "C##ZAYETS"."INDIVIDUALS" MODIFY ("ID_INDIVID" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."INDIVIDUALS" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."INDIVIDUALS" MODIFY ("LOGIN" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."INDIVIDUALS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."INDIVIDUALS" MODIFY ("SUBSCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."INDIVIDUALS" ADD CONSTRAINT "INDIVIDUALS_PK" PRIMARY KEY ("ID_INDIVID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##ZAYETS"."INDIVIDUALS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."INDIVIDUALS" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."INDIVIDUALS" MODIFY ("TELEPHONE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATEGORIES
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."CATEGORIES" MODIFY ("ID_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."CATEGORIES" MODIFY ("ID_PARENT" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."CATEGORIES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."CATEGORIES" ADD CONSTRAINT "CATEGORIES_PK" PRIMARY KEY ("ID_CATEGORY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DOCSTATES
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."DOCSTATES" MODIFY ("ID_DOC_STATE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCSTATES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCSTATES" ADD CONSTRAINT "DOCSTATES_PK" PRIMARY KEY ("ID_DOC_STATE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PAYTYPES
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."PAYTYPES" MODIFY ("ID_PAYTYPE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PAYTYPES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PAYTYPES" ADD CONSTRAINT "PAYTYPES_PK" PRIMARY KEY ("ID_PAYTYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."USERS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."USERS" MODIFY ("LOGIN" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."USERS" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."USERS" MODIFY ("POSITION" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."USERS" MODIFY ("DEPARTMENT" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##ZAYETS"."USERS" ADD CONSTRAINT "CHK_USERS_LOGIN" CHECK ( length(login) >= 5) ENABLE;
--------------------------------------------------------
--  Constraints for Table DOCTYPES
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."DOCTYPES" MODIFY ("ID_DOCTYPE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCTYPES" ADD CONSTRAINT "DOCTYPES_PK" PRIMARY KEY ("ID_DOCTYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##ZAYETS"."DOCTYPES" MODIFY ("DOCTYPE_CODE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCTYPES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCTYPES" ADD CONSTRAINT "CHK_DT_DDIR" CHECK (doc_direction is null or doc_direction in ('P', 'R')) ENABLE;
--------------------------------------------------------
--  Constraints for Table DOCS
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."DOCS" MODIFY ("ID_DOC" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCS" MODIFY ("ID_DOCTYPE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCS" MODIFY ("ID_DOCSTATE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCS" MODIFY ("ID_WAREHOUSE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCS" ADD CONSTRAINT "DOCS_PK" PRIMARY KEY ("ID_DOC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##ZAYETS"."DOCS" MODIFY ("DOC_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCS" MODIFY ("ID_PAYTYPE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCS" MODIFY ("DOC_DATE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCS" MODIFY ("DOC_FIXED_DATE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCS" MODIFY ("DOC_SUM" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCS" MODIFY ("DOC_SUM_LOYPROG" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCS" MODIFY ("CHANGE_DATE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCS" MODIFY ("IS_PICKUP" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOCS" ADD CONSTRAINT "CHK_DOC_IS_PICK" CHECK (is_pickup in ('Y', 'N')) ENABLE;
  ALTER TABLE "C##ZAYETS"."DOCS" ADD CONSTRAINT "CHK_DOC_DD_DFD" CHECK (doc_date <= doc_fixed_date) ENABLE;
  ALTER TABLE "C##ZAYETS"."DOCS" ADD CONSTRAINT "CHK_DOC_DSUM" CHECK (doc_sum  >= 0) ENABLE;
  ALTER TABLE "C##ZAYETS"."DOCS" ADD CONSTRAINT "CHK_DOC_DSUM_LOYPR" CHECK (doc_sum_loyprog >=0) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOYPROG_BY_PRODUCTS
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."LOYPROG_BY_PRODUCTS" MODIFY ("ID_PRODUCT" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."LOYPROG_BY_PRODUCTS" MODIFY ("ID_LOYPROG" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."LOYPROG_BY_PRODUCTS" MODIFY ("AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."LOYPROG_BY_PRODUCTS" ADD CONSTRAINT "LOYPROG_BY_PRODUCTS_PK" PRIMARY KEY ("ID_PRODUCT", "ID_LOYPROG")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##ZAYETS"."LOYPROG_BY_PRODUCTS" MODIFY ("ACTUAL_DATE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."LOYPROG_BY_PRODUCTS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."LOYPROG_BY_PRODUCTS" MODIFY ("CHANGE_DATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOYALTY_PROGRAM
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."LOYALTY_PROGRAM" MODIFY ("ID_LOYPROG" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."LOYALTY_PROGRAM" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."LOYALTY_PROGRAM" ADD CONSTRAINT "LOYALTY_PROGRAM_PK" PRIMARY KEY ("ID_LOYPROG")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##ZAYETS"."LOYALTY_PROGRAM" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."LOYALTY_PROGRAM" MODIFY ("VALUE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."LOYALTY_PROGRAM" MODIFY ("APPLY_TO_DOCS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DOC_STATES_TYPES
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."DOC_STATES_TYPES" MODIFY ("ID_DOCSTATE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_STATES_TYPES" MODIFY ("ID_DOCTYPE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_STATES_TYPES" MODIFY ("IS_FIXED" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_STATES_TYPES" MODIFY ("S_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_STATES_TYPES" ADD CONSTRAINT "DOC_STATES_TYPES_PK" PRIMARY KEY ("ID_DOCSTATE", "ID_DOCTYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##ZAYETS"."DOC_STATES_TYPES" ADD CONSTRAINT "CHK_DST_IS_FIX" CHECK (is_fixed in ('Y', 'N', 'R')) ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCTS_BY_SPEC
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."PRODUCTS_BY_SPEC" MODIFY ("ID_PRODUCT" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_BY_SPEC" MODIFY ("ID_SPEC" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_BY_SPEC" ADD CONSTRAINT "PRODUCTS_BY_SPEC_PK" PRIMARY KEY ("ID_PRODUCT", "ID_SPEC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCTS_BY_CATEGORIES
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."PRODUCTS_BY_CATEGORIES" ADD CONSTRAINT "PRODUCTS_BY_CATEGORIES_PK" PRIMARY KEY ("ID_PRODUCT", "ID_CATEGORY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_BY_CATEGORIES" MODIFY ("ID_PRODUCT" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS_BY_CATEGORIES" MODIFY ("ID_CATEGORY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WAREHOUSE
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."WAREHOUSE" MODIFY ("PICKUP" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."WAREHOUSE" ADD CONSTRAINT "CHK_WH_PICKUP" CHECK (pickup in ('Y', 'N')) ENABLE;
  ALTER TABLE "C##ZAYETS"."WAREHOUSE" MODIFY ("ID_WAREHOUSE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."WAREHOUSE" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."WAREHOUSE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."WAREHOUSE" ADD CONSTRAINT "WAREHOUSE_PK" PRIMARY KEY ("ID_WAREHOUSE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PARTNERS
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("ID_PARTNER" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("FULL_NAME" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("LEGAL_ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("ACTUAL_ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("TELEPHONE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("INN" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("KPP" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("OGRN" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("OKPO" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("OKATO" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("OKVED" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("BANK" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("CHECKING_ACC" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("CORR_ACC" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("BIK" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("GENERAL_DIRECTOR" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" MODIFY ("GENERAL_ACCOUNTANT" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PARTNERS" ADD CONSTRAINT "PARTNERS_PK" PRIMARY KEY ("ID_PARTNER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCTS
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."PRODUCTS" MODIFY ("ID_MANUFACTURER" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS" MODIFY ("ID_PRODUCT" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."PRODUCTS" ADD CONSTRAINT "PRODUCTS_PK" PRIMARY KEY ("ID_PRODUCT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS" MODIFY ("ARTICLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DOC_DETAILS
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" MODIFY ("FULL_PRICE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" MODIFY ("PRICE_LOYPROG" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" MODIFY ("DOC_DETAIL_SUM" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" MODIFY ("ID_DOCDETAIL" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" MODIFY ("ID_DOC" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" ADD CONSTRAINT "DOC_DETAILS_PK" PRIMARY KEY ("ID_DOCDETAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" MODIFY ("PROD_COUNT" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" MODIFY ("ID_PRODUCT" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" MODIFY ("CHANGE_DATE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" MODIFY ("PROD_RESERVE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" MODIFY ("PROD_SHIPPED" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" ADD CONSTRAINT "CHK_DOC_DET_PROD_COUNT" CHECK (prod_count >= 0) ENABLE;
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" ADD CONSTRAINT "CHK_DOC_DET_PROD_RES" CHECK (prod_reserve >= 0) ENABLE;
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" ADD CONSTRAINT "CHK_DOC_DET_PROD_SHIP" CHECK (prod_shipped >= 0) ENABLE;
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" ADD CONSTRAINT "CHK_DOC_DET_FULL_PRICE" CHECK (full_price >= 0) ENABLE;
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" ADD CONSTRAINT "CHK_DOC_DET_PRICE_LOYPR" CHECK (price_loyprog >= 0) ENABLE;
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" ADD CONSTRAINT "CHK_DOC_DET_DD_SUM" CHECK (doc_detail_sum >= 0) ENABLE;
--------------------------------------------------------
--  Constraints for Table HISTORY_PRICES
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."HISTORY_PRICES" MODIFY ("ID_PROD_WH" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."HISTORY_PRICES" MODIFY ("PURCHASE_PRICE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."HISTORY_PRICES" MODIFY ("SELLING_PRICE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."HISTORY_PRICES" MODIFY ("CHANGE_DATE" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."HISTORY_PRICES" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##ZAYETS"."HISTORY_PRICES" ADD CONSTRAINT "CHK_HIS_PR_PUR_PR" CHECK (purchase_price >= 0) ENABLE;
  ALTER TABLE "C##ZAYETS"."HISTORY_PRICES" ADD CONSTRAINT "CHK_HIS_PR_SEL_PR" CHECK (selling_price >= 0) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CATEGORIES
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."CATEGORIES" ADD FOREIGN KEY ("ID_PARENT")
	  REFERENCES "C##ZAYETS"."CATEGORIES" ("ID_CATEGORY") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DOC_DETAILS
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" ADD FOREIGN KEY ("ID_DOC")
	  REFERENCES "C##ZAYETS"."DOCS" ("ID_DOC") ENABLE;
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" ADD FOREIGN KEY ("ID_PRODUCT")
	  REFERENCES "C##ZAYETS"."PRODUCTS" ("ID_PRODUCT") ENABLE;
  ALTER TABLE "C##ZAYETS"."DOC_DETAILS" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "C##ZAYETS"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DOCS
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."DOCS" ADD FOREIGN KEY ("ID_DOCTYPE")
	  REFERENCES "C##ZAYETS"."DOCTYPES" ("ID_DOCTYPE") ENABLE;
  ALTER TABLE "C##ZAYETS"."DOCS" ADD FOREIGN KEY ("ID_DOCSTATE")
	  REFERENCES "C##ZAYETS"."DOCSTATES" ("ID_DOC_STATE") ENABLE;
  ALTER TABLE "C##ZAYETS"."DOCS" ADD FOREIGN KEY ("ID_INDIVIDUAL")
	  REFERENCES "C##ZAYETS"."INDIVIDUALS" ("ID_INDIVID") ENABLE;
  ALTER TABLE "C##ZAYETS"."DOCS" ADD FOREIGN KEY ("ID_PAYTYPE")
	  REFERENCES "C##ZAYETS"."PAYTYPES" ("ID_PAYTYPE") ENABLE;
  ALTER TABLE "C##ZAYETS"."DOCS" ADD FOREIGN KEY ("ID_LOYPROG")
	  REFERENCES "C##ZAYETS"."LOYALTY_PROGRAM" ("ID_LOYPROG") ENABLE;
  ALTER TABLE "C##ZAYETS"."DOCS" ADD FOREIGN KEY ("ID_PARTNER")
	  REFERENCES "C##ZAYETS"."PARTNERS" ("ID_PARTNER") ENABLE;
  ALTER TABLE "C##ZAYETS"."DOCS" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "C##ZAYETS"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DOC_STATES_TYPES
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."DOC_STATES_TYPES" ADD FOREIGN KEY ("ID_DOCSTATE")
	  REFERENCES "C##ZAYETS"."DOCSTATES" ("ID_DOC_STATE") ENABLE;
  ALTER TABLE "C##ZAYETS"."DOC_STATES_TYPES" ADD FOREIGN KEY ("ID_DOCTYPE")
	  REFERENCES "C##ZAYETS"."DOCTYPES" ("ID_DOCTYPE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HISTORY_PRICES
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."HISTORY_PRICES" ADD FOREIGN KEY ("ID_PROD_WH")
	  REFERENCES "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ("ID_PROD_WH") ENABLE;
  ALTER TABLE "C##ZAYETS"."HISTORY_PRICES" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "C##ZAYETS"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LOYPROG_BY_PRODUCTS
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."LOYPROG_BY_PRODUCTS" ADD FOREIGN KEY ("ID_PRODUCT")
	  REFERENCES "C##ZAYETS"."PRODUCTS" ("ID_PRODUCT") ENABLE;
  ALTER TABLE "C##ZAYETS"."LOYPROG_BY_PRODUCTS" ADD FOREIGN KEY ("ID_LOYPROG")
	  REFERENCES "C##ZAYETS"."LOYALTY_PROGRAM" ("ID_LOYPROG") ENABLE;
  ALTER TABLE "C##ZAYETS"."LOYPROG_BY_PRODUCTS" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "C##ZAYETS"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTS
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."PRODUCTS" ADD FOREIGN KEY ("ID_MANUFACTURER")
	  REFERENCES "C##ZAYETS"."PARTNERS" ("ID_PARTNER") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTS_BY_CATEGORIES
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."PRODUCTS_BY_CATEGORIES" ADD FOREIGN KEY ("ID_PRODUCT")
	  REFERENCES "C##ZAYETS"."PRODUCTS" ("ID_PRODUCT") ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_BY_CATEGORIES" ADD FOREIGN KEY ("ID_CATEGORY")
	  REFERENCES "C##ZAYETS"."CATEGORIES" ("ID_CATEGORY") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTS_BY_SPEC
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."PRODUCTS_BY_SPEC" ADD FOREIGN KEY ("ID_PRODUCT")
	  REFERENCES "C##ZAYETS"."PRODUCTS" ("ID_PRODUCT") ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_BY_SPEC" ADD FOREIGN KEY ("ID_SPEC")
	  REFERENCES "C##ZAYETS"."SPECIFICATIONS" ("ID_SPEC") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTS_IN_WAREHOUSE
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ADD FOREIGN KEY ("ID_WAREHOUSE")
	  REFERENCES "C##ZAYETS"."WAREHOUSE" ("ID_WAREHOUSE") ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ADD FOREIGN KEY ("ID_SUPPLIER")
	  REFERENCES "C##ZAYETS"."PARTNERS" ("ID_PARTNER") ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "C##ZAYETS"."USERS" ("USER_ID") ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ADD FOREIGN KEY ("ID_PRODUCT")
	  REFERENCES "C##ZAYETS"."PRODUCTS" ("ID_PRODUCT") ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ADD FOREIGN KEY ("USER_CREATED")
	  REFERENCES "C##ZAYETS"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTS_MOVING
--------------------------------------------------------

  ALTER TABLE "C##ZAYETS"."PRODUCTS_MOVING" ADD FOREIGN KEY ("ID_PROD_WH")
	  REFERENCES "C##ZAYETS"."PRODUCTS_IN_WAREHOUSE" ("ID_PROD_WH") ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_MOVING" ADD FOREIGN KEY ("ID_DOCDETAIL")
	  REFERENCES "C##ZAYETS"."DOC_DETAILS" ("ID_DOCDETAIL") ENABLE;
  ALTER TABLE "C##ZAYETS"."PRODUCTS_MOVING" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "C##ZAYETS"."USERS" ("USER_ID") ENABLE;
