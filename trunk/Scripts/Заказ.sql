CREATE TABLE Mat_Price
(
	ID_Mat_Price         NUMERIC(10) NOT NULL ,
	ID_Spr_Mat           NUMERIC(10) NOT NULL ,
	Price                NUMERIC(12,2) NOT NULL ,
	Date_Beg             DATE NOT NULL ,
	Date_End             DATE NOT NULL ,
	isDiscount           NUMERIC(1) DEFAULT  1  NOT NULL 
);

ALTER TABLE Mat_Price
	ADD CONSTRAINT  XPKMat_Price PRIMARY KEY (ID_Mat_Price);

ALTER TABLE Mat_Price
ADD CONSTRAINT  XAK1Mat_Price UNIQUE (ID_Spr_Mat,Date_Beg);

CREATE TABLE Order_Doc
(
	ID_Order             NUMERIC(10) NOT NULL ,
	Num_Order            NUMERIC(10) NOT NULL ,
	Date_Order           DATE NOT NULL ,
	ID_Spr_Type_Order    NUMERIC(10) NOT NULL ,
	Sum_Order            NUMERIC(12,2) NOT NULL ,
	Sum_Discount         NUMERIC(12,2) DEFAULT  0  NOT NULL ,
	Discount_Perc        NUMERIC(5,2) DEFAULT  0  NOT NULL ,
	Name_Customer        VARCHAR(100)
);

ALTER TABLE Order_Doc
	ADD CONSTRAINT  XPKOrder PRIMARY KEY (ID_Order);

ALTER TABLE Order_Doc
ADD CONSTRAINT  XAK1Order UNIQUE (Num_Order);

CREATE TABLE Order_Comp
(
	ID_Order_Comp        NUMERIC(10) NOT NULL ,
	ID_Order             NUMERIC(10) NOT NULL ,
	ID_Spr_Mat           NUMERIC(10) NOT NULL ,
	Quant_Mat            NUMERIC(12,3) NOT NULL ,
	Price_Mat            NUMERIC(12,2) NOT NULL ,
	Sum_Mat              NUMERIC(12,2) NOT NULL ,
	Sum_Discount         NUMERIC(12,2) NOT NULL ,
	Sum_Itog             NUMERIC(12,2) NOT NULL 
);

ALTER TABLE Order_Comp
	ADD CONSTRAINT  XPKOrder_Comp PRIMARY KEY (ID_Order_Comp);

ALTER TABLE Order_Comp
ADD CONSTRAINT  XAK1Order_Comp UNIQUE (ID_Spr_Mat,ID_Order);

CREATE TABLE Spr_Mat
(
	ID_Spr_Mat           NUMERIC(10) NOT NULL ,
	Name_Mat             VARCHAR(200) NOT NULL ,
	ID_Spr_Measure       NUMERIC(10) NOT NULL ,
	Name_Supplier        VARCHAR(100),
	Num_Calc             NUMERIC(1) DEFAULT  0  NOT NULL 
);

ALTER TABLE Spr_Mat
	ADD CONSTRAINT  XPKSpr_Mat PRIMARY KEY (ID_Spr_Mat);

ALTER TABLE Spr_Mat
ADD CONSTRAINT  XAK1Spr_Mat UNIQUE (Name_Mat,ID_Spr_Measure);

CREATE TABLE Spr_Measure
(
	ID_Spr_Measure       NUMERIC(10) NOT NULL ,
	Name_Measure         VARCHAR(20) NOT NULL ,
	Name_Measure_Short   VARCHAR(10) NOT NULL ,
	Name_Measure_Price   VARCHAR(20) NOT NULL ,
	Name_Measure_Price_Short VARCHAR(10) NOT NULL ,
	Koef_Price           NUMERIC(7) DEFAULT  1  NOT NULL 
);

ALTER TABLE Spr_Measure
	ADD CONSTRAINT  XPKSpr_Measure PRIMARY KEY (ID_Spr_Measure);

ALTER TABLE Spr_Measure
ADD CONSTRAINT  XAK1Spr_Measure UNIQUE (Name_Measure_Price);

ALTER TABLE Spr_Measure
ADD CONSTRAINT  XAK2Spr_Measure UNIQUE (Name_Measure,Koef_Price);

CREATE TABLE Spr_Type_Order
(
	ID_Spr_Type_Order    NUMERIC(10) NOT NULL ,
	Name_Type_Order      VARCHAR(20) NOT NULL ,
	Name_Print           VARCHAR(20)
);

ALTER TABLE Spr_Type_Order
	ADD CONSTRAINT  XPKSpr_Type_Order PRIMARY KEY (ID_Spr_Type_Order);

ALTER TABLE Spr_Type_Order
ADD CONSTRAINT  XAK1Spr_Type_Order UNIQUE (Name_Type_Order);

CREATE TABLE Spr_Type_Order_Mand
(
	ID_Spr_Type_Order_Mand NUMERIC(10) NOT NULL ,
	ID_Spr_Type_Order    NUMERIC(10) NOT NULL ,
	ID_Spr_Mat           NUMERIC(10) NOT NULL 
);

