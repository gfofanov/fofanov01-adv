CREATE TABLE Adv
(
	ID_Adv               NUMERIC(10) NOT NULL ,
	Address_Name         VARCHAR(100) NOT NULL ,
	Photo                BLOB NULL ,
	ID_Contract          NUMERIC(10) NOT NULL 
);

ALTER TABLE Adv
	ADD CONSTRAINT  XPKAdv PRIMARY KEY (ID_Adv);

CREATE TABLE Contract
(
	ID_Contract          NUMERIC(10) NOT NULL ,
	ID_Contractor        NUMERIC(10) NOT NULL ,
	Num_Contract         VARCHAR(50) NOT NULL ,
	Num_Add_Contract     VARCHAR(20) NULL ,
	Date_Contract        DATE NOT NULL ,
	Date_Beg             DATE NOT NULL ,
	Date_End             DATE NOT NULL 
);

ALTER TABLE Contract
	ADD CONSTRAINT  XPKContract PRIMARY KEY (ID_Contract);

CREATE TABLE Contractor
(
	ID_Contractor        NUMERIC(10) NOT NULL ,
	INN                  VARCHAR(12) NOT NULL ,
	KPP                  NUMERIC(9) NULL ,
	Name_Contractor      VARCHAR(100) NOT NULL ,
	Type_Contractor      NUMERIC(1) NOT NULL 
);

ALTER TABLE Contractor
	ADD CONSTRAINT  XPKContractor PRIMARY KEY (ID_Contractor);

CREATE TABLE Price_Contract
(
	ID_Price_Contract    NUMERIC(10) NOT NULL ,
	ID_Contract          NUMERIC(10) NOT NULL ,
	Price                NUMERIC(10,2) NOT NULL ,
	Date_Beg             DATE NOT NULL ,
	Date_End             DATE NOT NULL 
);

ALTER TABLE Price_Contract
	ADD CONSTRAINT  XPKPrice_Contract PRIMARY KEY (ID_Price_Contract);

CREATE TABLE Side
(
	ID_Side              NUMERIC(10) NOT NULL ,
	ID_Adv               NUMERIC(10) NOT NULL ,
	Width                NUMERIC(10,2) NULL ,
	Height               NUMERIC(10,2) NULL ,
	Type_Side            NUMERIC(1) NOT NULL ,
	ID_Contract          NUMERIC(10) NULL ,
	Photo                BLOB NULL ,
	Location_Side        NUMERIC(1) NOT NULL ,
	ID_Price_Contract    NUMERIC(10) NULL 
);

ALTER TABLE Side
	ADD CONSTRAINT  XPKSide PRIMARY KEY (ID_Side);

ALTER TABLE Adv
	ADD CONSTRAINT XFK1Adv FOREIGN KEY (ID_Contract) REFERENCES Contract (ID_Contract);

ALTER TABLE Contract
	ADD CONSTRAINT XFK1Contract FOREIGN KEY (ID_Contractor) REFERENCES Contractor (ID_Contractor);

ALTER TABLE Price_Contract
	ADD CONSTRAINT XFK1Price_Contract FOREIGN KEY (ID_Contract) REFERENCES Contract (ID_Contract);

ALTER TABLE Side
	ADD CONSTRAINT XFK1Side FOREIGN KEY (ID_Price_Contract) REFERENCES Price_Contract (ID_Price_Contract);

ALTER TABLE Side
	ADD CONSTRAINT XFK2Side FOREIGN KEY (ID_Adv) REFERENCES Adv (ID_Adv);

ALTER TABLE Side
	ADD CONSTRAINT XFK3Side FOREIGN KEY (ID_Contract) REFERENCES Contract (ID_Contract);


alter table SIDE
add constraint UNQ1_SIDE
unique (ID_ADV,LOCATION_SIDE);


CREATE SEQUENCE GEN_ADV_ID;
ALTER SEQUENCE GEN_ADV_ID RESTART WITH 1;

create trigger adv_bi for adv
active before insert position 0
as
begin
  if (new.id_adv is null) then
    new.id_adv = gen_id(gen_adv_id,1);
end
^

CREATE SEQUENCE GEN_CONTRACTOR_ID;
ALTER SEQUENCE GEN_CONTRACTOR_ID RESTART WITH 1;

create trigger contractor_bi for contractor
active before insert position 0
as
begin
  if (new.id_contractor is null) then
    new.id_contractor = gen_id(gen_contractor_id,1);
end
^

CREATE SEQUENCE GEN_CONTRACT_ID;
ALTER SEQUENCE GEN_CONTRACT_ID RESTART WITH 1;

create trigger contract_bi for contract
active before insert position 0
as
begin
  if (new.id_contract is null) then
    new.id_contract = gen_id(gen_contract_id,1);
end
^
CREATE SEQUENCE GEN_PRICE_CONTRACT_ID;
ALTER SEQUENCE GEN_PRICE_CONTRACT_ID RESTART WITH 1;

create trigger price_contract_bi for price_contract
active before insert position 0
as
begin
  if (new.id_price_contract is null) then
    new.id_price_contract = gen_id(gen_price_contract_id,1);
end
^

CREATE SEQUENCE GEN_SIDE_ID;
ALTER SEQUENCE GEN_SIDE_ID RESTART WITH 1;

create trigger side_bi for side
active before insert position 0
as
begin
  if (new.id_side is null) then
    new.id_side = gen_id(gen_side_id,1);
end
^

alter table CONTRACT
add constraint UNQ1_CONTRACT
unique (ID_CONTRACTOR,NUM_CONTRACT,NUM_ADD_CONTRACT);

ALTER TABLE SIDE ADD DATE_FACT DATE;

ALTER TABLE CONTRACTOR ADD IBE$$TEMP_COLUMN
 SMALLINT DEFAULT 2
;

UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'CONTRACTOR') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'CONTRACTOR') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'CONTRACTOR') AND
      (F1.RDB$FIELD_NAME = 'TYPE_CONTRACTOR');

ALTER TABLE CONTRACTOR DROP IBE$$TEMP_COLUMN;
