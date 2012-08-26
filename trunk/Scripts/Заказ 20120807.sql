CREATE TABLE Order_Doc
(
	ID_Order             NUMERIC(10) NOT NULL ,
	Num_Order            NUMERIC(10) NOT NULL ,
	Date_Order           DATE NOT NULL ,
	Name_Customer        VARCHAR(150) NOT NULL ,
	Phone_Customer       VARCHAR(50) ,
	ID_Spr_Type_Order    NUMERIC(10) NOT NULL ,
	Sum_Order            NUMERIC(12,2) DEFAULT  0 NOT NULL ,
	Sum_Discount         NUMERIC(12,2) DEFAULT  0  NOT NULL ,
	Discount_Perc        NUMERIC(5,2) DEFAULT  0  NOT NULL ,
	Sum_Paid             NUMERIC(12,2) DEFAULT  0 NOT NULL ,
	Sum_Unpaid           NUMERIC(12,2) DEFAULT  0 NOT NULL ,
	Comment_Order        VARCHAR(200) ,
	Plan_Date_Order      DATE ,
	Fact_Date_Order      DATE ,
	ID_Spr_State_Order   NUMERIC(10) NOT NULL 
);

ALTER TABLE Order_Doc
	ADD CONSTRAINT  XPKOrder_Doc PRIMARY KEY (ID_Order);

ALTER TABLE Order_Doc
ADD CONSTRAINT  XAK1Order_Doc UNIQUE (Num_Order);

CREATE TABLE Order_Comp
(
	ID_Order_Comp        NUMERIC(10) NOT NULL ,
	ID_Order             NUMERIC(10) NOT NULL ,
	ID_Spr_Mat           NUMERIC(10) NOT NULL ,
	Quant_Mat            NUMERIC(12,3) NOT NULL ,
	Price_Mat            NUMERIC(12,2) NOT NULL ,
	Sum_Mat              NUMERIC(12,2) NOT NULL ,
	Sum_Discount         NUMERIC(12,2) NOT NULL ,
	Sum_Itog             NUMERIC(12,2) NOT NULL ,
	Name_File            VARCHAR(150) ,
	SizeX                NUMERIC(10,2) ,
	SizeY                NUMERIC(10,2) ,
	Size_Area            NUMERIC(10,2) ,
	Quality_Print        NUMERIC(5) ,
	Fact_Date            DATE ,
	Comment_Line         VARCHAR(150) 
);

ALTER TABLE Order_Comp
	ADD CONSTRAINT  XPKOrder_Comp PRIMARY KEY (ID_Order_Comp);

ALTER TABLE Order_Comp
ADD CONSTRAINT  XAK1Order_Comp UNIQUE (ID_Order,ID_Spr_Mat);

CREATE TABLE Spr_State_Order
(
	ID_Spr_State_Order   NUMERIC(10) NOT NULL ,
	Name_Status          VARCHAR(50) NOT NULL
);

ALTER TABLE Spr_State_Order
	ADD CONSTRAINT   PRIMARY KEY (ID_Spr_State_Order);

ALTER TABLE Order_Doc
	ADD CONSTRAINT XFKOrderID_Spr_State_Order FOREIGN KEY (ID_Spr_State_Order) REFERENCES Spr_State_Order (ID_Spr_State_Order);

ALTER TABLE Order_Doc
	ADD CONSTRAINT XFKOrderID_Spr_Type_Order FOREIGN KEY (ID_Spr_Type_Order) REFERENCES Spr_Type_Order (ID_Spr_Type_Order);

ALTER TABLE Order_Comp
	ADD CONSTRAINT XFKOrder_CompID_Spr_Mat FOREIGN KEY (ID_Spr_Mat) REFERENCES Spr_Mat (ID_Spr_Mat);

ALTER TABLE Order_Comp
	ADD CONSTRAINT XFKOrder_CompID_Order FOREIGN KEY (ID_Order) REFERENCES Order_Doc (ID_Order);



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


CREATE SEQUENCE GEN_SPR_STATE_ORDER_ID;
ALTER SEQUENCE GEN_SPR_STATE_ORDER_ID RESTART WITH 1;
SET TERM ^ ;

create trigger spr_state_order_bi for spr_state_order
active before insert position 0
as
begin
  if (new.id_spr_state_order is null) then
    new.id_spr_state_order = gen_id(gen_spr_state_order_id,1);
end
^

SET TERM ; ^