ALTER TABLE Spr_Type_Order_Mand
	ADD CONSTRAINT  XPKSpr_Type_Order_Mand PRIMARY KEY (ID_Spr_Type_Order_Mand);

ALTER TABLE Spr_Type_Order_Mand
ADD CONSTRAINT  XAK1Spr_Type_Order_Mand UNIQUE (ID_Spr_Type_Order,ID_Spr_Mat);

ALTER TABLE Mat_Price
	ADD CONSTRAINT XFKMat_PriceID_Spr_Mat FOREIGN KEY (ID_Spr_Mat) REFERENCES Spr_Mat (ID_Spr_Mat);

ALTER TABLE Order_Doc
	ADD CONSTRAINT XFKOrderID_Spr_Type_Order FOREIGN KEY (ID_Spr_Type_Order) REFERENCES Spr_Type_Order (ID_Spr_Type_Order);

ALTER TABLE Order_Comp
	ADD CONSTRAINT XFKOrder_CompID_Spr_Mat FOREIGN KEY (ID_Spr_Mat) REFERENCES Spr_Mat (ID_Spr_Mat);

ALTER TABLE Order_Comp
	ADD CONSTRAINT XFKOrder_CompID_Order FOREIGN KEY (ID_Order) REFERENCES Order_Doc (ID_Order);

ALTER TABLE Spr_Mat
	ADD CONSTRAINT XFKSpr_MatID_Spr_Measure FOREIGN KEY (ID_Spr_Measure) REFERENCES Spr_Measure (ID_Spr_Measure);

ALTER TABLE Spr_Type_Order_Mand
	ADD CONSTRAINT XFKSpr_Type_Order_MandID_Spr_T FOREIGN KEY (ID_Spr_Type_Order) REFERENCES Spr_Type_Order (ID_Spr_Type_Order);

ALTER TABLE Spr_Type_Order_Mand
	ADD CONSTRAINT XFKSpr_Type_Order_MandID_Spr_M FOREIGN KEY (ID_Spr_Mat) REFERENCES Spr_Mat (ID_Spr_Mat);


CREATE SEQUENCE GEN_MAT_PRICE_ID;
ALTER SEQUENCE GEN_MAT_PRICE_ID RESTART WITH 1;
SET TERM ^ ;

create trigger mat_price_bi for mat_price
active before insert position 0
as
begin
  if (new.id_mat_price is null) then
    new.id_mat_price = gen_id(gen_mat_price_id,1);
end
^

SET TERM ; ^

CREATE SEQUENCE GEN_ORDER_COMP_ID;
ALTER SEQUENCE GEN_ORDER_COMP_ID RESTART WITH 1;
SET TERM ^ ;

create trigger order_comp_bi for order_comp
active before insert position 0
as
begin
  if (new.id_order_comp is null) then
    new.id_order_comp = gen_id(gen_order_comp_id,1);
end
^

SET TERM ; ^

CREATE SEQUENCE GEN_ORDER_DOC_ID;
ALTER SEQUENCE GEN_ORDER_DOC_ID RESTART WITH 1;
SET TERM ^ ;

create trigger order_doc_bi for order_doc
active before insert position 0
as
begin
  if (new.id_order is null) then
    new.id_order = gen_id(gen_order_doc_id,1);
end
^

SET TERM ; ^

CREATE SEQUENCE GEN_SPR_MAT_ID;
ALTER SEQUENCE GEN_SPR_MAT_ID RESTART WITH 1;
SET TERM ^ ;

create trigger spr_mat_bi for spr_mat
active before insert position 0
as
begin
  if (new.id_spr_mat is null) then
    new.id_spr_mat = gen_id(gen_spr_mat_id,1);
end
^

SET TERM ; ^


CREATE SEQUENCE GEN_SPR_MEASURE_ID;
ALTER SEQUENCE GEN_SPR_MEASURE_ID RESTART WITH 1;
SET TERM ^ ;

create trigger spr_measure_bi for spr_measure
active before insert position 0
as
begin
  if (new.id_spr_measure is null) then
    new.id_spr_measure = gen_id(gen_spr_measure_id,1);
end
^

SET TERM ; ^
CREATE SEQUENCE GEN_SPR_TYPE_ORDER_ID;
ALTER SEQUENCE GEN_SPR_TYPE_ORDER_ID RESTART WITH 1;
SET TERM ^ ;

create trigger spr_type_order_bi for spr_type_order
active before insert position 0
as
begin
  if (new.id_spr_type_order is null) then
    new.id_spr_type_order = gen_id(gen_spr_type_order_id,1);
end
^

SET TERM ; ^

CREATE SEQUENCE GEN_SPR_TYPE_ORDER_MAND_ID;
ALTER SEQUENCE GEN_SPR_TYPE_ORDER_MAND_ID RESTART WITH 1;
SET TERM ^ ;

create trigger spr_type_order_mand_bi for spr_type_order_mand
active before insert position 0
as
begin
  if (new.id_spr_type_order_mand is null) then
    new.id_spr_type_order_mand = gen_id(gen_spr_type_order_mand_id,1);
end
^

SET TERM ; ^

