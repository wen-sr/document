------------------------------------------------------
-- Export file for user WH1                         --
-- Created by Administrator on 2011/12/27, 21:39:15 --
------------------------------------------------------

spool WH1.log

prompt
prompt Creating table SERVICES
prompt =======================
prompt
create table SERVICES
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  SERVICEKEY  VARCHAR2(10) not null,
  DESCRIP     VARCHAR2(30) default ' ' not null,
  SUPPORTFLAG VARCHAR2(1) default 'A' not null,
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SERVICES
  add constraint PK_SYS_C004765 primary key (SERVICEKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SERVICES
  add check (SUPPORTFLAG = 'D' OR (SUPPORTFLAG = 'I' OR SUPPORTFLAG = 'A'));
create unique index SERVI_244 on SERVICES (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACCESSORIAL
prompt ==========================
prompt
create table ACCESSORIAL
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  ACCESSORIALKEY VARCHAR2(10) not null,
  DESCRIP        VARCHAR2(30) default ' ' not null,
  SUPPORTFLAG    VARCHAR2(1) default 'A' not null,
  STORERKEY      VARCHAR2(15) default ' ' not null,
  SKU            VARCHAR2(50) default ' ' not null,
  SERVICEKEY     VARCHAR2(10) default 'XXXXXXXXXX' not null,
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ACCESSORIAL
  add constraint PK_SYS_C004573 primary key (ACCESSORIALKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ACCESSORIAL
  add unique (STORERKEY, SKU, SERVICEKEY)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ACCESSORIAL
  add foreign key (SERVICEKEY)
  references SERVICES (SERVICEKEY);
alter table ACCESSORIAL
  add check (SUPPORTFLAG = 'D' OR (SUPPORTFLAG = 'I' OR SUPPORTFLAG = 'A'));
create unique index ACCES_1 on ACCESSORIAL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table GLDISTRIBUTION
prompt =============================
prompt
create table GLDISTRIBUTION
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  GLDISTRIBUTIONKEY VARCHAR2(10) not null,
  SUPPORTFLAG       VARCHAR2(1) default 'A' not null,
  DESCRIP           VARCHAR2(30) default ' ' not null,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table GLDISTRIBUTION
  add constraint PK_SYS_C004652 primary key (GLDISTRIBUTIONKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table GLDISTRIBUTION
  add check (SUPPORTFLAG = 'D' OR (SUPPORTFLAG = 'I' OR SUPPORTFLAG = 'A'));
create unique index GLDIS_103 on GLDISTRIBUTION (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACCESSORIALDETAIL
prompt ================================
prompt
create table ACCESSORIALDETAIL
(
  SERIALKEY            NUMBER not null,
  WHSEID               VARCHAR2(30) default USER,
  ACCESSORIALKEY       VARCHAR2(10) not null,
  ACCESSORIALDETAILKEY VARCHAR2(10) default ' ' not null,
  DESCRIP              VARCHAR2(30) default ' ' not null,
  RATE                 NUMBER(22,6) not null,
  BASE                 VARCHAR2(1) default 'Q' not null,
  MASTERUNITS          NUMBER(12,6) default 1.0 not null,
  UOMSHOW              VARCHAR2(10) default ' ' not null,
  TAXGROUPKEY          VARCHAR2(10) default 'XXXXXXXXXX' not null,
  GLDISTRIBUTIONKEY    VARCHAR2(10) default 'XXXXXXXXXX' not null,
  ADDDATE              DATE default SYSDATE not null,
  ADDWHO               VARCHAR2(30) default USER not null,
  EDITDATE             DATE default SYSDATE not null,
  EDITWHO              VARCHAR2(30) default USER not null,
  COSTRATE             NUMBER(22,6) default 0.0,
  COSTBASE             VARCHAR2(1) default 'Q',
  COSTMASTERUNITS      NUMBER(12,6) default 1.0,
  COSTUOMSHOW          VARCHAR2(10) default ' '
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ACCESSORIALDETAIL
  add constraint PK_SYS_C004572 primary key (ACCESSORIALDETAILKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ACCESSORIALDETAIL
  add foreign key (ACCESSORIALKEY)
  references ACCESSORIAL (ACCESSORIALKEY);
alter table ACCESSORIALDETAIL
  add foreign key (GLDISTRIBUTIONKEY)
  references GLDISTRIBUTION (GLDISTRIBUTIONKEY);
alter table ACCESSORIALDETAIL
  add check (COSTBASE = 'R' OR (COSTBASE = 'P' OR (COSTBASE = 'F' OR (COSTBASE = 'C' OR (COSTBASE = 'G' OR COSTBASE = 'Q')))));
alter table ACCESSORIALDETAIL
  add check (BASE = 'R' OR (BASE = 'F' OR (BASE = 'C' OR (BASE = 'G' OR BASE = 'Q'))));
alter table ACCESSORIALDETAIL
  add check (MASTERUNITS > 0.0);
create unique index ACCES_2 on ACCESSORIALDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STORER
prompt =====================
prompt
create table STORER
(
  SERIALKEY                   NUMBER not null,
  WHSEID                      VARCHAR2(30) default USER,
  STORERKEY                   VARCHAR2(15) not null,
  TYPE                        VARCHAR2(30) default '1',
  COMPANY                     VARCHAR2(45) default ' ',
  VAT                         VARCHAR2(18),
  ADDRESS1                    VARCHAR2(45),
  ADDRESS2                    VARCHAR2(45),
  ADDRESS3                    VARCHAR2(45),
  ADDRESS4                    VARCHAR2(45),
  CITY                        VARCHAR2(45),
  STATE                       VARCHAR2(2) default ' ',
  ZIP                         VARCHAR2(18) default ' ',
  COUNTRY                     VARCHAR2(30) default ' ',
  ISOCNTRYCODE                VARCHAR2(10),
  CONTACT1                    VARCHAR2(30),
  CONTACT2                    VARCHAR2(30),
  PHONE1                      VARCHAR2(18),
  PHONE2                      VARCHAR2(18),
  FAX1                        VARCHAR2(18),
  FAX2                        VARCHAR2(18),
  EMAIL1                      VARCHAR2(60),
  EMAIL2                      VARCHAR2(60),
  B_CONTACT1                  VARCHAR2(30),
  B_CONTACT2                  VARCHAR2(30),
  B_COMPANY                   VARCHAR2(45),
  B_ADDRESS1                  VARCHAR2(45),
  B_ADDRESS2                  VARCHAR2(45),
  B_ADDRESS3                  VARCHAR2(45),
  B_ADDRESS4                  VARCHAR2(45),
  B_CITY                      VARCHAR2(45),
  B_STATE                     VARCHAR2(2),
  B_ZIP                       VARCHAR2(18),
  B_COUNTRY                   VARCHAR2(30),
  B_ISOCNTRYCODE              VARCHAR2(10),
  B_PHONE1                    VARCHAR2(18),
  B_PHONE2                    VARCHAR2(18),
  B_FAX1                      VARCHAR2(18),
  B_FAX2                      VARCHAR2(18),
  B_EMAIL1                    VARCHAR2(60),
  B_EMAIL2                    VARCHAR2(60),
  CREDITLIMIT                 VARCHAR2(18),
  CARTONGROUP                 VARCHAR2(10) default 'STD' not null,
  PICKCODE                    VARCHAR2(10) default 'NSPFIFO' not null,
  CREATEPATASKONRFRECEIPT     VARCHAR2(10) default '0' not null,
  CALCULATEPUTAWAYLOCATION    VARCHAR2(10) default '2' not null,
  STATUS                      VARCHAR2(18),
  DEFAULTSTRATEGY             VARCHAR2(10) default 'STD',
  DEFAULTSKUROTATION          VARCHAR2(10) default 'Lot' not null,
  DEFAULTROTATION             VARCHAR2(1) default '1',
  SCAC_CODE                   VARCHAR2(4),
  TITLE1                      VARCHAR2(50),
  TITLE2                      VARCHAR2(50),
  DESCRIPTION                 VARCHAR2(50),
  SUSR1                       VARCHAR2(30),
  SUSR2                       VARCHAR2(30),
  SUSR3                       VARCHAR2(30),
  SUSR4                       VARCHAR2(30),
  SUSR5                       VARCHAR2(30),
  SUSR6                       VARCHAR2(30),
  NOTES1                      VARCHAR2(2000),
  NOTES2                      VARCHAR2(2000),
  APPORTIONRULE               VARCHAR2(10) default '0',
  ENABLEOPPXDOCK              VARCHAR2(1) default '0',
  ALLOWOVERSHIPMENT           VARCHAR2(1) default '0',
  MAXIMUMORDERS               INTEGER default 0,
  MINIMUMPERCENT              NUMBER(12,2) default 0.0,
  ORDERDATESTARTDAYS          INTEGER default 0,
  ORDERDATEENDDAYS            INTEGER default 0,
  ORDERTYPERESTRICT01         VARCHAR2(10),
  ORDERTYPERESTRICT02         VARCHAR2(10),
  ORDERTYPERESTRICT03         VARCHAR2(10),
  ORDERTYPERESTRICT04         VARCHAR2(10),
  ORDERTYPERESTRICT05         VARCHAR2(10),
  ORDERTYPERESTRICT06         VARCHAR2(10),
  OPPORDERSTRATEGYKEY         VARCHAR2(10),
  MULTIZONEPLPA               VARCHAR2(1) default '0',
  CWOFLAG                     VARCHAR2(1) default ' ',
  ROLLRECEIPT                 VARCHAR2(1) default '1' not null,
  RECEIPTVALIDATIONTEMPLATE   VARCHAR2(18) default ' ' not null,
  ALLOWAUTOCLOSEFORPO         VARCHAR2(1) default '1' not null,
  ALLOWAUTOCLOSEFORASN        VARCHAR2(1) default '1' not null,
  ALLOWAUTOCLOSEFORPS         VARCHAR2(1) default '1' not null,
  ALLOWSYSTEMGENERATEDLPN     VARCHAR2(1) default '1' not null,
  ALLOWDUPLICATELICENSEPLATES VARCHAR2(1) default '1' not null,
  ALLOWCOMMINGLEDLPN          VARCHAR2(1) default '1' not null,
  LPNBARCODESYMBOLOGY         VARCHAR2(60) default ' ',
  LPNBARCODEFORMAT            VARCHAR2(60) default ' ',
  ALLOWSINGLESCANRECEIVING    VARCHAR2(1) default '1' not null,
  LPNLENGTH                   NUMBER(38) default 6 not null,
  APPLICATIONID               VARCHAR2(2) default '00' not null,
  SSCC1STDIGIT                NUMBER(38) default 0 not null,
  UCCVENDORNUMBER             VARCHAR2(9) default ' ' not null,
  CASELABELTYPE               VARCHAR2(10) default 'STD' not null,
  AUTOPRINTLABELLPN           VARCHAR2(1) default '1' not null,
  AUTOPRINTLABELPUTAWAY       VARCHAR2(1) default '1' not null,
  LPNSTARTNUMBER              VARCHAR2(18) default ' ' not null,
  NEXTLPNNUMBER               VARCHAR2(18) default ' ' not null,
  LPNROLLBACKNUMBER           VARCHAR2(18) default ' ' not null,
  BARCODECONFIGKEY            VARCHAR2(18),
  DEFAULTPUTAWAYSTRATEGY      VARCHAR2(10) default 'STD',
  AUTOCLOSEASN                VARCHAR2(1) default '0' not null,
  AUTOCLOSEPO                 VARCHAR2(1) default '0' not null,
  TRACKINVENTORYBY            VARCHAR2(1) default '0',
  DUPCASEID                   VARCHAR2(1) default '0',
  DEFAULTRETURNSLOC           VARCHAR2(10) default 'RETURN' not null,
  DEFAULTQCLOC                VARCHAR2(10) default 'QC' not null,
  PISKUXLOC                   VARCHAR2(1) default '0' not null,
  CCSKUXLOC                   VARCHAR2(1) default '0' not null,
  CCDISCREPANCYRULE           VARCHAR2(10) default 'STD' not null,
  CCADJBYRF                   VARCHAR2(10) default '0' not null,
  ORDERBREAKDEFAULT           VARCHAR2(1) default '0' not null,
  ADDDATE                     DATE default SYSDATE not null,
  ADDWHO                      VARCHAR2(30) default USER not null,
  EDITDATE                    DATE default SYSDATE not null,
  EDITWHO                     VARCHAR2(30) default USER not null,
  ROUTE                       VARCHAR2(10),
  STOP                        VARCHAR2(10),
  CASE_QTY                    NUMBER(22,5) default 0,
  EACH_QTY                    NUMBER(22,5) default 0,
  STATION                     VARCHAR2(10),
  PACKLOC                     VARCHAR2(10)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column STORER.ROUTE
  is '路线';
comment on column STORER.STOP
  is '路顺';
comment on column STORER.CASE_QTY
  is '主配计算使用，重型料架区参数';
comment on column STORER.EACH_QTY
  is '主配计算使用，库存量';
comment on column STORER.STATION
  is '发站到站';
comment on column STORER.PACKLOC
  is '打包台';
alter table STORER
  add constraint PK_SYS_C004774 primary key (STORERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index STORE_252 on STORER (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TARIFF
prompt =====================
prompt
create table TARIFF
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  TARIFFKEY               VARCHAR2(10) not null,
  DESCRIP                 VARCHAR2(30) default ' ' not null,
  SUPPORTFLAG             VARCHAR2(1) default 'A' not null,
  INITIALSTORAGEPERIOD    NUMBER(10),
  RECURRINGSTORAGEPERIOD  NUMBER(10),
  SPLITMONTHDAY           NUMBER(10) default 15 not null,
  SPLITMONTHPERCENT       NUMBER(12,6) default 0.50 not null,
  PERIODTYPE              VARCHAR2(1) not null,
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null,
  CALENDARGROUP           VARCHAR2(10),
  RSPERIODTYPE            VARCHAR2(1),
  SPLITMONTHPERCENTBEFORE NUMBER(12,6) default 1.0
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TARIFF
  add constraint PK_SYS_C004782 primary key (TARIFFKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TARIFF
  add check (SUPPORTFLAG = 'A' OR (SUPPORTFLAG = 'I' OR SUPPORTFLAG = 'D'));
alter table TARIFF
  add check (INITIALSTORAGEPERIOD >= 1 AND INITIALSTORAGEPERIOD <= 999);
alter table TARIFF
  add check (RECURRINGSTORAGEPERIOD >= 1 AND RECURRINGSTORAGEPERIOD <= 999);
alter table TARIFF
  add check (SPLITMONTHDAY >= 1 AND SPLITMONTHDAY <= 31);
alter table TARIFF
  add check (SPLITMONTHPERCENT >= 0.0);
alter table TARIFF
  add check (PERIODTYPE = 'C' OR (PERIODTYPE = 'F' OR (PERIODTYPE = 'A' OR PERIODTYPE = 'S')));
alter table TARIFF
  add check (RSPERIODTYPE = 'F' OR (RSPERIODTYPE = 'C' OR (RSPERIODTYPE = 'A' OR RSPERIODTYPE = 'S')));
alter table TARIFF
  add check (SPLITMONTHPERCENTBEFORE >= 0.0 AND SPLITMONTHPERCENTBEFORE <= 1.0);
create unique index TARIF_259 on TARIFF (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TAXGROUP
prompt =======================
prompt
create table TAXGROUP
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  TAXGROUPKEY VARCHAR2(10) not null,
  SUPPORTFLAG VARCHAR2(1) default 'A' not null,
  DESCRIP     VARCHAR2(30) default ' ' not null,
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TAXGROUP
  add constraint PK_SYS_C004788 primary key (TAXGROUPKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TAXGROUP
  add check (SUPPORTFLAG = 'D' OR (SUPPORTFLAG = 'I' OR SUPPORTFLAG = 'A'));
create unique index TAXGR_267 on TAXGROUP (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACCUMULATEDCHARGES
prompt =================================
prompt
create table ACCUMULATEDCHARGES
(
  SERIALKEY                 NUMBER not null,
  WHSEID                    VARCHAR2(30) default USER,
  ACCUMULATEDCHARGESKEY     VARCHAR2(10) not null,
  DESCRIP                   VARCHAR2(100) default ' ' not null,
  STATUS                    VARCHAR2(1) default '0' not null,
  PRINTCOUNT                NUMBER(10) default 0 not null,
  SERVICEKEY                VARCHAR2(10) default 'XXXXXXXXXX' not null,
  STORERKEY                 VARCHAR2(15) default ' ' not null,
  SKU                       VARCHAR2(50) default ' ' not null,
  LOT                       VARCHAR2(10) default ' ' not null,
  ID                        VARCHAR2(18) default ' ' not null,
  UOMSHOW                   VARCHAR2(10) default ' ' not null,
  TARIFFKEY                 VARCHAR2(10) default 'XXXXXXXXXX' not null,
  TARIFFDETAILKEY           VARCHAR2(10) default ' ' not null,
  TAXGROUPKEY               VARCHAR2(10) default 'XXXXXXXXXX' not null,
  RATE                      NUMBER(22,6) default 1.0 not null,
  BASE                      VARCHAR2(1) default 'Q' not null,
  MASTERUNITS               NUMBER(12,6) default 1.0 not null,
  SYSTEMGENERATEDCHARGE     NUMBER(28,6) default 0.0 not null,
  DEBIT                     NUMBER(28,6) default 0.0 not null,
  CREDIT                    NUMBER(28,6) default 0.0 not null,
  BILLEDUNITS               NUMBER(21,7) default 0.0 not null,
  CHARGETYPE                VARCHAR2(10) not null,
  LINETYPE                  VARCHAR2(5) default 'N' not null,
  BILLFROMDATE              DATE default SYSDATE not null,
  BILLTHRUDATE              DATE default SYSDATE not null,
  SOURCEKEY                 VARCHAR2(20) default ' ' not null,
  SOURCETYPE                VARCHAR2(30) default ' ' not null,
  ACCESSORIALDETAILKEY      VARCHAR2(10) default 'XXXXXXXXXX' not null,
  GLDISTRIBUTIONKEY         VARCHAR2(10) default 'XXXXXXXXXX' not null,
  INVOICEBATCH              VARCHAR2(10) default ' ' not null,
  INVOICEKEY                VARCHAR2(10) default ' ' not null,
  ADDDATE                   DATE default SYSDATE not null,
  ADDWHO                    VARCHAR2(30) default USER not null,
  EDITDATE                  DATE default SYSDATE not null,
  EDITWHO                   VARCHAR2(30) default USER not null,
  COSTRATE                  NUMBER(22,6) default 1.0,
  COSTBASE                  VARCHAR2(1) default 'Q',
  COSTMASTERUNITS           NUMBER(12,6) default 1.0,
  COSTUOMSHOW               VARCHAR2(10) default ' ',
  COSTSYSTEMGENERATEDCHARGE NUMBER(28,6) default 0.0,
  COST                      NUMBER(28,6) default 0.0,
  COSTUNITS                 NUMBER(21,6) default 0.0,
  REFERENCEKEY              VARCHAR2(10) default ' ',
  INVOICEDATE               DATE
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ACCUMULATEDCHARGES
  add constraint PK_SYS_C004574 primary key (ACCUMULATEDCHARGESKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ACCUMULATEDCHARGES
  add foreign key (ACCESSORIALDETAILKEY)
  references ACCESSORIALDETAIL (ACCESSORIALDETAILKEY);
alter table ACCUMULATEDCHARGES
  add foreign key (GLDISTRIBUTIONKEY)
  references GLDISTRIBUTION (GLDISTRIBUTIONKEY);
alter table ACCUMULATEDCHARGES
  add foreign key (SERVICEKEY)
  references SERVICES (SERVICEKEY);
alter table ACCUMULATEDCHARGES
  add foreign key (STORERKEY)
  references STORER (STORERKEY);
alter table ACCUMULATEDCHARGES
  add foreign key (TARIFFKEY)
  references TARIFF (TARIFFKEY);
alter table ACCUMULATEDCHARGES
  add foreign key (TAXGROUPKEY)
  references TAXGROUP (TAXGROUPKEY);
alter table ACCUMULATEDCHARGES
  add check (COSTBASE = 'Q' OR (COSTBASE = 'G' OR (COSTBASE = 'C' OR (COSTBASE = 'F' OR (COSTBASE = 'P' OR COSTBASE = 'R')))));
alter table ACCUMULATEDCHARGES
  add check (CHARGETYPE = 'DI' OR (CHARGETYPE = 'DO' OR (CHARGETYPE = 'MT' OR (CHARGETYPE = 'CO' OR (CHARGETYPE = 'CI' OR (CHARGETYPE = 'SP' OR (CHARGETYPE = 'AC' OR (CHARGETYPE = 'MH' OR (CHARGETYPE = 'HI' OR (CHARGETYPE = 'MO' OR (CHARGETYPE = 'HO' OR (CHARGETYPE = 'MR' OR (CHARGETYPE = 'RS' OR (CHARGETYPE = 'MI' OR CHARGETYPE = 'IS'))))))))))))));
alter table ACCUMULATEDCHARGES
  add check (BASE = 'Q' OR (BASE = 'G' OR (BASE = 'C' OR (BASE = 'F' OR (BASE = 'P' OR BASE = 'R')))));
alter table ACCUMULATEDCHARGES
  add check (MASTERUNITS > 0.0);
alter table ACCUMULATEDCHARGES
  add check (SYSTEMGENERATEDCHARGE >= 0.0);
alter table ACCUMULATEDCHARGES
  add check (DEBIT >= 0.0);
alter table ACCUMULATEDCHARGES
  add check (CREDIT >= 0.0);
alter table ACCUMULATEDCHARGES
  add check (BILLEDUNITS >= 0.0);
create unique index ACCUM_3 on ACCUMULATEDCHARGES (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ADDDEPOSIT_LOCK
prompt ==============================
prompt
create table ADDDEPOSIT_LOCK
(
  SERIALKEY  NUMBER not null,
  WHSEID     VARCHAR2(30) default USER,
  SKU        VARCHAR2(50) not null,
  LOC        VARCHAR2(10) not null,
  ID         VARCHAR2(18) not null,
  STORERKEY  VARCHAR2(15) not null,
  LOTTABLE01 VARCHAR2(50) not null,
  LOTTABLE02 VARCHAR2(50) not null,
  LOTTABLE03 VARCHAR2(50) not null,
  LOTTABLE04 DATE not null,
  LOTTABLE05 DATE not null,
  LOTTABLE06 VARCHAR2(50) not null,
  LOTTABLE07 VARCHAR2(50) not null,
  LOTTABLE08 VARCHAR2(50) not null,
  LOTTABLE09 VARCHAR2(50) not null,
  LOTTABLE10 VARCHAR2(50) not null,
  ADDDATE    DATE default SYSDATE not null,
  ADDWHO     VARCHAR2(30) default USER not null,
  EDITDATE   DATE default SYSDATE not null,
  EDITWHO    VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ADDDEPOSIT_LOCK
  add constraint PK_SYS_C004575 primary key (SKU, LOC, ID, STORERKEY, LOTTABLE01, LOTTABLE02, LOTTABLE03, LOTTABLE04, LOTTABLE05, LOTTABLE06, LOTTABLE07, LOTTABLE08, LOTTABLE09, LOTTABLE10)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ADDDE_4 on ADDDEPOSIT_LOCK (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ADJUSTMENT
prompt =========================
prompt
create table ADJUSTMENT
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  ADJUSTMENTKEY VARCHAR2(10) not null,
  STORERKEY     VARCHAR2(15) default ' ' not null,
  EFFECTIVEDATE DATE default SYSDATE not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ADJUSTMENT
  add constraint PK_SYS_C004578 primary key (ADJUSTMENTKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ADJUSTMENT
  add foreign key (STORERKEY)
  references STORER (STORERKEY);
create unique index ADJUS_5 on ADJUSTMENT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PUTAWAYZONE
prompt ==========================
prompt
create table PUTAWAYZONE
(
  SERIALKEY              NUMBER not null,
  WHSEID                 VARCHAR2(30) default USER,
  PUTAWAYZONE            VARCHAR2(10) default ' ' not null,
  DESCR                  VARCHAR2(60) default ' ' not null,
  INLOC                  VARCHAR2(10) default ' ' not null,
  OUTLOC                 VARCHAR2(10) default ' ' not null,
  UOM1PICKMETHOD         VARCHAR2(1) default '1' not null,
  UOM2PICKMETHOD         VARCHAR2(1) default '3' not null,
  UOM3PICKMETHOD         VARCHAR2(1) default '3' not null,
  UOM4PICKMETHOD         VARCHAR2(1) default '1' not null,
  UOM5PICKMETHOD         VARCHAR2(1) default '3' not null,
  UOM6PICKMETHOD         VARCHAR2(1) default '3' not null,
  CLEAN_LOCATION         VARCHAR2(1) default '0',
  TOP_OFF                VARCHAR2(1) default 'A',
  REPLENISHMENT_FLAG     VARCHAR2(1) default '0',
  REPLENISHMENT_HOTLEVEL VARCHAR2(1) default '6',
  REPLENISHMENTMETHOD    VARCHAR2(10) default '0' not null,
  MAXCUBE                NUMBER(22,5) default 0 not null,
  MAXWEIGHT              NUMBER(22,5) default 0 not null,
  MAXCASECNT             NUMBER(22,5) default 0 not null,
  PICKTOLOC              VARCHAR2(10) default 'PICKTO',
  MAXPALLETSPERSKU       NUMBER(10) default 0 not null,
  POSVERMETHOD           VARCHAR2(10) default 'LOC' not null,
  PICKCC                 VARCHAR2(1) default '0' not null,
  QTYCC                  NUMBER(22,5) default 0 not null,
  CREATEASSIGNMENTS      VARCHAR2(1) default '0' not null,
  ZONEBREAK              VARCHAR2(1) default '0' not null,
  MAXPICKLINES           NUMBER default 0 not null,
  MAXPICKINGCONTAINERS   NUMBER default 0 not null,
  LABORMAXCASECNT        NUMBER default 0 not null,
  LABORMAXCUBE           NUMBER default 0 not null,
  LABORMAXWEIGHT         NUMBER default 0 not null,
  AISLESTART             NUMBER default 1 not null,
  AISLEEND               NUMBER default 1 not null,
  SLOTSTART              NUMBER default 1 not null,
  SLOTEND                NUMBER default 1 not null,
  ADDDATE                DATE default SYSDATE not null,
  ADDWHO                 VARCHAR2(30) default USER not null,
  EDITDATE               DATE default SYSDATE not null,
  EDITWHO                VARCHAR2(30) default USER not null,
  EXPORTNO               VARCHAR2(10),
  PUT_LOC                VARCHAR2(10),
  QC_LOC1                VARCHAR2(10),
  QC_LOC2                VARCHAR2(10)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column PUTAWAYZONE.EXPORTNO
  is '流水线出口';
comment on column PUTAWAYZONE.PUT_LOC
  is '上架默认储位';
comment on column PUTAWAYZONE.QC_LOC1
  is '质检少默认储位';
comment on column PUTAWAYZONE.QC_LOC2
  is '质检多默认储位';
alter table PUTAWAYZONE
  add constraint PK_SYS_C004752 primary key (PUTAWAYZONE)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PUTAW_225 on PUTAWAYZONE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOC
prompt ==================
prompt
create table LOC
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  LOC              VARCHAR2(10) default 'UNKNOWN' not null,
  CUBE             NUMBER default 0 not null,
  LENGTH           NUMBER default 0 not null,
  WIDTH            NUMBER default 0 not null,
  HEIGHT           NUMBER default 0 not null,
  LOCATIONTYPE     VARCHAR2(10) default ' ' not null,
  LOCATIONFLAG     VARCHAR2(10) default 'NONE' not null,
  LOCATIONHANDLING VARCHAR2(10) default '9' not null,
  LOCATIONCATEGORY VARCHAR2(10) default 'OTHER' not null,
  LOGICALLOCATION  VARCHAR2(18) default ' ' not null,
  CUBICCAPACITY    NUMBER default 0 not null,
  WEIGHTCAPACITY   NUMBER default 0 not null,
  STATUS           VARCHAR2(10) default 'OK' not null,
  LOSEID           VARCHAR2(1) default '0' not null,
  FACILITY         VARCHAR2(20) default ' ' not null,
  SECTION          VARCHAR2(10) default 'FACILITY' not null,
  ABC              VARCHAR2(1) default ' ' not null,
  PICKZONE         VARCHAR2(10) default ' ' not null,
  PUTAWAYZONE      VARCHAR2(10) default ' ' not null,
  SECTIONKEY       VARCHAR2(10) default 'FACILITY' not null,
  PICKMETHOD       VARCHAR2(1) default ' ' not null,
  COMMINGLESKU     VARCHAR2(1) default '1' not null,
  COMMINGLELOT     VARCHAR2(1) default '1' not null,
  LOCLEVEL         NUMBER(10) default 0 not null,
  XCOORD           NUMBER(10) default 0 not null,
  YCOORD           NUMBER(10) default 0 not null,
  ZCOORD           NUMBER(10) default 0 not null,
  OPTLOC           VARCHAR2(10),
  STACKLIMIT       NUMBER(10) default 0 not null,
  FOOTPRINT        NUMBER(10) default 0 not null,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null,
  LOCGROUPID       NUMBER(10),
  EXPORTNO         VARCHAR2(10),
  CUSTOMER         VARCHAR2(15),
  CASE_QTY         NUMBER(22,5) default 0
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column LOC.LENGTH
  is '长';
comment on column LOC.WIDTH
  is '宽';
comment on column LOC.HEIGHT
  is '高';
comment on column LOC.LOCATIONTYPE
  is 'CASE：重型料架储位 PICK：其他请配区储位 PACK：打包台 CASE_OUT：出库包件暂存 CASE_IN：入库包件暂存 QC1：待盈储位 QC2：待亏储位';
comment on column LOC.CUBICCAPACITY
  is '容积';
comment on column LOC.LOSEID
  is '是否丢失id';
comment on column LOC.COMMINGLESKU
  is '是否可混批次，默认1 可混';
comment on column LOC.EXPORTNO
  is '流水线出口';
comment on column LOC.CUSTOMER
  is '包件暂存储位对于客户';
comment on column LOC.CASE_QTY
  is '包件暂存储位最大存放包件数';
alter table LOC
  add constraint PK_SYS_C004679 primary key (LOC)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOC
  add foreign key (PUTAWAYZONE)
  references PUTAWAYZONE (PUTAWAYZONE);
alter table LOC
  add check (((NOT(LOC = ' '))));
create index IDX_LOC_LOCGROUP on LOC (LOCGROUPID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOC_LOGICALLOC on LOC (LOGICALLOCATION)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOC_PUTAWAYZ_01 on LOC (LOC, PUTAWAYZONE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOC_PUTAWAYZ_02 on LOC (PUTAWAYZONE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOC_136 on LOC (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SKU
prompt ==================
prompt
create table SKU
(
  SERIALKEY                   NUMBER not null,
  WHSEID                      VARCHAR2(30) default USER,
  STORERKEY                   VARCHAR2(15) not null,
  SKU                         VARCHAR2(50) not null,
  HAZMATCODESKEY              VARCHAR2(10) default ' ' not null,
  ITEMREFERENCE               VARCHAR2(8) default ' ' not null,
  SERIALNUMBERSTART           NUMBER(15),
  SERIALNUMBEREND             NUMBER(15),
  SERIALNUMBERNEXT            NUMBER(15),
  DESCR                       VARCHAR2(60),
  SUSR1                       VARCHAR2(18),
  SUSR2                       VARCHAR2(18),
  SUSR3                       VARCHAR2(18),
  SUSR4                       VARCHAR2(18),
  SUSR5                       VARCHAR2(18),
  MANUFACTURERSKU             VARCHAR2(50),
  RETAILSKU                   VARCHAR2(50),
  ALTSKU                      VARCHAR2(50),
  PACKKEY                     VARCHAR2(50) default 'STD' not null,
  STDGROSSWGT                 NUMBER(22,5) default 0 not null,
  STDNETWGT                   NUMBER(22,5) default 0 not null,
  STDCUBE                     NUMBER(22,5) default 0 not null,
  TARE                        NUMBER(22,5) default 0 not null,
  CLASS                       VARCHAR2(10) default 'STD' not null,
  ACTIVE                      VARCHAR2(10) default '1' not null,
  SKUGROUP                    VARCHAR2(10) default 'STD' not null,
  TARIFFKEY                   VARCHAR2(10) default 'XXXXXXXXXX',
  BUSR1                       VARCHAR2(30),
  BUSR2                       VARCHAR2(30),
  BUSR3                       VARCHAR2(30),
  BUSR4                       VARCHAR2(30),
  BUSR5                       VARCHAR2(30),
  LOTTABLE01LABEL             VARCHAR2(20) default 'JULIAN DT.' not null,
  LOTTABLE02LABEL             VARCHAR2(20) default 'CUST.LOT' not null,
  LOTTABLE03LABEL             VARCHAR2(20) default 'COLOR' not null,
  LOTTABLE04LABEL             VARCHAR2(20) default 'MAN.DATE' not null,
  LOTTABLE05LABEL             VARCHAR2(20) default 'EXP.DATE' not null,
  LOTTABLE06LABEL             VARCHAR2(20) default ' ' not null,
  LOTTABLE07LABEL             VARCHAR2(20) default ' ' not null,
  LOTTABLE08LABEL             VARCHAR2(20) default ' ' not null,
  LOTTABLE09LABEL             VARCHAR2(20) default ' ' not null,
  LOTTABLE10LABEL             VARCHAR2(20) default ' ' not null,
  PICKCODE                    VARCHAR2(10) default 'NSPFIFO' not null,
  STRATEGYKEY                 VARCHAR2(10) default 'STD' not null,
  CARTONGROUP                 VARCHAR2(10) default 'STD' not null,
  PUTCODE                     VARCHAR2(10) default 'NSPPASTD' not null,
  PUTAWAYLOC                  VARCHAR2(10) default 'UNKNOWN' not null,
  PUTAWAYZONE                 VARCHAR2(10) default 'BULK',
  INNERPACK                   NUMBER(22,5) default 0 not null,
  CUBE                        NUMBER(22,5) default 0 not null,
  GROSSWGT                    NUMBER(22,5) default 0 not null,
  NETWGT                      NUMBER(22,5) default 0 not null,
  ABC                         VARCHAR2(5),
  CYCLECOUNTFREQUENCY         NUMBER(10),
  LASTCYCLECOUNT              DATE,
  REORDERPOINT                NUMBER(10),
  REORDERQTY                  NUMBER(22,5),
  STDORDERCOST                NUMBER(22,5),
  CARRYCOST                   NUMBER(22,5),
  PRICE                       NUMBER(22,5),
  COST                        NUMBER(22,5),
  ONRECEIPTCOPYPACKKEY        VARCHAR2(10) default '0' not null,
  RECEIPTHOLDCODE             VARCHAR2(10) default ' ',
  RECEIPTINSPECTIONLOC        VARCHAR2(10) default 'QC' not null,
  ROTATEBY                    VARCHAR2(10) default 'Lot' not null,
  DATECODEDAYS                NUMBER(10) default 0,
  DEFAULTROTATION             VARCHAR2(1) default '1',
  SHIPPABLECONTAINER          VARCHAR2(10) default 'N' not null,
  IOFLAG                      VARCHAR2(5),
  TAREWEIGHT                  NUMBER(12,6) default 0,
  LOTXIDDETAILOTHERLABEL1     VARCHAR2(30) default 'SER#',
  LOTXIDDETAILOTHERLABEL2     VARCHAR2(30) default 'CSID',
  LOTXIDDETAILOTHERLABEL3     VARCHAR2(30) default 'OTHER',
  AVGCASEWEIGHT               NUMBER(22,6) default 0,
  TOLERANCEPCT                NUMBER(22,6) default 0,
  SHELFLIFEINDICATOR          VARCHAR2(10),
  SHELFLIFE                   NUMBER(10) default 0,
  TRANSPORTATIONMODE          VARCHAR2(30),
  SKUGROUP2                   VARCHAR2(30),
  SUSR6                       VARCHAR2(30),
  SUSR7                       VARCHAR2(30),
  SUSR8                       VARCHAR2(30),
  SUSR9                       VARCHAR2(30),
  SUSR10                      VARCHAR2(30),
  BUSR6                       VARCHAR2(30),
  BUSR7                       VARCHAR2(30),
  BUSR8                       VARCHAR2(30),
  BUSR9                       VARCHAR2(30),
  BUSR10                      VARCHAR2(30),
  MINIMUMSHELFLIFEONRFPICKING NUMBER(10) default 0 not null,
  FREIGHTCLASS                VARCHAR2(10) default 'FAK' not null,
  ICWFLAG                     VARCHAR2(1) default '0',
  ICWBY                       VARCHAR2(1) default '1',
  IDEWEIGHT                   VARCHAR2(1) default '0',
  ICDFLAG                     VARCHAR2(1) default '0',
  ICDLABEL1                   VARCHAR2(5) default ' ',
  ICDLABEL2                   VARCHAR2(5) default ' ',
  ICDLABEL3                   VARCHAR2(5) default ' ',
  OCWFLAG                     VARCHAR2(1) default ' ',
  OCWBY                       VARCHAR2(1) default '0',
  ODEWEIGHT                   VARCHAR2(1) default '1',
  OACOVERRIDE                 VARCHAR2(1) default '0',
  OCDFLAG                     VARCHAR2(1) default '0',
  OCDLABEL1                   VARCHAR2(5) default ' ',
  OCDLABEL2                   VARCHAR2(5) default ' ',
  OCDLABEL3                   VARCHAR2(5) default ' ',
  OTAREWEIGHT                 NUMBER(12,6) default 0,
  OAVGCASEWEIGHT              NUMBER(12,6) default 0,
  OTOLERANCEPCT               NUMBER(12,6) default 0,
  RFDEFAULTPACK               VARCHAR2(50) default 'STD',
  RFDEFAULTUOM                VARCHAR2(10) default 'EA',
  SHELFLIFECODETYPE           VARCHAR2(1) default 'E' not null,
  SHELFLIFEONRECEIVING        NUMBER(10) default 0 not null,
  LOTTABLEVALIDATIONKEY       VARCHAR2(10) default 'STD' not null,
  ALLOWCONSOLIDATION          VARCHAR2(1) default '0',
  MINIMUMWAVEQTY              NUMBER(22,5),
  BULKCARTONGROUP             VARCHAR2(10) default ' ',
  PICKUOM                     VARCHAR2(2) default '1' not null,
  EACHKEY                     VARCHAR2(10) default ' ',
  CASEKEY                     VARCHAR2(10) default ' ',
  TYPE                        VARCHAR2(32),
  EFFECSTARTDATE              DATE,
  EFFECENDDATE                DATE,
  CONVEYABLE                  VARCHAR2(1) default 'N',
  FLOWTHRUITEM                VARCHAR2(1) default 'N',
  NOTES1                      VARCHAR2(2000),
  NOTES2                      VARCHAR2(2000),
  VERT_STORAGE                VARCHAR2(1) default '0',
  CWFLAG                      VARCHAR2(10),
  VERIFYLOT04LOT05            VARCHAR2(1) default '0',
  PUTAWAYSTRATEGYKEY          VARCHAR2(10),
  RETURNSLOC                  VARCHAR2(10) default 'RETURN' not null,
  QCLOC                       VARCHAR2(10) default 'QC' not null,
  RECEIPTVALIDATIONTEMPLATE   VARCHAR2(18) default 'STD' not null,
  SKUTYPE                     VARCHAR2(1) default '0' not null,
  STACKLIMIT                  NUMBER(10) default 0 not null,
  MAXPALLETSPERZONE           NUMBER(10) default 0 not null,
  CCDISCREPANCYRULE           VARCHAR2(10) default 'STD' not null,
  ADDDATE                     DATE default SYSDATE not null,
  ADDWHO                      VARCHAR2(30) default USER not null,
  EDITDATE                    DATE default SYSDATE not null,
  EDITWHO                     VARCHAR2(30) default USER not null,
  CASE_QTY                    NUMBER(22,5) default 0,
  EACH_QTY                    NUMBER(22,5) default 0,
  BARCODE                     VARCHAR2(50)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column SKU.CASE_QTY
  is '主配计算使用，重型料架区参数';
comment on column SKU.EACH_QTY
  is '主配计算使用，库存量';
comment on column SKU.BARCODE
  is '条码';
alter table SKU
  add constraint PK_SYS_C004767 primary key (SKU, STORERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SKU
  add foreign key (PUTAWAYLOC)
  references LOC (LOC);
alter table SKU
  add foreign key (STORERKEY)
  references STORER (STORERKEY);
create unique index SKU_245 on SKU (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ADJUSTMENTDETAIL
prompt ===============================
prompt
create table ADJUSTMENTDETAIL
(
  SERIALKEY            NUMBER not null,
  WHSEID               VARCHAR2(30) default USER,
  ADJUSTMENTKEY        VARCHAR2(10) not null,
  ADJUSTMENTLINENUMBER VARCHAR2(5) not null,
  STORERKEY            VARCHAR2(15) default ' ' not null,
  SKU                  VARCHAR2(50) default ' ' not null,
  LOC                  VARCHAR2(10) default ' ' not null,
  LOT                  VARCHAR2(10) default ' ' not null,
  ID                   VARCHAR2(18) default ' ' not null,
  REASONCODE           VARCHAR2(10) default '0' not null,
  UOM                  VARCHAR2(10) default ' ' not null,
  PACKKEY              VARCHAR2(50) default 'STD' not null,
  QTY                  NUMBER(22,5) default 0 not null,
  CASECNT              NUMBER(22,5) default 0 not null,
  INNERPACK            NUMBER(22,5) default 0 not null,
  PALLET               NUMBER(22,5) default 0 not null,
  CUBE                 NUMBER(22,5) default 0 not null,
  GROSSWGT             NUMBER(22,5) default 0 not null,
  NETWGT               NUMBER(22,5) default 0 not null,
  OTHERUNIT1           NUMBER(22,5) default 0 not null,
  OTHERUNIT2           NUMBER(22,5) default 0 not null,
  ITRNKEY              VARCHAR2(10) default ' ' not null,
  EFFECTIVEDATE        DATE default SYSDATE not null,
  RECEIPTKEY           VARCHAR2(10),
  RECEIPTLINENUMBER    VARCHAR2(10),
  FORTE_FLAG           VARCHAR2(6) default 'I' not null,
  UPDATEFLAG           VARCHAR2(1),
  REFERENCEKEY         VARCHAR2(10),
  ADDDATE              DATE default SYSDATE not null,
  ADDWHO               VARCHAR2(30) default USER not null,
  EDITDATE             DATE default SYSDATE not null,
  EDITWHO              VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ADJUSTMENTDETAIL
  add constraint PK_SYS_C004576 primary key (ADJUSTMENTKEY, ADJUSTMENTLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ADJUSTMENTDETAIL
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
create unique index ADJUS_6 on ADJUSTMENTDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ADJUSTMENTDETAIL_UDF
prompt ===================================
prompt
create table ADJUSTMENTDETAIL_UDF
(
  SERIALKEY            NUMBER not null,
  WHSEID               VARCHAR2(30) default USER,
  ADJUSTMENTKEY        VARCHAR2(10) not null,
  ADJUSTMENTLINENUMBER VARCHAR2(5) not null,
  UDFLABEL             VARCHAR2(60) not null,
  UDFVALUE             VARCHAR2(60),
  UDFNOTES             VARCHAR2(60),
  ADDDATE              DATE default SYSDATE not null,
  ADDWHO               VARCHAR2(30) default USER not null,
  EDITDATE             DATE default SYSDATE not null,
  EDITWHO              VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ADJUSTMENTDETAIL_UDF
  add constraint PK_SYS_C004577 primary key (ADJUSTMENTKEY, ADJUSTMENTLINENUMBER, UDFLABEL)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ADJUS_7 on ADJUSTMENTDETAIL_UDF (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ADJUSTMENT_UDF
prompt =============================
prompt
create table ADJUSTMENT_UDF
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  ADJUSTMENTKEY VARCHAR2(10) not null,
  UDFLABEL      VARCHAR2(60) not null,
  UDFVALUE      VARCHAR2(60),
  UDFNOTES      VARCHAR2(60),
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ADJUSTMENT_UDF
  add constraint PK_SYS_C004579 primary key (ADJUSTMENTKEY, UDFLABEL)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ADJUS_8 on ADJUSTMENT_UDF (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ALERT
prompt ====================
prompt
create table ALERT
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  ALERTKEY     VARCHAR2(18) not null,
  MODULENAME   VARCHAR2(30) not null,
  ALERTMESSAGE VARCHAR2(255) not null,
  SEVERITY     NUMBER(10) default 5 not null,
  LOGDATE      DATE default SYSDATE not null,
  USERID       VARCHAR2(30) default USER not null,
  NOTIFYID     VARCHAR2(18) default ' ' not null,
  STATUS       VARCHAR2(10) default '0' not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null,
  RESOLUTION   VARCHAR2(2000) default ' ' not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ALERT
  add constraint PK_SYS_C004580 primary key (ALERTKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ALERT_9 on ALERT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ALLOCATESTRATEGY
prompt ===============================
prompt
create table ALLOCATESTRATEGY
(
  SERIALKEY            NUMBER not null,
  WHSEID               VARCHAR2(30) default USER,
  ALLOCATESTRATEGYKEY  VARCHAR2(10) default ' ' not null,
  DESCR                VARCHAR2(60) default ' ' not null,
  RETRYIFQTYREMAIN     NUMBER(22,5) default 0 not null,
  ALLOCATESTRATEGYTYPE VARCHAR2(1) default '1',
  ADDDATE              DATE default SYSDATE not null,
  ADDWHO               VARCHAR2(30) default USER not null,
  EDITDATE             DATE default SYSDATE not null,
  EDITWHO              VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ALLOCATESTRATEGY
  add constraint PK_SYS_C004582 primary key (ALLOCATESTRATEGYKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ALLOC_10 on ALLOCATESTRATEGY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ALLOCATESTRATEGYDETAIL
prompt =====================================
prompt
create table ALLOCATESTRATEGYDETAIL
(
  SERIALKEY                  NUMBER not null,
  WHSEID                     VARCHAR2(30) default USER,
  ALLOCATESTRATEGYKEY        VARCHAR2(10) default ' ' not null,
  ALLOCATESTRATEGYLINENUMBER VARCHAR2(5) default ' ' not null,
  DESCR                      VARCHAR2(60) default ' ' not null,
  UOM                        VARCHAR2(10) default ' ' not null,
  PICKCODE                   VARCHAR2(20) default ' ' not null,
  LOCATIONTYPEOVERRIDE       VARCHAR2(10) default ' ' not null,
  LOCATIONTYPEOVERRIDESTRIPE VARCHAR2(10) default ' ' not null,
  ALLOWOVERALLOCATIONS       VARCHAR2(1) default '0',
  PICKCODESQL                VARCHAR2(2000),
  ADDDATE                    DATE default SYSDATE not null,
  ADDWHO                     VARCHAR2(30) default USER not null,
  EDITDATE                   DATE default SYSDATE not null,
  EDITWHO                    VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ALLOCATESTRATEGYDETAIL
  add constraint PK_SYS_C004581 primary key (ALLOCATESTRATEGYKEY, ALLOCATESTRATEGYLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ALLOC_11 on ALLOCATESTRATEGYDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ALTSKU
prompt =====================
prompt
create table ALTSKU
(
  SERIALKEY  NUMBER not null,
  WHSEID     VARCHAR2(30) default USER,
  STORERKEY  VARCHAR2(15) not null,
  SKU        VARCHAR2(50) not null,
  ALTSKU     VARCHAR2(50) not null,
  VENDOR     VARCHAR2(15),
  PACKKEY    VARCHAR2(50) default 'STD' not null,
  DEFAULTUOM VARCHAR2(10) default 'EA' not null,
  TYPE       VARCHAR2(10) default ' ' not null,
  UDF1       VARCHAR2(32),
  UDF2       VARCHAR2(32),
  UDF3       VARCHAR2(32),
  UDF4       VARCHAR2(32),
  UDF5       VARCHAR2(32),
  ADDDATE    DATE default SYSDATE not null,
  ADDWHO     VARCHAR2(30) default USER not null,
  EDITDATE   DATE default SYSDATE not null,
  EDITWHO    VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ALTSKU
  add constraint PK_SYS_C004583 primary key (STORERKEY, ALTSKU)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ALTSKU
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
create unique index ALTSK_12 on ALTSKU (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ALTSKU_SKUVALUE on ALTSKU (ALTSKU)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ALTSKU_STORERSKU on ALTSKU (STORERKEY, SKU)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table APPORTIONSTRATEGY
prompt ================================
prompt
create table APPORTIONSTRATEGY
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  STORERKEY         VARCHAR2(15) not null,
  CONSIGNEEKEY      VARCHAR2(15) not null,
  SEQUENCE          NUMBER not null,
  ALLOWOVERSHIPMENT VARCHAR2(1) default '0' not null,
  MAXIMUMPEROVER    NUMBER(12,2) default 0 not null,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPORTIONSTRATEGY
  add constraint PK_SYS_C004584 primary key (STORERKEY, CONSIGNEEKEY, SEQUENCE)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index APPOR_13 on APPORTIONSTRATEGY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOAD_TYPE
prompt ========================
prompt
create table LOAD_TYPE
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  LOAD_TYPE_ID      VARCHAR2(10) not null,
  LOAD_TYPE_DESC    VARCHAR2(50) not null,
  LESS_THAN_CASE    NUMBER(10) default 0 not null,
  GREATER_THAN_CASE NUMBER(10) default 0 not null,
  LESS_THAN_CUBE    NUMBER(10) default 0 not null,
  GREATER_THAN_CUBE NUMBER(10) default 0 not null,
  LESS_THAN_WGHT    NUMBER(10) default 0 not null,
  GREATER_THAN_WGHT NUMBER(10) default 0 not null,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOAD_TYPE
  add constraint PK_SYS_C004678 primary key (LOAD_TYPE_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOAD__135 on LOAD_TYPE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table APPT_HEADER
prompt ==========================
prompt
create table APPT_HEADER
(
  SERIALKEY                NUMBER not null,
  WHSEID                   VARCHAR2(30) default USER,
  APPT_ID                  VARCHAR2(10) not null,
  CDLKUP_APPT_ACTION       VARCHAR2(10) default ' ',
  CDLKUP_APPT_TYPE         VARCHAR2(10) default ' ',
  CDLKUP_APPT_STATUS       VARCHAR2(10) default ' ',
  CDLKUP_LOAD_ACTION       VARCHAR2(10),
  LOAD_TYPE_ID             VARCHAR2(10),
  DOCK_STORER_ID           VARCHAR2(15),
  CDLKUP_DOCK_STORER_TYPE  VARCHAR2(10),
  CDLKUP_LOAD_HANDLING     VARCHAR2(10),
  CDLKUP_LOAD_STATUS       VARCHAR2(10),
  CDLKUP_CHECKINOUT_ACTION VARCHAR2(10),
  TRIP_ID                  VARCHAR2(20) default ' ',
  SCHEDULE_TIME            DATE,
  HOT_ITEM_FLAG            VARCHAR2(1) default '0',
  COMMENT_ID               VARCHAR2(10),
  ADDDATE                  DATE default SYSDATE not null,
  ADDWHO                   VARCHAR2(30) default USER not null,
  EDITDATE                 DATE default SYSDATE not null,
  EDITWHO                  VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_HEADER
  add constraint PK_SYS_C004592 primary key (APPT_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_HEADER
  add foreign key (LOAD_TYPE_ID)
  references LOAD_TYPE (LOAD_TYPE_ID);
create unique index APPT__21 on APPT_HEADER (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table APPT_ACTIVITY
prompt ============================
prompt
create table APPT_ACTIVITY
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  APPT_ID           VARCHAR2(10) not null,
  ACTIVITY_DTL_ID   VARCHAR2(10) not null,
  APPT_EVENT_TIME   DATE default SYSDATE not null,
  CDLKUP_APPT_EVENT VARCHAR2(10) default ' ' not null,
  LOC_ID            VARCHAR2(10) default ' ' not null,
  EQPT_UNIT_ID      VARCHAR2(18) default ' ',
  WHSE_ID           VARCHAR2(15) default ' ',
  ADDDATE           DATE default SYSDATE,
  ADDWHO            VARCHAR2(18) default ' ',
  EDITDATE          DATE default SYSDATE,
  EDITWHO           VARCHAR2(18) default ' '
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_ACTIVITY
  add constraint PK_SYS_C004585 primary key (APPT_ID, ACTIVITY_DTL_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_ACTIVITY
  add foreign key (APPT_ID)
  references APPT_HEADER (APPT_ID);
create unique index APPT__14 on APPT_ACTIVITY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table APPT_ASN
prompt =======================
prompt
create table APPT_ASN
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  APPT_ID   VARCHAR2(10) not null,
  ASN_ID    VARCHAR2(30) not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_ASN
  add constraint PK_SYS_C004586 primary key (APPT_ID, ASN_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_ASN
  add foreign key (APPT_ID)
  references APPT_HEADER (APPT_ID);
create unique index APPT__15 on APPT_ASN (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table APPT_CO
prompt ======================
prompt
create table APPT_CO
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  APPT_ID   VARCHAR2(10) not null,
  CO_ID     VARCHAR2(24) not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_CO
  add constraint PK_SYS_C004588 primary key (APPT_ID, CO_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_CO
  add foreign key (APPT_ID)
  references APPT_HEADER (APPT_ID);
create unique index APPT__16 on APPT_CO (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table APPT_COMMENT
prompt ===========================
prompt
create table APPT_COMMENT
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  COMMENT_ID   VARCHAR2(10) not null,
  APPT_ID      VARCHAR2(10),
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null,
  COMMENT_DESC VARCHAR2(2000)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_COMMENT
  add constraint PK_SYS_C004587 primary key (COMMENT_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_COMMENT
  add foreign key (APPT_ID)
  references APPT_HEADER (APPT_ID);
create unique index APPT__17 on APPT_COMMENT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DC
prompt =================
prompt
create table DC
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  DC_ID     VARCHAR2(15) not null,
  DC_DESC   VARCHAR2(50) not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DC
  add constraint PK_SYS_C004631 primary key (DC_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index DC_78 on DC (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DC_LOC
prompt =====================
prompt
create table DC_LOC
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  DC_LOC_ID   VARCHAR2(15) not null,
  DC_ID       VARCHAR2(15) not null,
  DC_LOC_DESC VARCHAR2(50) not null,
  ADDRESS1    VARCHAR2(50) default ' ',
  ADDRESS2    VARCHAR2(50) default ' ',
  ADDRESS3    VARCHAR2(50) default ' ',
  ADDRESS4    VARCHAR2(50),
  CITY        VARCHAR2(50) default ' ',
  STATE       VARCHAR2(50) default ' ',
  ZIP         VARCHAR2(18) default ' ',
  COUNTRY     VARCHAR2(50) default ' ',
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DC_LOC
  add constraint PK_SYS_C004632 primary key (DC_LOC_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DC_LOC
  add foreign key (DC_ID)
  references DC (DC_ID);
create unique index DC_LO_79 on DC_LOC (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHEDULE_RULES
prompt =============================
prompt
create table SCHEDULE_RULES
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  SCHED_RULES_ID   VARCHAR2(10) not null,
  SCHED_RULES_DESC VARCHAR2(50) not null,
  LOAD_BEG_DAY     NUMBER(10),
  LOAD_BEG_MIN     NUMBER(10),
  EARLY_APPT_MIN   NUMBER(10),
  LATE_APPT_MIN    NUMBER(10),
  DEAD_TIME        NUMBER(10),
  MASTER_SCHED_YN  VARCHAR2(1),
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SCHEDULE_RULES
  add constraint PK_SYS_C004762 primary key (SCHED_RULES_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index SCHED_241 on SCHEDULE_RULES (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WHSE
prompt ===================
prompt
create table WHSE
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  WHSE_ID        VARCHAR2(15) not null,
  DC_LOC_ID      VARCHAR2(15) default ' ' not null,
  SCHED_RULES_ID VARCHAR2(10),
  DC_ID          VARCHAR2(15) default ' ' not null,
  ZONE           VARCHAR2(50),
  ZONE_HOUR      NUMBER(10) default 0,
  WHSE_DESC      VARCHAR2(50) not null,
  ADDRESS1       VARCHAR2(50) default ' ',
  ADDRESS2       VARCHAR2(50) default ' ',
  ADDRESS3       VARCHAR2(50) default ' ',
  ADDRESS4       VARCHAR2(50) default ' ',
  CITY           VARCHAR2(50) default ' ',
  STATE          VARCHAR2(50) default ' ',
  ZIP            VARCHAR2(18) default ' ',
  COUNTRY        VARCHAR2(50) default ' ',
  CONTACT_NAME1  VARCHAR2(50) default ' ',
  CONTACT_NAME2  VARCHAR2(50) default ' ',
  TITLE1         VARCHAR2(50) default ' ',
  TITLE2         VARCHAR2(50) default ' ',
  PHONE1         VARCHAR2(18) default ' ',
  PHONE2         VARCHAR2(18) default ' ',
  FAX1           VARCHAR2(18) default ' ',
  FAX2           VARCHAR2(18) default ' ',
  EMAIL1         VARCHAR2(50) default ' ',
  EMAIL2         VARCHAR2(50) default ' ',
  ADDDATE        DATE default SYSDATE,
  ADDWHO         VARCHAR2(18) default ' ',
  EDITDATE       DATE default SYSDATE,
  EDITWHO        VARCHAR2(18) default ' '
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WHSE
  add constraint PK_SYS_C004805 primary key (WHSE_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WHSE
  add foreign key (DC_LOC_ID)
  references DC_LOC (DC_LOC_ID);
alter table WHSE
  add foreign key (SCHED_RULES_ID)
  references SCHEDULE_RULES (SCHED_RULES_ID);
create unique index WHSE_287 on WHSE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DOOR
prompt ===================
prompt
create table DOOR
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  DOOR_ID            VARCHAR2(10) not null,
  WHSE_ID            VARCHAR2(15) default ' ' not null,
  TOTAL_UNITS        NUMBER(22,5) default 1 not null,
  CDLKUP_DOOR_STATUS VARCHAR2(10) default ' ' not null,
  CDLKUP_CUR_STATUS  VARCHAR2(10),
  X_COORD            NUMBER(10) default 0,
  Y_COORD            NUMBER(10) default 0,
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DOOR
  add constraint PK_SYS_C004638 primary key (DOOR_ID, WHSE_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DOOR
  add foreign key (WHSE_ID)
  references WHSE (WHSE_ID);
create unique index DOOR_84 on DOOR (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table APPT_DOOR
prompt ========================
prompt
create table APPT_DOOR
(
  SERIALKEY                   NUMBER not null,
  WHSEID                      VARCHAR2(30) default USER,
  APPT_DOOR_ID                VARCHAR2(10) not null,
  DOOR_ID                     VARCHAR2(10),
  APPT_ID                     VARCHAR2(10),
  WHSE_ID                     VARCHAR2(15) default ' ' not null,
  ARRIVE_DATETIME             DATE,
  DURATION_MIN                NUMBER(10) default 0,
  DEPART_DATETIME             DATE,
  CDLKUP_APPT_DOOR_CUR_STATUS VARCHAR2(10),
  PRIORITY_ID                 NUMBER(10) default 0,
  CURRENT_LOC                 VARCHAR2(10),
  ACTUAL_ARRIVE_DATETIME      DATE,
  ACTUAL_DEPART_DATETIME      DATE,
  ACTUAL_DURATION             NUMBER(10),
  SEQUENCE                    VARCHAR2(10),
  ADDDATE                     DATE default SYSDATE not null,
  ADDWHO                      VARCHAR2(30) default USER not null,
  EDITDATE                    DATE default SYSDATE not null,
  EDITWHO                     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_DOOR
  add constraint PK_SYS_C004589 primary key (APPT_DOOR_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_DOOR
  add foreign key (APPT_ID)
  references APPT_HEADER (APPT_ID);
alter table APPT_DOOR
  add foreign key (DOOR_ID, WHSE_ID)
  references DOOR (DOOR_ID, WHSE_ID);
alter table APPT_DOOR
  add foreign key (WHSE_ID)
  references WHSE (WHSE_ID);
create unique index APPT__18 on APPT_DOOR (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table APPT_DOOR_HISTORY
prompt ================================
prompt
create table APPT_DOOR_HISTORY
(
  SERIALKEY                   NUMBER not null,
  WHSEID                      VARCHAR2(30) default USER,
  APPT_DOOR_HISTORY_ID        VARCHAR2(10) not null,
  APPT_ID                     VARCHAR2(10),
  DOOR_ID                     VARCHAR2(10),
  PRIORITY_ID                 NUMBER(10) default 0,
  WHSE_ID                     VARCHAR2(15) default ' ',
  CDLKUP_APPT_DOOR_CUR_STATUS VARCHAR2(10),
  ARRIVE_DATETIME             DATE,
  DURATION_MIN                NUMBER(10) default 0,
  DEPART_DATETIME             DATE,
  APPT_DOOR_ID                VARCHAR2(10),
  ACTUAL_DEPART_DATETIME      DATE,
  ACTUAL_DURATION             NUMBER(10),
  ACTUAL_ARRIVE_DATETIME      DATE,
  CURRENT_LOC                 VARCHAR2(10),
  ADDDATE                     DATE default SYSDATE not null,
  ADDWHO                      VARCHAR2(30) default USER not null,
  EDITDATE                    DATE default SYSDATE not null,
  EDITWHO                     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_DOOR_HISTORY
  add constraint PK_SYS_C004590 primary key (APPT_DOOR_HISTORY_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index APPT__19 on APPT_DOOR_HISTORY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table APPT_EQPT
prompt ========================
prompt
create table APPT_EQPT
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  EQPT_DTL_ID             VARCHAR2(10) not null,
  APPT_ID                 VARCHAR2(10) not null,
  DOCK_STORER_ID          VARCHAR2(15),
  EQPT_CLASS_ID           VARCHAR2(10) default ' ',
  EQPT_CATEGORY_ID        VARCHAR2(10) default ' ',
  EQPT_UNIT_ID            VARCHAR2(18),
  CDLKUP_DOCK_STORER_TYPE VARCHAR2(10),
  DOOR_ID                 VARCHAR2(10),
  WHSE_ID                 VARCHAR2(15) default ' ',
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_EQPT
  add constraint PK_SYS_C004591 primary key (EQPT_DTL_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_EQPT
  add foreign key (APPT_ID)
  references APPT_HEADER (APPT_ID);
create unique index APPT__20 on APPT_EQPT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table APPT_HISTORY
prompt ===========================
prompt
create table APPT_HISTORY
(
  SERIALKEY                NUMBER not null,
  WHSEID                   VARCHAR2(30) default USER,
  APPT_ID                  VARCHAR2(10),
  APPT_HISTORY_ID          VARCHAR2(10) not null,
  DOCK_STORER_ID           VARCHAR2(15),
  CDLKUP_DOCK_STORER_TYPE  VARCHAR2(10),
  CDLKUP_APPT_ACTION       VARCHAR2(10) default ' ',
  CDLKUP_APPT_TYPE         VARCHAR2(10) default ' ',
  CDLKUP_APPT_STATUS       VARCHAR2(10) default ' ',
  CDLKUP_LOAD_ACTION       VARCHAR2(10),
  CDLKUP_LOAD_STATUS       VARCHAR2(10),
  CDLKUP_LOAD_HANDLING     VARCHAR2(10),
  LOAD_TYPE_ID             VARCHAR2(10),
  CDLKUP_CHECKINOUT_ACTION VARCHAR2(10),
  TRIP_ID                  VARCHAR2(15) default ' ',
  HOT_ITEM_FLAG            VARCHAR2(1) default '0',
  SCHEDULE_TIME            DATE default SYSDATE,
  ADDDATE                  DATE default SYSDATE not null,
  ADDWHO                   VARCHAR2(30) default USER not null,
  EDITDATE                 DATE default SYSDATE not null,
  EDITWHO                  VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_HISTORY
  add constraint PK_SYS_C004593 primary key (APPT_HISTORY_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index APPT__22 on APPT_HISTORY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table APPT_PO
prompt ======================
prompt
create table APPT_PO
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  PO_ID     VARCHAR2(24) not null,
  APPT_ID   VARCHAR2(10) not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_PO
  add constraint PK_SYS_C004594 primary key (PO_ID, APPT_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_PO
  add foreign key (APPT_ID)
  references APPT_HEADER (APPT_ID);
create unique index APPT__23 on APPT_PO (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table APPT_SKU
prompt =======================
prompt
create table APPT_SKU
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  APPT_ID   VARCHAR2(10) not null,
  SKU       VARCHAR2(50) not null,
  STORERKEY VARCHAR2(15) not null,
  WHSE_ID   VARCHAR2(15) default ' ' not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_SKU
  add constraint PK_SYS_C004595 primary key (APPT_ID, STORERKEY, SKU)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPT_SKU
  add foreign key (APPT_ID)
  references APPT_HEADER (APPT_ID);
create unique index APPT__24 on APPT_SKU (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ARCHIVETABLE
prompt ===========================
prompt
create table ARCHIVETABLE
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  ARCHIVETABLEID NUMBER(10) not null,
  NAME           VARCHAR2(50) not null,
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ARCHIVETABLE
  add constraint PK_SYS_C004602 primary key (ARCHIVETABLEID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ARCHI_30 on ARCHIVETABLE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ARCHIVEPROCESS
prompt =============================
prompt
create table ARCHIVEPROCESS
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  ARCHIVEPROCESSID NUMBER(10) not null,
  ARCHIVETABLEID   NUMBER(10) not null,
  NAME             VARCHAR2(50) not null,
  TYPE             NUMBER(10) not null,
  RUNFREQUENCY     NUMBER(10) not null,
  LASTRUN          DATE default SYSDATE not null,
  RUNHOUR          NUMBER(10) not null,
  PRIORITY         NUMBER(10) not null,
  ACTIVE           NUMBER(10) default 1 not null,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ARCHIVEPROCESS
  add constraint PK_SYS_C004600 primary key (ARCHIVEPROCESSID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ARCHIVEPROCESS
  add foreign key (ARCHIVETABLEID)
  references ARCHIVETABLE (ARCHIVETABLEID);
create unique index ARCHI_29 on ARCHIVEPROCESS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ARCHIVECASCADE
prompt =============================
prompt
create table ARCHIVECASCADE
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  ARCHIVECASCADEID NUMBER(10) not null,
  ARCHIVEPROCESSID NUMBER(10) not null,
  HEADERTABLEID    NUMBER(10) not null,
  DETAILTABLEID    NUMBER(10) not null,
  SEQUENCE         NUMBER(10) not null,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ARCHIVECASCADE
  add constraint PK_SYS_C004596 primary key (ARCHIVECASCADEID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ARCHIVECASCADE
  add foreign key (ARCHIVEPROCESSID)
  references ARCHIVEPROCESS (ARCHIVEPROCESSID);
alter table ARCHIVECASCADE
  add foreign key (HEADERTABLEID)
  references ARCHIVETABLE (ARCHIVETABLEID);
alter table ARCHIVECASCADE
  add foreign key (DETAILTABLEID)
  references ARCHIVETABLE (ARCHIVETABLEID);
create unique index ARCHI_25 on ARCHIVECASCADE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ARCHIVELOG
prompt =========================
prompt
create table ARCHIVELOG
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  ARCHIVELOGID NUMBER(10) not null,
  MESSAGE      VARCHAR2(250) not null,
  TIMESTAMEP   DATE default SYSDATE not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ARCHIVELOG
  add constraint PK_SYS_C004597 primary key (ARCHIVELOGID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ARCHI_26 on ARCHIVELOG (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ARCHIVEPARAMETERS
prompt ================================
prompt
create table ARCHIVEPARAMETERS
(
  SERIALKEY                     NUMBER not null,
  WHSEID                        VARCHAR2(30) default USER,
  ARCHIVEKEY                    VARCHAR2(10) not null,
  COPYROWSTOARCHIVEDATABASE     VARCHAR2(1) default 'Y' not null,
  ARCHIVEDATABASENAME           VARCHAR2(30) default ' ' not null,
  LIVEDATABASENAME              VARCHAR2(30) default ' ' not null,
  SHIPNUMBEROFDAYSTORETAIN      NUMBER(10) default 0 not null,
  SHIPACTIVE                    VARCHAR2(2) default 'Y' not null,
  SHIPSTORERKEYSTART            VARCHAR2(15) default '0' not null,
  SHIPSTORERKEYEND              VARCHAR2(15) default 'zzzzzzzzzzzzzzz' not null,
  SHIPSYSORDSTART               VARCHAR2(10) default '0' not null,
  SHIPSYSORDEND                 VARCHAR2(10) default 'zzzzzzzzzz' not null,
  SHIPEXTERNORDERKEYSTART       VARCHAR2(30) default ' ' not null,
  SHIPEXTERNORDERKEYEND         VARCHAR2(30) default 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' not null,
  SHIPORDTYPSTART               VARCHAR2(10) default ' ' not null,
  SHIPORDTYPEND                 VARCHAR2(10) default 'zzzzzzzzzz' not null,
  SHIPORDGRPSTART               VARCHAR2(20) default ' ' not null,
  SHIPORDGRPEND                 VARCHAR2(20) default 'zzzzzzzzzzzzzzzzzzzz' not null,
  SHIPTOSTART                   VARCHAR2(15) default ' ' not null,
  SHIPTOEND                     VARCHAR2(15) default 'zzzzzzzzzzzzzzz' not null,
  SHIPBILLTOSTART               VARCHAR2(15) default ' ' not null,
  SHIPBILLTOEND                 VARCHAR2(15) default 'zzzzzzzzzzzzzzz' not null,
  SHIPMENTORDERDATETYPE         VARCHAR2(10) default '1' not null,
  ADJNUMBEROFDAYSTORETAIN       NUMBER(10) default 0 not null,
  ADJACTIVE                     VARCHAR2(2) default 'Y' not null,
  ADJSTART                      VARCHAR2(10) default '0' not null,
  ADJEND                        VARCHAR2(10) default 'zzzzzzzzzz' not null,
  ADJUSTMENTDATETYPE            VARCHAR2(10) default '1' not null,
  TRANNUMBEROFDAYSTORETAIN      NUMBER(10) default 0 not null,
  TRANACTIVE                    VARCHAR2(2) default 'Y' not null,
  TRANSTART                     VARCHAR2(10) default '0' not null,
  TRANEND                       VARCHAR2(10) default 'zzzzzzzzzz' not null,
  TRANSFERDATETYPE              VARCHAR2(10) default '1' not null,
  PONUMBEROFDAYSTORETAIN        NUMBER(10) default 0 not null,
  POACTIVE                      VARCHAR2(2) default 'Y' not null,
  POSTORERKEYSTART              VARCHAR2(15) default '0' not null,
  POSTORERKEYEND                VARCHAR2(15) default 'zzzzzzzzzzzzzzz' not null,
  POSTART                       VARCHAR2(18) default '0' not null,
  POEND                         VARCHAR2(18) default 'zzzzzzzzzzzzzzzzzz' not null,
  PODATETYPE                    VARCHAR2(10) default '1' not null,
  RECEIPTNUMBEROFDAYSTORETAIN   NUMBER(10) default 0 not null,
  RECEIPTACTIVE                 VARCHAR2(2) default 'Y' not null,
  RECEIPTSTORERKEYSTART         VARCHAR2(15) default '0' not null,
  RECEIPTSTORERKEYEND           VARCHAR2(15) default 'zzzzzzzzzz' not null,
  RECEIPTSTART                  VARCHAR2(10) default '0' not null,
  RECEIPTEND                    VARCHAR2(10) default '0' not null,
  RECEIPTDATETYPE               VARCHAR2(10) default '1' not null,
  ITRNNUMBEROFDAYSTORETAIN      NUMBER(10) default 0 not null,
  ITRNACTIVE                    VARCHAR2(2) default 'Y' not null,
  ITRNSTORERKEYSTART            VARCHAR2(15) default '0' not null,
  ITRNSTORERKEYEND              VARCHAR2(15) default 'zzzzzzzzzzzzzzz' not null,
  ITRNSKUSTART                  VARCHAR2(50) default '0' not null,
  ITRNSKUEND                    VARCHAR2(50) default 'zzzzzzzzzzzzzzzzzzzz' not null,
  ITRNLOTSTART                  VARCHAR2(15) default '0' not null,
  ITRNLOTEND                    VARCHAR2(15) default 'zzzzzzzzzz' not null,
  ITRNDATETYPE                  VARCHAR2(10) default '1' not null,
  MAWBNUMBEROFDAYSTORETAIN      NUMBER(10) default 0 not null,
  MAWBACTIVE                    VARCHAR2(2) default 'Y' not null,
  MAWBSTART                     VARCHAR2(15) default '0' not null,
  MAWBEND                       VARCHAR2(15) default 'zzzzzzzzzzzzzzz' not null,
  MAWBDATETYPE                  VARCHAR2(10) default '1' not null,
  HAWBNUMBEROFDAYSTORETAIN      NUMBER(10) default 0 not null,
  HAWBACTIVE                    VARCHAR2(2) default 'Y' not null,
  HAWBSTART                     VARCHAR2(15) default '0' not null,
  HAWBEND                       VARCHAR2(15) default 'zzzzzzzzzzzzzzz' not null,
  HAWBDATETYPE                  VARCHAR2(10) default '1' not null,
  CONTAINERNUMBEROFDAYSTORETAIN NUMBER(10) default 0 not null,
  CONTAINERACTIVE               VARCHAR2(2) default 'Y' not null,
  CONTAINERSTART                VARCHAR2(20) default '0' not null,
  CONTAINEREND                  VARCHAR2(20) default 'zzzzzzzzzzzzzzzzzzzz' not null,
  CONTAINERDATETYPE             VARCHAR2(10) default '2' not null,
  PALLETNUMBEROFDAYSTORETAIN    NUMBER(10) default 0 not null,
  PALLETACTIVE                  VARCHAR2(2) default 'Y' not null,
  PALLETSTART                   VARCHAR2(10) default '0' not null,
  PALLETEND                     VARCHAR2(10) default 'zzzzzzzzzz' not null,
  PALLETDATETYPE                VARCHAR2(10) default '2' not null,
  CASEMNUMBEROFDAYSTORETAIN     NUMBER(10) default 0 not null,
  CASEMACTIVE                   VARCHAR2(2) default 'Y' not null,
  CASEMSTORERKEYSTART           VARCHAR2(15) default '0' not null,
  CASEMSTORERKEYEND             VARCHAR2(20) default 'zzzzzzzzzzzzzzzzzzzz' not null,
  CASEMSTART                    VARCHAR2(20) default '0' not null,
  CASEMEND                      VARCHAR2(20) default 'zzzzzzzzzzzzzzzzzzzz' not null,
  CASEMDATETYPE                 VARCHAR2(10) default '2' not null,
  MBOLNUMBEROFDAYSTORETAIN      NUMBER(10) default 0 not null,
  MBOLACTIVE                    VARCHAR2(2) default 'Y' not null,
  MBOLSTART                     VARCHAR2(10) default '0' not null,
  MBOLEND                       VARCHAR2(10) default 'zzzzzzzzzz' not null,
  MBOLDEPDATESTART              DATE default SYSDATE not null,
  MBOLDEPDATEEND                DATE default SYSDATE not null,
  MBOLDELDATESTART              DATE default SYSDATE not null,
  MBOLDELDATEEND                DATE default SYSDATE not null,
  MBOLVOYAGESTART               VARCHAR2(30) default '0' not null,
  MBOLVOYAGEEND                 VARCHAR2(30) default 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' not null,
  MBOLDATETYPE                  VARCHAR2(10) default '2' not null,
  PICKDATETYPE                  VARCHAR2(10) default '2' not null,
  ADDDATE                       DATE default SYSDATE not null,
  ADDWHO                        VARCHAR2(30) default USER not null,
  EDITDATE                      DATE default SYSDATE not null,
  EDITWHO                       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ARCHIVEPARAMETERS
  add constraint PK_SYS_C004598 primary key (ARCHIVEKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ARCHIVEPARAMETERS
  add check (ARCHIVEDATABASENAME <> LIVEDATABASENAME);
create unique index ARCHI_27 on ARCHIVEPARAMETERS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ARCHIVEPARMS
prompt ===========================
prompt
create table ARCHIVEPARMS
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  ARCHIVEPARMSID NUMBER(10) not null,
  BATCHSIZE      NUMBER(10) not null,
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ARCHIVEPARMS
  add constraint PK_SYS_C004599 primary key (ARCHIVEPARMSID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ARCHI_28 on ARCHIVEPARMS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ARCHIVETABLEKEY
prompt ==============================
prompt
create table ARCHIVETABLEKEY
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  ARCHIVETABLEKEYID NUMBER(10) not null,
  ARCHIVETABLEID    NUMBER(10) not null,
  COLUMNNAME        VARCHAR2(50) not null,
  COLUMNTYPE        NUMBER(10) not null,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ARCHIVETABLEKEY
  add constraint PK_SYS_C004601 primary key (ARCHIVETABLEKEYID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ARCHIVETABLEKEY
  add foreign key (ARCHIVETABLEID)
  references ARCHIVETABLE (ARCHIVETABLEID);
create unique index ARCHI_31 on ARCHIVETABLEKEY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ARCHIVETABPARMS
prompt ==============================
prompt
create table ARCHIVETABPARMS
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  ARCHIVETABPARMSID NUMBER(10) not null,
  ARCHIVEPROCESSID  NUMBER(10) not null,
  COLUMNNAME        VARCHAR2(50) not null,
  COLUMNTYPE        NUMBER(10) not null,
  OPERATOR          VARCHAR2(20) not null,
  VALUE             VARCHAR2(100) not null,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ARCHIVETABPARMS
  add constraint PK_SYS_C004603 primary key (ARCHIVETABPARMSID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ARCHIVETABPARMS
  add foreign key (ARCHIVEPROCESSID)
  references ARCHIVEPROCESS (ARCHIVEPROCESSID);
create unique index ARCHI_32 on ARCHIVETABPARMS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AREA
prompt ===================
prompt
create table AREA
(
  SERIALKEY              NUMBER not null,
  WHSEID                 VARCHAR2(30) default USER,
  AREAKEY                VARCHAR2(10) not null,
  ALLOWVOICE             VARCHAR2(1) default '0' not null,
  AUTOASSIGN             VARCHAR2(1) default '1' not null,
  MAXNUMWORKIDS          INTEGER default 1 not null,
  SKIPAISLEALLOWED       VARCHAR2(1) default '1' not null,
  SKIPLOCALLOWED         VARCHAR2(1) default '1' not null,
  REPICKSKIPS            VARCHAR2(1) default '1' not null,
  CPSPEAKWORKID          VARCHAR2(1) default '0' not null,
  MAXQUANTITYTOPICK      INTEGER default 0 not null,
  PRINTLABELS            VARCHAR2(1) default '0' not null,
  PRINTCHASELABELS       VARCHAR2(1) default '0' not null,
  SPEAKDESCRIPTION       VARCHAR2(1) default '0' not null,
  PICKPROMPT             VARCHAR2(1) default '0' not null,
  SPEAKWORKID            VARCHAR2(1) default '0' not null,
  SIGNOFFALLOWED         VARCHAR2(1) default '1' not null,
  CONTAINERTYPE          VARCHAR2(1) default '1' not null,
  CONTAINERCAPACITY      INTEGER default 0 not null,
  DELIVERPREVCONTAINER   VARCHAR2(1) default '0' not null,
  PASSASSIGNMENT         VARCHAR2(1) default '0' not null,
  DELIVERY               VARCHAR2(1) default '0' not null,
  QUANTITYVERIFICATION   VARCHAR2(1) default '1' not null,
  SPOKENWORKID           VARCHAR2(10) default 'ORDER' not null,
  WORKIDLENGTH           INTEGER default -1 not null,
  GOBACKFORSHORTS        VARCHAR2(1) default '0' not null,
  NOCONTAINERTRACKING    VARCHAR2(1) default '0' not null,
  REGIONZONE             VARCHAR2(1) default '0' not null,
  CONTAINERCOUNT         VARCHAR2(1) default '0' not null,
  ORDERPICKING           VARCHAR2(1) default '0' not null,
  USELUT                 VARCHAR2(1) default '0' not null,
  CURRENTZONE            VARCHAR2(100) default 'X' not null,
  CURRENTAISLE           VARCHAR2(50) default ' ' not null,
  CURRENTSLOT            VARCHAR2(50) default ' ' not null,
  PRINTMULTIPLELABELS    VARCHAR2(1) default '0' not null,
  CATCHWGTTOLERANCE      VARCHAR2(1) default '1' not null,
  DOCUMENTSREQUIRED      VARCHAR2(1) default '0' not null,
  REPLENALLOWED          VARCHAR2(1) default '0' not null,
  MULTICONTAINERSALLOWED VARCHAR2(1) default '0' not null,
  VERIFYPUTQTY           VARCHAR2(1) default '0' not null,
  WORKIDFIELD            VARCHAR2(50) default 'ORDERS' not null,
  ADDDATE                DATE default SYSDATE not null,
  ADDWHO                 VARCHAR2(30) default USER not null,
  EDITDATE               DATE default SYSDATE not null,
  EDITWHO                VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table AREA
  add constraint PK_SYS_4824 primary key (AREAKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AREADETAIL
prompt =========================
prompt
create table AREADETAIL
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  AREAKEY     VARCHAR2(10) default ' ' not null,
  PUTAWAYZONE VARCHAR2(10) default ' ' not null,
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table AREADETAIL
  add constraint PK_SYS_C004604 primary key (AREAKEY, PUTAWAYZONE)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index AREAD_33 on AREADETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AUTO_PRINT
prompt =========================
prompt
create table AUTO_PRINT
(
  ID            NUMBER not null,
  BOXNO         VARCHAR2(10) not null,
  BOXWEIGHT     NUMBER(10,4),
  NET_WEIGHT    NUMBER(10,4),
  ACT_WEIGHT    NUMBER(10,4) not null,
  DOC_STATUS    VARCHAR2(2),
  DOC_DONE      VARCHAR2(1),
  ADDDATE       DATE default SYSDATE,
  ADDWHO        VARCHAR2(18) default USER,
  EDITDATE      DATE default SYSDATE,
  EDITWHO       VARCHAR2(18) default USER,
  CUSTOMER      VARCHAR2(30),
  PRINT_FLAG    VARCHAR2(1) default 'N',
  CASEID        VARCHAR2(10),
  REPORT        VARCHAR2(40),
  PARAMETER     VARCHAR2(40),
  COMPUTER_NAME VARCHAR2(30),
  PRINTER_NAME  VARCHAR2(60),
  PACKLOC       VARCHAR2(10)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column AUTO_PRINT.ID
  is 'Id';
comment on column AUTO_PRINT.BOXNO
  is '箱号';
comment on column AUTO_PRINT.BOXWEIGHT
  is '箱重量（KG）';
comment on column AUTO_PRINT.NET_WEIGHT
  is '理论重量（KG）';
comment on column AUTO_PRINT.ACT_WEIGHT
  is '实际重量（KG）';
comment on column AUTO_PRINT.ADDDATE
  is '新增时间';
comment on column AUTO_PRINT.ADDWHO
  is '新增人';
comment on column AUTO_PRINT.EDITDATE
  is '修改时间';
comment on column AUTO_PRINT.EDITWHO
  is '修改人';
comment on column AUTO_PRINT.CUSTOMER
  is '门店号';
comment on column AUTO_PRINT.PRINT_FLAG
  is '打印标志';
comment on column AUTO_PRINT.CASEID
  is '包件清单号';
comment on column AUTO_PRINT.REPORT
  is '报表名称';
comment on column AUTO_PRINT.PARAMETER
  is '报表参数';
comment on column AUTO_PRINT.COMPUTER_NAME
  is '计算机名称';
comment on column AUTO_PRINT.PRINTER_NAME
  is '打印机名称';
comment on column AUTO_PRINT.PACKLOC
  is '打包台';
alter table AUTO_PRINT
  add constraint PK_SYS_AUTO_PRINT_ID primary key (ID)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BARCODECONFIG
prompt ============================
prompt
create table BARCODECONFIG
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  BARCODECONFIGKEY VARCHAR2(18) not null,
  CONFIGTYPE       VARCHAR2(18) not null,
  DESCRIPTION      VARCHAR2(30),
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BARCODECONFIG
  add constraint PK_SYS_C004605 primary key (BARCODECONFIGKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BARCO_34 on BARCODECONFIG (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BARCODECONFIGDETAIL
prompt ==================================
prompt
create table BARCODECONFIGDETAIL
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  BARCODECONFIGKEY VARCHAR2(18) not null,
  AI               VARCHAR2(6) not null,
  FIELDNAME        VARCHAR2(30),
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BARCODECONFIGDETAIL
  add constraint PK_SYS_C004861 primary key (BARCODECONFIGKEY, AI)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BARCODECONFIGDETAIL
  add foreign key (BARCODECONFIGKEY)
  references BARCODECONFIG (BARCODECONFIGKEY);
create unique index BARCO_35 on BARCODECONFIGDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BATCHSELECTION
prompt =============================
prompt
create table BATCHSELECTION
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  BATCHSELECTIONKEY VARCHAR2(18) not null,
  DEFAULTFLAG       VARCHAR2(1) not null,
  BULKCARTONGROUP   VARCHAR2(10) default 'STD' not null,
  AREADEFINED       VARCHAR2(1) default 'F' not null,
  SORTLOCASSIGNMENT VARCHAR2(1) default '1' not null,
  CUSTOMERTYPESTART VARCHAR2(30) default ' ' not null,
  CUSTOMERTYPEEND   VARCHAR2(30) default 'zzzzzzzzzz' not null,
  CONSIGNEESTART    VARCHAR2(15) default ' ' not null,
  CONSIGNEEEND      VARCHAR2(15) default 'zzzzzzzzzz' not null,
  ORDERTYPESTART    VARCHAR2(10) default ' ' not null,
  ORDERTYPEEND      VARCHAR2(10) default 'zzzzzzzzzz' not null,
  OHTYPESTART       VARCHAR2(10) default ' ' not null,
  OHTYPEEND         VARCHAR2(10) default 'zzzzzzzzzz' not null,
  TOTALQTYSTART     NUMBER(22,5) default 1 not null,
  TOTALQTYEND       NUMBER(22,5) default 99999 not null,
  TOTALLINESSTART   NUMBER(10) default 1 not null,
  TOTALLINESEND     NUMBER(10) default 99999 not null,
  TOTALCUBESTART    NUMBER(22,5) default 1 not null,
  TOTALCUBEEND      NUMBER(22,5) default 99999 not null,
  TOTALWEIGHTSTART  NUMBER(22,5) default 1 not null,
  TOTALWEIGHTEND    NUMBER(22,5) default 99999 not null,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BATCHSELECTION
  add constraint PK_SYS_C004606 primary key (BATCHSELECTIONKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BATCH_36 on BATCHSELECTION (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BATCH_REPLEN_WORK
prompt ================================
prompt
create table BATCH_REPLEN_WORK
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  LOT       VARCHAR2(10) not null,
  LOC       VARCHAR2(10) not null,
  ID        VARCHAR2(18) not null,
  QTY       NUMBER(22,5) not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BATCH_37 on BATCH_REPLEN_WORK (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BILLING_DETAIL_CUT
prompt =================================
prompt
create table BILLING_DETAIL_CUT
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  STORERKEY     VARCHAR2(15) not null,
  SKU           VARCHAR2(50) not null,
  LOT           VARCHAR2(10) not null,
  QTY           NUMBER(22,5) not null,
  EFFECTIVEDATE DATE not null,
  FLAG          VARCHAR2(1) not null,
  TRANTYPE      VARCHAR2(10) not null,
  RUNNINGTOTAL  NUMBER(22,5) not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BILLI_38 on BILLING_DETAIL_CUT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BILLOFMATERIAL
prompt =============================
prompt
create table BILLOFMATERIAL
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  STORERKEY    VARCHAR2(15) default ' ' not null,
  SKU          VARCHAR2(50) default ' ' not null,
  COMPONENTSKU VARCHAR2(50) default ' ' not null,
  SEQUENCE     VARCHAR2(10) default ' ' not null,
  BOMONLY      VARCHAR2(1) default ' ' not null,
  QTY          NUMBER(22,5) default 1 not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null,
  NOTES        VARCHAR2(2000) default ' ' not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BILLOFMATERIAL
  add constraint PK_SYS_C004607 primary key (STORERKEY, SKU, COMPONENTSKU)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BILLOFMATERIAL
  add unique (STORERKEY, SKU, COMPONENTSKU, SEQUENCE)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BILLO_39 on BILLOFMATERIAL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BILL_ACCUMULATEDCHARGES
prompt ======================================
prompt
create table BILL_ACCUMULATEDCHARGES
(
  SERIALKEY                 NUMBER not null,
  WHSEID                    VARCHAR2(30) default USER,
  IDENT                     NUMBER(10) default 0 not null,
  ACCUMULATEDCHARGESKEY     VARCHAR2(10),
  DESCRIP                   VARCHAR2(100),
  STATUS                    VARCHAR2(1),
  PRINTCOUNT                NUMBER(28),
  SERVICEKEY                VARCHAR2(10),
  STORERKEY                 VARCHAR2(15),
  SKU                       VARCHAR2(50),
  LOT                       VARCHAR2(10),
  ID                        VARCHAR2(18),
  UOMSHOW                   VARCHAR2(10),
  TARIFFKEY                 VARCHAR2(10),
  TARIFFDETAILKEY           VARCHAR2(10),
  TAXGROUPKEY               VARCHAR2(10),
  RATE                      NUMBER(22,6),
  BASE                      VARCHAR2(1),
  MASTERUNITS               NUMBER(12,6),
  SYSTEMGENERATEDCHARGE     NUMBER(28,6),
  DEBIT                     NUMBER(28,6),
  CREDIT                    NUMBER(28,6),
  BILLEDUNITS               NUMBER(21,7),
  CHARGETYPE                VARCHAR2(10),
  LINETYPE                  VARCHAR2(5),
  BILLFROMDATE              DATE,
  BILLTHRUDATE              DATE,
  SOURCEKEY                 VARCHAR2(20),
  SOURCETYPE                VARCHAR2(30),
  ACCESSORIALDETAILKEY      VARCHAR2(10),
  GLDISTRIBUTIONKEY         VARCHAR2(10),
  INVOICEBATCH              VARCHAR2(10),
  INVOICEKEY                VARCHAR2(10),
  COSTRATE                  NUMBER(22,6),
  COSTBASE                  VARCHAR2(1),
  COSTMASTERUNITS           NUMBER(12,6),
  COSTUOMSHOW               VARCHAR2(10),
  COSTSYSTEMGENERATEDCHARGE NUMBER(28,6),
  COST                      NUMBER(28,6),
  COSTUNITS                 NUMBER(21,6),
  REFERENCEKEY              VARCHAR2(10),
  ADDWHO                    VARCHAR2(18)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BILL__40 on BILL_ACCUMULATEDCHARGES (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_BILLACCUMCHARGES_KEY on BILL_ACCUMULATEDCHARGES (ACCUMULATEDCHARGESKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BILL_INVENTORYCUT
prompt ================================
prompt
create table BILL_INVENTORYCUT
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  STORERKEY     VARCHAR2(15) not null,
  SKU           VARCHAR2(50) not null,
  LOT           VARCHAR2(10) not null,
  QTY           NUMBER(22,5) not null,
  TRANTYPE      VARCHAR2(10) not null,
  EFFECTIVEDATE DATE not null,
  ADDWHO        VARCHAR2(18)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BILL__41 on BILL_INVENTORYCUT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BILL_LISTBETWEEN
prompt ===============================
prompt
create table BILL_LISTBETWEEN
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  STORERKEY VARCHAR2(15) not null,
  SKU       VARCHAR2(50) not null,
  LOT       VARCHAR2(10) not null,
  ADDWHO    VARCHAR2(18)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BILL__42 on BILL_LISTBETWEEN (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BILL_LISTNOBEFORE
prompt ================================
prompt
create table BILL_LISTNOBEFORE
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  STORERKEY VARCHAR2(15) not null,
  SKU       VARCHAR2(50) not null,
  LOT       VARCHAR2(10) not null,
  ADDWHO    VARCHAR2(18)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BILL__43 on BILL_LISTNOBEFORE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BILL_MINDATES
prompt ============================
prompt
create table BILL_MINDATES
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  DATEMIN   DATE not null,
  BFDATE    DATE not null,
  LOT       VARCHAR2(10) not null,
  ADDWHO    VARCHAR2(18)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BILL__44 on BILL_MINDATES (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BILL_RSDATES
prompt ===========================
prompt
create table BILL_RSDATES
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  STORERKEY       VARCHAR2(15) not null,
  TARIFFKEY       VARCHAR2(10) not null,
  BILLFROM        DATE not null,
  BILLTHRU        DATE not null,
  ADDWHO          VARCHAR2(18),
  LOTBILLTHRUDATE DATE,
  DESCR           VARCHAR2(20) default ' '
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BILL__45 on BILL_RSDATES (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BILL_RSLOTS
prompt ==========================
prompt
create table BILL_RSLOTS
(
  SERIALKEY              NUMBER not null,
  WHSEID                 VARCHAR2(30) default USER,
  STORERKEY              VARCHAR2(15) not null,
  SKU                    VARCHAR2(50) not null,
  STDGROSSWGT            NUMBER(28,5) not null,
  STDCUBE                NUMBER(28,5) not null,
  LOT                    VARCHAR2(10) not null,
  TARIFFKEY              VARCHAR2(10) not null,
  LOTBILLTHRUDATE        DATE not null,
  RSPERIODTYPE           VARCHAR2(1),
  RECURRINGSTORAGEPERIOD NUMBER(22,5),
  DESCRIP                VARCHAR2(100) not null,
  TAXGROUPKEY            VARCHAR2(10) not null,
  GLDISTRIBUTIONKEY      VARCHAR2(10) not null,
  RATE                   NUMBER(22,6) not null,
  BASE                   VARCHAR2(1) not null,
  MASTERUNITS            NUMBER(12,6) not null,
  UOMSHOW                VARCHAR2(10) not null,
  TARIFFDETAILKEY        VARCHAR2(10) not null,
  ROUNDMASTERUNITS       VARCHAR2(10) not null,
  COSTRATE               NUMBER(22,6),
  COSTBASE               VARCHAR2(1),
  COSTMASTERUNITS        NUMBER(12,6),
  COSTUOMSHOW            VARCHAR2(10),
  ADDWHO                 VARCHAR2(18)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BILL__46 on BILL_RSLOTS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_BILLRSLOTS_LOT on BILL_RSLOTS (LOT)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BILL_STOCKMOVEDATE
prompt =================================
prompt
create table BILL_STOCKMOVEDATE
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  BILLFROM  DATE not null,
  LOT       VARCHAR2(10) not null,
  ADDWHO    VARCHAR2(18)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BILL__47 on BILL_STOCKMOVEDATE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_BILLSTOCKMOVEDATE_LOT on BILL_STOCKMOVEDATE (LOT)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BILL_STOCKMOVEMENT
prompt =================================
prompt
create table BILL_STOCKMOVEMENT
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  STORERKEY     VARCHAR2(15) not null,
  SKU           VARCHAR2(50) not null,
  LOT           VARCHAR2(10) not null,
  QTY           NUMBER(22,5) not null,
  EFFECTIVEDATE DATE not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BILL__48 on BILL_STOCKMOVEMENT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_BILLSTOCKMOVEMENT_LOT on BILL_STOCKMOVEMENT (LOT)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BILL_STOCKMOVEMENT_DETAIL
prompt ========================================
prompt
create table BILL_STOCKMOVEMENT_DETAIL
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  STORERKEY     VARCHAR2(15) not null,
  COMPANY       VARCHAR2(45),
  SKU           VARCHAR2(50) not null,
  DESCR         VARCHAR2(60),
  LOT           VARCHAR2(10) not null,
  QTY           NUMBER(22,5) not null,
  EFFECTIVEDATE DATE not null,
  FLAG          VARCHAR2(2),
  TRANTYPE      VARCHAR2(10) not null,
  RUNNINGTOTAL  NUMBER(22,5),
  RECORD_NUMBER NUMBER(10),
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BILL__49 on BILL_STOCKMOVEMENT_DETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BILL_SUMMARYCUT
prompt ==============================
prompt
create table BILL_SUMMARYCUT
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  STORERKEY     VARCHAR2(15) not null,
  SKU           VARCHAR2(50) not null,
  LOT           VARCHAR2(10) not null,
  QTY           NUMBER(22,5) not null,
  EFFECTIVEDATE DATE not null,
  FLAG          VARCHAR2(2) not null,
  TRANTYPE      VARCHAR2(10) not null,
  RUNNINGTOTAL  NUMBER(22,5) not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BILL__50 on BILL_SUMMARYCUT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BOMHDR
prompt =====================
prompt
create table BOMHDR
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  BOMHDRID        NUMBER(10) not null,
  BOMHDRKEY       VARCHAR2(32) not null,
  DESCRIPTION     VARCHAR2(64),
  STATUS          NUMBER(2),
  PARENTSTORERKEY VARCHAR2(15),
  PARENTSKU       VARCHAR2(50),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BOMHDR
  add constraint PK_SYS_C004611 primary key (BOMHDRID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BOMHDR
  add foreign key (PARENTSKU, PARENTSTORERKEY)
  references SKU (SKU, STORERKEY);
create unique index BOMHDRU1 on BOMHDR (BOMHDRKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BOMHD_53 on BOMHDR (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BOMDET
prompt =====================
prompt
create table BOMDET
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  BOMDETID       NUMBER(10) not null,
  BOMDETKEY      VARCHAR2(32) not null,
  QTYREQUIRED    NUMBER(18,7) not null,
  SKUSCRAPPCT    NUMBER(18,16) default 0,
  SUBSTCOMPID    NUMBER(10),
  SUBSTSTARTDATE DATE,
  SUBSTENDDATE   DATE,
  BOMHDRID       NUMBER(10),
  ISOPTIONAL     NUMBER(1) default 0,
  STORERKEY      VARCHAR2(15),
  SKU            VARCHAR2(50),
  SUBSTSTORERKEY VARCHAR2(15),
  SUBSTSKU       VARCHAR2(50),
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BOMDET
  add constraint PK_SYS_C004609 primary key (BOMDETID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BOMDET
  add foreign key (BOMHDRID)
  references BOMHDR (BOMHDRID);
alter table BOMDET
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
alter table BOMDET
  add foreign key (SUBSTSKU, SUBSTSTORERKEY)
  references SKU (SKU, STORERKEY);
create unique index BOMDETU1 on BOMDET (BOMDETKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BOMDE_51 on BOMDET (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_BOMDET01 on BOMDET (BOMHDRID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BOMHDRDEFN
prompt =========================
prompt
create table BOMHDRDEFN
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  BOMHDRDEFNID    NUMBER(10) not null,
  BOMHDRDEFNKEY   VARCHAR2(32) not null,
  DESCRIPTION     VARCHAR2(64),
  PARENTSTORERKEY VARCHAR2(15),
  PARENTSKU       VARCHAR2(50),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BOMHDRDEFN
  add constraint PK_SYS_C004610 primary key (BOMHDRDEFNID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BOMHDRDEFN
  add foreign key (PARENTSKU, PARENTSTORERKEY)
  references SKU (SKU, STORERKEY);
create unique index BOMHDRDEFNU1 on BOMHDRDEFN (BOMHDRDEFNKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BOMHD_54 on BOMHDRDEFN (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BOMDETDEFN
prompt =========================
prompt
create table BOMDETDEFN
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  BOMDETDEFNID   NUMBER(10) not null,
  BOMDETDEFNKEY  VARCHAR2(32) not null,
  QTYREQUIRED    NUMBER(18,7) not null,
  SKUSCRAPPCT    NUMBER(18,16) default 0,
  SUBSTCOMPID    NUMBER(10),
  SUBSTSTARTDATE DATE,
  SUBSTENDDATE   DATE,
  BOMHDRDEFNID   NUMBER(10),
  ISOPTIONAL     NUMBER(1) default 0,
  STORERKEY      VARCHAR2(15),
  SKU            VARCHAR2(50),
  SUBSTSTORERKEY VARCHAR2(15),
  SUBSTSKU       VARCHAR2(50),
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BOMDETDEFN
  add constraint PK_SYS_C004608 primary key (BOMDETDEFNID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BOMDETDEFN
  add foreign key (BOMHDRDEFNID)
  references BOMHDRDEFN (BOMHDRDEFNID);
alter table BOMDETDEFN
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
create unique index BOMDETDEFNU1 on BOMDETDEFN (BOMDETDEFNKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index BOMDE_52 on BOMDETDEFN (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_BOMDETDEFN01 on BOMDETDEFN (BOMHDRDEFNID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BOX
prompt ==================
prompt
create table BOX
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER not null,
  BOXNO        VARCHAR2(10) not null,
  TYPE         VARCHAR2(10),
  STATUS       VARCHAR2(15),
  EXTERN_LENTH NUMBER(22,5),
  EXTERN_WIDTH NUMBER(22,5),
  EXTERN_HIGH  NUMBER(22,5),
  LENTH        NUMBER(22,5),
  WIDTH        NUMBER(22,5),
  HIGH         NUMBER(22,5),
  STDCUBE      NUMBER(22,5),
  WEIGHT       NUMBER(22,5),
  STDWGT       NUMBER(22,5),
  ERROR_PER    NUMBER(22,5),
  SUSR1        VARCHAR2(30),
  SUSR2        VARCHAR2(30),
  SUSR3        VARCHAR2(30),
  SUSR4        VARCHAR2(30),
  SUSR5        VARCHAR2(30),
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null,
  DIF_WGT      NUMBER(22,5),
  DIF_TIMES    INTEGER
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column BOX.WEIGHT
  is '箱体重量';
comment on column BOX.STDWGT
  is '容重';
create unique index IDX_BOX_001 on BOX (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PK_SYS_BOX on BOX (BOXNO)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CALENDAR
prompt =======================
prompt
create table CALENDAR
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  CALENDARGROUP VARCHAR2(10) not null,
  DESCRIPTION   VARCHAR2(60) default ' ' not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CALENDAR
  add constraint PK_SYS_C004613 primary key (CALENDARGROUP)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index CALEN_55 on CALENDAR (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CALENDARDETAIL
prompt =============================
prompt
create table CALENDARDETAIL
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  CALENDARGROUP VARCHAR2(10) not null,
  PERIODEND     DATE not null,
  SPLITDATE     DATE not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CALENDARDETAIL
  add constraint PK_SYS_C004612 primary key (CALENDARGROUP, PERIODEND)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CALENDARDETAIL
  add foreign key (CALENDARGROUP)
  references CALENDAR (CALENDARGROUP);
create unique index CALEN_56 on CALENDARDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CARTONIZATION
prompt ============================
prompt
create table CARTONIZATION
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  CARTONIZATIONKEY   VARCHAR2(10) not null,
  CARTONIZATIONGROUP VARCHAR2(10) default ' ' not null,
  CARTONTYPE         VARCHAR2(10) default ' ' not null,
  CARTONDESCRIPTION  VARCHAR2(60) default ' ' not null,
  USESEQUENCE        NUMBER(10) default 1 not null,
  CUBE               NUMBER default 0 not null,
  MAXWEIGHT          NUMBER default 0 not null,
  MAXCOUNT           NUMBER(22,5) default 0 not null,
  LENGTH             NUMBER(22,5) default 0 not null,
  WIDTH              NUMBER(22,5) default 0 not null,
  HEIGHT             NUMBER(22,5) default 0 not null,
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CARTONIZATION
  add constraint PK_SYS_C004614 primary key (CARTONIZATIONKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CARTONIZATION
  add unique (CARTONIZATIONGROUP, USESEQUENCE)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index CARTO_57 on CARTONIZATION (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CASEDETAIL
prompt =========================
prompt
create table CASEDETAIL
(
  FROMTABLE     VARCHAR2(20) not null,
  FROMTYPE      VARCHAR2(10) not null,
  CASEID        VARCHAR2(10) not null,
  CASEID_BAK    VARCHAR2(10) not null,
  LINENUMBER    VARCHAR2(5) not null,
  PACKID        VARCHAR2(10),
  PICKDETAILKEY VARCHAR2(10),
  STORERKEY     VARCHAR2(10),
  TYPE          NUMBER not null,
  DOC_NUMBER    VARCHAR2(32) not null,
  SKU           VARCHAR2(50),
  QTY           NUMBER,
  SEQ           VARCHAR2(5),
  PRICE         NUMBER(18,4) default 0,
  DISCOUNT      NUMBER(18,4) default 100,
  AMT           NUMBER(18,4) default 0,
  NET           NUMBER(18,4) default 0,
  NETWEIGHT     NUMBER(18,2),
  VOLUME        NUMBER(18,2),
  SUSR1         VARCHAR2(30),
  SUSR2         VARCHAR2(30),
  SUSR3         VARCHAR2(30),
  SUSR4         VARCHAR2(30),
  SUSR5         VARCHAR2(30),
  ADDDATE       DATE default SYSDATE,
  ADDWHO        VARCHAR2(18),
  EDITDATE      DATE default SYSDATE,
  EDITWHO       VARCHAR2(18)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column CASEDETAIL.FROMTABLE
  is '来源表单';
comment on column CASEDETAIL.FROMTYPE
  is '来源类型：0、请配 1、主配';
comment on column CASEDETAIL.CASEID
  is '包清单号　';
comment on column CASEDETAIL.LINENUMBER
  is '包明细号';
comment on column CASEDETAIL.PACKID
  is '打包明细唯一号';
comment on column CASEDETAIL.PICKDETAILKEY
  is '拣货明细号';
comment on column CASEDETAIL.STORERKEY
  is '货主';
comment on column CASEDETAIL.TYPE
  is '原始任务单据类型
0=主配
1=客退…
';
comment on column CASEDETAIL.DOC_NUMBER
  is '主配：任务单号

退货：退货单号

';
comment on column CASEDETAIL.SKU
  is '商品内码';
comment on column CASEDETAIL.QTY
  is '数量';
comment on column CASEDETAIL.SEQ
  is '任务单序号,对应主配明细中的SEQ';
comment on column CASEDETAIL.PRICE
  is '商品价格';
comment on column CASEDETAIL.DISCOUNT
  is '商品折扣';
comment on column CASEDETAIL.AMT
  is '码洋';
comment on column CASEDETAIL.NET
  is '实洋';
comment on column CASEDETAIL.NETWEIGHT
  is '理论重量（QTY*SKU.STDNETWGT）';
comment on column CASEDETAIL.VOLUME
  is '体积(QTY*SKU.STDCUBE)';
comment on column CASEDETAIL.SUSR1
  is '扩展字段';
comment on column CASEDETAIL.SUSR2
  is '扩展字段';
comment on column CASEDETAIL.SUSR3
  is '扩展字段';
comment on column CASEDETAIL.SUSR4
  is '扩展字段';
comment on column CASEDETAIL.SUSR5
  is '扩展字段';
comment on column CASEDETAIL.ADDDATE
  is '新增时间';
comment on column CASEDETAIL.ADDWHO
  is '新增人';
comment on column CASEDETAIL.EDITDATE
  is '修改时间';
comment on column CASEDETAIL.EDITWHO
  is '修改人';
alter table CASEDETAIL
  add constraint PK_SYS_CASEIDNUMBER primary key (CASEID, LINENUMBER)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CASEID
prompt =====================
prompt
create table CASEID
(
  BATCHNO       VARCHAR2(20),
  SHIPKEY       VARCHAR2(10),
  CASEID        VARCHAR2(10) not null,
  CASEID_BAK    VARCHAR2(10) not null,
  DOC_STORERKEY VARCHAR2(15),
  WH            VARCHAR2(10),
  CONSK         VARCHAR2(15),
  SHORTNAME     VARCHAR2(20),
  STATUS        VARCHAR2(10),
  LOC           VARCHAR2(10),
  QTY           NUMBER,
  AMT           NUMBER(18,4) default 0,
  NET           NUMBER(18,4) default 0,
  WEIGHT        NUMBER(18,2),
  NETWEIGHT     NUMBER(18,2),
  VOLUME        NUMBER(18,2),
  SUSR1         VARCHAR2(30),
  SUSR2         VARCHAR2(30),
  SUSR3         VARCHAR2(30),
  SUSR4         VARCHAR2(30),
  SUSR5         VARCHAR2(30),
  ADDDATE       DATE default SYSDATE,
  ADDWHO        VARCHAR2(18),
  EDITDATE      DATE default SYSDATE,
  EDITWHO       VARCHAR2(18),
  BOX_WGT       NUMBER(18,2),
  SEND_USER     VARCHAR2(18),
  SEND_DATE     DATE,
  REC_USER      VARCHAR2(18),
  REC_DATE      DATE,
  DIVEDE_USER   VARCHAR2(18),
  DIVIDE_DATE   DATE,
  MERGE_USER    VARCHAR2(18),
  MERGE_DATE    DATE,
  CONFIRM_USER  VARCHAR2(18),
  CONFIRM_DATE  DATE,
  LOAD_USER     VARCHAR2(18),
  LOAD_DATE     DATE,
  SHIP_USER     VARCHAR2(18),
  SHIP_DATE     DATE,
  IS_MERGE      VARCHAR2(1) default '0',
  PACK_USER     VARCHAR2(18),
  PACK_DATE     DATE
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column CASEID.BATCHNO
  is '处理批号';
comment on column CASEID.SHIPKEY
  is '发运单号';
comment on column CASEID.CASEID
  is '包件清单号';
comment on column CASEID.CASEID_BAK
  is '包件清单号';
comment on column CASEID.WH
  is '仓库';
comment on column CASEID.CONSK
  is '门店号';
comment on column CASEID.SHORTNAME
  is '门店名称';
comment on column CASEID.STATUS
  is '0：新增

1：收包

2：分包

5：待发确认

6：发送TMS
7：交包（配载）
8：装车
9：发运
';
comment on column CASEID.LOC
  is '包件暂存储位';
comment on column CASEID.QTY
  is '总数';
comment on column CASEID.AMT
  is '总码洋';
comment on column CASEID.NET
  is '总实洋';
comment on column CASEID.WEIGHT
  is '实际称重重量';
comment on column CASEID.NETWEIGHT
  is '理论重量';
comment on column CASEID.VOLUME
  is '体积';
comment on column CASEID.SUSR1
  is '扩展字段';
comment on column CASEID.SUSR2
  is '扩展字段';
comment on column CASEID.SUSR3
  is '扩展字段';
comment on column CASEID.SUSR4
  is '扩展字段';
comment on column CASEID.SUSR5
  is '扩展字段';
comment on column CASEID.ADDDATE
  is '新增时间';
comment on column CASEID.ADDWHO
  is '新增人';
comment on column CASEID.EDITDATE
  is '修改时间';
comment on column CASEID.EDITWHO
  is '修改人';
comment on column CASEID.BOX_WGT
  is '理论箱重量';
comment on column CASEID.SEND_USER
  is '交包人';
comment on column CASEID.SEND_DATE
  is '交包时间';
comment on column CASEID.REC_USER
  is '收包人';
comment on column CASEID.REC_DATE
  is '收包时间';
comment on column CASEID.DIVEDE_USER
  is '分包人';
comment on column CASEID.DIVIDE_DATE
  is '分包时间';
comment on column CASEID.MERGE_USER
  is '并包人';
comment on column CASEID.MERGE_DATE
  is '并包时间';
comment on column CASEID.CONFIRM_USER
  is '待发确认人';
comment on column CASEID.CONFIRM_DATE
  is '待发确时间';
comment on column CASEID.LOAD_USER
  is '装车人';
comment on column CASEID.LOAD_DATE
  is '装车时间';
comment on column CASEID.SHIP_USER
  is '发运人';
comment on column CASEID.SHIP_DATE
  is '发运时间';
comment on column CASEID.IS_MERGE
  is '是否并包';
alter table CASEID
  add constraint CASEID_PK primary key (CASEID, CASEID_BAK);
create unique index PK_SYS_CASEID on CASEID (CASEID, CASEID_BAK)
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CASEMANIFEST
prompt ===========================
prompt
create table CASEMANIFEST
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  CASEID              VARCHAR2(20) not null,
  STORERKEY           VARCHAR2(15) default ' ' not null,
  SKU                 VARCHAR2(50) default ' ' not null,
  LOC                 VARCHAR2(10) default 'UNKNOWN' not null,
  STATUS              VARCHAR2(10) default '0' not null,
  EXPECTEDRECEIPTKEY  VARCHAR2(10) default ' ' not null,
  EXPECTEDPOKEY       VARCHAR2(18) default ' ' not null,
  RECEIVEDRECEIPTKEY  VARCHAR2(10) default ' ' not null,
  RECEIVEDPOKEY       VARCHAR2(18) default ' ' not null,
  RECEIPTDATE         DATE default SYSDATE not null,
  EXPECTEDCLPORDERKEY VARCHAR2(10) default ' ' not null,
  SHIPPEDCLPORDERKEY  VARCHAR2(10) default ' ' not null,
  QTY                 NUMBER(22,5) default 0 not null,
  SHIPSTATUS          VARCHAR2(10) default '0' not null,
  SHIPDATE            DATE default SYSDATE not null,
  OSDCODE             VARCHAR2(10) default ' ' not null,
  OSDQTY              NUMBER(22,5) default 0 not null,
  ID                  VARCHAR2(18) default ' ' not null,
  ADDDATE             DATE default SYSDATE not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  EDITDATE            DATE default SYSDATE not null,
  EDITWHO             VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CASEMANIFEST
  add constraint PK_SYS_C004615 primary key (CASEID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CASEMANIFEST
  add foreign key (LOC)
  references LOC (LOC);
alter table CASEMANIFEST
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
alter table CASEMANIFEST
  add check (((NOT(CASEID = ' '))));
alter table CASEMANIFEST
  add check (STATUS >= '0' AND STATUS <= '9');
alter table CASEMANIFEST
  add check (SHIPSTATUS >= '0' AND SHIPSTATUS <= '9');
create unique index CASEM_58 on CASEMANIFEST (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CC
prompt =================
prompt
create table CC
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  CCKEY         VARCHAR2(10) not null,
  STORERKEY     VARCHAR2(15) default ' ' not null,
  SKU           VARCHAR2(50) default ' ' not null,
  LOC           VARCHAR2(10) default ' ' not null,
  TASKDETAILKEY VARCHAR2(10) default ' ' not null,
  STATUS        VARCHAR2(10) default '0' not null,
  CCADJREASON   VARCHAR2(10) default '0' not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CC
  add constraint PK_SYS_C004618 primary key (CCKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index CC_59 on CC (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_CC_STATUS on CC (STATUS)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_CC_TASKDETAILKEY on CC (TASKDETAILKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CCADJRULES
prompt =========================
prompt
create table CCADJRULES
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  CCADJRULEKEY VARCHAR2(10) not null,
  DESCR        VARCHAR2(50) default ' ' not null,
  POSADJLOT    VARCHAR2(10) default '0' not null,
  POSADJLOT04  VARCHAR2(10) default '0' not null,
  POSADJLOT05  VARCHAR2(10) default '0' not null,
  QTYGTRZERO   VARCHAR2(1) default '0' not null,
  NEGADJLOT    VARCHAR2(10) default '0' not null,
  NEGADJLOT04  VARCHAR2(10) default '0' not null,
  NEGADJLOT05  VARCHAR2(10) default '0' not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CCADJRULES
  add constraint PK_SYS_C004820 primary key (CCADJRULEKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CCDETAIL
prompt =======================
prompt
create table CCDETAIL
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  CCKEY       VARCHAR2(10) not null,
  CCDETAILKEY VARCHAR2(10) not null,
  STORERKEY   VARCHAR2(15) default ' ' not null,
  SKU         VARCHAR2(50) default ' ' not null,
  LOT         VARCHAR2(10) default ' ' not null,
  LOC         VARCHAR2(10) default ' ' not null,
  ID          VARCHAR2(18) default ' ' not null,
  QTY         NUMBER(22,5) default 0 not null,
  SYSQTY      NUMBER(22,5) default 0 not null,
  ADJQTY      NUMBER(22,5) default 0 not null,
  STATUS      VARCHAR2(10) default '0' not null,
  STATUSMSG   VARCHAR2(255) default ' ' not null,
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CCDETAIL
  add constraint PK_SYS_C004616 primary key (CCDETAILKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index CCDET_60 on CCDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CCGEN
prompt ====================
prompt
create table CCGEN
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  CCGENKEY    VARCHAR2(1),
  MAXCNTS     NUMBER(10) default 0,
  SHOWQTY     VARCHAR2(1) default '0' not null,
  REQUESTONLY VARCHAR2(1) default '0',
  BALCHANGE   NUMBER(22,5) default 0,
  QTYLESSTHAN NUMBER(22,5) default 0,
  CCEXLOC     VARCHAR2(1) default '0',
  INCLZEROCNT VARCHAR2(1) default '0' not null,
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index CCGEN_61 on CCGEN (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CCLST
prompt ====================
prompt
create table CCLST
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  REQUESTKEY     VARCHAR2(10) not null,
  PROCESSFLAG    VARCHAR2(1) default '0' not null,
  STORERKEYSTART VARCHAR2(15) default '0' not null,
  STORERKEYEND   VARCHAR2(15) default 'ZZZZZZZZZZZZZZZ' not null,
  SKUSTART       VARCHAR2(50) default '0' not null,
  SKUEND         VARCHAR2(50) default 'ZZZZZZZZZZZZZZZZZZZZ' not null,
  LOCSTART       VARCHAR2(10) default '0' not null,
  LOCEND         VARCHAR2(10) default 'ZZZZZZZZZZ' not null,
  LOCLEVELSTART  NUMBER(10) default 0 not null,
  LOCLEVELEND    NUMBER(10) default 99999 not null,
  ZONESTART      VARCHAR2(10) default '0' not null,
  ZONEEND        VARCHAR2(10) default 'ZZZZZZZZZZ' not null,
  AREASTART      VARCHAR2(10) default '0' not null,
  AREAEND        VARCHAR2(10) default 'ZZZZZZZZZZ' not null,
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CCLST
  add constraint PK_SYS_C004819 primary key (REQUESTKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index CCLST_62 on CCLST (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CCRELEASEHISTORY
prompt ===============================
prompt
create table CCRELEASEHISTORY
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  STORERKEY   VARCHAR2(15) not null,
  SKU         VARCHAR2(50) not null,
  LOC         VARCHAR2(10) not null,
  RELEASEDATE DATE default SYSDATE not null,
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CCSETUP
prompt ======================
prompt
create table CCSETUP
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  CLASSID   VARCHAR2(1) not null,
  CLASSDESC VARCHAR2(30),
  CYCLEDAYS NUMBER(10) default 0 not null,
  POSCNTCHG NUMBER(22,5) default 0 not null,
  NEGCNTCHG NUMBER(22,5) default 0 not null,
  POSDOLCHG NUMBER(22,5) default 0 not null,
  NEGDOLCHG NUMBER(22,5) default 0 not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CCSETUP
  add constraint PK_SYS_C004617 primary key (CLASSID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index CCSET_63 on CCSETUP (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHARTOFACCOUNTS
prompt ==============================
prompt
create table CHARTOFACCOUNTS
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  CHARTOFACCOUNTSKEY VARCHAR2(30) not null,
  DESCRIP            VARCHAR2(30) default ' ' not null,
  SUPPORTFLAG        VARCHAR2(1) default 'A' not null,
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CHARTOFACCOUNTS
  add constraint PK_SYS_C004619 primary key (CHARTOFACCOUNTSKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CHARTOFACCOUNTS
  add check (SUPPORTFLAG = 'D' OR (SUPPORTFLAG = 'I' OR SUPPORTFLAG = 'A'));
create unique index CHART_64 on CHARTOFACCOUNTS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHERRYPICKREPLEN_LOCK
prompt ====================================
prompt
create table CHERRYPICKREPLEN_LOCK
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  PTCID     VARCHAR2(10) not null,
  STORERKEY VARCHAR2(15) not null,
  SKU       VARCHAR2(50) not null,
  FROMLOC   VARCHAR2(10) not null,
  TOLOC     VARCHAR2(10) not null,
  LOT       VARCHAR2(10) not null,
  ID        VARCHAR2(18) not null,
  STATUS    VARCHAR2(1) default '0' not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index CHERR_65 on CHERRYPICKREPLEN_LOCK (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CLASSTOZONE
prompt ==========================
prompt
create table CLASSTOZONE
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER not null,
  SKUGROUP  VARCHAR2(10) not null,
  AISLEWAY  VARCHAR2(10) not null,
  ZONE      VARCHAR2(10) not null,
  SUSR1     VARCHAR2(30),
  SUSR2     VARCHAR2(30),
  SUSR3     VARCHAR2(30),
  SUSR4     VARCHAR2(30),
  SUSR5     VARCHAR2(30),
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column CLASSTOZONE.SKUGROUP
  is '商品大类';
comment on column CLASSTOZONE.AISLEWAY
  is '走道，第0区域时使用';
comment on column CLASSTOZONE.ZONE
  is '区域';
alter table CLASSTOZONE
  add constraint PK_SYS_CLASSTOZONE primary key (SKUGROUP, ZONE, AISLEWAY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index CLASSTOZONE_001 on CLASSTOZONE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PODETAIL
prompt =======================
prompt
create table PODETAIL
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  POKEY           VARCHAR2(18) not null,
  POLINENUMBER    VARCHAR2(5) not null,
  STORERKEY       VARCHAR2(15) not null,
  PODETAILKEY     VARCHAR2(10) default ' ',
  EXTERNPOKEY     VARCHAR2(20) default ' ',
  EXTERNLINENO    VARCHAR2(20) default ' ',
  MARKSCONTAINER  VARCHAR2(18) default ' ',
  SKU             VARCHAR2(50) default ' ',
  SKUDESCRIPTION  VARCHAR2(60) default ' ',
  MANUFACTURERSKU VARCHAR2(50) default ' ',
  RETAILSKU       VARCHAR2(50) default ' ',
  ALTSKU          VARCHAR2(50) default ' ',
  QTYORDERED      NUMBER(22,5) default 0,
  QTYADJUSTED     NUMBER(22,5) default 0,
  QTYRECEIVED     NUMBER(22,5) default 0,
  PACKKEY         VARCHAR2(50) default 'STD' not null,
  UNITPRICE       NUMBER(22,5) default 0,
  UOM             VARCHAR2(10) default ' ',
  EFFECTIVEDATE   DATE default SYSDATE not null,
  FORTE_FLAG      VARCHAR2(6) default 'I' not null,
  ITEM_NUMBER     NUMBER(10) default 0,
  SKU_WGT         NUMBER(22,5) default 0 not null,
  SKU_CUBE        NUMBER(22,5) default 0 not null,
  SKU_HGT         NUMBER(22,5) default 0 not null,
  UNIT_COST       NUMBER(22,5) default 0 not null,
  UNIT_SHIP       NUMBER(22,5) default 0 not null,
  SUSR1           VARCHAR2(30),
  SUSR2           VARCHAR2(30),
  SUSR3           VARCHAR2(30),
  SUSR4           VARCHAR2(30),
  SUSR5           VARCHAR2(30),
  QTYREJECTED     NUMBER(22,5) default 0 not null,
  STATUS          VARCHAR2(2) default '0' not null,
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null,
  NOTES           VARCHAR2(2000)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PODETAIL
  add constraint PK_SYS_C004740 primary key (POKEY, POLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PODETAIL
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
alter table PODETAIL
  add constraint CK_PODETAIL_STATUS
  check (TO_NUMBER(STATUS) >= 0 AND TO_NUMBER(STATUS) <= 20);
create unique index PODET_208 on PODETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CLPDETAIL
prompt ========================
prompt
create table CLPDETAIL
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  CLPORDERKEY        VARCHAR2(10) not null,
  CLPORDERLINENUMBER VARCHAR2(5) not null,
  POKEY              VARCHAR2(18) not null,
  POLINENUMBER       VARCHAR2(5) not null,
  QTY                NUMBER(22,5) not null,
  CASEID             VARCHAR2(20) not null,
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CLPDETAIL
  add constraint PK_SYS_C004620 primary key (CLPORDERKEY, CLPORDERLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CLPDETAIL
  add foreign key (POKEY, POLINENUMBER)
  references PODETAIL (POKEY, POLINENUMBER);
create unique index CLPDE_66 on CLPDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CLPORDER
prompt =======================
prompt
create table CLPORDER
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  CLPORDERKEY VARCHAR2(10) not null,
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CLPORDER
  add constraint PK_SYS_C004621 primary key (CLPORDERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index CLPOR_67 on CLPORDER (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CO
prompt =================
prompt
create table CO
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  CO_ID                   VARCHAR2(24) not null,
  CO_TYPE                 VARCHAR2(10),
  CO_TYPE_DESC            VARCHAR2(50),
  ROUTE_ID                VARCHAR2(10),
  LOADID                  NUMBER(10),
  STOP_ID                 VARCHAR2(10),
  DOCK_STORER_ID          VARCHAR2(15),
  CDLKUP_DOCK_STORER_TYPE VARCHAR2(10),
  DC_ID                   VARCHAR2(10) default ' ',
  WHSE_ID                 VARCHAR2(15) default ' ',
  DELIVERY_DATE           DATE default SYSDATE,
  TOTAL_WEIGHT            NUMBER(22,5) default 0,
  TOTAL_CUBE              NUMBER(22,5) default 0,
  TOTAL_UNITS             NUMBER(22,5) default 0,
  DOOR_ID                 VARCHAR2(10) default ' ',
  SPLIT_ORDERS            VARCHAR2(1) default '0',
  STG_PT_ID               VARCHAR2(10) default ' ',
  CDLKUP_CO_APPT_STATUS   VARCHAR2(10),
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CO
  add constraint PK_SYS_C004630 primary key (CO_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index CO_68 on CO (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table COD
prompt ==================
prompt
create table COD
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  CO_ID          VARCHAR2(24) not null,
  COD_ID         VARCHAR2(10) not null,
  WHSE_ID        VARCHAR2(15) default ' ',
  PRODUCT_SKU    VARCHAR2(50) default ' ',
  ORDER_QTY      NUMBER(22,5) default 0,
  SHIPPED_QTY    NUMBER(22,5) default 0,
  LOT            VARCHAR2(15) default ' ',
  PACK           VARCHAR2(50) default ' ',
  SUB_FLAG       VARCHAR2(1) default ' ',
  PRODUCT_DESC   VARCHAR2(50) default ' ',
  PALLET_ID      VARCHAR2(18) default ' ',
  PRODUCT_CUBE   NUMBER(22,5) default 0,
  PRODUCT_WEIGHT NUMBER(22,5) default 0,
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table COD
  add constraint PK_SYS_C004624 primary key (CO_ID, COD_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table COD
  add foreign key (CO_ID)
  references CO (CO_ID);
create unique index COD_69 on COD (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CODELIST
prompt =======================
prompt
create table CODELIST
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  LISTNAME    VARCHAR2(10) not null,
  DESCRIPTION VARCHAR2(60),
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CODELIST
  add constraint PK_SYS_C004622 primary key (LISTNAME)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index CODEL_70 on CODELIST (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CODELKUP
prompt =======================
prompt
create table CODELKUP
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  LISTNAME    VARCHAR2(10) not null,
  CODE        VARCHAR2(10) not null,
  DESCRIPTION VARCHAR2(250),
  SHORT       VARCHAR2(10),
  LONG_VALUE  VARCHAR2(250),
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null,
  NOTES       VARCHAR2(2000)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CODELKUP
  add constraint PK_SYS_C004623 primary key (LISTNAME, CODE)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CODELKUP
  add foreign key (LISTNAME)
  references CODELIST (LISTNAME);
create unique index CODEL_71 on CODELKUP (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CONDITIONALVALIDATION
prompt ====================================
prompt
create table CONDITIONALVALIDATION
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  VALIDATIONKEY    VARCHAR2(10) not null,
  STORERKEY        VARCHAR2(15) default ' ' not null,
  SKU              VARCHAR2(50) default ' ' not null,
  CONSIGNEEKEY     VARCHAR2(15) default ' ' not null,
  TYPE             VARCHAR2(5) not null,
  ACTIVE           NUMBER(10) default 0 not null,
  MINIMUMSHELFLIFE NUMBER(10) default 0 not null,
  ISDEFAULT        VARCHAR2(1) default 'N' not null,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONDITIONALVALIDATION
  add constraint PK_SYS_C004626 primary key (VALIDATIONKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONDITIONALVALIDATION
  add unique (SKU, STORERKEY, CONSIGNEEKEY, TYPE)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONDITIONALVALIDATION
  add check (TYPE = 'ALLOC' OR (TYPE = 'SHIP' OR TYPE = 'PICK'));
create unique index CONDI_72 on CONDITIONALVALIDATION (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CONDITIONALVALIDATIONDETAIL
prompt ==========================================
prompt
create table CONDITIONALVALIDATIONDETAIL
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  VALIDATIONKEY     VARCHAR2(10) not null,
  SEQ               NUMBER(10) not null,
  VALIDATIONROUTINE VARCHAR2(40) not null,
  ACTIVE            NUMBER(10) default 0 not null,
  TMPICK            VARCHAR2(1) default 'N' not null,
  REGRFPICK         VARCHAR2(1) default 'N' not null,
  DYNPICK           VARCHAR2(1) default 'N' not null,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONDITIONALVALIDATIONDETAIL
  add constraint PK_SYS_C004625 primary key (VALIDATIONKEY, SEQ)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONDITIONALVALIDATIONDETAIL
  add foreign key (VALIDATIONKEY)
  references CONDITIONALVALIDATION (VALIDATIONKEY);
create unique index CONDI_73 on CONDITIONALVALIDATIONDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CONSOLIDATIONINFO
prompt ================================
prompt
create table CONSOLIDATIONINFO
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  WAVEKEY          VARCHAR2(10),
  STORERKEY        VARCHAR2(15),
  SKU              VARCHAR2(50),
  ORDERTYPE        VARCHAR2(10),
  CONSOLLOC        VARCHAR2(10),
  MAXLOCQTY        NUMBER(22,5),
  WAVETOTAL        NUMBER(22,5),
  MINWAVEQTY       NUMBER(22,5),
  PICKPIECE        VARCHAR2(10),
  PICKCASE         VARCHAR2(10),
  UPDATESKUXLOCFLG NUMBER(10) default 0
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index CONSO_74 on CONSOLIDATIONINFO (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CONTAINER
prompt ========================
prompt
create table CONTAINER
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  CONTAINERKEY     VARCHAR2(20) not null,
  STATUS           VARCHAR2(10) default '0' not null,
  VESSEL           VARCHAR2(30) default ' ',
  VOYAGE           VARCHAR2(30) default ' ',
  CARRIERKEY       VARCHAR2(15),
  CARRIERAGENT     VARCHAR2(30),
  ETA              DATE,
  ETADESTINATION   DATE,
  BOOKINGREFERENCE VARCHAR2(30),
  OTHERREFERENCE   VARCHAR2(30),
  SEAL01           VARCHAR2(30) default ' ' not null,
  SEAL02           VARCHAR2(30) default ' ' not null,
  SEAL03           VARCHAR2(30) default ' ' not null,
  CONTAINERTYPE    VARCHAR2(10) default ' ',
  EFFECTIVEDATE    DATE default SYSDATE not null,
  FORTE_FLAG       VARCHAR2(6) default 'I' not null,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONTAINER
  add constraint PK_SYS_C004629 primary key (CONTAINERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONTAINER
  add check (STATUS = '9' OR STATUS = '0');
create unique index CONTA_75 on CONTAINER (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CONTAINERBILLING
prompt ===============================
prompt
create table CONTAINERBILLING
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  CONTAINERBILLINGKEY VARCHAR2(10) not null,
  DOCTYPE             VARCHAR2(10) default 'ASN' not null,
  CONTAINERTYPE       VARCHAR2(20) default ' ' not null,
  DESCR               VARCHAR2(60) default ' ' not null,
  RATE                NUMBER(12,6) not null,
  BASE                VARCHAR2(1) default 'Q' not null,
  TAXGROUPKEY         VARCHAR2(10) default 'XXXXXXXXXX' not null,
  GLDISTRIBUTIONKEY   VARCHAR2(10) default 'XXXXXXXXXX' not null,
  COSTRATE            NUMBER(12,6) not null,
  ADDDATE             DATE default SYSDATE not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  EDITDATE            DATE default SYSDATE not null,
  EDITWHO             VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONTAINERBILLING
  add constraint PK_SYS_C004627 primary key (CONTAINERBILLINGKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONTAINERBILLING
  add check (DOCTYPE = 'CNT' OR (DOCTYPE = 'SO' OR DOCTYPE = 'ASN'));
alter table CONTAINERBILLING
  add check (BASE = 'R' OR (BASE = 'P' OR (BASE = 'F' OR (BASE = 'C' OR (BASE = 'G' OR BASE = 'Q')))));
create unique index CONTA_76 on CONTAINERBILLING (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PALLET
prompt =====================
prompt
create table PALLET
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  PALLETKEY     VARCHAR2(10) not null,
  STORERKEY     VARCHAR2(15) default ' ' not null,
  STATUS        VARCHAR2(10) default '0' not null,
  EFFECTIVEDATE DATE default SYSDATE not null,
  FORTE_FLAG    VARCHAR2(6) default 'I' not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PALLET
  add constraint PK_SYS_C004715 primary key (PALLETKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PALLET
  add check (STATUS = '9' OR STATUS = '0');
create unique index PALLE_178 on PALLET (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CONTAINERDETAIL
prompt ==============================
prompt
create table CONTAINERDETAIL
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  CONTAINERKEY        VARCHAR2(20) not null,
  CONTAINERLINENUMBER VARCHAR2(5) not null,
  PALLETKEY           VARCHAR2(10) not null,
  EFFECTIVEDATE       DATE default SYSDATE not null,
  FORTE_FLAG          VARCHAR2(6) default 'I' not null,
  ADDDATE             DATE default SYSDATE not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  EDITDATE            DATE default SYSDATE not null,
  EDITWHO             VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONTAINERDETAIL
  add constraint PK_SYS_C004628 primary key (CONTAINERKEY, CONTAINERLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONTAINERDETAIL
  add foreign key (PALLETKEY)
  references PALLET (PALLETKEY);
create unique index CONTA_77 on CONTAINERDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DEMANDALLOCATION
prompt ===============================
prompt
create table DEMANDALLOCATION
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  LOT               VARCHAR2(10),
  LOC               VARCHAR2(10),
  ID                VARCHAR2(18),
  STORERKEY         VARCHAR2(15) not null,
  SKU               VARCHAR2(50) not null,
  PACKKEY           VARCHAR2(50),
  UOM               VARCHAR2(10) not null,
  QTYALLOCATED      NUMBER(22,5) default 0 not null,
  QTYPREALLOCATED   NUMBER(22,5) default 0 not null,
  QTYPICKINPROCESS  NUMBER(22,5) default 0,
  ORDERKEY          VARCHAR2(10) not null,
  ORDERLINENUMBER   VARCHAR2(5) not null,
  ALLOCSTRATEGYTYPE VARCHAR2(1),
  DEMANDKEY         VARCHAR2(10) not null,
  SKUROTATION       VARCHAR2(10),
  CARTONIZEDQTY     NUMBER(22,5),
  USERID            VARCHAR2(20),
  CLEANOUTLOC       VARCHAR2(10),
  LOCATIONTYPE      VARCHAR2(10) default ' ',
  ROTATION          VARCHAR2(1) default '1',
  SHELFLIFE         NUMBER(10) default 0,
  DATECODEDAYS      NUMBER(10) default 0,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DEMANDALLOCATION
  add constraint PK_SYS_C004633 primary key (DEMANDKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index DEMAN_80 on DEMANDALLOCATION (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_DEMANDALLOCATION_ORDERKEY on DEMANDALLOCATION (ORDERKEY, ORDERLINENUMBER)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DOCKPO
prompt =====================
prompt
create table DOCKPO
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  PO_ID                   VARCHAR2(24) not null,
  PICKUP_DATE             DATE default SYSDATE,
  SHIP_DATE               DATE default SYSDATE,
  DELIVERY_DATE           DATE default SYSDATE,
  PO_TYPE                 VARCHAR2(10) default ' ',
  PO_TYPE_DESC            VARCHAR2(50) default ' ',
  DOCK_STORER_ID          VARCHAR2(15),
  CDLKUP_DOCK_STORER_TYPE VARCHAR2(10),
  DC_ID                   VARCHAR2(15) default ' ',
  WHSE_ID                 VARCHAR2(15) default ' ',
  ASN_ID                  VARCHAR2(30),
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DOCKPO
  add constraint PK_SYS_C004634 primary key (PO_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index DOCKP_81 on DOCKPO (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DOCK_PTWY_RULES
prompt ==============================
prompt
create table DOCK_PTWY_RULES
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  DOCK_PTWY_ID   VARCHAR2(10) not null,
  DOCK_PTWY_DESC VARCHAR2(50) not null,
  TO_LOC         VARCHAR2(50) default ' ' not null,
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index DOCK__82 on DOCK_PTWY_RULES (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DOCK_STORER
prompt ==========================
prompt
create table DOCK_STORER
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  DOCK_STORER_ID          VARCHAR2(15) not null,
  CDLKUP_DOCK_STORER_TYPE VARCHAR2(10) not null,
  DOCK_STORER_DESC        VARCHAR2(50) not null,
  ADDRESS1                VARCHAR2(50),
  ADDRESS2                VARCHAR2(50),
  ADDRESS3                VARCHAR2(50),
  ADDRESS4                VARCHAR2(50),
  CITY                    VARCHAR2(50),
  STATE                   VARCHAR2(50),
  ZIP                     VARCHAR2(18),
  COUNTRY                 VARCHAR2(50),
  ISOCNTRYCODE            VARCHAR2(10),
  CONTACT_NAME1           VARCHAR2(50) default ' ',
  CONTACT_NAME2           VARCHAR2(50) default ' ',
  TITLE1                  VARCHAR2(50),
  TITLE2                  VARCHAR2(50),
  PHONE1                  VARCHAR2(18) default ' ',
  PHONE2                  VARCHAR2(18) default ' ',
  FAX1                    VARCHAR2(18),
  FAX2                    VARCHAR2(18),
  EMAIL1                  VARCHAR2(50),
  EMAIL2                  VARCHAR2(50),
  SCAC_CODE               VARCHAR2(4),
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DOCK_STORER
  add constraint PK_SYS_C004635 primary key (DOCK_STORER_ID, CDLKUP_DOCK_STORER_TYPE)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index DOCK__83 on DOCK_STORER (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DOOR_ASGN_RULES
prompt ==============================
prompt
create table DOOR_ASGN_RULES
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  DOOR_ASGN_ID       VARCHAR2(15) not null,
  DOOR_ASGN_DESC     VARCHAR2(50) not null,
  CDLKUP_APPT_ACTION VARCHAR2(10) default ' ' not null,
  CDLKUP_DAYOFWEEK   VARCHAR2(10) default ' ' not null,
  ASGN_TIME          VARCHAR2(4) not null,
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DOOR_ASGN_RULES
  add constraint PK_SYS_C004636 primary key (DOOR_ASGN_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index DOOR__85 on DOOR_ASGN_RULES (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DOOR_ASOC_RULES
prompt ==============================
prompt
create table DOOR_ASOC_RULES
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  DOOR_ASGN_ID VARCHAR2(15) not null,
  DOOR_ID      VARCHAR2(10) not null,
  WHSE_ID      VARCHAR2(15) not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DOOR_ASOC_RULES
  add constraint PK_SYS_C004637 primary key (DOOR_ASGN_ID, DOOR_ID, WHSE_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DOOR_ASOC_RULES
  add foreign key (DOOR_ID, WHSE_ID)
  references DOOR (DOOR_ID, WHSE_ID);
alter table DOOR_ASOC_RULES
  add foreign key (DOOR_ASGN_ID)
  references DOOR_ASGN_RULES (DOOR_ASGN_ID);
create unique index DOOR__86 on DOOR_ASOC_RULES (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DOOR_LOADTYPE
prompt ============================
prompt
create table DOOR_LOADTYPE
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  LOAD_TYPE_ID VARCHAR2(10) not null,
  DOOR_ID      VARCHAR2(10) not null,
  WHSE_ID      VARCHAR2(15) default ' ' not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DOOR_LOADTYPE
  add constraint PK_SYS_C004639 primary key (LOAD_TYPE_ID, DOOR_ID, WHSE_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DOOR_LOADTYPE
  add foreign key (DOOR_ID, WHSE_ID)
  references DOOR (DOOR_ID, WHSE_ID);
alter table DOOR_LOADTYPE
  add foreign key (LOAD_TYPE_ID)
  references LOAD_TYPE (LOAD_TYPE_ID);
create unique index DOOR__87 on DOOR_LOADTYPE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table EQPT_CATEGORY
prompt ============================
prompt
create table EQPT_CATEGORY
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  EQPT_CATEGORY_ID   VARCHAR2(10) not null,
  EQPT_CATEGORY_DESC VARCHAR2(50) not null,
  CUBIC_CAPACITY     NUMBER(22,5) default 0,
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EQPT_CATEGORY
  add constraint PK_SYS_C004645 primary key (EQPT_CATEGORY_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index EQPT__94 on EQPT_CATEGORY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RESTRICTIONS
prompt ===========================
prompt
create table RESTRICTIONS
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  RSTRC_ID         VARCHAR2(15) not null,
  RSTRC_DESC       VARCHAR2(50) not null,
  EQPT_CLASS_ID    VARCHAR2(10) not null,
  EQPT_CATEGORY_ID VARCHAR2(10) not null,
  ADDDATE          DATE default SYSDATE,
  ADDWHO           VARCHAR2(18) default ' ',
  EDITDATE         DATE default SYSDATE,
  EDITWHO          VARCHAR2(18) default ' '
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RESTRICTIONS
  add constraint PK_SYS_C004759 primary key (RSTRC_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RESTRICTIONS
  add foreign key (EQPT_CATEGORY_ID)
  references EQPT_CATEGORY (EQPT_CATEGORY_ID);
create unique index RESTR_235 on RESTRICTIONS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DOOR_RESTRICTIONS
prompt ================================
prompt
create table DOOR_RESTRICTIONS
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  RSTRC_ID  VARCHAR2(15) not null,
  DOOR_ID   VARCHAR2(10) not null,
  WHSE_ID   VARCHAR2(15) not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DOOR_RESTRICTIONS
  add constraint PK_SYS_C004640 primary key (RSTRC_ID, DOOR_ID, WHSE_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DOOR_RESTRICTIONS
  add foreign key (DOOR_ID, WHSE_ID)
  references DOOR (DOOR_ID, WHSE_ID);
alter table DOOR_RESTRICTIONS
  add foreign key (RSTRC_ID)
  references RESTRICTIONS (RSTRC_ID);
create unique index DOOR__88 on DOOR_RESTRICTIONS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STAGING_POINT
prompt ============================
prompt
create table STAGING_POINT
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  STG_PT_ID   VARCHAR2(10) not null,
  WHSE_ID     VARCHAR2(15) not null,
  STG_PT_DESC VARCHAR2(50) not null,
  ADDDATE     DATE default SYSDATE,
  ADDWHO      VARCHAR2(18) default ' ',
  EDITDATE    DATE default SYSDATE,
  EDITWHO     VARCHAR2(18) default ' '
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STAGING_POINT
  add constraint PK_SYS_C004771 primary key (STG_PT_ID, WHSE_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index STAGI_250 on STAGING_POINT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DOOR_STAGINGPOINT
prompt ================================
prompt
create table DOOR_STAGINGPOINT
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  DOOR_ID   VARCHAR2(10) not null,
  STG_PT_ID VARCHAR2(10) not null,
  WHSE_ID   VARCHAR2(15) default ' ' not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DOOR_STAGINGPOINT
  add constraint PK_SYS_C004641 primary key (DOOR_ID, STG_PT_ID, WHSE_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DOOR_STAGINGPOINT
  add foreign key (DOOR_ID, WHSE_ID)
  references DOOR (DOOR_ID, WHSE_ID);
alter table DOOR_STAGINGPOINT
  add foreign key (STG_PT_ID, WHSE_ID)
  references STAGING_POINT (STG_PT_ID, WHSE_ID);
create unique index DOOR__89 on DOOR_STAGINGPOINT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DROPID
prompt =====================
prompt
create table DROPID
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  DROPID          VARCHAR2(18) default ' ' not null,
  DROPLOC         VARCHAR2(10) default ' ' not null,
  ADDITIONALLOC   VARCHAR2(30) default ' ' not null,
  DROPIDTYPE      VARCHAR2(10) default '0' not null,
  LABELPRINTED    VARCHAR2(10) default '0' not null,
  MANIFESTPRINTED VARCHAR2(10) default '0' not null,
  STATUS          VARCHAR2(10) default '0' not null,
  ISCLOSED        VARCHAR2(1) default 'N' not null,
  QCSTATUS        VARCHAR2(10) default 'P' not null,
  DRUDF1          VARCHAR2(10),
  DRUDF2          VARCHAR2(10),
  DRUDF3          VARCHAR2(10),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DROPID
  add constraint PK_SYS_C004643 primary key (DROPID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index DROPI_90 on DROPID (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DROPIDDETAIL
prompt ===========================
prompt
create table DROPIDDETAIL
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  DROPID    VARCHAR2(18) default ' ' not null,
  CHILDID   VARCHAR2(18) default ' ' not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null,
  IDTYPE    VARCHAR2(10)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DROPIDDETAIL
  add constraint PK_SYS_C004642 primary key (DROPID, CHILDID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index DROPI_91 on DROPIDDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DTX_ERROR_LOG
prompt ============================
prompt
create table DTX_ERROR_LOG
(
  TID        VARCHAR2(15),
  TYPE       VARCHAR2(20),
  TABLENAME  VARCHAR2(40),
  KEYNO      VARCHAR2(20),
  LINEID     VARCHAR2(20),
  DATETIME   DATE,
  USERID     VARCHAR2(20),
  ERROR_TYPE VARCHAR2(100),
  ERROR_DESC VARCHAR2(300),
  STATUS     VARCHAR2(2),
  NOTE       VARCHAR2(200),
  ADDDATE    DATE
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table EDI_APPT_DATA
prompt ============================
prompt
create table EDI_APPT_DATA
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  EDI_APPTDATA_ID   VARCHAR2(10) not null,
  EDI_APPTDATA_DESC VARCHAR2(50) not null,
  PO_ID             VARCHAR2(24) default ' ' not null,
  DELIVERY_DATE     DATE default SYSDATE not null,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index EDI_A_93 on EDI_APPT_DATA (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table EQPT_CLASS
prompt =========================
prompt
create table EQPT_CLASS
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  EQPT_CLASS_ID   VARCHAR2(10) not null,
  EQPT_CLASS_DESC VARCHAR2(50) not null,
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EQPT_CLASS
  add constraint PK_SYS_C004646 primary key (EQPT_CLASS_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index EQPT__95 on EQPT_CLASS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table EQUIPMENTPROFILE
prompt ===============================
prompt
create table EQUIPMENTPROFILE
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  EQUIPMENTPROFILEKEY     VARCHAR2(10) default ' ' not null,
  DESCR                   VARCHAR2(60) default ' ' not null,
  MAXIMUMWEIGHT           NUMBER(22,5) default 9999999.0 not null,
  WEIGHTREDUCTIONPERLEVEL NUMBER(22,5) default 0.0 not null,
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EQUIPMENTPROFILE
  add constraint PK_SYS_C004647 primary key (EQUIPMENTPROFILEKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index EQUIP_96 on EQUIPMENTPROFILE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ERRLOG
prompt =====================
prompt
create table ERRLOG
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  LOGDATE     DATE default SYSDATE not null,
  USERID      VARCHAR2(30) default USER not null,
  ERRORID     NUMBER(10) not null,
  SYSTEMSTATE VARCHAR2(18),
  MODULE      VARCHAR2(250),
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null,
  ERRORTEXT   VARCHAR2(2000) not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ERRLO_97 on ERRLOG (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table EXELINK
prompt ======================
prompt
create table EXELINK
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  SOURCEROWKEY  NUMBER(10) not null,
  STATEMENTSEQ  NUMBER(10) not null,
  OPERATIONTYPE VARCHAR2(1) not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EXELINK
  add constraint PK_SYS_C004648 primary key (STATEMENTSEQ, SOURCEROWKEY, OPERATIONTYPE)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index EXELI_98 on EXELINK (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FACILITYNEST
prompt ===========================
prompt
create table FACILITYNEST
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  NESTID       INTEGER not null,
  NAME         VARCHAR2(20) not null,
  DESCRIPTION  VARCHAR2(50) not null,
  PARENTNESTID INTEGER,
  LEVELNUM     INTEGER not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index FACIL_99 on FACILITYNEST (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FORTEUPDATE
prompt ==========================
prompt
create table FORTEUPDATE
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  TABLENAME   VARCHAR2(30) not null,
  HEADERKEY   VARCHAR2(10) not null,
  DETAILKEY   VARCHAR2(20) default ' ' not null,
  STATUS      VARCHAR2(10),
  SKU         VARCHAR2(50),
  STORERKEY   VARCHAR2(20),
  POKEY       VARCHAR2(20),
  QTY         NUMBER(22,5),
  QTYRECEIVED NUMBER(22,5),
  QTYEXPECTED NUMBER(22,5),
  OPENQTY     NUMBER(22,5),
  ADJUSTEDQTY NUMBER(22,5),
  SHIPPEDQTY  NUMBER(22,5),
  FROMQTY     NUMBER(22,5),
  QTYORDERED  NUMBER(22,5)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FORTEUPDATE
  add constraint PK_SYS_C004649 primary key (TABLENAME, HEADERKEY, DETAILKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index FORTE_100 on FORTEUPDATE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FXRATE
prompt =====================
prompt
create table FXRATE
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  CURRENCYKEY    VARCHAR2(10) default ' ' not null,
  DESCRIP        VARCHAR2(30) default ' ' not null,
  BASECURRENCY   VARCHAR2(10) default 'USD' not null,
  TARGETCURRENCY VARCHAR2(10) default 'USD' not null,
  CONVERSIONRATE NUMBER(8,4) default 1.0 not null,
  FXDATE         DATE default SYSDATE not null,
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FXRATE
  add constraint PK_SYS_C004650 primary key (CURRENCYKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index FXRAT_101 on FXRATE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table GATE_EXCP_RULES
prompt ==============================
prompt
create table GATE_EXCP_RULES
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  GATE_EXCP_RLS_ID   VARCHAR2(10) not null,
  GATE_EXCP_RLS_DESC VARCHAR2(50) not null,
  PRINT_TAG          VARCHAR2(1) default '0' not null,
  ADDDATE            DATE default SYSDATE,
  ADDWHO             VARCHAR2(18) default ' ',
  EDITDATE           DATE default SYSDATE,
  EDITWHO            VARCHAR2(18) default ' '
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index GATE__102 on GATE_EXCP_RULES (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table GLDISTRIBUTIONDETAIL
prompt ===================================
prompt
create table GLDISTRIBUTIONDETAIL
(
  SERIALKEY                NUMBER not null,
  WHSEID                   VARCHAR2(30) default USER,
  GLDISTRIBUTIONKEY        VARCHAR2(10) not null,
  GLDISTRIBUTIONLINENUMBER VARCHAR2(5) default ' ' not null,
  CHARTOFACCOUNTSKEY       VARCHAR2(30) default 'XXXXXXXXXX' not null,
  GLDISTRIBUTIONPCT        NUMBER(12,6) default 0.0 not null,
  DESCRIP                  VARCHAR2(30) default ' ' not null,
  ADDDATE                  DATE default SYSDATE not null,
  ADDWHO                   VARCHAR2(30) default USER not null,
  EDITDATE                 DATE default SYSDATE not null,
  EDITWHO                  VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table GLDISTRIBUTIONDETAIL
  add constraint PK_SYS_C004651 primary key (GLDISTRIBUTIONKEY, GLDISTRIBUTIONLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table GLDISTRIBUTIONDETAIL
  add foreign key (CHARTOFACCOUNTSKEY)
  references CHARTOFACCOUNTS (CHARTOFACCOUNTSKEY);
alter table GLDISTRIBUTIONDETAIL
  add foreign key (GLDISTRIBUTIONKEY)
  references GLDISTRIBUTION (GLDISTRIBUTIONKEY);
create unique index GLDIS_104 on GLDISTRIBUTIONDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table GLOBALPREFS
prompt ==========================
prompt
create table GLOBALPREFS
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  GLOBALPREFID  NUMBER(10) not null,
  GLOBALPREFKEY VARCHAR2(32) not null,
  TYPE          VARCHAR2(16),
  VALUE         VARCHAR2(32),
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table GLOBALPREFS
  add constraint PK_SYS_C004653 primary key (GLOBALPREFID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index GLOBALPREFSU1 on GLOBALPREFS (GLOBALPREFKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index GLOBA_105 on GLOBALPREFS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table GLOC
prompt ===================
prompt
create table GLOC
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  GLOC_ID   VARCHAR2(20) not null,
  DC_LOC_ID VARCHAR2(15) default ' ' not null,
  GLOC_DESC VARCHAR2(50) not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table GLOC
  add constraint PK_SYS_C004654 primary key (GLOC_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table GLOC
  add foreign key (DC_LOC_ID)
  references DC_LOC (DC_LOC_ID);
create unique index GLOC_106 on GLOC (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table GLOC_RESTRICTIONS
prompt ================================
prompt
create table GLOC_RESTRICTIONS
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  RSTRC_ID  VARCHAR2(15) not null,
  GLOC_ID   VARCHAR2(20) not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table GLOC_RESTRICTIONS
  add constraint PK_SYS_C004655 primary key (RSTRC_ID, GLOC_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table GLOC_RESTRICTIONS
  add foreign key (GLOC_ID)
  references GLOC (GLOC_ID);
alter table GLOC_RESTRICTIONS
  add foreign key (RSTRC_ID)
  references RESTRICTIONS (RSTRC_ID);
create unique index GLOC__107 on GLOC_RESTRICTIONS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table GRAPHASSIGNMENT
prompt ==============================
prompt
create table GRAPHASSIGNMENT
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  FUNCTYPE      VARCHAR2(250),
  FUNCSUBTYPE   VARCHAR2(250),
  PARTITIONTYPE VARCHAR2(250),
  LOGICALUNIT   NUMBER(10)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table GRAPHASSIGNMENT
  add unique (FUNCTYPE, FUNCSUBTYPE)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index GRAPH_108 on GRAPHASSIGNMENT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HAZMATCODES
prompt ==========================
prompt
create table HAZMATCODES
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  HAZMATCODESKEY    VARCHAR2(10) not null,
  NMFCCODE          VARCHAR2(10),
  USDOTDESCRIPTION  VARCHAR2(255),
  UNCODE            VARCHAR2(10),
  UNCODEDESCRIPTION VARCHAR2(255),
  SUSR1             VARCHAR2(18),
  SUSR2             VARCHAR2(18),
  SUSR3             VARCHAR2(18),
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table HAZMATCODES
  add constraint PK_SYS_C004656 primary key (HAZMATCODESKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index HAZMA_109 on HAZMATCODES (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HAZMATXMSDS
prompt ==========================
prompt
create table HAZMATXMSDS
(
  SERIALKEY            NUMBER not null,
  WHSEID               VARCHAR2(30) default USER,
  HAZMATXMSDSKEY       VARCHAR2(10) not null,
  HAZMATCODESKEY       VARCHAR2(10),
  MSDSSHEETNUMBER      VARCHAR2(10),
  MSDSSHEETDESCRIPTION VARCHAR2(255),
  SUSR1                VARCHAR2(18),
  SUSR2                VARCHAR2(18),
  SUSR3                VARCHAR2(18),
  ADDDATE              DATE default SYSDATE not null,
  ADDWHO               VARCHAR2(30) default USER not null,
  EDITDATE             DATE default SYSDATE not null,
  EDITWHO              VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table HAZMATXMSDS
  add constraint PK_SYS_C004657 primary key (HAZMATXMSDSKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table HAZMATXMSDS
  add foreign key (HAZMATCODESKEY)
  references HAZMATCODES (HAZMATCODESKEY);
create unique index HAZMA_110 on HAZMATXMSDS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HAZMATXPLACARDS
prompt ==============================
prompt
create table HAZMATXPLACARDS
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  HAZMATXPLACARDSKEY VARCHAR2(10) not null,
  HAZMATCODESKEY     VARCHAR2(10),
  PLACARDID          VARCHAR2(10),
  PLACARDDESCRIPTION VARCHAR2(255),
  SUSR1              VARCHAR2(18),
  SUSR2              VARCHAR2(18),
  SUSR3              VARCHAR2(18),
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table HAZMATXPLACARDS
  add constraint PK_SYS_C004658 primary key (HAZMATXPLACARDSKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table HAZMATXPLACARDS
  add foreign key (HAZMATCODESKEY)
  references HAZMATCODES (HAZMATCODESKEY);
create unique index HAZMA_111 on HAZMATXPLACARDS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HELP
prompt ===================
prompt
create table HELP
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  TOPIC           VARCHAR2(64) default ' ' not null,
  CONTEXT         VARCHAR2(128) default ' ' not null,
  LANGID          NUMBER(10) default 0 not null,
  SHORTHELP       VARCHAR2(255) default ' ' not null,
  EXTENDEDHELPURL VARCHAR2(255) default ' ' not null,
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table HELP
  add constraint PK_SYS_C004659 primary key (TOPIC, CONTEXT, LANGID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index HELP_112 on HELP (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HIERROR
prompt ======================
prompt
create table HIERROR
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  HIERRORGROUP VARCHAR2(10) not null,
  ERRORTEXT    VARCHAR2(254) not null,
  ERRORTYPE    VARCHAR2(20) not null,
  SOURCEKEY    VARCHAR2(20) not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index HIERR_113 on HIERROR (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HOUSEAIRWAYBILL
prompt ==============================
prompt
create table HOUSEAIRWAYBILL
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  HAWBKEY                 VARCHAR2(15) not null,
  MAWBKEY                 VARCHAR2(15) default ' ' not null,
  CONSIGNEEKEY            VARCHAR2(15) default ' ' not null,
  C_CONTACT1              VARCHAR2(30),
  C_CONTACT2              VARCHAR2(30),
  C_COMPANY               VARCHAR2(30),
  C_ADDRESS1              VARCHAR2(30),
  C_ADDRESS2              VARCHAR2(30),
  C_ADDRESS3              VARCHAR2(30),
  C_ADDRESS4              VARCHAR2(30),
  C_CITY                  VARCHAR2(30),
  C_STATE                 VARCHAR2(2),
  C_ZIP                   VARCHAR2(18),
  C_COUNTRY               VARCHAR2(30),
  C_ISOCNTRYCODE          VARCHAR2(10),
  C_PHONE1                VARCHAR2(18),
  C_PHONE2                VARCHAR2(18),
  C_FAX1                  VARCHAR2(18),
  C_FAX2                  VARCHAR2(18),
  SHIPPERKEY              VARCHAR2(15) default ' ' not null,
  S_CONTACT1              VARCHAR2(30),
  S_CONTACT2              VARCHAR2(30),
  S_COMPANY               VARCHAR2(30),
  S_ADDRESS1              VARCHAR2(30),
  S_ADDRESS2              VARCHAR2(30),
  S_ADDRESS3              VARCHAR2(30),
  S_ADDRESS4              VARCHAR2(30),
  S_CITY                  VARCHAR2(30),
  S_STATE                 VARCHAR2(2),
  S_ZIP                   VARCHAR2(18),
  S_COUNTRY               VARCHAR2(30),
  S_ISOCNTRYCODE          VARCHAR2(10),
  S_PHONE1                VARCHAR2(18),
  S_PHONE2                VARCHAR2(18),
  S_FAX1                  VARCHAR2(18),
  S_FAX2                  VARCHAR2(18),
  AGENTKEY                VARCHAR2(15) default ' ' not null,
  A_CONTACT1              VARCHAR2(30),
  A_CONTACT2              VARCHAR2(30),
  A_COMPANY               VARCHAR2(30),
  A_ADDRESS1              VARCHAR2(30),
  A_ADDRESS2              VARCHAR2(30),
  A_ADDRESS3              VARCHAR2(30),
  A_ADDRESS4              VARCHAR2(30),
  A_CITY                  VARCHAR2(30),
  A_STATE                 VARCHAR2(2),
  A_ZIP                   VARCHAR2(18),
  A_COUNTRY               VARCHAR2(30),
  A_ISOCNTRYCODE          VARCHAR2(10),
  A_PHONE1                VARCHAR2(18),
  A_PHONE2                VARCHAR2(18),
  A_FAX1                  VARCHAR2(18),
  A_FAX2                  VARCHAR2(18),
  CURRENCY                VARCHAR2(10) default 'USD',
  WTVALPPD                VARCHAR2(10) default ' ',
  WTVALCOL                VARCHAR2(10) default ' ',
  OTHERPPD                VARCHAR2(10) default ' ',
  OTHERCOL                VARCHAR2(10) default ' ',
  DECLAREDVALUEFORCUSTOMS VARCHAR2(30) default 'AS PER INVOICE',
  PLACEOFLOADING          VARCHAR2(18) default ' ',
  ROUTETO01               VARCHAR2(18) default ' ',
  ROUTETO02               VARCHAR2(18) default ' ',
  ROUTETO03               VARCHAR2(18) default ' ',
  CARRIER01               VARCHAR2(18) default ' ',
  CARRIER02               VARCHAR2(18) default ' ',
  CARRIER03               VARCHAR2(18) default ' ',
  AIRPORTOFDESTINATION    VARCHAR2(18) default ' ',
  FLIGHTDATE01            VARCHAR2(18) default ' ' not null,
  FLIGHTDATE02            VARCHAR2(18) default ' ' not null,
  AMOUNTOFINSURANCE       VARCHAR2(18) default ' ' not null,
  CHARGEDESC01            VARCHAR2(10) default ' ' not null,
  PPDCHARGE01             NUMBER default 0 not null,
  COLLCHARGE01            NUMBER default 0 not null,
  CHARGEDESC02            VARCHAR2(10) default ' ' not null,
  PPDCHARGE02             NUMBER default 0 not null,
  COLLCHARGE02            NUMBER default 0 not null,
  CHARGEDESC03            VARCHAR2(10) default ' ' not null,
  PPDCHARGE03             NUMBER default 0 not null,
  COLLCHARGE03            NUMBER default 0 not null,
  CHARGEDESC04            VARCHAR2(10) default ' ' not null,
  PPDCHARGE04             NUMBER default 0 not null,
  COLLCHARGE04            NUMBER default 0 not null,
  CHARGEDESC05            VARCHAR2(10) default ' ' not null,
  PPDCHARGE05             NUMBER default 0 not null,
  COLLCHARGE05            NUMBER default 0 not null,
  CHARGEDESC06            VARCHAR2(10) default ' ' not null,
  PPDCHARGE06             NUMBER default 0 not null,
  COLLCHARGE06            NUMBER default 0 not null,
  PPDCHARGETOTAL          NUMBER default 0 not null,
  COLLCHARGETOTAL         NUMBER default 0 not null,
  TOTALCHARGE             NUMBER default 0 not null,
  TOTALPKGRECEIVED        NUMBER default 0 not null,
  TOTALGROSSWGT           NUMBER default 0 not null,
  ALTERNATECURRENCY       VARCHAR2(10) default 'USD' not null,
  CONVERSIONRATE          NUMBER default 1 not null,
  STATUS                  VARCHAR2(10) default '0' not null,
  EFFECTIVEDATE           DATE default SYSDATE not null,
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null,
  ACCOUNTINGINFO          VARCHAR2(2000),
  HANDLINGINFO            VARCHAR2(2000),
  NOTES                   VARCHAR2(2000)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table HOUSEAIRWAYBILL
  add constraint PK_SYS_C004661 primary key (HAWBKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table HOUSEAIRWAYBILL
  add check (STATUS IN ('0','1','2','3','4','5','6','7,','8,','9'));
create unique index HOUSE_114 on HOUSEAIRWAYBILL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HOUSEAIRWAYBILLDETAIL
prompt ====================================
prompt
create table HOUSEAIRWAYBILLDETAIL
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  HAWBKEY          VARCHAR2(15) not null,
  HAWBLINENUMBER   VARCHAR2(5) default ' ' not null,
  NUMBEROFPIECES   NUMBER(22,5) default 1 not null,
  GROSSWEIGHT      NUMBER default 0 not null,
  UOMWEIGHT        VARCHAR2(10) default ' ' not null,
  RATECLASS        VARCHAR2(10) default ' ' not null,
  SKU              VARCHAR2(50) default ' ' not null,
  SKUDESCRIPTION   VARCHAR2(45) default ' ' not null,
  CHARGEABLEWEIGHT NUMBER default 0 not null,
  RATE             NUMBER default 0 not null,
  EXTENSION        NUMBER default 0 not null,
  UOMVOLUME        VARCHAR2(10) default ' ' not null,
  LENGTH           NUMBER default 0 not null,
  WIDTH            NUMBER default 0 not null,
  HEIGHT           NUMBER default 0 not null,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null,
  NOTES            VARCHAR2(2000)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table HOUSEAIRWAYBILLDETAIL
  add constraint PK_SYS_C004660 primary key (HAWBKEY, HAWBLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index HOUSE_115 on HOUSEAIRWAYBILLDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ID
prompt =================
prompt
create table ID
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  ID        VARCHAR2(18) default ' ' not null,
  QTY       NUMBER(22,5) default 0 not null,
  STATUS    VARCHAR2(10) default 'OK' not null,
  PACKKEY   VARCHAR2(50) default 'STD' not null,
  PUTAWAYTI NUMBER(22,5) default 0 not null,
  PUTAWAYHI NUMBER(22,5) default 0 not null,
  IPSKEY    VARCHAR2(10),
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ID
  add constraint PK_SYS_C004663 primary key (ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ID_EDITDATE on ID (EDITDATE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ID_116 on ID (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table IDSTACK
prompt ======================
prompt
create table IDSTACK
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  ID        VARCHAR2(18) default ' ' not null,
  IDTYPE    VARCHAR2(10) default 'ID' not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table IDSTACK
  add constraint PK_SYS_C004662 primary key (ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index IDSTA_117 on IDSTACK (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table IMP_BOX
prompt ======================
prompt
create table IMP_BOX
(
  BOXNO VARCHAR2(10) not null,
  TYPE  VARCHAR2(10)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column IMP_BOX.BOXNO
  is '箱号';
comment on column IMP_BOX.TYPE
  is '类型 b箱号 p栈板';

prompt
prompt Creating table IMP_CLASSTOZONE
prompt ==============================
prompt
create table IMP_CLASSTOZONE
(
  SKUGROUP VARCHAR2(10) not null,
  AISLEWAY VARCHAR2(10),
  ZONE     VARCHAR2(10),
  SUSR1    VARCHAR2(30),
  SUSR2    VARCHAR2(30),
  SUSR3    VARCHAR2(30),
  SUSR4    VARCHAR2(30),
  SUSR5    VARCHAR2(30)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column IMP_CLASSTOZONE.SKUGROUP
  is '商品大类';
comment on column IMP_CLASSTOZONE.AISLEWAY
  is '走道，第0区域时使用';
comment on column IMP_CLASSTOZONE.ZONE
  is '区域';

prompt
prompt Creating table IMP_PACKLOC
prompt ==========================
prompt
create table IMP_PACKLOC
(
  LOC      VARCHAR2(10),
  EXPORTNO VARCHAR2(10),
  SUSR2    VARCHAR2(10),
  SUSR3    VARCHAR2(10),
  SUSR4    VARCHAR2(10),
  SUSR5    VARCHAR2(10)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table IMP_PUTAWAYZONE
prompt ==============================
prompt
create table IMP_PUTAWAYZONE
(
  SERIALKEY   NUMBER not null,
  PUTAWAYZONE VARCHAR2(10),
  DESCR       VARCHAR2(60),
  EXPORTNO    VARCHAR2(10),
  PUT_LOC     VARCHAR2(10),
  QC_LOC1     VARCHAR2(10),
  QC_LOC2     VARCHAR2(10),
  SUSR1       VARCHAR2(100),
  SUSR2       VARCHAR2(100),
  SUSR3       VARCHAR2(100),
  SUSR4       VARCHAR2(100),
  SUSR5       VARCHAR2(100)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column IMP_PUTAWAYZONE.EXPORTNO
  is '流水线出口';
comment on column IMP_PUTAWAYZONE.PUT_LOC
  is '上架默认储位';
comment on column IMP_PUTAWAYZONE.QC_LOC1
  is '质检少默认储位';
comment on column IMP_PUTAWAYZONE.QC_LOC2
  is '质检多默认储位';
create unique index IMP_PUTAWAYZONE_252 on IMP_PUTAWAYZONE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table IMP_STORER
prompt =========================
prompt
create table IMP_STORER
(
  STORERKEY VARCHAR2(15) not null,
  TYPE      VARCHAR2(30) default '1',
  COMPANY   VARCHAR2(45) default ' ',
  ROUTE     VARCHAR2(10),
  STOP      VARCHAR2(10),
  CASE_QTY  NUMBER(22,5) default 16,
  EACH_QTY  NUMBER(22,5) default 16,
  PACKLOC   VARCHAR2(10),
  STATION   VARCHAR2(10),
  SUSR1     VARCHAR2(100),
  SUSR2     VARCHAR2(100),
  SUSR3     VARCHAR2(100),
  SUSR4     VARCHAR2(100),
  SUSR5     VARCHAR2(100)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column IMP_STORER.ROUTE
  is '路线';
comment on column IMP_STORER.STOP
  is '路顺';
comment on column IMP_STORER.CASE_QTY
  is '主配计算使用，重型料架区参数';
comment on column IMP_STORER.EACH_QTY
  is '主配计算使用，库存量';
comment on column IMP_STORER.STATION
  is '发站到站';

prompt
prompt Creating table IMP_TEMPLOC
prompt ==========================
prompt
create table IMP_TEMPLOC
(
  LOCA  VARCHAR2(10),
  LOCB  VARCHAR2(10),
  LOCC  VARCHAR2(10),
  LOCD  VARCHAR2(10),
  LOCE  VARCHAR2(10),
  LOCF  VARCHAR2(10),
  LOCG  VARCHAR2(10),
  LOCH  VARCHAR2(10),
  LOCI  VARCHAR2(10),
  LOCJ  VARCHAR2(10),
  LOCKK VARCHAR2(10)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table INDIRECTACTIVITY
prompt ===============================
prompt
create table INDIRECTACTIVITY
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  ACTIVITY  VARCHAR2(30) not null,
  DESCR     VARCHAR2(100),
  DURATION  NUMBER default 0 not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table INDIRECTACTIVITY
  add constraint PK_SYS_C004823 primary key (ACTIVITY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table INTRANSIT
prompt ========================
prompt
create table INTRANSIT
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  INTRANSITKEY        VARCHAR2(10) not null,
  SOURCENESTID        INTEGER not null,
  ORDERKEY            VARCHAR2(10) not null,
  DESTINATIONNESTID   INTEGER not null,
  RECEIPTKEY          VARCHAR2(10) not null,
  STORERKEY           VARCHAR2(15) not null,
  NOTES               LONG,
  ORDERDATE           DATE default SYSDATE not null,
  ACTUALSHIPDATE      DATE default SYSDATE,
  EXPECTEDRECEIPTDATE DATE default SYSDATE,
  ADDDATE             DATE default SYSDATE not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  EDITDATE            DATE default SYSDATE not null,
  EDITWHO             VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index INTRA_118 on INTRANSIT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table INTRANSITDETAIL
prompt ==============================
prompt
create table INTRANSITDETAIL
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  INTRANSITKEY        VARCHAR2(10) not null,
  INTRANSITLINENUMBER VARCHAR2(5) not null,
  ORDERLINENUMBER     VARCHAR2(5) not null,
  RECEIPTLINENUMBER   VARCHAR2(5) not null,
  STORERKEY           VARCHAR2(15) not null,
  SKU                 VARCHAR2(50) not null,
  UOM                 VARCHAR2(10) not null,
  PACKKEY             VARCHAR2(50) not null,
  QTY                 NUMBER(22,5) not null,
  QTYSHIPPED          NUMBER(22,5) default 0 not null,
  QTYRECEIVED         NUMBER(22,5) default 0 not null,
  ADDDATE             DATE default SYSDATE not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  EDITDATE            DATE default SYSDATE not null,
  EDITWHO             VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index INTRA_119 on INTRANSITDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table INVENPURGEDATE
prompt =============================
prompt
create table INVENPURGEDATE
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  LASTUPDATEDATE DATE default SYSDATE not null,
  DELETECOUNT    NUMBER default 0 not null,
  ADDWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table INVENTORYHOLD
prompt ============================
prompt
create table INVENTORYHOLD
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  INVENTORYHOLDKEY VARCHAR2(10) default ' ' not null,
  LOT              VARCHAR2(10) default ' ' not null,
  ID               VARCHAR2(18) default ' ' not null,
  LOC              VARCHAR2(10) default ' ' not null,
  HOLD             VARCHAR2(1) default ' ' not null,
  STATUS           VARCHAR2(10) default ' ' not null,
  DATEON           DATE default SYSDATE not null,
  WHOON            VARCHAR2(30) default USER not null,
  DATEOFF          DATE default SYSDATE not null,
  WHOOFF           VARCHAR2(30) default USER not null,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table INVENTORYHOLD
  add constraint PK_SYS_C004664 primary key (INVENTORYHOLDKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table INVENTORYHOLD
  add unique (LOT, LOC, ID, STATUS)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table INVENTORYHOLD
  add check (LTRIM(RTRIM(LOT)) <> ' ' AND LTRIM(RTRIM(LOC)) = ' ' AND LTRIM(RTRIM(ID)) = ' ' OR LTRIM(RTRIM(LOT)) = ' ' AND LTRIM(RTRIM(LOC)) <> ' ' AND LTRIM(RTRIM(ID)) = ' ' OR LTRIM(RTRIM(LOT)) = ' ' AND LTRIM(RTRIM(LOC)) = ' ' AND LTRIM(RTRIM(ID)) <> ' ');
create unique index INVEN_120 on INVENTORYHOLD (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table IPSUPPLIER
prompt =========================
prompt
create table IPSUPPLIER
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  SUPPLIERKEY      VARCHAR2(10) not null,
  SUPPLIERNAME     VARCHAR2(25),
  SUPPLIERADDRESS1 VARCHAR2(45),
  SUPPLIERADDRESS2 VARCHAR2(45),
  SUPPLIERCITY     VARCHAR2(45),
  SUPPLIERSTATE    VARCHAR2(25),
  SUPPLIERZIP      VARCHAR2(18),
  SUPPLIERCOUNTRY  VARCHAR2(30),
  SUPPLIERPHONE    VARCHAR2(18),
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(10),
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(10)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table IPSUPPLIER
  add constraint PK_SUPPLIERKEY primary key (SUPPLIERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ITRN
prompt ===================
prompt
create table ITRN
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  ITRNKEY           VARCHAR2(10) not null,
  ITRNSYSID         NUMBER(10),
  TRANTYPE          VARCHAR2(10) not null,
  STORERKEY         VARCHAR2(15) not null,
  SKU               VARCHAR2(50) not null,
  LOT               VARCHAR2(10) not null,
  FROMLOC           VARCHAR2(10) not null,
  FROMID            VARCHAR2(18) not null,
  TOLOC             VARCHAR2(10) not null,
  TOID              VARCHAR2(18) not null,
  SOURCEKEY         VARCHAR2(20),
  SOURCETYPE        VARCHAR2(30),
  STATUS            VARCHAR2(10),
  LOTTABLE01        VARCHAR2(50) default ' ' not null,
  LOTTABLE02        VARCHAR2(50) default ' ' not null,
  LOTTABLE03        VARCHAR2(50) default ' ' not null,
  LOTTABLE04        DATE,
  LOTTABLE05        DATE,
  LOTTABLE06        VARCHAR2(50) default ' ' not null,
  LOTTABLE07        VARCHAR2(50) default ' ' not null,
  LOTTABLE08        VARCHAR2(50) default ' ' not null,
  LOTTABLE09        VARCHAR2(50) default ' ' not null,
  LOTTABLE10        VARCHAR2(50) default ' ' not null,
  CASECNT           NUMBER(22,5) default 0 not null,
  INNERPACK         NUMBER(22,5) default 0 not null,
  QTY               NUMBER(22,5) default 0 not null,
  PALLET            NUMBER(22,5) default 0 not null,
  CUBE              NUMBER(22,5) default 0 not null,
  GROSSWGT          NUMBER(22,5) default 0 not null,
  NETWGT            NUMBER(22,5) default 0 not null,
  OTHERUNIT1        NUMBER(22,5) default 0 not null,
  OTHERUNIT2        NUMBER(22,5) default 0 not null,
  PACKKEY           VARCHAR2(50),
  UOM               VARCHAR2(10),
  UOMCALC           NUMBER(10),
  UOMQTY            NUMBER(22,5),
  EFFECTIVEDATE     DATE default SYSDATE not null,
  RECEIPTKEY        VARCHAR2(10),
  RECEIPTLINENUMBER VARCHAR2(10),
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ITRN
  add constraint PK_SYS_C004666 primary key (ITRNKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ITRN_EFFECTIVEDATE on ITRN (EFFECTIVEDATE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ITRN_RECKEY on ITRN (RECEIPTKEY)
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ITRN_RECLINENO on ITRN (RECEIPTLINENUMBER)
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ITRN_121 on ITRN (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ITRNHDR
prompt ======================
prompt
create table ITRNHDR
(
  SERIALKEY  NUMBER not null,
  WHSEID     VARCHAR2(30) default USER,
  HEADERTYPE VARCHAR2(2) not null,
  ITRNKEY    VARCHAR2(10) not null,
  HEADERKEY  VARCHAR2(10) not null,
  ADDDATE    DATE default SYSDATE not null,
  ADDWHO     VARCHAR2(30) default USER not null,
  EDITDATE   DATE default SYSDATE not null,
  EDITWHO    VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ITRNHDR
  add constraint PK_SYS_C004665 primary key (HEADERTYPE, ITRNKEY, HEADERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ITRNH_122 on ITRNHDR (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JOBSCONTEXT_XSO
prompt ==============================
prompt
create table JOBSCONTEXT_XSO
(
  DOC_NUMBER    VARCHAR2(32) not null,
  DOC_SEQ       VARCHAR2(5) not null,
  DOC_CONSK     VARCHAR2(15) not null,
  DOC_SHORTNAME VARCHAR2(20),
  DOC_SKU       VARCHAR2(20) not null,
  DOC_DESCR     VARCHAR2(60),
  DOC_EQTY      INTEGER default 0 not null,
  DOC_CQTY      NUMBER(22,5),
  DOC_CASE_QTY  NUMBER(22,5),
  DOC_WESQTY    NUMBER(22,5),
  DOC_AQTY      INTEGER default 0,
  DOC_AMT       NUMBER(18,4) default 0,
  DOC_ACT_AMT   NUMBER(18,4) default 0,
  DOC_NET       NUMBER(18,4) default 0,
  DOC_ACT_MY    NUMBER(18,4) default 0,
  DOC_PRICE     NUMBER(18,4) default 0,
  DOC_DISCOUNT  NUMBER(18,2) default 100,
  DOC_CAT       VARCHAR2(10),
  DOC_CATNAME   VARCHAR2(20),
  DOC_EXPORTNO  VARCHAR2(10),
  DOC_LOC       VARCHAR2(10),
  DOC_PACKKEY   VARCHAR2(50) default 'STD' not null,
  DOC_SUSR1     VARCHAR2(30),
  DOC_SUSR2     VARCHAR2(30),
  DOC_SUSR3     VARCHAR2(30),
  DOC_SUSR4     VARCHAR2(30),
  DOC_SUSR5     VARCHAR2(30),
  ADDDATE       DATE default SYSDATE,
  ADDWHO        VARCHAR2(18) default USER,
  EDITDATE      DATE default SYSDATE,
  EDITWHO       VARCHAR2(18) default USER,
  STATUS        VARCHAR2(2),
  DOC_ZQTY      NUMBER(22)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table JOBSCONTEXT_XSO
  add constraint PK_JOBSCONTEXT_XSO primary key (DOC_NUMBER, DOC_SEQ)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1224K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JOBS_XSO
prompt =======================
prompt
create table JOBS_XSO
(
  BATCHNO         VARCHAR2(20),
  DOC_REGISTER    VARCHAR2(11) not null,
  DOC_STORERKEY   VARCHAR2(10) not null,
  DOC_WH          VARCHAR2(10) default 'WH1' not null,
  DOC_COMPANY     VARCHAR2(10) not null,
  DOC_COMPNAME    VARCHAR2(10),
  DOC_TYPE        VARCHAR2(1) not null,
  DOC_NUMBER      VARCHAR2(32) not null,
  DOC_ISSUER      VARCHAR2(10),
  DOC_ISSDATE     DATE,
  DOC_PRIORITY    VARCHAR2(1) default 5 not null,
  DOC_FINDATE     DATE,
  DOC_STATUS      VARCHAR2(2),
  DOC_DONE        VARCHAR2(1),
  DOC_CONSK_QTY   NUMBER(22,5) default 0 not null,
  DOC_AREA_QTY    NUMBER(22,5) default 0 not null,
  DOC_SUSR1       VARCHAR2(30),
  DOC_SUSR2       VARCHAR2(30),
  DOC_SUSR3       VARCHAR2(30),
  DOC_SUSR4       VARCHAR2(30),
  DOC_SUSR5       VARCHAR2(30),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(18) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(18) default USER not null,
  DOC_WES_WMS     VARCHAR2(10),
  DOC_WORKGROUP   VARCHAR2(10),
  JOBS_XSO_KEY    VARCHAR2(10),
  STATUS          VARCHAR2(10) default '0',
  WORKGROUP_DATE  DATE default sysdate,
  WES_FINISH_DATE DATE default sysdate,
  WES_START_DATE  DATE default sysdate
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column JOBS_XSO.DOC_REGISTER
  is '到货登记号';
comment on column JOBS_XSO.DOC_STORERKEY
  is '货主码';
comment on column JOBS_XSO.DOC_WH
  is '仓库';
comment on column JOBS_XSO.DOC_COMPANY
  is '来源对像';
comment on column JOBS_XSO.DOC_COMPNAME
  is '来源对像简称';
comment on column JOBS_XSO.DOC_TYPE
  is '任务类型';
comment on column JOBS_XSO.DOC_NUMBER
  is '任务单号';
comment on column JOBS_XSO.DOC_ISSUER
  is '制单人';
comment on column JOBS_XSO.DOC_ISSDATE
  is '任务开始时间';
comment on column JOBS_XSO.DOC_PRIORITY
  is '优先级';
comment on column JOBS_XSO.DOC_FINDATE
  is '任务完成时间';
comment on column JOBS_XSO.DOC_CONSK_QTY
  is '退货记录不同供应商数，主配记录不同门店数';
comment on column JOBS_XSO.DOC_AREA_QTY
  is '退货记录入库区域数';
comment on column JOBS_XSO.DOC_SUSR1
  is '扩展字段';
comment on column JOBS_XSO.ADDDATE
  is '新增时间';
comment on column JOBS_XSO.ADDWHO
  is '新增人';
comment on column JOBS_XSO.EDITDATE
  is '修改时间';
comment on column JOBS_XSO.EDITWHO
  is '修改人';
comment on column JOBS_XSO.WORKGROUP_DATE
  is '指派任务时间';
comment on column JOBS_XSO.WES_FINISH_DATE
  is '主配线完成时间';
comment on column JOBS_XSO.WES_START_DATE
  is '传入主配时间';
alter table JOBS_XSO
  add constraint PK_SYS_JOBS_XSO primary key (DOC_NUMBER)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JOBS_XSO_REJ
prompt ===========================
prompt
create table JOBS_XSO_REJ
(
  JOBS_XSO_KEY VARCHAR2(10) not null,
  DOC_NUMBER   VARCHAR2(32) not null,
  LINENUMBER   VARCHAR2(10) not null,
  SERIALKEY    NUMBER not null,
  SKU          VARCHAR2(50),
  ALTSKU       VARCHAR2(50),
  PRICE        NUMBER(22,5),
  REASON       VARCHAR2(10),
  REC_USER     VARCHAR2(18),
  REC_DATE     DATE,
  SUSR1        VARCHAR2(30),
  SUSR2        VARCHAR2(30),
  SUSR3        VARCHAR2(30),
  SUSR4        VARCHAR2(30),
  SUSR5        VARCHAR2(30),
  ADDDATE      DATE default SYSDATE,
  ADDWHO       VARCHAR2(18) default USER,
  EDITDATE     DATE default SYSDATE,
  EDITWHO      VARCHAR2(18) default USER,
  DOC_COMPANY  VARCHAR2(10),
  QTY          NUMBER
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column JOBS_XSO_REJ.JOBS_XSO_KEY
  is '收货单号';
comment on column JOBS_XSO_REJ.DOC_NUMBER
  is '外部单号';
comment on column JOBS_XSO_REJ.LINENUMBER
  is '预收唯一号';
comment on column JOBS_XSO_REJ.SKU
  is '内码';
comment on column JOBS_XSO_REJ.ALTSKU
  is '条码';
comment on column JOBS_XSO_REJ.PRICE
  is '定价';
comment on column JOBS_XSO_REJ.REASON
  is '拒收原因';
comment on column JOBS_XSO_REJ.REC_USER
  is '拒收录入人员';
comment on column JOBS_XSO_REJ.REC_DATE
  is '拒收录入日期';
comment on column JOBS_XSO_REJ.SUSR1
  is '备注1';
comment on column JOBS_XSO_REJ.SUSR2
  is '备注2';
comment on column JOBS_XSO_REJ.SUSR3
  is '备注3';
comment on column JOBS_XSO_REJ.SUSR4
  is '备注4';
comment on column JOBS_XSO_REJ.SUSR5
  is '备注5';
comment on column JOBS_XSO_REJ.ADDDATE
  is '添加时间';
comment on column JOBS_XSO_REJ.ADDWHO
  is '添加人';
comment on column JOBS_XSO_REJ.EDITDATE
  is '修改时间';
comment on column JOBS_XSO_REJ.EDITWHO
  is '修改人';
comment on column JOBS_XSO_REJ.DOC_COMPANY
  is '公司名称';
comment on column JOBS_XSO_REJ.QTY
  is '预收数量';

prompt
prompt Creating table LABELPRINTER
prompt ===========================
prompt
create table LABELPRINTER
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  PRINTERNAME VARCHAR2(45) not null,
  PRINTERTYPE VARCHAR2(10) not null,
  DESCR       VARCHAR2(50),
  LABELSIZE   VARCHAR2(10) not null,
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LABELPRINTER
  add constraint PK_SYS_C004669 primary key (PRINTERNAME)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LABEL_125 on LABELPRINTER (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LABELCONFIG
prompt ==========================
prompt
create table LABELCONFIG
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  LABELTYPE           VARCHAR2(20) not null,
  PRINTERTYPE         VARCHAR2(10) not null,
  LABELNAME           VARCHAR2(20) not null,
  LABELDESCR          VARCHAR2(50),
  LABELSIZE           VARCHAR2(10) not null,
  DEFAULTFORLABELTYPE NUMBER(10) default 0 not null,
  DEFAULTPRINTER      VARCHAR2(45),
  DEFAULTCOPIES       NUMBER(10) default 1,
  DATASOURCE          VARCHAR2(2000) default ' ' not null,
  HEADERVALUE         NUMBER,
  ADDDATE             DATE default SYSDATE not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  EDITDATE            DATE default SYSDATE not null,
  EDITWHO             VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LABELCONFIG
  add constraint PK_SYS_C004667 primary key (LABELTYPE, LABELNAME)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LABELCONFIG
  add foreign key (DEFAULTPRINTER)
  references LABELPRINTER (PRINTERNAME);
create unique index LABEL_123 on LABELCONFIG (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LABELCONTAINERDETAIL
prompt ===================================
prompt
create table LABELCONTAINERDETAIL
(
  SERIALKEY            NUMBER not null,
  WHSEID               VARCHAR2(30) default USER,
  PICKDETAILKEY        VARCHAR2(18) not null,
  CASEID               VARCHAR2(20),
  CONTAINERDETAILID    VARCHAR2(50) default ' ' not null,
  QTY                  NUMBER(22,5) default 0 not null,
  LABELTYPE            VARCHAR2(10) default 0 not null,
  SERIALREFERENCE      VARCHAR2(15),
  OUTERCONTAINERFLAG   VARCHAR2(1) default '0' not null,
  BATCHCONTAINERDETAIL VARCHAR2(10) default ' ',
  FILTERVALUE          NUMBER,
  INDICATORDIGIT       NUMBER,
  ADDDATE              DATE default SYSDATE not null,
  ADDWHO               VARCHAR2(30) default USER not null,
  EDITDATE             DATE default SYSDATE not null,
  EDITWHO              VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LABELCONTAINERDETAIL
  add constraint PK_SYS_C004818 primary key (PICKDETAILKEY, CONTAINERDETAILID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LABELLIST
prompt ========================
prompt
create table LABELLIST
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  LABELNAME        VARCHAR2(30) default ' ' not null,
  LABELDESC        VARCHAR2(60) default ' ' not null,
  LABELTYPE        VARCHAR2(10) default ' ' not null,
  DEFAULTPRINTER   VARCHAR2(60) default ' ' not null,
  PRINTERTYPE      VARCHAR2(20) default ' ' not null,
  DWNAME           VARCHAR2(30) default ' ' not null,
  PREDOWNLOADFILE  VARCHAR2(100) default ' ' not null,
  DOWNLOADFILE     VARCHAR2(100) default ' ' not null,
  USETIMER         VARCHAR2(1) default ' ',
  TIMERINTERVAL    NUMBER(10) default 0,
  RESOLUTION       VARCHAR2(3) default ' ' not null,
  LAYOUT           VARCHAR2(10) default ' ' not null,
  PRINTPOS         NUMBER(10) default 1 not null,
  PORT             VARCHAR2(4) default 'L1' not null,
  CLEARPRINTBUFFER VARCHAR2(1) default 'Y' not null,
  LLMSUB           VARCHAR2(1) default 'N' not null,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LABELLIST
  add constraint PK_SYS_C004668 primary key (LABELNAME)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LABEL_124 on LABELLIST (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LANE
prompt ===================
prompt
create table LANE
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  LANEKEY       VARCHAR2(10) not null,
  LANETYPE      VARCHAR2(10) not null,
  LANEASSG1     VARCHAR2(15),
  LANEASSG2     VARCHAR2(50),
  DOOR          VARCHAR2(10),
  STATUS        VARCHAR2(10),
  LANEGENNUMBER VARCHAR2(10),
  LANESEQ       VARCHAR2(10),
  OHTYPE        VARCHAR2(10),
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LANE_LANEASSG on LANE (LANEASSG1, LANEASSG2)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LANE_LANEKEY on LANE (LANEKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LANE_126 on LANE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LIPS_JOBS_STOCK
prompt ==============================
prompt
create table LIPS_JOBS_STOCK
(
  BATCHNO          VARCHAR2(20) not null,
  INV_DATE         DATE default SYSDATE not null,
  DOC_STORERKEY    VARCHAR2(15) not null,
  DOC_WH           VARCHAR2(10) not null,
  DOC_SKU          VARCHAR2(10) not null,
  DOC_DESCR        VARCHAR2(50),
  DOC_LOC          VARCHAR2(60) not null,
  DOC_ALLOCATEDQTY NUMBER(18,4) default 0 not null,
  DOC_HOLDQTY      NUMBER(18,4) default 0 not null,
  DOC_AVAILABLEQTY NUMBER(18,4) default 0 not null,
  DOC_PICKEDQTY    NUMBER(18,4) default 0 not null,
  DOC_QTY          NUMBER(18,4) default 0 not null,
  DOC_STATUS       VARCHAR2(2) default 0,
  DOC_DONE         VARCHAR2(2) default 0,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LIPS_JOBS_STOCK
  add constraint PK_SYS_STOCK primary key (BATCHNO, DOC_STORERKEY, DOC_SKU, DOC_LOC)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOADHDR
prompt ======================
prompt
create table LOADHDR
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  LOADID         VARCHAR2(18) not null,
  ROUTE          VARCHAR2(10) not null,
  DOOR           VARCHAR2(10),
  STATUS         VARCHAR2(10) not null,
  DEPARTURETIME  DATE default SYSDATE not null,
  CARRIERID      VARCHAR2(10),
  TRAILERID      VARCHAR2(10),
  TOTALCUBE      NUMBER(22,5) default 0 not null,
  TOTALWEIGHT    NUMBER(22,5) default 0 not null,
  TOTALUNITS     NUMBER(22,5) default 0 not null,
  EXPECTEDCUBE   NUMBER(22,5) default 0 not null,
  EXPECTEDWEIGHT NUMBER(22,5) default 0 not null,
  EXPECTEDUNITS  NUMBER(22,5) default 0 not null,
  COST           NUMBER(22,5) default 0 not null,
  VALUE          NUMBER(22,5) default 0 not null,
  EXTERNALID     VARCHAR2(20),
  BEGINLOADTIME  DATE,
  ENDLOADTIME    DATE,
  WAREHOUSEID    NUMBER(10),
  LOADSEQUENCE   VARCHAR2(10) default '2',
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOADHDR
  add constraint PK_SYS_C004670 primary key (LOADID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOADHDR_ROUTEID on LOADHDR (ROUTE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOADH_127 on LOADHDR (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOADORDERDETAIL
prompt ==============================
prompt
create table LOADORDERDETAIL
(
  SERIALKEY            NUMBER not null,
  WHSEID               VARCHAR2(30) default USER,
  LOADSTOPID           NUMBER(10) not null,
  LOADORDERDETAILID    NUMBER(10) not null,
  STORER               VARCHAR2(20) default ' ' not null,
  SHIPMENTORDERID      VARCHAR2(20),
  TRANSSHIPCONTAINERID VARCHAR2(20),
  CUSTOMER             VARCHAR2(20) not null,
  OUTUNITS             NUMBER(22,5) default 0 not null,
  OUTUNITCUBE          NUMBER(22,5) default 0 not null,
  OUTUNITWEIGHT        NUMBER(22,5) default 0 not null,
  EXTERNALSHIPMENTID   VARCHAR2(20),
  EXTERNALORDERID      VARCHAR2(20),
  TOTALCOST            NUMBER(22,5),
  TOTALVALUE           NUMBER(22,5),
  OHTYPE               VARCHAR2(10),
  FLOWORDERID          VARCHAR2(20),
  CASEID               VARCHAR2(20) default ' ',
  TRANSASNKEY          VARCHAR2(20),
  ADDDATE              DATE default SYSDATE not null,
  ADDWHO               VARCHAR2(30) default USER not null,
  EDITDATE             DATE default SYSDATE not null,
  EDITWHO              VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOADORDERDETAIL
  add constraint PK_SYS_C004671 primary key (LOADORDERDETAILID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOADORDERDETAIL_ORDERID on LOADORDERDETAIL (SHIPMENTORDERID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOADORDERDETAIL_STOPORDER on LOADORDERDETAIL (LOADSTOPID, LOADORDERDETAILID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOADORDERDETAIL_TRANSSHIP on LOADORDERDETAIL (TRANSSHIPCONTAINERID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOADO_128 on LOADORDERDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOADPLANNING
prompt ===========================
prompt
create table LOADPLANNING
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  LOADPLANNINGKEY VARCHAR2(10) not null,
  SELLER          VARCHAR2(15),
  SHIPTO          VARCHAR2(15),
  OHTYPE          VARCHAR2(10),
  ORDERKEY        VARCHAR2(10),
  DELIVERYDATE    DATE default SYSDATE not null,
  ROUTE           VARCHAR2(10) default ' ',
  STOP            VARCHAR2(10) default ' ',
  OUTBOUNDLANE    VARCHAR2(10),
  LOADID          VARCHAR2(18),
  STATUS          VARCHAR2(2),
  SELLERORDER     VARCHAR2(32),
  ORDERDATE       DATE default SYSDATE not null,
  VEHICLECARRIER  VARCHAR2(30),
  EXTERNALLOADID  VARCHAR2(20),
  SOURCETYPE      VARCHAR2(10),
  DELIVERYTIME    DATE default SYSDATE not null,
  REMARKS         VARCHAR2(255),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOADPLANNING
  add constraint PK_SYS_C004672 primary key (LOADPLANNINGKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOADPLANNING_ORDKEYTYPE on LOADPLANNING (ORDERKEY, SOURCETYPE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOADP_129 on LOADPLANNING (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOADSCHEDULE
prompt ===========================
prompt
create table LOADSCHEDULE
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  LOADSCHEDULEKEY VARCHAR2(10) not null,
  STORER          VARCHAR2(15),
  SCHEDULETYPE    VARCHAR2(15),
  DAYOFWEEK       VARCHAR2(10),
  ROUTE           VARCHAR2(10),
  OUTBOUNDLANE    VARCHAR2(10),
  DEPARTURETIME   DATE default SYSDATE not null,
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOADSCHEDULE
  add constraint PK_SYS_C004674 primary key (LOADSCHEDULEKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOADS_130 on LOADSCHEDULE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOADSCHEDULEDETAIL
prompt =================================
prompt
create table LOADSCHEDULEDETAIL
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  LOADSCHEDULEKEY VARCHAR2(10) not null,
  LINENUMBER      VARCHAR2(10) not null,
  STOP            VARCHAR2(10),
  OHTYPE          VARCHAR2(10) not null,
  CONSIGNEEKEY    VARCHAR2(15),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOADSCHEDULEDETAIL
  add constraint PK_SYS_C004673 primary key (LOADSCHEDULEKEY, LINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOADS_131 on LOADSCHEDULEDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOADSTOP
prompt =======================
prompt
create table LOADSTOP
(
  SERIALKEY  NUMBER not null,
  WHSEID     VARCHAR2(30) default USER,
  LOADID     VARCHAR2(18) not null,
  LOADSTOPID NUMBER(10) not null,
  STOP       NUMBER(10) not null,
  STATUS     VARCHAR2(10) default '0' not null,
  ADDDATE    DATE default SYSDATE not null,
  ADDWHO     VARCHAR2(30) default USER not null,
  EDITDATE   DATE default SYSDATE not null,
  EDITWHO    VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOADSTOP
  add constraint PK_SYS_C004676 primary key (LOADSTOPID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOADSTOP_LOADLOADSTOP on LOADSTOP (LOADID, LOADSTOPID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOADS_132 on LOADSTOP (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOADSTOPSEAL
prompt ===========================
prompt
create table LOADSTOPSEAL
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  LOADSTOPID       NUMBER(10) not null,
  LOADSTOPSEALID   NUMBER(10) not null,
  LOADSTOPSEALCHAR VARCHAR2(20) not null,
  LOADSTOPSEALDESC VARCHAR2(50) not null,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOADSTOPSEAL
  add constraint PK_SYS_C004675 primary key (LOADSTOPSEALID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOADSTOPSEAL_STOPSEAL on LOADSTOPSEAL (LOADSTOPID, LOADSTOPSEALID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOADS_133 on LOADSTOPSEAL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOADUNITDETAIL
prompt =============================
prompt
create table LOADUNITDETAIL
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  LOADSTOPID         NUMBER(10) not null,
  LOADUNITDETAILID   NUMBER(10) not null,
  UNITIDTYPE         NUMBER(10) not null,
  UNITID             VARCHAR2(20) not null,
  OUTUNITS           NUMBER(22,5) default 0 not null,
  OUTUNITCUBE        NUMBER(22,5) default 0 not null,
  OUTUNITWEIGHT      NUMBER(22,5) default 0 not null,
  LOADUNITDETAILCHAR VARCHAR2(10),
  STATUS             VARCHAR2(10) default '0',
  WAVEKEY            VARCHAR2(10),
  SEQUENCE           NUMBER(10),
  POSITION           VARCHAR2(10),
  TRANSASNKEY        VARCHAR2(20),
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOADUNITDETAIL
  add constraint PK_SYS_C004677 primary key (LOADUNITDETAILID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOADUNITDETAIL_STOPUNIT on LOADUNITDETAIL (LOADSTOPID, LOADUNITDETAILID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOADUNITDETAIL_UNITID on LOADUNITDETAIL (UNITIDTYPE, UNITID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOADU_134 on LOADUNITDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOTATTRIBUTE
prompt ===========================
prompt
create table LOTATTRIBUTE
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  STORERKEY   VARCHAR2(15) not null,
  SKU         VARCHAR2(50) not null,
  LOT         VARCHAR2(10) not null,
  LOTTABLE01  VARCHAR2(50) default ' ' not null,
  LOTTABLE02  VARCHAR2(50) default ' ' not null,
  LOTTABLE03  VARCHAR2(50) default ' ' not null,
  LOTTABLE04  DATE,
  LOTTABLE05  DATE,
  LOTTABLE06  VARCHAR2(50) default ' ' not null,
  LOTTABLE07  VARCHAR2(50) default ' ' not null,
  LOTTABLE08  VARCHAR2(50) default ' ' not null,
  LOTTABLE09  VARCHAR2(50) default ' ' not null,
  LOTTABLE10  VARCHAR2(50) default ' ' not null,
  EXTERNALLOT VARCHAR2(100),
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOTATTRIBUTE
  add constraint PK_SYS_C004680 primary key (LOT)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOTATTRIBUTE
  add unique (SKU, STORERKEY, LOTTABLE01, LOTTABLE02, LOTTABLE03, LOTTABLE04, LOTTABLE05, LOTTABLE06, LOTTABLE07, LOTTABLE08, LOTTABLE09, LOTTABLE10)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOTATTRIBUTE
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
alter table LOTATTRIBUTE
  add foreign key (STORERKEY)
  references STORER (STORERKEY);
create unique index LOTAT_138 on LOTATTRIBUTE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOT
prompt ==================
prompt
create table LOT
(
  SERIALKEY            NUMBER not null,
  WHSEID               VARCHAR2(30) default USER,
  LOT                  VARCHAR2(10) not null,
  STORERKEY            VARCHAR2(15) not null,
  SKU                  VARCHAR2(50) not null,
  CASECNT              NUMBER(22,5) default 0 not null,
  INNERPACK            NUMBER(22,5) default 0 not null,
  QTY                  NUMBER(22,5) default 0 not null,
  PALLET               NUMBER(22,5) default 0 not null,
  CUBE                 NUMBER(22,5) default 0 not null,
  GROSSWGT             NUMBER(22,5) default 0 not null,
  NETWGT               NUMBER(22,5) default 0 not null,
  OTHERUNIT1           NUMBER(22,5) default 0 not null,
  OTHERUNIT2           NUMBER(22,5) default 0 not null,
  QTYPREALLOCATED      NUMBER(22,5) default 0 not null,
  QTYALLOCATED         NUMBER(22,5) default 0 not null,
  QTYPICKED            NUMBER(22,5) default 0 not null,
  QTYONHOLD            NUMBER(22,5) default 0 not null,
  STATUS               VARCHAR2(10) default 'OK' not null,
  ARCHIVEQTY           NUMBER(22,5) default 0 not null,
  ARCHIVEDATE          DATE default TO_DATE('01-01-1901', 'MM-DD-YYYY') not null,
  ADDDATE              DATE default SYSDATE not null,
  ADDWHO               VARCHAR2(30) default USER not null,
  EDITDATE             DATE default SYSDATE not null,
  EDITWHO              VARCHAR2(30) default USER not null,
  GROSSWGTPREALLOCATED NUMBER(22,5) default 0 not null,
  NETWGTPREALLOCATED   NUMBER(22,5) default 0 not null,
  GROSSWGTALLOCATED    NUMBER(22,5) default 0 not null,
  NETWGTALLOCATED      NUMBER(22,5) default 0 not null,
  GROSSWGTPICKED       NUMBER(22,5) default 0 not null,
  NETWGTPICKED         NUMBER(22,5) default 0 not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOT
  add constraint PK_SYS_C004688 primary key (LOT)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOT
  add foreign key (LOT)
  references LOTATTRIBUTE (LOT);
alter table LOT
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
alter table LOT
  add foreign key (STORERKEY)
  references STORER (STORERKEY);
alter table LOT
  add check (QTY >= QTYPREALLOCATED + QTYALLOCATED + QTYPICKED);
alter table LOT
  add check (QTY >= 0 AND QTYPREALLOCATED >= 0 AND QTYALLOCATED >= 0 AND QTYPICKED >= 0 AND QTYONHOLD >= 0);
create index IDX_LOT_EDITDATE on LOT (EDITDATE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOT_STORERKEY on LOT (STORERKEY, SKU)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOT_137 on LOT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOTNEWBILLTHRUDATE
prompt =================================
prompt
create table LOTNEWBILLTHRUDATE
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  LOT          VARCHAR2(10) default ' ' not null,
  BILLTHRUDATE DATE default SYSDATE not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOTNEWBILLTHRUDATE
  add constraint PK_SYS_C004681 primary key (LOT)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOTNE_139 on LOTNEWBILLTHRUDATE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOTTABLEVALIDATION
prompt =================================
prompt
create table LOTTABLEVALIDATION
(
  SERIALKEY                      NUMBER not null,
  WHSEID                         VARCHAR2(30) default USER,
  LOTTABLEVALIDATIONKEY          VARCHAR2(10) not null,
  DESCRIPTION                    VARCHAR2(60) default ' ' not null,
  SHOWLOTTABLE01ONRFRECEIPT      VARCHAR2(1) default '0' not null,
  SHOWLOTTABLE02ONRFRECEIPT      VARCHAR2(1) default '0' not null,
  SHOWLOTTABLE03ONRFRECEIPT      VARCHAR2(1) default '0' not null,
  SHOWLOTTABLE04ONRFRECEIPT      VARCHAR2(1) default '0' not null,
  SHOWLOTTABLE05ONRFRECEIPT      VARCHAR2(1) default '0' not null,
  SHOWLOTTABLE06ONRFRECEIPT      VARCHAR2(1) default '0' not null,
  SHOWLOTTABLE07ONRFRECEIPT      VARCHAR2(1) default '0' not null,
  SHOWLOTTABLE08ONRFRECEIPT      VARCHAR2(1) default '0' not null,
  SHOWLOTTABLE09ONRFRECEIPT      VARCHAR2(1) default '0' not null,
  SHOWLOTTABLE10ONRFRECEIPT      VARCHAR2(1) default '0' not null,
  LOTTABLE01ONRFRECEIPTMANDATORY VARCHAR2(1) default '0' not null,
  LOTTABLE02ONRFRECEIPTMANDATORY VARCHAR2(1) default '0' not null,
  LOTTABLE03ONRFRECEIPTMANDATORY VARCHAR2(1) default '0' not null,
  LOTTABLE04ONRFRECEIPTMANDATORY VARCHAR2(1) default '0' not null,
  LOTTABLE05ONRFRECEIPTMANDATORY VARCHAR2(1) default '0' not null,
  LOTTABLE06ONRFRECEIPTMANDATORY VARCHAR2(1) default '0' not null,
  LOTTABLE07ONRFRECEIPTMANDATORY VARCHAR2(1) default '0' not null,
  LOTTABLE08ONRFRECEIPTMANDATORY VARCHAR2(1) default '0' not null,
  LOTTABLE09ONRFRECEIPTMANDATORY VARCHAR2(1) default '0' not null,
  LOTTABLE10ONRFRECEIPTMANDATORY VARCHAR2(1) default '0' not null,
  ADDDATE                        DATE default SYSDATE not null,
  ADDWHO                         VARCHAR2(30) default USER not null,
  EDITDATE                       DATE default SYSDATE not null,
  EDITWHO                        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOTTABLEVALIDATION
  add constraint PK_SYS_C004683 primary key (LOTTABLEVALIDATIONKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOTTA_140 on LOTTABLEVALIDATION (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOTTABLEVALIDATIONDETAIL
prompt =======================================
prompt
create table LOTTABLEVALIDATIONDETAIL
(
  SERIALKEY                   NUMBER not null,
  WHSEID                      VARCHAR2(30) default USER,
  LOTTABLEVALIDATIONKEY       VARCHAR2(10) not null,
  SEQ                         NUMBER(10) not null,
  LOTTABLE01RECEIPTVALIDATION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE02RECEIPTVALIDATION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE03RECEIPTVALIDATION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE04RECEIPTVALIDATION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE05RECEIPTVALIDATION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE06RECEIPTVALIDATION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE07RECEIPTVALIDATION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE08RECEIPTVALIDATION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE09RECEIPTVALIDATION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE10RECEIPTVALIDATION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE01RECEIPTCONVERSION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE02RECEIPTCONVERSION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE03RECEIPTCONVERSION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE04RECEIPTCONVERSION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE05RECEIPTCONVERSION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE06RECEIPTCONVERSION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE07RECEIPTCONVERSION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE08RECEIPTCONVERSION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE09RECEIPTCONVERSION VARCHAR2(10) default 'NONE' not null,
  LOTTABLE10RECEIPTCONVERSION VARCHAR2(10) default 'NONE' not null,
  ADDDATE                     DATE default SYSDATE not null,
  ADDWHO                      VARCHAR2(30) default USER not null,
  EDITDATE                    DATE default SYSDATE not null,
  EDITWHO                     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOTTABLEVALIDATIONDETAIL
  add constraint PK_SYS_C004682 primary key (LOTTABLEVALIDATIONKEY, SEQ)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOTTABLEVALIDATIONDETAIL
  add foreign key (LOTTABLEVALIDATIONKEY)
  references LOTTABLEVALIDATION (LOTTABLEVALIDATIONKEY);
create unique index LOTTA_141 on LOTTABLEVALIDATIONDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOTXBILLDATE
prompt ===========================
prompt
create table LOTXBILLDATE
(
  SERIALKEY            NUMBER not null,
  WHSEID               VARCHAR2(30) default USER,
  LOT                  VARCHAR2(10) not null,
  TARIFFKEY            VARCHAR2(10) not null,
  LOTBILLTHRUDATE      DATE default SYSDATE not null,
  LASTACTIVITY         DATE default SYSDATE not null,
  QTYBILLEDBALANCE     NUMBER(22,5) default 0 not null,
  QTYBILLEDGROSSWEIGHT NUMBER(22,5) default 0 not null,
  QTYBILLEDNETWEIGHT   NUMBER(22,5) default 0 not null,
  QTYBILLEDCUBE        NUMBER(22,5) default 0 not null,
  ADDDATE              DATE default SYSDATE not null,
  ADDWHO               VARCHAR2(30) default USER not null,
  EDITDATE             DATE default SYSDATE not null,
  EDITWHO              VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOTXBILLDATE
  add constraint PK_SYS_C004684 primary key (LOT)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOTXBILLDATE
  add foreign key (LOT)
  references LOT (LOT);
alter table LOTXBILLDATE
  add foreign key (TARIFFKEY)
  references TARIFF (TARIFFKEY);
create index IDX_LOTXBILLDATE_BILLTHRUDATE on LOTXBILLDATE (LOTBILLTHRUDATE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOTXB_142 on LOTXBILLDATE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOTXIDDETAIL
prompt ===========================
prompt
create table LOTXIDDETAIL
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  LOTXIDKEY        VARCHAR2(10) not null,
  LOTXIDLINENUMBER VARCHAR2(5) not null,
  WGT              NUMBER(12,6) default 0 not null,
  IOTHER1          VARCHAR2(30) default ' ',
  IOTHER2          VARCHAR2(30) default ' ',
  IOTHER3          VARCHAR2(30) default ' ',
  OOTHER1          VARCHAR2(30) default ' ',
  OOTHER2          VARCHAR2(30) default ' ',
  OOTHER3          VARCHAR2(30) default ' ',
  SKU              VARCHAR2(50) default ' ',
  ETWEIGHT         NUMBER(12,6) default 0 not null,
  IOFLAG           VARCHAR2(1) default ' ',
  LOT              VARCHAR2(10) not null,
  ID               VARCHAR2(18) default ' ',
  SOURCEKEY        VARCHAR2(10) default ' ',
  SOURCELINENUMBER VARCHAR2(5) default ' ',
  PICKDETAILKEY    VARCHAR2(10) default ' ',
  VALIDATEFLAG     VARCHAR2(1),
  CAPTUREBY        VARCHAR2(1),
  CASEID           VARCHAR2(20),
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOTXIDDETAIL
  add constraint PK_SYS_C004685 primary key (LOTXIDKEY, LOTXIDLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOTXI_143 on LOTXIDDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOTXIDHEADER
prompt ===========================
prompt
create table LOTXIDHEADER
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  LOTXIDKEY        VARCHAR2(10) not null,
  STORERKEY        VARCHAR2(15) not null,
  SKU              VARCHAR2(50) default ' ',
  ETWEIGHT         NUMBER(12,6) default 0 not null,
  IOFLAG           VARCHAR2(1) default ' ',
  LOT              VARCHAR2(10) not null,
  ID               VARCHAR2(18) default ' ',
  SOURCEKEY        VARCHAR2(10) default ' ',
  SOURCELINENUMBER VARCHAR2(5) default ' ',
  PICKDETAILKEY    VARCHAR2(10) default ' ',
  VALIDATEFLAG     VARCHAR2(1),
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOTXIDHEADER
  add constraint PK_SYS_C004686 primary key (LOTXIDKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOTXI_144 on LOTXIDHEADER (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LOTXLOCXID
prompt =========================
prompt
create table LOTXLOCXID
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  LOT              VARCHAR2(10) default ' ' not null,
  LOC              VARCHAR2(10) default 'UNKNOWN' not null,
  ID               VARCHAR2(18) default ' ' not null,
  STORERKEY        VARCHAR2(15) default ' ' not null,
  SKU              VARCHAR2(50) default ' ' not null,
  QTY              NUMBER(22,5) default 0 not null,
  QTYALLOCATED     NUMBER(22,5) default 0 not null,
  QTYPICKED        NUMBER(22,5) default 0 not null,
  QTYEXPECTED      NUMBER(22,5) default 0 not null,
  QTYPICKINPROCESS NUMBER(22,5) default 0 not null,
  PENDINGMOVEIN    NUMBER(22,5) default 0 not null,
  ARCHIVEQTY       NUMBER(22,5) default 0 not null,
  ARCHIVEDATE      DATE default TO_DATE('01-01-1901', 'MM-DD-YYYY') not null,
  STATUS           VARCHAR2(10) default 'OK',
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOTXLOCXID
  add constraint PK_SYS_C004687 primary key (LOT, LOC, ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOTXLOCXID
  add foreign key (LOC)
  references LOC (LOC);
alter table LOTXLOCXID
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
alter table LOTXLOCXID
  add check (QTY >= 0 AND QTYALLOCATED >= 0 AND QTYPICKED >= 0 AND QTYEXPECTED >= 0);
create index IDX_LOTXLOCXID_ID on LOTXLOCXID (ID, LOT, LOC)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOTXLOCXID_LOC on LOTXLOCXID (LOC)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_LOTXLOCXID_SKU on LOTXLOCXID (SKU)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LOTXL_145 on LOTXLOCXID (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LPNDETAIL
prompt ========================
prompt
create table LPNDETAIL
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  RECEIPTKEY        VARCHAR2(10) not null,
  RECEIPTLINENUMBER VARCHAR2(5) not null,
  LPNDETAILKEY      VARCHAR2(18) not null,
  STORERKEY         VARCHAR2(15) default ' ' not null,
  SKU               VARCHAR2(50) default ' ' not null,
  LOT               VARCHAR2(10),
  ID                VARCHAR2(18) default ' ' not null,
  PALLETID          VARCHAR2(18) default ' ' not null,
  STATUS            VARCHAR2(10) default '0' not null,
  DATERECEIVED      DATE default SYSDATE,
  QTYEXPECTED       NUMBER(22,5) default 0 not null,
  QTYADJUSTED       NUMBER(22,5) default 0 not null,
  QTYRECEIVED       NUMBER(22,5) default 0 not null,
  QTYREJECTED       NUMBER(22,5) default 0 not null,
  UOM               VARCHAR2(10) default ' ' not null,
  PACKKEY           VARCHAR2(50) default 'STD' not null,
  TOLOC             VARCHAR2(10) not null,
  LOTTABLE01        VARCHAR2(50) default ' ' not null,
  LOTTABLE02        VARCHAR2(50) default ' ' not null,
  LOTTABLE03        VARCHAR2(50) default ' ' not null,
  LOTTABLE04        DATE,
  LOTTABLE05        DATE,
  LOTTABLE06        VARCHAR2(50) default ' ' not null,
  LOTTABLE07        VARCHAR2(50) default ' ' not null,
  LOTTABLE08        VARCHAR2(50) default ' ' not null,
  LOTTABLE09        VARCHAR2(50) default ' ' not null,
  LOTTABLE10        VARCHAR2(50) default ' ' not null,
  REASONCODE        VARCHAR2(20) default ' ',
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LPNDETAIL
  add constraint PK_SYS_C004689 primary key (RECEIPTKEY, RECEIPTLINENUMBER, LPNDETAILKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index LPNDE_146 on LPNDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MASTERAIRWAYBILL
prompt ===============================
prompt
create table MASTERAIRWAYBILL
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  MAWBKEY                 VARCHAR2(15) not null,
  CONSIGNEEKEY            VARCHAR2(15) default ' ' not null,
  C_CONTACT1              VARCHAR2(30),
  C_CONTACT2              VARCHAR2(30),
  C_COMPANY               VARCHAR2(30),
  C_ADDRESS1              VARCHAR2(30),
  C_ADDRESS2              VARCHAR2(30),
  C_ADDRESS3              VARCHAR2(30),
  C_ADDRESS4              VARCHAR2(30),
  C_CITY                  VARCHAR2(30),
  C_STATE                 VARCHAR2(2),
  C_ZIP                   VARCHAR2(18),
  C_COUNTRY               VARCHAR2(30),
  C_ISOCNTRYCODE          VARCHAR2(10),
  C_PHONE1                VARCHAR2(18),
  C_PHONE2                VARCHAR2(18),
  C_FAX1                  VARCHAR2(18),
  C_FAX2                  VARCHAR2(18),
  SHIPPERKEY              VARCHAR2(15) default ' ' not null,
  S_CONTACT1              VARCHAR2(30),
  S_CONTACT2              VARCHAR2(30),
  S_COMPANY               VARCHAR2(30),
  S_ADDRESS1              VARCHAR2(30),
  S_ADDRESS2              VARCHAR2(30),
  S_ADDRESS3              VARCHAR2(30),
  S_ADDRESS4              VARCHAR2(30),
  S_CITY                  VARCHAR2(30),
  S_STATE                 VARCHAR2(2),
  S_ZIP                   VARCHAR2(18),
  S_COUNTRY               VARCHAR2(30),
  S_ISOCNTRYCODE          VARCHAR2(10),
  S_PHONE1                VARCHAR2(18),
  S_PHONE2                VARCHAR2(18),
  S_FAX1                  VARCHAR2(18),
  S_FAX2                  VARCHAR2(18),
  AGENTKEY                VARCHAR2(15) default ' ' not null,
  A_CONTACT1              VARCHAR2(30),
  A_CONTACT2              VARCHAR2(30),
  A_COMPANY               VARCHAR2(30),
  A_ADDRESS1              VARCHAR2(30),
  A_ADDRESS2              VARCHAR2(30),
  A_ADDRESS3              VARCHAR2(30),
  A_ADDRESS4              VARCHAR2(30),
  A_CITY                  VARCHAR2(30),
  A_STATE                 VARCHAR2(2),
  A_ZIP                   VARCHAR2(18),
  A_COUNTRY               VARCHAR2(30),
  A_ISOCNTRYCODE          VARCHAR2(10),
  A_PHONE1                VARCHAR2(18),
  A_PHONE2                VARCHAR2(18),
  A_FAX1                  VARCHAR2(18),
  A_FAX2                  VARCHAR2(18),
  CURRENCY                VARCHAR2(10) default 'USD',
  WTVALPPD                VARCHAR2(10) default ' ',
  WTVALCOL                VARCHAR2(10) default ' ',
  OTHERPPD                VARCHAR2(10) default ' ',
  OTHERCOL                VARCHAR2(10) default ' ',
  DECLAREDVALUEFORCUSTOMS VARCHAR2(30) default 'AS PER INVOICE',
  PLACEOFLOADING          VARCHAR2(18) default ' ',
  ROUTETO01               VARCHAR2(18) default ' ',
  ROUTETO02               VARCHAR2(18) default ' ',
  ROUTETO03               VARCHAR2(18) default ' ',
  CARRIER01               VARCHAR2(18) default ' ',
  CARRIER02               VARCHAR2(18) default ' ',
  CARRIER03               VARCHAR2(18) default ' ',
  AIRPORTOFDESTINATION    VARCHAR2(18) default ' ',
  FLIGHTDATE01            VARCHAR2(18) default ' ' not null,
  FLIGHTDATE02            VARCHAR2(18) default ' ' not null,
  AMOUNTOFINSURANCE       VARCHAR2(18) default ' ' not null,
  CHARGEDESC01            VARCHAR2(10) default ' ' not null,
  PPDCHARGE01             NUMBER default 0 not null,
  COLLCHARGE01            NUMBER default 0 not null,
  CHARGEDESC02            VARCHAR2(10) default ' ' not null,
  PPDCHARGE02             NUMBER default 0 not null,
  COLLCHARGE02            NUMBER default 0 not null,
  CHARGEDESC03            VARCHAR2(10) default ' ' not null,
  PPDCHARGE03             NUMBER default 0 not null,
  COLLCHARGE03            NUMBER default 0 not null,
  CHARGEDESC04            VARCHAR2(10) default ' ' not null,
  PPDCHARGE04             NUMBER default 0 not null,
  COLLCHARGE04            NUMBER default 0 not null,
  CHARGEDESC05            VARCHAR2(10) default ' ' not null,
  PPDCHARGE05             NUMBER default 0 not null,
  COLLCHARGE05            NUMBER default 0 not null,
  CHARGEDESC06            VARCHAR2(10) default ' ' not null,
  PPDCHARGE06             NUMBER default 0 not null,
  COLLCHARGE06            NUMBER default 0 not null,
  PPDCHARGETOTAL          NUMBER default 0 not null,
  COLLCHARGETOTAL         NUMBER default 0 not null,
  TOTALCHARGE             NUMBER default 0 not null,
  TOTALPKGRECEIVED        NUMBER default 0 not null,
  TOTALGROSSWGT           NUMBER default 0 not null,
  ALTERNATECURRENCY       VARCHAR2(10) default 'USD' not null,
  CONVERSIONRATE          NUMBER default 1 not null,
  STATUS                  VARCHAR2(10) default '0' not null,
  EFFECTIVEDATE           DATE default SYSDATE not null,
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null,
  ACCOUNTINGINFO          VARCHAR2(2000),
  HANDLINGINFO            VARCHAR2(2000),
  NOTES                   VARCHAR2(2000)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MASTERAIRWAYBILL
  add constraint PK_SYS_C004691 primary key (MAWBKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MASTERAIRWAYBILL
  add check (STATUS IN ('0','1','2','3','4','5','6','7,','8,','9'));
create unique index MASTE_147 on MASTERAIRWAYBILL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MASTERAIRWAYBILLDETAIL
prompt =====================================
prompt
create table MASTERAIRWAYBILLDETAIL
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  MAWBKEY          VARCHAR2(15) not null,
  MAWBLINENUMBER   VARCHAR2(5) default ' ' not null,
  HAWBKEY          VARCHAR2(15) default ' ' not null,
  NUMBEROFPIECES   NUMBER(22,5) default 1 not null,
  GROSSWEIGHT      NUMBER(22,5) default 0 not null,
  UOMWEIGHT        VARCHAR2(10) default ' ' not null,
  RATECLASS        VARCHAR2(10) default ' ' not null,
  SKU              VARCHAR2(50) default ' ' not null,
  SKUDESCRIPTION   VARCHAR2(45) default ' ' not null,
  CHARGEABLEWEIGHT NUMBER(22,5) default 0 not null,
  RATE             NUMBER(22,5) default 0 not null,
  EXTENSION        NUMBER default 0 not null,
  UOMVOLUME        VARCHAR2(10) default ' ' not null,
  LENGTH           NUMBER(22,5) default 0 not null,
  WIDTH            NUMBER(22,5) default 0 not null,
  HEIGHT           NUMBER(22,5) default 0 not null,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null,
  NOTES            VARCHAR2(2000)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MASTERAIRWAYBILLDETAIL
  add constraint PK_SYS_C004690 primary key (MAWBKEY, MAWBLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index MASTE_148 on MASTERAIRWAYBILLDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MASTER_SCHED
prompt ===========================
prompt
create table MASTER_SCHED
(
  SERIALKEY            NUMBER not null,
  WHSEID               VARCHAR2(30) default USER,
  MASTER_ID            VARCHAR2(10) not null,
  DOOR_ID              VARCHAR2(10),
  WHSE_ID              VARCHAR2(15) not null,
  ROUTE_ID             VARCHAR2(10) not null,
  CDLKUP_DAYOFWEEK_BEG VARCHAR2(10) not null,
  BEG_TIME             VARCHAR2(4),
  CDLKUP_DAYOFWEEK_END VARCHAR2(10),
  END_TIME             VARCHAR2(4),
  DURATION_MIN         NUMBER(10),
  CDLKUP_APPT_STATUS   VARCHAR2(10) default ' ',
  LOAD_TYPE_ID         VARCHAR2(10),
  CDLKUP_APPT_TYPE     VARCHAR2(10) default ' ',
  ADDDATE              DATE default SYSDATE not null,
  ADDWHO               VARCHAR2(30) default USER not null,
  EDITDATE             DATE default SYSDATE not null,
  EDITWHO              VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MASTER_SCHED
  add constraint PK_SYS_C004693 primary key (MASTER_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MASTER_SCHED
  add foreign key (DOOR_ID, WHSE_ID)
  references DOOR (DOOR_ID, WHSE_ID);
create unique index MASTE_150 on MASTER_SCHED (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MASTER_DETAIL
prompt ============================
prompt
create table MASTER_DETAIL
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  MASTER_ID               VARCHAR2(10) not null,
  MASTER_DTL_ID           VARCHAR2(10) not null,
  DOCK_STORER_ID          VARCHAR2(15),
  CDLKUP_DOCK_STORER_TYPE VARCHAR2(10),
  EQPT_CATEGORY_ID        VARCHAR2(10) default ' ',
  EQPT_CLASS_ID           VARCHAR2(10) default ' ',
  EQPT_UNIT_ID            VARCHAR2(18),
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MASTER_DETAIL
  add constraint PK_SYS_C004692 primary key (MASTER_ID, MASTER_DTL_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MASTER_DETAIL
  add foreign key (MASTER_ID)
  references MASTER_SCHED (MASTER_ID);
create unique index MASTE_149 on MASTER_DETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MBOL
prompt ===================
prompt
create table MBOL
(
  SERIALKEY                   NUMBER not null,
  WHSEID                      VARCHAR2(30) default USER,
  MBOLKEY                     VARCHAR2(10) not null,
  STATUS                      VARCHAR2(10) default '0' not null,
  EXTERNMBOLKEY               VARCHAR2(30) default ' ' not null,
  ORIGINCOUNTRY               VARCHAR2(30) default ' ' not null,
  DESTINATIONCOUNTRY          VARCHAR2(30) default ' ' not null,
  VESSELQUALIFIER             VARCHAR2(10) default 'VM' not null,
  VESSEL                      VARCHAR2(30) default ' ' not null,
  PLACEOFLOADINGQUALIFIER     VARCHAR2(10) default ' ' not null,
  PLACEOFLOADING              VARCHAR2(30) default ' ' not null,
  PLACEOFDISCHARGEQUALIFIER   VARCHAR2(10) default ' ' not null,
  PLACEOFDISCHARGE            VARCHAR2(30) default ' ' not null,
  PLACEOFDELIVERYQUALIFIER    VARCHAR2(10) default ' ' not null,
  PLACEOFDELIVERY             VARCHAR2(30) default ' ' not null,
  TRANSMETHOD                 VARCHAR2(30) default ' ' not null,
  VOYAGENUMBER                VARCHAR2(30) default ' ' not null,
  DEPARTUREDATE               DATE default SYSDATE not null,
  ARRIVALDATE                 DATE default SYSDATE not null,
  ARRIVALDATEFINALDESTINATION DATE default SYSDATE not null,
  BOOKINGREFERENCE            VARCHAR2(30) default ' ' not null,
  OTHERREFERENCE              VARCHAR2(30) default ' ' not null,
  CARRIERKEY                  VARCHAR2(15) default ' ' not null,
  CARRIERAGENT                VARCHAR2(30) default ' ' not null,
  EFFECTIVEDATE               DATE default SYSDATE not null,
  FORTE_FLAG                  VARCHAR2(6) default 'I' not null,
  ADDDATE                     DATE default SYSDATE not null,
  ADDWHO                      VARCHAR2(30) default USER not null,
  EDITDATE                    DATE default SYSDATE not null,
  EDITWHO                     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MBOL
  add constraint PK_SYS_C004695 primary key (MBOLKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MBOL
  add check (STATUS = '9' OR STATUS = '0');
create unique index MBOL_151 on MBOL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MBOLDETAIL
prompt =========================
prompt
create table MBOLDETAIL
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  MBOLKEY        VARCHAR2(10) not null,
  MBOLLINENUMBER VARCHAR2(5) not null,
  CONTAINERKEY   VARCHAR2(20),
  ORDERKEY       VARCHAR2(10),
  PALLETKEY      VARCHAR2(10),
  DESCRIPTION    VARCHAR2(30) default ' ' not null,
  FORTE_FLAG     VARCHAR2(6) default 'I' not null,
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MBOLDETAIL
  add constraint PK_SYS_C004694 primary key (MBOLKEY, MBOLLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index MBOLD_152 on MBOLDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MENU
prompt ===================
prompt
create table MENU
(
  MENUID       NVARCHAR2(10),
  PARENTMENUID NVARCHAR2(10),
  MENUNAME     NVARCHAR2(100),
  URL          NVARCHAR2(100),
  MULTITAB     NVARCHAR2(1) default '0'
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table NCOUNTER
prompt =======================
prompt
create table NCOUNTER
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  KEYNAME   VARCHAR2(30) not null,
  KEYCOUNT  NUMBER(10) not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table NCOUNTER
  add constraint PK_SYS_C004696 primary key (KEYNAME)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index NCOUN_153 on NCOUNTER (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table NSQLCONFIG
prompt =========================
prompt
create table NSQLCONFIG
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  CONFIGKEY     VARCHAR2(30) not null,
  NSQLVALUE     VARCHAR2(30) default ' ' not null,
  NSQLDEFAULT   VARCHAR2(30) default ' ' not null,
  NSQLDESCRIP   VARCHAR2(120),
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null,
  PARAMETERTYPE VARCHAR2(1) default 'F' not null,
  MODIFIABLE    VARCHAR2(1) default '1' not null,
  EFFECTIVE     VARCHAR2(1) default 'I' not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table NSQLCONFIG
  add constraint PK_SYS_C004697 primary key (CONFIGKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index NSQLC_154 on NSQLCONFIG (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OPERATIONCLASS
prompt =============================
prompt
create table OPERATIONCLASS
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  OPCLASSID   NUMBER(10) not null,
  OPCLASSKEY  VARCHAR2(32) not null,
  DESCRIPTION VARCHAR2(64),
  LISTNAME    VARCHAR2(10) default 'WKCOPTYPE',
  OPCLASSTYPE VARCHAR2(10),
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OPERATIONCLASS
  add constraint PK_SYS_C004701 primary key (OPCLASSID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_OPERATIONCLASS01 on OPERATIONCLASS (LISTNAME, OPCLASSTYPE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OPERATIONCLASSU1 on OPERATIONCLASS (OPCLASSKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OPERA_155 on OPERATIONCLASS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OPPALLOCATIONMGT
prompt ===============================
prompt
create table OPPALLOCATIONMGT
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  STORERKEY         VARCHAR2(15) not null,
  CONSIGNEEKEY      VARCHAR2(15) not null,
  SKU               VARCHAR2(50),
  ORDERKEY          VARCHAR2(10) not null,
  ORDERDATE         DATE default SYSDATE not null,
  OPENQTY           NUMBER(22,5) default 0,
  SEQUENCE          INTEGER default 0,
  PRIORITYGROUP     INTEGER default 4,
  MANUAL            VARCHAR2(1) default '0' not null,
  REQUESTEDSHIPDATE DATE default SYSDATE,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OPPALLOCATIONMGT
  add constraint PK_SYS_C004698 primary key (ORDERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OPPAL_156 on OPPALLOCATIONMGT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OPPORDERSTRATEGY
prompt ===============================
prompt
create table OPPORDERSTRATEGY
(
  SERIALKEY              NUMBER not null,
  WHSEID                 VARCHAR2(30) default USER,
  OPPORDERSTRATEGYKEY    VARCHAR2(15) not null,
  DESCRIPTION            VARCHAR2(50),
  PRIORITYGROUP1FLAG     VARCHAR2(1) default ('5') not null,
  PRIORITYGROUP2FLAG     VARCHAR2(1) default ('0') not null,
  PRIORITYGROUP3FLAG     VARCHAR2(1) default ('0') not null,
  PRIORITYFROM01         VARCHAR2(10),
  PRIORITYFROM02         VARCHAR2(10),
  PRIORITYFROM03         VARCHAR2(10),
  PRIORITYTO01           VARCHAR2(10),
  PRIORITYTO02           VARCHAR2(10),
  PRIORITYTO03           VARCHAR2(10),
  ORDERDATESTARTDAYS01   INTEGER,
  ORDERDATESTARTDAYS02   INTEGER,
  ORDERDATESTARTDAYS03   INTEGER,
  ORDERDATEENDDAYS01     INTEGER,
  ORDERDATEENDDAYS02     INTEGER,
  ORDERDATEENDDAYS03     INTEGER,
  REQSHIPDATESTARTDAYS01 INTEGER,
  REQSHIPDATESTARTDAYS02 INTEGER,
  REQSHIPDATESTARTDAYS03 INTEGER,
  REQSHIPDATEENDDAYS01   INTEGER,
  REQSHIPDATEENDDAYS02   INTEGER,
  REQSHIPDATEENDDAYS03   INTEGER,
  ORDERTYPEINCLUDE01     VARCHAR2(10),
  ORDERTYPEINCLUDE02     VARCHAR2(10),
  ORDERTYPEINCLUDE03     VARCHAR2(10),
  ADDDATE                DATE default SYSDATE not null,
  ADDWHO                 VARCHAR2(30) default USER not null,
  EDITDATE               DATE default SYSDATE not null,
  EDITWHO                VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OPPORDERSTRATEGY
  add constraint PK_SYS_C004699 primary key (OPPORDERSTRATEGYKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OPPOR_157 on OPPORDERSTRATEGY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OPSSKUDET
prompt ========================
prompt
create table OPSSKUDET
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  SKUBYOPID   NUMBER(10) not null,
  SKUBYOPKEY  VARCHAR2(32) not null,
  OPERATIONID NUMBER(10),
  QTYREQUIRED NUMBER(18,7),
  QTYUSED     NUMBER(18,7),
  STATUS      NUMBER(2),
  STORERKEY   VARCHAR2(15),
  SKU         VARCHAR2(50),
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OPSSKUDET
  add constraint PK_SYS_C004703 primary key (SKUBYOPID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OPSSKUDET
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
create index IDX_OPSSKUDET01 on OPSSKUDET (OPERATIONID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OPSSKUDETU1 on OPSSKUDET (SKUBYOPKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OPSSK_158 on OPSSKUDET (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WORKCENTERDEFN
prompt =============================
prompt
create table WORKCENTERDEFN
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  WORKCENTERDEFNID   NUMBER(10) not null,
  WORKCENTERDEFNKEY  VARCHAR2(32) not null,
  DESCRIPTION        VARCHAR2(64),
  ISINBNDDZGROUP     NUMBER(1) default 0,
  ISOPCMPDZGROUP     NUMBER(1) default 0,
  ISFINGDDZGROUP     NUMBER(1) default 0,
  ISTMIBTOWC         NUMBER(1) default 0,
  ISTMWCTOOC         NUMBER(1) default 0,
  ISTMWCTOFG         NUMBER(1) default 0 not null,
  ISWCALLOC          NUMBER(1) default 0,
  ISMOVETASK         NUMBER(1) default 0,
  LOC                VARCHAR2(10),
  LOC_INBOUNDDZ      VARCHAR2(10),
  LOC_OPCOMPLETEDZ   VARCHAR2(10),
  LOC_FINISHEDGOODDZ VARCHAR2(10),
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WORKCENTERDEFN
  add constraint PK_SYS_C004808 primary key (WORKCENTERDEFNID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WORKCENTERDEFN
  add foreign key (LOC)
  references LOC (LOC);
alter table WORKCENTERDEFN
  add foreign key (LOC_INBOUNDDZ)
  references LOC (LOC);
alter table WORKCENTERDEFN
  add foreign key (LOC_OPCOMPLETEDZ)
  references LOC (LOC);
alter table WORKCENTERDEFN
  add foreign key (LOC_FINISHEDGOODDZ)
  references LOC (LOC);
create unique index WORKCENTERDEFNU1 on WORKCENTERDEFN (WORKCENTERDEFNKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WORKC_290 on WORKCENTERDEFN (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WORKORDERDEFN
prompt ============================
prompt
create table WORKORDERDEFN
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  WORKORDERDEFNID  NUMBER(10) not null,
  WORKORDERDEFNKEY VARCHAR2(32) not null,
  EXTERNWOKEY      VARCHAR2(32),
  DESCRIPTION      VARCHAR2(64),
  STATUS           NUMBER(2),
  WOLISTNAME       VARCHAR2(10),
  WOTYPE           VARCHAR2(10) default 'ATO',
  BOMHDRDEFNID     NUMBER(10),
  QUANTITY         NUMBER(18,7),
  PICKRELEASEHOW   NUMBER(2) default 0,
  ADJSKUQTYHOW     NUMBER(2) default 0,
  ISSHIPORDBYOP    NUMBER(1) default 0,
  INSTRUCTIONSURL  VARCHAR2(250),
  NOTES            VARCHAR2(250),
  UDF1             VARCHAR2(32),
  UDF2             VARCHAR2(32),
  UDF3             VARCHAR2(32),
  UDF4             VARCHAR2(32),
  UDF5             VARCHAR2(32),
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WORKORDERDEFN
  add constraint PK_SYS_C004809 primary key (WORKORDERDEFNID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WORKORDERDEFN
  add foreign key (BOMHDRDEFNID)
  references BOMHDRDEFN (BOMHDRDEFNID);
create index IDX_WORKORDERDEFN01 on WORKORDERDEFN (BOMHDRDEFNID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_WORKORDERDEFN02 on WORKORDERDEFN (WOLISTNAME, WOTYPE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WORKORDERDEFNU1 on WORKORDERDEFN (WORKORDERDEFNKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WORKO_292 on WORKORDERDEFN (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ROUTEOPSDEFN
prompt ===========================
prompt
create table ROUTEOPSDEFN
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  OPERATIONDEFNID  NUMBER(10) not null,
  OPERATIONDEFNKEY VARCHAR2(32) not null,
  DESCRIPTION      VARCHAR2(64),
  SEQUENCE         NUMBER(10) not null,
  TIMECODEBASIS    VARCHAR2(32) default 'MINUTES',
  STANDARDTIME     NUMBER(18) default 0,
  ACTUALTIME       NUMBER(18) default 0,
  CREWSIZE         NUMBER(10) default 1,
  EXTERNPROCCOST   NUMBER(18,3) default 0,
  SCRAPPERCENT     NUMBER(18,16) default 0,
  BATCHQTY         NUMBER(18,7) default 0,
  BATCHUOM         VARCHAR2(10) default 'EACH',
  ISDYNAMIC        NUMBER(1) default 0,
  SUSPENDAFTEROP   NUMBER(1) default 0,
  PICKRELEASEHOW   NUMBER(2) default 0,
  UPDATEINVENTORY  NUMBER(1) default 0,
  STATUS           NUMBER(2),
  WORKORDERDEFNID  NUMBER(10),
  WORKCENTERDEFNID NUMBER(10),
  OPCLASSID        NUMBER(10),
  INSTRUCTIONSURL  VARCHAR2(250),
  NOTES            VARCHAR2(250),
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROUTEOPSDEFN
  add constraint PK_SYS_C004760 primary key (OPERATIONDEFNID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROUTEOPSDEFN
  add foreign key (OPCLASSID)
  references OPERATIONCLASS (OPCLASSID);
alter table ROUTEOPSDEFN
  add foreign key (WORKCENTERDEFNID)
  references WORKCENTERDEFN (WORKCENTERDEFNID);
alter table ROUTEOPSDEFN
  add foreign key (WORKORDERDEFNID)
  references WORKORDERDEFN (WORKORDERDEFNID);
create index IDX_ROUTEOPSDEFN01 on ROUTEOPSDEFN (WORKORDERDEFNID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ROUTEOPSDEFN02 on ROUTEOPSDEFN (WORKCENTERDEFNID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ROUTEOPSDEFN03 on ROUTEOPSDEFN (OPCLASSID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ROUTEOPSDEFNU1 on ROUTEOPSDEFN (OPERATIONDEFNKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ROUTE_239 on ROUTEOPSDEFN (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OPSSKUDETDEFN
prompt ============================
prompt
create table OPSSKUDETDEFN
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  SKUBYOPDEFNID   NUMBER(10) not null,
  SKUBYOPDEFNKEY  VARCHAR2(32) not null,
  OPERATIONDEFNID NUMBER(10),
  QTYREQUIRED     NUMBER(18,7),
  STATUS          NUMBER(2),
  STORERKEY       VARCHAR2(15),
  SKU             VARCHAR2(50),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OPSSKUDETDEFN
  add constraint PK_SYS_C004702 primary key (SKUBYOPDEFNID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OPSSKUDETDEFN
  add foreign key (OPERATIONDEFNID)
  references ROUTEOPSDEFN (OPERATIONDEFNID);
alter table OPSSKUDETDEFN
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
create index IDX_OPSSKUDETDEFN01 on OPSSKUDETDEFN (OPERATIONDEFNID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OPSSKUDETDEFNU1 on OPSSKUDETDEFN (SKUBYOPDEFNKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OPSSK_159 on OPSSKUDETDEFN (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OPTSKUXLOC
prompt =========================
prompt
create table OPTSKUXLOC
(
  SERIALKEY                   NUMBER not null,
  WHSEID                      VARCHAR2(30) default USER,
  STORERKEY                   VARCHAR2(15) default ' ' not null,
  SKU                         VARCHAR2(50) default ' ' not null,
  LOC                         VARCHAR2(10) default ' ' not null,
  QTY                         NUMBER(22,5) default 0 not null,
  QTYALLOCATED                NUMBER(22,5) default 0 not null,
  QTYPICKED                   NUMBER(22,5) default 0 not null,
  QTYEXPECTED                 NUMBER(22,5) default 0 not null,
  QTYLOCATIONLIMIT            NUMBER(22,5) default 0 not null,
  QTYLOCATIONMINIMUM          NUMBER(22,5) default 0 not null,
  QTYPICKINPROCESS            NUMBER(22,5) default 0 not null,
  QTYREPLENISHMENTOVERRIDE    NUMBER(22,5) default 0 not null,
  REPLENISHMENTPRIORITY       VARCHAR2(5) default '9' not null,
  REPLENISHMENTSEVERITY       NUMBER(22,5) default 0 not null,
  REPLENISHMENTCASECNT        NUMBER(22,5) default 0 not null,
  LOCATIONTYPE                VARCHAR2(10) default 'OTHER' not null,
  LOCATIONUOM                 VARCHAR2(10) default ' ',
  REPLENISHMENTUOM            VARCHAR2(10) default '1',
  REPLENISHMENTQTY            NUMBER(22,5) default 0,
  TODOUSER                    VARCHAR2(18) default ' ',
  ALLOWREPLENISHFROMCASEPICK  NUMBER(1) default 0,
  ALLOWREPLENISHFROMBULK      NUMBER(1) default 0,
  ALLOWREPLENISHFROMPIECEPICK NUMBER(1) default 0,
  OPTBATCHID                  VARCHAR2(10),
  OPTSEQUENCE                 VARCHAR2(10),
  OPTADDDELFLAG               VARCHAR2(1),
  ADDDATE                     DATE default SYSDATE not null,
  ADDWHO                      VARCHAR2(30) default USER not null,
  EDITDATE                    DATE default SYSDATE not null,
  EDITWHO                     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OPTSK_160 on OPTSKUXLOC (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORDERS
prompt =====================
prompt
create table ORDERS
(
  SERIALKEY             NUMBER not null,
  WHSEID                VARCHAR2(30) default USER,
  ORDERKEY              VARCHAR2(10) not null,
  STORERKEY             VARCHAR2(15) default ' ' not null,
  EXTERNORDERKEY        VARCHAR2(32) default ' ' not null,
  ORDERDATE             DATE default SYSDATE not null,
  DELIVERYDATE          DATE default SYSDATE not null,
  PRIORITY              VARCHAR2(10) default '5' not null,
  CONSIGNEEKEY          VARCHAR2(15) default ' ' not null,
  C_CONTACT1            VARCHAR2(30),
  C_CONTACT2            VARCHAR2(30),
  C_COMPANY             VARCHAR2(45),
  C_ADDRESS1            VARCHAR2(45),
  C_ADDRESS2            VARCHAR2(45),
  C_ADDRESS3            VARCHAR2(45),
  C_ADDRESS4            VARCHAR2(45),
  C_CITY                VARCHAR2(45),
  C_STATE               VARCHAR2(2),
  C_ZIP                 VARCHAR2(18),
  C_COUNTRY             VARCHAR2(30),
  C_ISOCNTRYCODE        VARCHAR2(10),
  C_PHONE1              VARCHAR2(18),
  C_PHONE2              VARCHAR2(18),
  C_FAX1                VARCHAR2(18),
  C_FAX2                VARCHAR2(18),
  C_VAT                 VARCHAR2(18),
  BUYERPO               VARCHAR2(20),
  BILLTOKEY             VARCHAR2(15) default ' ' not null,
  B_CONTACT1            VARCHAR2(30),
  B_CONTACT2            VARCHAR2(30),
  B_COMPANY             VARCHAR2(45),
  B_ADDRESS1            VARCHAR2(45),
  B_ADDRESS2            VARCHAR2(45),
  B_ADDRESS3            VARCHAR2(45),
  B_ADDRESS4            VARCHAR2(45),
  B_CITY                VARCHAR2(45),
  B_STATE               VARCHAR2(2),
  B_ZIP                 VARCHAR2(18),
  B_COUNTRY             VARCHAR2(30),
  B_ISOCNTRYCODE        VARCHAR2(10),
  B_PHONE1              VARCHAR2(18),
  B_PHONE2              VARCHAR2(18),
  B_FAX1                VARCHAR2(18),
  B_FAX2                VARCHAR2(18),
  B_VAT                 VARCHAR2(18),
  INCOTERM              VARCHAR2(10),
  PMTTERM               VARCHAR2(10),
  DOOR                  VARCHAR2(10) default ' ' not null,
  SORTATIONLOCATION     VARCHAR2(18),
  BATCHFLAG             VARCHAR2(1) default '0' not null,
  BULKCARTONGROUP       VARCHAR2(10),
  ROUTE                 VARCHAR2(10) default ' ' not null,
  STOP                  VARCHAR2(10) default ' ' not null,
  OPENQTY               NUMBER(22,5) default 0,
  STATUS                VARCHAR2(10) default '02' not null,
  DISCHARGEPLACE        VARCHAR2(30),
  DELIVERYPLACE         VARCHAR2(30),
  INTERMODALVEHICLE     VARCHAR2(30) default ' ' not null,
  COUNTRYOFORIGIN       VARCHAR2(30),
  COUNTRYDESTINATION    VARCHAR2(30),
  UPDATESOURCE          VARCHAR2(10) default '0' not null,
  TYPE                  VARCHAR2(10) default '0' not null,
  ORDERGROUP            VARCHAR2(20) default ' ' not null,
  EFFECTIVEDATE         DATE default SYSDATE not null,
  STAGE                 VARCHAR2(10) default ' ',
  DC_ID                 VARCHAR2(10) default ' ',
  WHSE_ID               VARCHAR2(10) default ' ',
  SPLIT_ORDERS          VARCHAR2(1) default '0',
  APPT_STATUS           VARCHAR2(10),
  CHEPPALLETINDICATOR   VARCHAR2(10),
  CONTAINERTYPE         VARCHAR2(20),
  CONTAINERQTY          NUMBER(22,5),
  BILLEDCONTAINERQTY    NUMBER(22,5),
  TRANSPORTATIONMODE    VARCHAR2(30),
  TRANSPORTATIONSERVICE VARCHAR2(30),
  EXTERNALORDERKEY2     VARCHAR2(32),
  C_EMAIL1              VARCHAR2(55),
  C_EMAIL2              VARCHAR2(55),
  SUSR1                 VARCHAR2(30),
  SUSR2                 VARCHAR2(30),
  SUSR3                 VARCHAR2(30),
  SUSR4                 VARCHAR2(30),
  SUSR5                 VARCHAR2(30),
  NOTES2                VARCHAR2(2000),
  ITEM_NUMBER           NUMBER(28) default 0,
  FORTE_FLAG            VARCHAR2(6) default 'I' not null,
  LOADID                VARCHAR2(20),
  SHIPTOGETHER          VARCHAR2(1) default 'N' not null,
  DELIVERYDATE2         DATE default SYSDATE,
  REQUESTEDSHIPDATE     DATE default SYSDATE,
  ACTUALSHIPDATE        DATE default SYSDATE,
  DELIVER_DATE          DATE default SYSDATE not null,
  ORDERVALUE            NUMBER(10,2) default 0 not null,
  OHTYPE                VARCHAR2(10) default '1',
  EXTERNALLOADID        VARCHAR2(20) default ' ',
  DESTINATIONNESTID     NUMBER,
  REFERENCENUM          VARCHAR2(30),
  INTRANSITKEY          VARCHAR2(10),
  RECEIPTKEY            VARCHAR2(10),
  CASELABELTYPE         VARCHAR2(10),
  LABELNAME             VARCHAR2(20),
  STDSSCCLABELNAME      VARCHAR2(20),
  STDGTINLABELNAME      VARCHAR2(20),
  RFIDSSCCLABELNAME     VARCHAR2(20),
  RFIDGTINLABELNAME     VARCHAR2(20),
  RFIDFLAG              VARCHAR2(1) default '0' not null,
  CARRIERCODE           VARCHAR2(15),
  CARRIERNAME           VARCHAR2(45),
  CARRIERADDRESS1       VARCHAR2(45),
  CARRIERADDRESS2       VARCHAR2(45),
  CARRIERCITY           VARCHAR2(45),
  CARRIERSTATE          VARCHAR2(25),
  CARRIERZIP            VARCHAR2(18),
  CARRIERCOUNTRY        VARCHAR2(30),
  CARRIERPHONE          VARCHAR2(18),
  DRIVERNAME            VARCHAR2(25),
  TRAILERNUMBER         VARCHAR2(25),
  TRAILEROWNER          VARCHAR2(25),
  DEPDATETIME           DATE default SYSDATE not null,
  ORDERBREAK            VARCHAR2(1),
  ADDDATE               DATE default SYSDATE not null,
  ADDWHO                VARCHAR2(30) default USER not null,
  EDITDATE              DATE default SYSDATE not null,
  EDITWHO               VARCHAR2(30) default USER not null,
  NOTES                 VARCHAR2(2000),
  PICKGRPTYPE           VARCHAR2(10) default '0'
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column ORDERS.PICKGRPTYPE
  is '生成拣货流水号类型';
alter table ORDERS
  add constraint PK_SYS_C004711 primary key (ORDERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add foreign key (STORERKEY)
  references STORER (STORERKEY);
create index IDX_ORDERS_EXTERNORDERKEY on ORDERS (EXTERNORDERKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_ORDERS_ROUTE on ORDERS (ROUTE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ORDER_172 on ORDERS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OPXSHIPORD
prompt =========================
prompt
create table OPXSHIPORD
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  OPSHIPID    NUMBER(10) not null,
  OPSHIPKEY   VARCHAR2(32) not null,
  OPERATIONID NUMBER(10),
  ORDERKEY    VARCHAR2(10),
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OPXSHIPORD
  add constraint PK_SYS_C004704 primary key (OPSHIPID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OPXSHIPORD
  add foreign key (ORDERKEY)
  references ORDERS (ORDERKEY);
create index IDX_OPORDXSHIPORD01 on OPXSHIPORD (OPERATIONID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OPORDXSHIPORDU1 on OPXSHIPORD (OPSHIPKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OPORDXSHIPORDU2 on OPXSHIPORD (ORDERKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OPXSH_161 on OPXSHIPORD (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OPXSKUXLOC
prompt =========================
prompt
create table OPXSKUXLOC
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  OPXSKUXLOCID  NUMBER(10) not null,
  OPXSKUXLOCKEY VARCHAR2(18) not null,
  WORKORDERID   NUMBER(10) not null,
  OPERATIONSTEP NUMBER(10) not null,
  LOCTYPE       VARCHAR2(18),
  PICKHEADERKEY VARCHAR2(18) not null,
  PICKDETAILKEY VARCHAR2(18) not null,
  CASEID        VARCHAR2(20) not null,
  STORERKEY     VARCHAR2(15) not null,
  SKU           VARCHAR2(50) not null,
  LOC           VARCHAR2(10) not null,
  QTYINCOMING   NUMBER(22,5) not null,
  QTY           NUMBER(22,5) not null,
  QTYCOMPLETED  NUMBER(22,5) not null,
  QTYSTARTED    NUMBER(22,5) not null,
  QTYMOVED      NUMBER(22,5) not null,
  STATUS        NUMBER(10) not null,
  PICKSTATUS    VARCHAR2(10) not null,
  MOVABLEID     VARCHAR2(18) not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OPXSKUXLOC
  add constraint PK_SYS_C004705 primary key (OPXSKUXLOCID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OPXSKUXLOC
  add foreign key (LOC)
  references LOC (LOC);
alter table OPXSKUXLOC
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
create index IDX_OPXSKUXLOC01 on OPXSKUXLOC (WORKORDERID, OPERATIONSTEP)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_OPXSKUXLOC02 on OPXSKUXLOC (SKU, STORERKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_OPXSKUXLOC03 on OPXSKUXLOC (PICKDETAILKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OPXSK_162 on OPXSKUXLOC (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OP_CARTONLINES
prompt =============================
prompt
create table OP_CARTONLINES
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  CARTONBATCH     VARCHAR2(10) not null,
  PICKDETAILKEY   VARCHAR2(10) not null,
  PICKHEADERKEY   VARCHAR2(10),
  ORDERKEY        VARCHAR2(10),
  ORDERLINENUMBER VARCHAR2(10),
  STORERKEY       VARCHAR2(15),
  SKU             VARCHAR2(50),
  LOC             VARCHAR2(10),
  LOT             VARCHAR2(10),
  ID              VARCHAR2(18),
  CASEID          VARCHAR2(20),
  UOM             VARCHAR2(10),
  UOMQTY          NUMBER(22,5),
  QTY             NUMBER(22,5),
  PACKKEY         VARCHAR2(50),
  CARTONGROUP     VARCHAR2(10),
  CARTONTYPE      VARCHAR2(10),
  DOREPLENISH     VARCHAR2(1),
  REPLENISHZONE   VARCHAR2(10),
  DOCARTONIZE     VARCHAR2(1),
  PICKMETHOD      VARCHAR2(1),
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITWHO         VARCHAR2(30) default USER not null,
  EFFECTIVEDATE   DATE default SYSDATE not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OP_CARTONLINES
  add constraint PK_SYS_C004706 primary key (CARTONBATCH, PICKDETAILKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OP_CA_163 on OP_CARTONLINES (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OP_CARTONLINESWORK
prompt =================================
prompt
create table OP_CARTONLINESWORK
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  CARTONBATCH     VARCHAR2(10) not null,
  PICKDETAILKEY   VARCHAR2(10) not null,
  PICKHEADERKEY   VARCHAR2(10) not null,
  ORDERKEY        VARCHAR2(10) not null,
  ORDERLINENUMBER VARCHAR2(5) not null,
  STORERKEY       VARCHAR2(15) default ' ' not null,
  SKU             VARCHAR2(50) default ' ' not null,
  LOC             VARCHAR2(10) default ' ' not null,
  LOT             VARCHAR2(10) default ' ' not null,
  ID              VARCHAR2(18) default ' ' not null,
  CASEID          VARCHAR2(20) default ' ' not null,
  CARTONTYPE      VARCHAR2(10) default ' ' not null,
  UOM             VARCHAR2(10) default ' ' not null,
  UOMQTY          NUMBER(22,5) default 0 not null,
  QTY             NUMBER(22,5) default 0 not null,
  PACKKEY         VARCHAR2(50) default 'STD' not null,
  CARTONGROUP     VARCHAR2(10) default 'STD' not null,
  STDCUBE         NUMBER(22,5) default 0 not null,
  CUBE            NUMBER(22,5) default 0 not null,
  STDGROSSWGT     NUMBER(22,5) default 0 not null,
  GROSSWGT        NUMBER(22,5) default 0 not null,
  STDNETWGT       NUMBER(22,5) default 0 not null,
  NETWGT          NUMBER(22,5) default 0 not null,
  DOREPLENISH     VARCHAR2(1) default 'N' not null,
  REPLENISHZONE   VARCHAR2(10) default ' ' not null,
  DOCARTONIZE     VARCHAR2(1) default 'N' not null,
  PICKMETHOD      VARCHAR2(1) default ' ' not null,
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OP_CA_164 on OP_CARTONLINESWORK (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OP_CARTONWORK
prompt ============================
prompt
create table OP_CARTONWORK
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  CARTONBATCH     VARCHAR2(10) not null,
  PICKDETAILKEY   VARCHAR2(10) not null,
  PICKHEADERKEY   VARCHAR2(10) not null,
  ORDERKEY        VARCHAR2(10) not null,
  ORDERLINENUMBER VARCHAR2(5) not null,
  STORERKEY       VARCHAR2(15) default ' ' not null,
  SKU             VARCHAR2(50) default ' ' not null,
  LOC             VARCHAR2(10) default ' ' not null,
  LOT             VARCHAR2(10) default ' ' not null,
  ID              VARCHAR2(18) default ' ' not null,
  CASEID          VARCHAR2(20) default ' ' not null,
  CARTONTYPE      VARCHAR2(10) default ' ' not null,
  UOM             VARCHAR2(10) default ' ' not null,
  UOMQTY          NUMBER(22,5) default 0 not null,
  QTY             NUMBER(22,5) default 0 not null,
  PACKKEY         VARCHAR2(50) default 'STD' not null,
  CARTONGROUP     VARCHAR2(10) default 'STD' not null,
  STDCUBE         NUMBER(22,5) default 0 not null,
  CUBE            NUMBER(22,5) default 0 not null,
  STDGROSSWGT     NUMBER(22,5) default 0 not null,
  GROSSWGT        NUMBER(22,5) default 0 not null,
  STDNETWGT       NUMBER(22,5) default 0 not null,
  NETWGT          NUMBER(22,5) default 0 not null,
  DOREPLENISH     VARCHAR2(1) default 'N' not null,
  REPLENISHZONE   VARCHAR2(10) default ' ' not null,
  DOCARTONIZE     VARCHAR2(1) default 'N' not null,
  PICKMETHOD      VARCHAR2(1) default ' ' not null,
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OP_CA_165 on OP_CARTONWORK (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OP_LOC
prompt =====================
prompt
create table OP_LOC
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  ORDERKEY  VARCHAR2(10),
  LOC       VARCHAR2(10) not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OP_LO_166 on OP_LOC (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OP_ORDERDETAIL
prompt =============================
prompt
create table OP_ORDERDETAIL
(
  SERIALKEY            NUMBER not null,
  WHSEID               VARCHAR2(30) default USER,
  ORDERKEY             VARCHAR2(10) not null,
  ORDERLINENUMBER      VARCHAR2(5) not null,
  SKU                  VARCHAR2(50) default ' ' not null,
  STORERKEY            VARCHAR2(15) default ' ' not null,
  OPENQTY              NUMBER(22,5) default 0 not null,
  QTYPREALLOCATED      NUMBER(22,5) default 0 not null,
  QTYALLOCATED         NUMBER(22,5) default 0 not null,
  QTYPICKED            NUMBER(22,5) default 0 not null,
  UOM                  VARCHAR2(10) default ' ' not null,
  UOMQTY               NUMBER(22,5) default 0 not null,
  PACKKEY              VARCHAR2(50) default 'STD' not null,
  STRATEGYKEY          VARCHAR2(10) default 'STD' not null,
  ONRECEIPTCOPYPACKKEY VARCHAR2(10) default '0' not null,
  PICKCODE             VARCHAR2(10) default ' ' not null,
  PICKMETHOD           VARCHAR2(1) default ' ' not null,
  DOCARTONIZE          VARCHAR2(1) default ' ' not null,
  CARTONGROUP          VARCHAR2(10) default ' ' not null,
  LOT                  VARCHAR2(10) default ' ' not null,
  ID                   VARCHAR2(18) default ' ' not null,
  FACILITY             VARCHAR2(20) default ' ' not null,
  STATUS               VARCHAR2(10) default '0' not null,
  TYPE                 VARCHAR2(10) default '0' not null,
  PRIORITY             VARCHAR2(10) default '5' not null,
  ORDERGROUP           VARCHAR2(20) default ' ' not null,
  CONSIGNEEKEY         VARCHAR2(15) default ' ' not null,
  DELIVERYDATE         DATE default SYSDATE not null,
  ORDERDATE            DATE default SYSDATE not null,
  INTERMODALVEHICLE    VARCHAR2(30) default ' ' not null,
  LOTTABLE01           VARCHAR2(50) default ' ' not null,
  LOTTABLE02           VARCHAR2(50) default ' ' not null,
  LOTTABLE03           VARCHAR2(50) default ' ' not null,
  LOTTABLE04           VARCHAR2(50) default ' ' not null,
  LOTTABLE05           VARCHAR2(50) default ' ' not null,
  LOTTABLE06           VARCHAR2(50) default ' ' not null,
  LOTTABLE07           VARCHAR2(50) default ' ' not null,
  LOTTABLE08           VARCHAR2(50) default ' ' not null,
  LOTTABLE09           VARCHAR2(50) default ' ' not null,
  LOTTABLE10           VARCHAR2(50) default ' ' not null,
  ADDDATE              DATE default SYSDATE not null,
  ADDWHO               VARCHAR2(30) default USER not null,
  EDITDATE             DATE default SYSDATE not null,
  EDITWHO              VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OP_OR_167 on OP_ORDERDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table OP_PICKLOCS
prompt ==========================
prompt
create table OP_PICKLOCS
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  ORDERKEY     VARCHAR2(10),
  STORERKEY    VARCHAR2(15),
  SKU          VARCHAR2(50),
  LOC          VARCHAR2(10),
  LOCATIONTYPE VARCHAR2(10),
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index OP_PI_168 on OP_PICKLOCS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORDERDETAIL
prompt ==========================
prompt
create table ORDERDETAIL
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  ORDERKEY                VARCHAR2(10) not null,
  ORDERLINENUMBER         VARCHAR2(5) not null,
  ORDERDETAILSYSID        NUMBER(10),
  EXTERNORDERKEY          VARCHAR2(32) default ' ' not null,
  EXTERNLINENO            VARCHAR2(20) default ' ' not null,
  SKU                     VARCHAR2(50) default ' ' not null,
  STORERKEY               VARCHAR2(15) default ' ' not null,
  MANUFACTURERSKU         VARCHAR2(50) default ' ' not null,
  RETAILSKU               VARCHAR2(50) default ' ' not null,
  ALTSKU                  VARCHAR2(50) default ' ' not null,
  ORIGINALQTY             NUMBER(22,5) default 0 not null,
  OPENQTY                 NUMBER(22,5) default 0 not null,
  SHIPPEDQTY              NUMBER(22,5) default 0 not null,
  ADJUSTEDQTY             NUMBER(22,5) default 0 not null,
  QTYPREALLOCATED         NUMBER(22,5) default 0 not null,
  QTYALLOCATED            NUMBER(22,5) default 0 not null,
  QTYPICKED               NUMBER(22,5) default 0 not null,
  UOM                     VARCHAR2(10) default ' ' not null,
  PACKKEY                 VARCHAR2(50) default 'STD' not null,
  PICKCODE                VARCHAR2(10) default ' ' not null,
  CARTONGROUP             VARCHAR2(10) default ' ' not null,
  LOT                     VARCHAR2(10) default ' ' not null,
  ID                      VARCHAR2(18) default ' ' not null,
  FACILITY                VARCHAR2(20) default ' ' not null,
  STATUS                  VARCHAR2(10) default '02' not null,
  UNITPRICE               NUMBER default 0 not null,
  TAX01                   NUMBER default 0 not null,
  TAX02                   NUMBER default 0 not null,
  EXTENDEDPRICE           NUMBER default 0 not null,
  UPDATESOURCE            VARCHAR2(10) default '0' not null,
  LOTTABLE01              VARCHAR2(50) default ' ' not null,
  LOTTABLE02              VARCHAR2(50) default ' ' not null,
  LOTTABLE03              VARCHAR2(50) default ' ' not null,
  LOTTABLE04              DATE,
  LOTTABLE05              DATE,
  LOTTABLE06              VARCHAR2(50) default ' ' not null,
  LOTTABLE07              VARCHAR2(50) default ' ' not null,
  LOTTABLE08              VARCHAR2(50) default ' ' not null,
  LOTTABLE09              VARCHAR2(50) default ' ' not null,
  LOTTABLE10              VARCHAR2(50) default ' ' not null,
  EFFECTIVEDATE           DATE default SYSDATE not null,
  FORTE_FLAG              VARCHAR2(6) default 'I' not null,
  TARIFFKEY               VARCHAR2(10),
  SUSR1                   VARCHAR2(30),
  SUSR2                   VARCHAR2(30),
  SUSR3                   VARCHAR2(30),
  SUSR4                   VARCHAR2(30),
  SUSR5                   VARCHAR2(30),
  NOTES                   VARCHAR2(2000),
  WORKORDERKEY            VARCHAR2(10) default ' ',
  ALLOCATESTRATEGYKEY     VARCHAR2(10) default ' ',
  PREALLOCATESTRATEGYKEY  VARCHAR2(10) default ' ',
  ALLOCATESTRATEGYTYPE    VARCHAR2(10) default ' ',
  SKUROTATION             VARCHAR2(10) default 'Lot',
  SHELFLIFE               NUMBER(10) default 0,
  ROTATION                VARCHAR2(1) default '1',
  PALLET_ID               VARCHAR2(18) default ' ',
  SUB_FLAG                VARCHAR2(1) default ' ',
  PRODUCT_WEIGHT          NUMBER default 0 not null,
  PRODUCT_CUBE            NUMBER default 0 not null,
  ORIGCASEQTY             NUMBER(22,5) default 0 not null,
  ORIGPALLETQTY           NUMBER(22,5) default 0 not null,
  OKTOSUBSTITUTE          NUMBER(10) default 0 not null,
  ISSUBSTITUTE            NUMBER(10) default 0 not null,
  ORIGINALSKU             VARCHAR2(50),
  ORIGINALLINENUMBER      VARCHAR2(5),
  SHIPGROUP01             VARCHAR2(1) default 'N' not null,
  SHIPGROUP02             VARCHAR2(1) default 'N' not null,
  SHIPGROUP03             VARCHAR2(1) default 'N' not null,
  ACTUALSHIPDATE          DATE,
  INTERMODALVEHICLE       VARCHAR2(10),
  PICKINGINSTRUCTIONS     VARCHAR2(255),
  CARTONBREAK             VARCHAR2(10),
  CARTONQTYBREAK          NUMBER(22,5),
  QTYINTRANSIT            NUMBER(22,5) default 0 not null,
  OPPREQUEST              VARCHAR2(1) default 0,
  WPRELEASED              VARCHAR2(1) default '0' not null,
  EXTERNALLOT             VARCHAR2(100),
  BUYERPO                 VARCHAR2(10),
  GENERATECONTAINERDETAIL VARCHAR2(1) default '0' not null,
  LABELNAME               VARCHAR2(20),
  STDSSCCLABELNAME        VARCHAR2(20),
  STDGTINLABELNAME        VARCHAR2(20),
  RFIDSSCCLABELNAME       VARCHAR2(20),
  RFIDGTINLABELNAME       VARCHAR2(20),
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERDETAIL
  add constraint PK_SYS_C004708 primary key (ORDERKEY, ORDERLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERDETAIL
  add foreign key (ORDERKEY)
  references ORDERS (ORDERKEY);
alter table ORDERDETAIL
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
alter table ORDERDETAIL
  add check (QTYALLOCATED >= 0 AND QTYALLOCATED <= OPENQTY);
alter table ORDERDETAIL
  add check (QTYPICKED >= 0 AND QTYPICKED <= OPENQTY);
alter table ORDERDETAIL
  add check (QTYPREALLOCATED + QTYPICKED + QTYALLOCATED <= OPENQTY);
alter table ORDERDETAIL
  add check (QTYPREALLOCATED >= 0);
create unique index ORDER_169 on ORDERDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORDERDETAILXVAS
prompt ==============================
prompt
create table ORDERDETAILXVAS
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  ODVASKEY        VARCHAR2(10) not null,
  ORDERKEY        VARCHAR2(10),
  ORDERLINENUMBER VARCHAR2(5),
  NOTES1          VARCHAR2(80),
  NOTES2          VARCHAR2(80),
  NOTES3          VARCHAR2(80),
  UDF1            VARCHAR2(80),
  UDF2            VARCHAR2(80),
  UDF3            VARCHAR2(80),
  VAS1            VARCHAR2(10) default ' ',
  VAS2            VARCHAR2(10) default ' ',
  VAS3            VARCHAR2(10) default ' ',
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERDETAILXVAS
  add constraint PK_SYS_C004707 primary key (ODVASKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERDETAILXVAS
  add unique (ORDERKEY, ORDERLINENUMBER, VAS1)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERDETAILXVAS
  add foreign key (ORDERKEY, ORDERLINENUMBER)
  references ORDERDETAIL (ORDERKEY, ORDERLINENUMBER);
create unique index ORDER_170 on ORDERDETAILXVAS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORDERDETAIL_UDF
prompt ==============================
prompt
create table ORDERDETAIL_UDF
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  ORDERKEY        VARCHAR2(10) not null,
  ORDERLINENUMBER VARCHAR2(5) not null,
  UDFLABEL        VARCHAR2(60) not null,
  UDFVALUE        VARCHAR2(60),
  UDFNOTES        VARCHAR2(60),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERDETAIL_UDF
  add constraint PK_SYS_C004709 primary key (ORDERKEY, ORDERLINENUMBER, UDFLABEL)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ORDER_171 on ORDERDETAIL_UDF (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORDERSELECTION
prompt =============================
prompt
create table ORDERSELECTION
(
  SERIALKEY             NUMBER not null,
  WHSEID                VARCHAR2(30) default USER,
  ORDERSELECTIONKEY     VARCHAR2(10) not null,
  CONFIGKEY             VARCHAR2(3) not null,
  DEFAULTFLAG           VARCHAR2(10) default '0' not null,
  ORDERDATESTART        DATE default '1901/01/01 12:00:00' not null,
  ORDERDATEEND          DATE default '2999/12/31 23:51:00' not null,
  DELIVERYDATESTART     DATE default '1901/01/01 12:00:00' not null,
  DELIVERYDATEEND       DATE default '2999/12/31 23:51:00' not null,
  ORDERTYPESTART        VARCHAR2(10) default ' ' not null,
  ORDERTYPEEND          VARCHAR2(10) default '9' not null,
  ORDERGROUPSTART       VARCHAR2(20) default ' ' not null,
  ORDERGROUPEND         VARCHAR2(20) default '9' not null,
  ORDERPRIORITYSTART    VARCHAR2(10) default '0' not null,
  ORDERPRIORITYEND      VARCHAR2(10) default '9' not null,
  STORERKEYSTART        VARCHAR2(15) default ' ' not null,
  STORERKEYEND          VARCHAR2(15) default 'zzzzzzzzzzzzzzz' not null,
  ORDERKEYSTART         VARCHAR2(10) default ' ' not null,
  ORDERKEYEND           VARCHAR2(10) default 'zzzzzzzzzz' not null,
  EXTERNORDERKEYSTART   VARCHAR2(30) default ' ' not null,
  EXTERNORDERKEYEND     VARCHAR2(30) default 'zzzzzzzzzzzzzzzzzzzz' not null,
  CONSIGNEEKEYSTART     VARCHAR2(15) default ' ' not null,
  CONSIGNEEKEYEND       VARCHAR2(15) default 'zzzzzzzzzzzzzzz' not null,
  CARRIERKEYSTART       VARCHAR2(15) default ' ' not null,
  CARRIERKEYEND         VARCHAR2(15) default 'zzzzzzzzzzzzzzz' not null,
  ROUTESTART            VARCHAR2(10) default ' ' not null,
  ROUTEEND              VARCHAR2(10) default 'zzzzzzzzzz' not null,
  DOORSTART             VARCHAR2(10) default ' ' not null,
  DOOREND               VARCHAR2(10) default 'zzzzzzzzzz' not null,
  STOPSTART             VARCHAR2(10) default ' ' not null,
  STOPEND               VARCHAR2(10) default 'zzzzzzzzzz' not null,
  CARTONIZATIONGROUP    VARCHAR2(10) default 'STD' not null,
  ROUTINGKEY            VARCHAR2(10) default 'STD' not null,
  PICKCODE              VARCHAR2(10) default 'USESKUTBL' not null,
  DOCARTONIZATION       VARCHAR2(1) default 'Y' not null,
  DOROUTING             VARCHAR2(1) default 'N' not null,
  MAXORDERS             NUMBER(10) default 0 not null,
  PREALLOCATIONGROUPING VARCHAR2(10) default '1' not null,
  PREALLOCATIONSORT     VARCHAR2(10) default '1' not null,
  WAVEOPTION            VARCHAR2(10) default 'DISCRETE' not null,
  BATCHPICKMAXCUBE      NUMBER(22,5) default 0 not null,
  BATCHPICKMAXCOUNT     NUMBER(22,5) default 0 not null,
  UOM1PICKMETHOD        VARCHAR2(1) default '1' not null,
  UOM2PICKMETHOD        VARCHAR2(1) default '1' not null,
  UOM3PICKMETHOD        VARCHAR2(1) default '1' not null,
  UOM4PICKMETHOD        VARCHAR2(1) default '1' not null,
  UOM5PICKMETHOD        VARCHAR2(1) default '1' not null,
  UOM6PICKMETHOD        VARCHAR2(1) default '1' not null,
  UOM7PICKMETHOD        VARCHAR2(1) default '1' not null,
  OHTYPESTART           VARCHAR2(1) default '1' not null,
  OHTYPEEND             VARCHAR2(20) default '2' not null,
  LOADIDSTART           VARCHAR2(20) default ' ' not null,
  LOADIDEND             VARCHAR2(20) default 'zzzzzzzzzzzzzzzzzzzz' not null,
  SKUGROUPSTART         VARCHAR2(10) default ' ' not null,
  SKUGROUPEND           VARCHAR2(10) default 'zzzzzzzzzz' not null,
  SKUGROUP2START        VARCHAR2(10) default ' ' not null,
  SKUGROUP2END          VARCHAR2(10) default 'zzzzzzzzzz' not null,
  SKUSTART              VARCHAR2(50) default ' ' not null,
  SKUEND                VARCHAR2(50) default 'zzzzzzzzzzzzzzzzzzzz' not null,
  COMPANYSTART          VARCHAR2(45) default ' ' not null,
  COMPANYEND            VARCHAR2(45) default 'zzzzzzzzzz' not null,
  STATESTART            VARCHAR2(2) default ' ' not null,
  STATEEND              VARCHAR2(2) default 'zz' not null,
  ZIPSTART              VARCHAR2(18) default ' ' not null,
  ZIPEND                VARCHAR2(18) default 'zzzzzzzzzz' not null,
  LOTSTART              VARCHAR2(10) default ' ' not null,
  LOTEND                VARCHAR2(10) default 'zzzzzzzzzz' not null,
  LOTTABLE01START       VARCHAR2(50) default ' ' not null,
  LOTTABLE01END         VARCHAR2(50) default 'zzzzzzzzzz' not null,
  LOTTABLE02START       VARCHAR2(50) default ' ' not null,
  LOTTABLE02END         VARCHAR2(50) default 'zzzzzzzzzz' not null,
  LOTTABLE03START       VARCHAR2(50) default ' ' not null,
  LOTTABLE03END         VARCHAR2(50) default 'zzzzzzzzzz' not null,
  LOTTABLE04START       DATE default '1901/01/01 12:00:00' not null,
  LOTTABLE04END         DATE default '2999/12/31 23:51:00' not null,
  LOTTABLE05START       DATE default '1901/01/01 12:00:00' not null,
  LOTTABLE05END         DATE default '2999/12/31 23:51:00' not null,
  LOTTABLE06START       VARCHAR2(50) default ' ' not null,
  LOTTABLE06END         VARCHAR2(50) default 'zzzzzzzzzz' not null,
  LOTTABLE07START       VARCHAR2(50) default ' ' not null,
  LOTTABLE07END         VARCHAR2(50) default 'zzzzzzzzzz' not null,
  LOTTABLE08START       VARCHAR2(50) default ' ' not null,
  LOTTABLE08END         VARCHAR2(50) default 'zzzzzzzzzz' not null,
  LOTTABLE09START       VARCHAR2(50) default ' ' not null,
  LOTTABLE09END         VARCHAR2(50) default 'zzzzzzzzzz' not null,
  LOTTABLE10START       VARCHAR2(50) default ' ' not null,
  LOTTABLE10END         VARCHAR2(50) default 'zzzzzzzzzz' not null,
  ABCSTART              VARCHAR2(5) default ' ' not null,
  ABCEND                VARCHAR2(5) default 'zzzzz' not null,
  OHTYPE                VARCHAR2(10) default '1',
  NUMOFORDERS           NUMBER(10) default 0,
  INCLUDEORDERS         VARCHAR2(1) default '1',
  ORDERSTATUSSTART      VARCHAR2(3) default ' ' not null,
  ORDERSTATUSEND        VARCHAR2(3) default 'zzz' not null,
  RFIDORDERS            VARCHAR2(1) default '2' not null,
  SUSR1START            VARCHAR2(30) default ' ' not null,
  SUSR2START            VARCHAR2(30) default ' ' not null,
  SUSR3START            VARCHAR2(30) default ' ' not null,
  SUSR4START            VARCHAR2(30) default ' ' not null,
  SUSR5START            VARCHAR2(30) default ' ' not null,
  SUSR1END              VARCHAR2(30) default 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' not null,
  SUSR2END              VARCHAR2(30) default 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' not null,
  SUSR3END              VARCHAR2(30) default 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' not null,
  SUSR4END              VARCHAR2(30) default 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' not null,
  SUSR5END              VARCHAR2(30) default 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' not null,
  ADDDATE               DATE default SYSDATE not null,
  ADDWHO                VARCHAR2(30) default USER not null,
  EDITDATE              DATE default SYSDATE not null,
  EDITWHO               VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERSELECTION
  add constraint PK_SYS_C004710 primary key (ORDERSELECTIONKEY, CONFIGKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ORDER_173 on ORDERSELECTION (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORDERSTATUSHISTORY
prompt =================================
prompt
create table ORDERSTATUSHISTORY
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  ORDERKEY        VARCHAR2(10) not null,
  ORDERLINENUMBER VARCHAR2(5) not null,
  ORDERTYPE       VARCHAR2(10) not null,
  STATUS          VARCHAR2(3) not null,
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  COMMENTS        VARCHAR2(100) default ' ' not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERSTATUSHISTORY
  add check (ORDERTYPE IN ('SO','FTO','TSO'));
create index IDX_ORDERSTATUSHISTORY on ORDERSTATUSHISTORY (ORDERKEY, ORDERLINENUMBER, ORDERTYPE)
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ORDER_174 on ORDERSTATUSHISTORY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORDERSTATUSSETUP
prompt ===============================
prompt
create table ORDERSTATUSSETUP
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  SHOWSEQ           NUMBER,
  CODE              VARCHAR2(3) not null,
  DESCRIPTION       VARCHAR2(30) not null,
  EDITABLE          CHAR(1) default '1' not null,
  ENABLED           CHAR(1) default '1' not null,
  ORDERFLAG         CHAR(1) default '1' not null,
  XORDERFLAG        CHAR(1) default '1' not null,
  TRANSSHIPFLAG     CHAR(1) default '1' not null,
  HEADERFLAG        CHAR(1) default '1' not null,
  DETAILFLAG        CHAR(1) default '1' not null,
  HEADERHISTORYFLAG CHAR(1) default '1' not null,
  DETAILHISTORYFLAG CHAR(1) default '1' not null,
  RULES             VARCHAR2(255) default ' ' not null,
  COMMENTS          VARCHAR2(255) default ' ' not null,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERSTATUSSETUP
  add constraint PK_SYS_C004700 primary key (CODE)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ORDER_175 on ORDERSTATUSSETUP (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORDERS_UDF
prompt =========================
prompt
create table ORDERS_UDF
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  ORDERKEY  VARCHAR2(10) not null,
  UDFLABEL  VARCHAR2(60) not null,
  UDFVALUE  VARCHAR2(60),
  UDFNOTES  VARCHAR2(60),
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERS_UDF
  add constraint PK_SYS_C004712 primary key (ORDERKEY, UDFLABEL)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ORDER_176 on ORDERS_UDF (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PACK
prompt ===================
prompt
create table PACK
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  PACKKEY            VARCHAR2(50) not null,
  PACKDESCR          VARCHAR2(45) not null,
  PACKUOM1           VARCHAR2(10) default ' ' not null,
  CASECNT            NUMBER(22,5) default 0 not null,
  ISWHQTY1           VARCHAR2(1) default ' ' not null,
  REPLENISHUOM1      VARCHAR2(1) default 'N' not null,
  REPLENISHZONE1     VARCHAR2(10) default 'N' not null,
  CARTONIZEUOM1      VARCHAR2(1) default 'N' not null,
  LENGTHUOM1         NUMBER(22,5) default 0 not null,
  WIDTHUOM1          NUMBER(22,5) default 0 not null,
  HEIGHTUOM1         NUMBER(22,5) default 0 not null,
  CUBEUOM1           NUMBER(22,5) default 0 not null,
  FILTERVALUEUOM1    NUMBER,
  INDICATORDIGITUOM1 NUMBER,
  PACKUOM2           VARCHAR2(10) default ' ' not null,
  INNERPACK          NUMBER(22,5) default 0 not null,
  ISWHQTY2           VARCHAR2(1) default ' ' not null,
  REPLENISHUOM2      VARCHAR2(1) default 'N' not null,
  REPLENISHZONE2     VARCHAR2(10) default 'N' not null,
  CARTONIZEUOM2      VARCHAR2(1) default 'N' not null,
  LENGTHUOM2         NUMBER(22,5) default 0 not null,
  WIDTHUOM2          NUMBER(22,5) default 0 not null,
  HEIGHTUOM2         NUMBER(22,5) default 0 not null,
  CUBEUOM2           NUMBER(22,5) default 0 not null,
  FILTERVALUEUOM2    NUMBER,
  INDICATORDIGITUOM2 NUMBER,
  PACKUOM3           VARCHAR2(10) default ' ' not null,
  QTY                NUMBER(22,5) default 0 not null,
  ISWHQTY3           VARCHAR2(1) default ' ' not null,
  REPLENISHUOM3      VARCHAR2(1) default 'Y' not null,
  REPLENISHZONE3     VARCHAR2(10) default 'N' not null,
  CARTONIZEUOM3      VARCHAR2(1) default 'N' not null,
  LENGTHUOM3         NUMBER(22,5) default 0 not null,
  WIDTHUOM3          NUMBER(22,5) default 0 not null,
  HEIGHTUOM3         NUMBER(22,5) default 0 not null,
  CUBEUOM3           NUMBER(22,5) default 0 not null,
  FILTERVALUEUOM3    NUMBER,
  INDICATORDIGITUOM3 NUMBER,
  PACKUOM4           VARCHAR2(10) default ' ' not null,
  PALLET             NUMBER(22,5) default 0 not null,
  ISWHQTY4           VARCHAR2(1) default ' ' not null,
  REPLENISHUOM4      VARCHAR2(1) default 'N' not null,
  REPLENISHZONE4     VARCHAR2(10) default 'N' not null,
  CARTONIZEUOM4      VARCHAR2(1) default 'N' not null,
  LENGTHUOM4         NUMBER(22,5) default 0 not null,
  WIDTHUOM4          NUMBER(22,5) default 0 not null,
  HEIGHTUOM4         NUMBER(22,5) default 0 not null,
  CUBEUOM4           NUMBER(22,5) default 0 not null,
  FILTERVALUEUOM4    NUMBER,
  INDICATORDIGITUOM4 NUMBER,
  PALLETWOODLENGTH   NUMBER(22,5) default 0 not null,
  PALLETWOODWIDTH    NUMBER(22,5) default 0 not null,
  PALLETWOODHEIGHT   NUMBER(22,5) default 0 not null,
  PALLETTI           NUMBER(22,5) default 0 not null,
  PALLETHI           NUMBER(22,5) default 0 not null,
  PACKUOM5           VARCHAR2(10) default ' ' not null,
  CUBE               NUMBER(22,5) default 0 not null,
  ISWHQTY5           VARCHAR2(1) default ' ' not null,
  FILTERVALUEUOM5    NUMBER,
  INDICATORDIGITUOM5 NUMBER,
  PACKUOM6           VARCHAR2(10) default ' ' not null,
  GROSSWGT           NUMBER(22,5) default 0 not null,
  ISWHQTY6           VARCHAR2(1) default ' ' not null,
  FILTERVALUEUOM6    NUMBER,
  INDICATORDIGITUOM6 NUMBER,
  PACKUOM7           VARCHAR2(10) default ' ' not null,
  NETWGT             NUMBER(22,5) default 0 not null,
  ISWHQTY7           VARCHAR2(1) default ' ' not null,
  FILTERVALUEUOM7    NUMBER,
  INDICATORDIGITUOM7 NUMBER,
  PACKUOM8           VARCHAR2(10) default ' ',
  OTHERUNIT1         NUMBER(22,5) default 0 not null,
  ISWHQTY8           VARCHAR2(1) default ' ' not null,
  REPLENISHUOM8      VARCHAR2(1) default 'N' not null,
  REPLENISHZONE8     VARCHAR2(10) default 'N' not null,
  CARTONIZEUOM8      VARCHAR2(1) default 'N' not null,
  LENGTHUOM8         NUMBER(22,5) default 0 not null,
  WIDTHUOM8          NUMBER(22,5) default 0 not null,
  HEIGHTUOM8         NUMBER(22,5) default 0 not null,
  FILTERVALUEUOM8    NUMBER,
  INDICATORDIGITUOM8 NUMBER,
  PACKUOM9           VARCHAR2(10) default ' ' not null,
  OTHERUNIT2         NUMBER(22,5) default 0 not null,
  ISWHQTY9           VARCHAR2(1) default ' ' not null,
  REPLENISHUOM9      VARCHAR2(1) default 'N' not null,
  REPLENISHZONE9     VARCHAR2(10) default 'N' not null,
  CARTONIZEUOM9      VARCHAR2(1) default 'N' not null,
  LENGTHUOM9         NUMBER(22,5) default 0 not null,
  WIDTHUOM9          NUMBER(22,5) default 0 not null,
  HEIGHTUOM9         NUMBER(22,5) default 0 not null,
  FILTERVALUEUOM9    NUMBER,
  INDICATORDIGITUOM9 NUMBER,
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PACK
  add constraint PK_SYS_C004713 primary key (PACKKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PACK
  add check (RTRIM(PACKUOM2) = ' ' OR RTRIM(PACKUOM3) = ' ' OR RTRIM(PACKUOM2) <> RTRIM(PACKUOM3));
alter table PACK
  add check (RTRIM(PACKUOM1) = ' ' OR RTRIM(PACKUOM4) = ' ' OR RTRIM(PACKUOM1) <> RTRIM(PACKUOM4));
create unique index PACK_177 on PACK (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PACK_CASE
prompt ========================
prompt
create table PACK_CASE
(
  BATCH_NO      VARCHAR2(20),
  PACKID        VARCHAR2(10) not null,
  FROMTABLE     VARCHAR2(20) not null,
  FROMTYPE      VARCHAR2(10) not null,
  PICKDETAILKEY VARCHAR2(10),
  STORERKEY     VARCHAR2(10) not null,
  BOXNO         VARCHAR2(10) not null,
  BOXNOBAK      VARCHAR2(10) not null,
  CASEID        VARCHAR2(20),
  CASELINENO    VARCHAR2(5),
  TYPE          NUMBER not null,
  DOC_NUMBER    VARCHAR2(32) not null,
  SEQ           VARCHAR2(5),
  SKU           VARCHAR2(20) not null,
  PACKQTY       NUMBER default 0 not null,
  CONFIRM_QTY   NUMBER default 0,
  PRICE         NUMBER(22,5) default 0,
  DISCOUNT      NUMBER(18,2) default 1,
  MY            NUMBER(18,2) default 0,
  STATUS        INTEGER,
  CONSK         VARCHAR2(15),
  SHORTNAME     VARCHAR2(20),
  EXPORTNO      VARCHAR2(10),
  SUSR1         VARCHAR2(30),
  SUSR2         VARCHAR2(30),
  SUSR3         VARCHAR2(30),
  SUSR4         VARCHAR2(30),
  SUSR5         VARCHAR2(30),
  ADDDATE       DATE default SYSDATE,
  ADDWHO        VARCHAR2(18) default USER,
  EDITDATE      DATE default SYSDATE,
  EDITWHO       VARCHAR2(18) default USER,
  PACK_USER     VARCHAR2(18) default USER,
  PACK_DATE     DATE default SYSDATE,
  CONFIRM_USER  VARCHAR2(18) default USER,
  CONFIRM_DATE  DATE default SYSDATE,
  MERGE_USER    VARCHAR2(18) default USER,
  MERGE_DATE    DATE default SYSDATE,
  SOW_USER      VARCHAR2(18) default USER,
  SOW_DATE      DATE default SYSDATE,
  NET_WEIGHT    NUMBER(10,4),
  ACT_WEIGHT    NUMBER(10,4),
  BARCODE       VARCHAR2(50),
  DESCR         VARCHAR2(60),
  IS_MERGE      VARCHAR2(1) default '0',
  PICKNO        VARCHAR2(10),
  ROUTE         VARCHAR2(10),
  PUTAWAYZONE   VARCHAR2(10),
  PACK_USER1    VARCHAR2(18) default USER,
  PACK_DATE1    DATE default SYSDATE,
  PACKLOC       VARCHAR2(10),
  STATION       VARCHAR2(10)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column PACK_CASE.BATCH_NO
  is '包件批次号';
comment on column PACK_CASE.PACKID
  is '打包明细唯一号';
comment on column PACK_CASE.FROMTABLE
  is '来源表单';
comment on column PACK_CASE.FROMTYPE
  is '来源类型：0、请配RF 1、主配线 3、WMS主配 4、请配纸张';
comment on column PACK_CASE.PICKDETAILKEY
  is '拣货唯一号';
comment on column PACK_CASE.STORERKEY
  is '货主码';
comment on column PACK_CASE.BOXNO
  is '箱号、纸张拣货为拣货流水号';
comment on column PACK_CASE.BOXNOBAK
  is '箱号、纸张拣货为拣货流水号，播种作业/并箱作业时记录原始箱号';
comment on column PACK_CASE.CASEID
  is '原始系统箱号（主配线传入）';
comment on column PACK_CASE.CASELINENO
  is '原始系统箱明细序号（主配线传入）';
comment on column PACK_CASE.TYPE
  is '原始任务单据类型';
comment on column PACK_CASE.DOC_NUMBER
  is '主配：任务单号  退货：退货单号 请配：请配单号';
comment on column PACK_CASE.SEQ
  is '任务单序号,对应主配明细中的SEQ，或请配单中的明细';
comment on column PACK_CASE.SKU
  is '商品内码';
comment on column PACK_CASE.PACKQTY
  is '此箱中此商品对应SEQ的数量';
comment on column PACK_CASE.CONFIRM_QTY
  is '确认打包量';
comment on column PACK_CASE.PRICE
  is '商品价格';
comment on column PACK_CASE.DISCOUNT
  is '商品折扣';
comment on column PACK_CASE.MY
  is '码洋';
comment on column PACK_CASE.STATUS
  is '任务状态：
0：新增
9：打包完成
';
comment on column PACK_CASE.CONSK
  is '发货对象代码(门店号或供应商号或走道)';
comment on column PACK_CASE.SHORTNAME
  is '发货对象简称';
comment on column PACK_CASE.EXPORTNO
  is '流水线出口';
comment on column PACK_CASE.SUSR1
  is '扩展字段';
comment on column PACK_CASE.SUSR2
  is '扩展字段';
comment on column PACK_CASE.SUSR3
  is '扩展字段';
comment on column PACK_CASE.SUSR4
  is '扩展字段';
comment on column PACK_CASE.SUSR5
  is '扩展字段';
comment on column PACK_CASE.PACK_USER
  is '打包人';
comment on column PACK_CASE.PACK_DATE
  is '打包时间';
comment on column PACK_CASE.CONFIRM_USER
  is '复核人员';
comment on column PACK_CASE.CONFIRM_DATE
  is '复核时间';
comment on column PACK_CASE.MERGE_USER
  is '并包人';
comment on column PACK_CASE.MERGE_DATE
  is '并包时间';
comment on column PACK_CASE.SOW_USER
  is '播种人';
comment on column PACK_CASE.SOW_DATE
  is '播种时间';
comment on column PACK_CASE.NET_WEIGHT
  is '理论重量（KG）';
comment on column PACK_CASE.ACT_WEIGHT
  is '实际重量（KG）';
comment on column PACK_CASE.BARCODE
  is '图书条码';
comment on column PACK_CASE.DESCR
  is '图书名称';
comment on column PACK_CASE.IS_MERGE
  is '是否并箱';
comment on column PACK_CASE.PICKNO
  is '拣货流水号';
comment on column PACK_CASE.ROUTE
  is '客户对应路线';
comment on column PACK_CASE.PUTAWAYZONE
  is '拣货区域';
comment on column PACK_CASE.PACK_USER1
  is '打包人员';
comment on column PACK_CASE.PACK_DATE1
  is '打包日期';
comment on column PACK_CASE.PACKLOC
  is '打包台';
comment on column PACK_CASE.STATION
  is '发站到站';
alter table PACK_CASE
  add constraint PK_SYS_PACKID primary key (PACKID)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_BOXNO_PICKNO on PACK_CASE (BOXNO, PICKNO)
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PALLETDETAIL
prompt ===========================
prompt
create table PALLETDETAIL
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  PALLETKEY        VARCHAR2(10) not null,
  PALLETLINENUMBER VARCHAR2(5) not null,
  CASEID           VARCHAR2(20) default ' ',
  STORERKEY        VARCHAR2(15) default ' ' not null,
  SKU              VARCHAR2(50) default ' ' not null,
  LOC              VARCHAR2(10) default 'UNKNOWN' not null,
  QTY              NUMBER(22,5) default 0 not null,
  STATUS           VARCHAR2(10) default '0' not null,
  FORTE_FLAG       VARCHAR2(6) default 'I' not null,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PALLETDETAIL
  add constraint PK_SYS_C004714 primary key (PALLETKEY, PALLETLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PALLETDETAIL
  add foreign key (LOC)
  references LOC (LOC);
alter table PALLETDETAIL
  add check (STATUS >= '0' AND STATUS <= '9');
create unique index PALLE_179 on PALLETDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PALOCSEARCH
prompt ==========================
prompt
create table PALOCSEARCH
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  PUTAWAYZONE         VARCHAR2(10) not null,
  LOC                 VARCHAR2(10) not null,
  RFUSER              VARCHAR2(30) not null,
  PASTRATEGYSOURCEKEY VARCHAR2(15) not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  ADDDATE             DATE default SYSDATE not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PALOCSEARCH
  add constraint PK_SYS_C004716 primary key (LOC, PUTAWAYZONE, RFUSER, PASTRATEGYSOURCEKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_PALOCSEARCH_RFUSERZONE on PALOCSEARCH (RFUSER, PUTAWAYZONE, PASTRATEGYSOURCEKEY, ADDDATE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PALOC_180 on PALOCSEARCH (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PATRACELOG
prompt =========================
prompt
create table PATRACELOG
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  LOC       VARCHAR2(10) not null,
  ACTION    VARCHAR2(40),
  MESSAGE   VARCHAR2(250),
  ADDWHO    VARCHAR2(30) default USER not null,
  ADDDATE   DATE default SYSDATE not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PATRA_181 on PATRACELOG (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PAZONEEQUIPMENTEXCLUDEDETAIL
prompt ===========================================
prompt
create table PAZONEEQUIPMENTEXCLUDEDETAIL
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  PUTAWAYZONE         VARCHAR2(10) default ' ' not null,
  EQUIPMENTPROFILEKEY VARCHAR2(10) default ' ' not null,
  DESCR               VARCHAR2(60) default ' ' not null,
  ADDDATE             DATE default SYSDATE not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  EDITDATE            DATE default SYSDATE not null,
  EDITWHO             VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PAZONEEQUIPMENTEXCLUDEDETAIL
  add constraint PK_SYS_C004717 primary key (PUTAWAYZONE, EQUIPMENTPROFILEKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PAZON_182 on PAZONEEQUIPMENTEXCLUDEDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PBSRPT_CATEGORY
prompt ==============================
prompt
create table PBSRPT_CATEGORY
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  CATEGORY_ID NUMBER(10) not null,
  CATEGORY    VARCHAR2(40) not null,
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PBSRPT_CATEGORY
  add constraint PK_SYS_C004718 primary key (CATEGORY_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PBSRP_183 on PBSRPT_CATEGORY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PBSRPT_PARMS
prompt ===========================
prompt
create table PBSRPT_PARMS
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  RPT_ID        VARCHAR2(8) not null,
  PARM_NO       NUMBER(3) not null,
  PARM_DATATYPE VARCHAR2(20),
  PARM_LABEL    VARCHAR2(30),
  PARM_DEFAULT  VARCHAR2(50),
  STYLE         VARCHAR2(10),
  NAME          VARCHAR2(40),
  DISPLAY       VARCHAR2(40),
  DATA_VALUE    VARCHAR2(50),
  ATTRIBUTES    VARCHAR2(100),
  VISIBLE       VARCHAR2(1),
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PBSRPT_PARMS
  add constraint PK_SYS_C004719 primary key (RPT_ID, PARM_NO)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PBSRP_184 on PBSRPT_PARMS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PBSRPT_REPORTS
prompt =============================
prompt
create table PBSRPT_REPORTS
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  RPT_ID         VARCHAR2(8) not null,
  RPT_DATAWINDOW VARCHAR2(40),
  RPT_LIBRARY    VARCHAR2(80),
  RPT_TITLE      VARCHAR2(100),
  RPT_PURPOSE    VARCHAR2(255),
  RPT_DESCR      VARCHAR2(255),
  RPT_HEADER     VARCHAR2(1),
  RPT_ACTIVE     VARCHAR2(1),
  RPT_TYPE       NUMBER(10),
  RPT_WHERE      VARCHAR2(255),
  RPT_FILTER     VARCHAR2(255),
  RPT_SORT       VARCHAR2(255),
  ENABLE_FILTER  VARCHAR2(1),
  ENABLE_SORT    VARCHAR2(1),
  AUTORETRIEVE   VARCHAR2(1),
  CATEGORY_ID    NUMBER(10),
  SHOW_CRITERIA  VARCHAR2(1),
  QUERY_MODE     VARCHAR2(1),
  SHARED_RPT_ID  VARCHAR2(8),
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PBSRPT_REPORTS
  add constraint PK_SYS_C004720 primary key (RPT_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PBSRP_185 on PBSRPT_REPORTS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PBSRPT_SETS
prompt ==========================
prompt
create table PBSRPT_SETS
(
  SERIALKEY  NUMBER not null,
  WHSEID     VARCHAR2(30) default USER,
  RPT_SET_ID NUMBER(3) not null,
  NAME       VARCHAR2(100) not null,
  ADDDATE    DATE default SYSDATE not null,
  ADDWHO     VARCHAR2(30) default USER not null,
  EDITDATE   DATE default SYSDATE not null,
  EDITWHO    VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PBSRPT_SETS
  add constraint PK_SYS_C004721 primary key (RPT_SET_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PBSRP_186 on PBSRPT_SETS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PBSRPT_SET_REPORTS
prompt =================================
prompt
create table PBSRPT_SET_REPORTS
(
  SERIALKEY  NUMBER not null,
  WHSEID     VARCHAR2(30) default USER,
  RPT_SET_ID NUMBER(3) not null,
  RPT_SEQ    NUMBER(3) not null,
  RPT_ID     VARCHAR2(8),
  ADDDATE    DATE default SYSDATE not null,
  ADDWHO     VARCHAR2(30) default USER not null,
  EDITDATE   DATE default SYSDATE not null,
  EDITWHO    VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PBSRPT_SET_REPORTS
  add constraint PK_SYS_C004722 primary key (RPT_SET_ID, RPT_SEQ)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PBSRP_187 on PBSRPT_SET_REPORTS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHYSICAL
prompt =======================
prompt
create table PHYSICAL
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  TEAM         VARCHAR2(1) default 'A' not null,
  STORERKEY    VARCHAR2(15) default ' ' not null,
  SKU          VARCHAR2(50) default ' ' not null,
  LOC          VARCHAR2(10) default 'UNKNOWN' not null,
  LOT          VARCHAR2(10) default ' ' not null,
  ID           VARCHAR2(18) default ' ' not null,
  INVENTORYTAG VARCHAR2(18) default ' ' not null,
  QTY          NUMBER(22,5) default 0 not null,
  PACKKEY      VARCHAR2(50) default ' ',
  UOM          VARCHAR2(10) default ' ',
  STATUS       VARCHAR2(1) default '0',
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHYSICAL
  add constraint PK_SYS_C004724 primary key (TEAM, STORERKEY, SKU, LOT, LOC, ID, INVENTORYTAG)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHYSICAL
  add foreign key (LOC)
  references LOC (LOC);
create unique index PHYSI_188 on PHYSICAL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHYSICALPARAMETERS
prompt =================================
prompt
create table PHYSICALPARAMETERS
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  PHYSICALPARMKEY NUMBER(10) default 0 not null,
  STORERKEYMIN    VARCHAR2(15) default ' ' not null,
  STORERKEYMAX    VARCHAR2(15) default ' ' not null,
  SKUMIN          VARCHAR2(50) default ' ' not null,
  SKUMAX          VARCHAR2(50) default ' ' not null,
  LOCMIN          VARCHAR2(10) default ' ' not null,
  LOCMAX          VARCHAR2(10) default ' ' not null,
  ZONEMIN         VARCHAR2(10) default ' ' not null,
  ZONEMAX         VARCHAR2(10) default ' ' not null,
  AREAMIN         VARCHAR2(10) default ' ' not null,
  AREAMAX         VARCHAR2(10) default ' ' not null,
  LEVELMIN        NUMBER default 0 not null,
  LEVELMAX        NUMBER default 0 not null,
  SHOWSYSTEMQTY   VARCHAR2(10) default '0' not null,
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHYSICALPARAMETERS
  add constraint PK_SYS_C004723 primary key (PHYSICALPARMKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHYSI_189 on PHYSICALPARAMETERS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHY_A2B_ID
prompt =========================
prompt
create table PHY_A2B_ID
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  STORERKEY VARCHAR2(15) default ' ' not null,
  SKU       VARCHAR2(50) default ' ' not null,
  LOC       VARCHAR2(10) default ' ' not null,
  ID        VARCHAR2(18) default ' ' not null,
  QTYTEAMA  NUMBER(22,5) default 0 not null,
  QTYTEAMB  NUMBER(22,5) default 0 not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHY_A2B_ID
  add constraint PK_SYS_C004725 primary key (STORERKEY, SKU, LOC, ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHY_A_190 on PHY_A2B_ID (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHY_A2B_LOT
prompt ==========================
prompt
create table PHY_A2B_LOT
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  STORERKEY VARCHAR2(15) default ' ' not null,
  SKU       VARCHAR2(50) default ' ' not null,
  LOC       VARCHAR2(10) default ' ' not null,
  LOT       VARCHAR2(10) default ' ' not null,
  QTYTEAMA  NUMBER(22,5) default 0 not null,
  QTYTEAMB  NUMBER(22,5) default 0 not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHY_A2B_LOT
  add constraint PK_SYS_C004726 primary key (STORERKEY, SKU, LOC, LOT)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHY_A_191 on PHY_A2B_LOT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHY_A2B_SKU
prompt ==========================
prompt
create table PHY_A2B_SKU
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  STORERKEY VARCHAR2(15) default ' ' not null,
  SKU       VARCHAR2(50) default ' ' not null,
  QTYTEAMA  NUMBER(22,5) default 0 not null,
  QTYTEAMB  NUMBER(22,5) default 0 not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHY_A2B_SKU
  add constraint PK_SYS_C004727 primary key (STORERKEY, SKU)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHY_A_192 on PHY_A2B_SKU (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHY_A2B_TAG
prompt ==========================
prompt
create table PHY_A2B_TAG
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  STORERKEY    VARCHAR2(15) default ' ' not null,
  SKU          VARCHAR2(50) default ' ' not null,
  LOC          VARCHAR2(10) default 'UNKNOWN' not null,
  ID           VARCHAR2(18) default ' ' not null,
  INVENTORYTAG VARCHAR2(18) default ' ' not null,
  QTYTEAMA     NUMBER(22,5) default 0 not null,
  QTYTEAMB     NUMBER(22,5) default 0 not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHY_A2B_TAG
  add constraint PK_SYS_C004728 primary key (STORERKEY, SKU, LOC, ID, INVENTORYTAG)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHY_A_193 on PHY_A2B_TAG (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHY_INV2A_ID
prompt ===========================
prompt
create table PHY_INV2A_ID
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  STORERKEY     VARCHAR2(15) default ' ' not null,
  SKU           VARCHAR2(50) default ' ' not null,
  ID            VARCHAR2(18) default ' ' not null,
  QTYTEAMA      NUMBER(22,5) default 0 not null,
  QTYLOTXLOCXID NUMBER(22,5) default 0 not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHY_INV2A_ID
  add constraint PK_SYS_C004729 primary key (ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHY_I_194 on PHY_INV2A_ID (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHY_INV2A_LOT
prompt ============================
prompt
create table PHY_INV2A_LOT
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  STORERKEY     VARCHAR2(15) default ' ' not null,
  SKU           VARCHAR2(50) default ' ' not null,
  LOT           VARCHAR2(10) default ' ' not null,
  QTYTEAMA      NUMBER(22,5) default 0 not null,
  QTYLOTXLOCXID NUMBER(22,5) default 0 not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHY_INV2A_LOT
  add constraint PK_SYS_C004730 primary key (STORERKEY, SKU, LOT)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHY_I_195 on PHY_INV2A_LOT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHY_INV2A_SKU
prompt ============================
prompt
create table PHY_INV2A_SKU
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  STORERKEY     VARCHAR2(15) default ' ' not null,
  SKU           VARCHAR2(50) default ' ' not null,
  QTYTEAMA      NUMBER(22,5) default 0 not null,
  QTYLOTXLOCXID NUMBER(22,5) default 0 not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHY_INV2A_SKU
  add constraint PK_SYS_C004731 primary key (STORERKEY, SKU)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHY_I_196 on PHY_INV2A_SKU (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHY_MISSING_TAG_A
prompt ================================
prompt
create table PHY_MISSING_TAG_A
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  INVENTORYTAG VARCHAR2(18) not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHY_MISSING_TAG_A
  add constraint PK_SYS_C004732 primary key (INVENTORYTAG)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHY_M_197 on PHY_MISSING_TAG_A (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHY_MISSING_TAG_B
prompt ================================
prompt
create table PHY_MISSING_TAG_B
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  INVENTORYTAG VARCHAR2(18) not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHY_MISSING_TAG_B
  add constraint PK_SYS_C004733 primary key (INVENTORYTAG)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHY_M_198 on PHY_MISSING_TAG_B (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHY_OUTOFRANGE_TAG_A
prompt ===================================
prompt
create table PHY_OUTOFRANGE_TAG_A
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  INVENTORYTAG VARCHAR2(18) not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHY_OUTOFRANGE_TAG_A
  add constraint PK_SYS_C004734 primary key (INVENTORYTAG)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHY_O_199 on PHY_OUTOFRANGE_TAG_A (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHY_OUTOFRANGE_TAG_B
prompt ===================================
prompt
create table PHY_OUTOFRANGE_TAG_B
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  INVENTORYTAG VARCHAR2(18) not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHY_OUTOFRANGE_TAG_B
  add constraint PK_SYS_C004735 primary key (INVENTORYTAG)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHY_O_200 on PHY_OUTOFRANGE_TAG_B (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHY_POSTED
prompt =========================
prompt
create table PHY_POSTED
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  STORERKEY     VARCHAR2(15) default ' ' not null,
  SKU           VARCHAR2(50) default ' ' not null,
  QTYTEAMA      NUMBER(22,5) default 0 not null,
  QTYLOTXLOCXID NUMBER(22,5) default 0 not null,
  ERRORMESSAGE  VARCHAR2(255),
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PHY_POSTED
  add constraint PK_SYS_C004736 primary key (STORERKEY, SKU)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHY_P_201 on PHY_POSTED (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHY_POST_DETAIL
prompt ==============================
prompt
create table PHY_POST_DETAIL
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  STORERKEY     VARCHAR2(15) default ' ' not null,
  SKU           VARCHAR2(50) default ' ' not null,
  LOC           VARCHAR2(10) default ' ' not null,
  LOT           VARCHAR2(10) default ' ' not null,
  ID            VARCHAR2(18) default ' ' not null,
  QTYTEAMA      NUMBER(22,5) default 0 not null,
  QTYLOTXLOCXID NUMBER(22,5) default 0 not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PHY_P_202 on PHY_POST_DETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PICKCODE
prompt =======================
prompt
create table PICKCODE
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  PICKCODEKEY        VARCHAR2(10) not null,
  STRATEGYKEY        VARCHAR2(20) not null,
  STRATEGYLINENUMBER VARCHAR2(5) not null,
  STRATEGYTYPE       VARCHAR2(1) not null,
  TABLENAME          VARCHAR2(60) not null,
  COLUMNNAME         VARCHAR2(60) not null,
  OPERATOR           VARCHAR2(10) not null,
  VALUE              VARCHAR2(255) default ' ' not null,
  JOINTABLENAME      VARCHAR2(60) default ' ' not null,
  JOINCOLUMNNAME     VARCHAR2(60) default ' ' not null,
  EXPRESSION         VARCHAR2(1000) default ' ' not null,
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PICKCODE
  add constraint PK_SYS_C004737 primary key (PICKCODEKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PICKC_203 on PICKCODE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PICKDETAIL
prompt =========================
prompt
create table PICKDETAIL
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  PICKDETAILKEY     VARCHAR2(18) not null,
  CASEID            VARCHAR2(20) default ' ' not null,
  PICKHEADERKEY     VARCHAR2(18) not null,
  ORDERKEY          VARCHAR2(10) not null,
  ORDERLINENUMBER   VARCHAR2(5) not null,
  LOT               VARCHAR2(10) not null,
  STORERKEY         VARCHAR2(15) not null,
  SKU               VARCHAR2(50) not null,
  ALTSKU            VARCHAR2(50) default ' ' not null,
  UOM               VARCHAR2(10) default ' ' not null,
  UOMQTY            NUMBER(22,5) default 0 not null,
  QTY               NUMBER(22,5) default 0 not null,
  QTYMOVED          NUMBER(22,5) default 0 not null,
  STATUS            VARCHAR2(10) default '0' not null,
  DROPID            VARCHAR2(18) default ' ' not null,
  LOC               VARCHAR2(10) default 'UNKNOWN' not null,
  ID                VARCHAR2(18) default ' ' not null,
  PACKKEY           VARCHAR2(50) default ' ' not null,
  UPDATESOURCE      VARCHAR2(10) default '0' not null,
  CARTONGROUP       VARCHAR2(10),
  CARTONTYPE        VARCHAR2(10),
  TOLOC             VARCHAR2(10) default ' ',
  DOREPLENISH       VARCHAR2(1) default 'N',
  REPLENISHZONE     VARCHAR2(10) default ' ',
  DOCARTONIZE       VARCHAR2(1) default 'N',
  PICKMETHOD        VARCHAR2(1) default ' ' not null,
  WAVEKEY           VARCHAR2(10) default ' ' not null,
  EFFECTIVEDATE     DATE default SYSDATE not null,
  FORTE_FLAG        VARCHAR2(6) default 'I' not null,
  FROMLOC           VARCHAR2(10) default ' ',
  TRACKINGID        VARCHAR2(45),
  FREIGHTCHARGES    NUMBER,
  INTERMODALVEHICLE VARCHAR2(30),
  LOADID            NUMBER(10),
  STOP              NUMBER(10),
  DOOR              VARCHAR2(18),
  ROUTE             VARCHAR2(18),
  SORTATIONLOCATION VARCHAR2(18),
  SORTATIONSTATION  VARCHAR2(18),
  BATCHCARTONID     VARCHAR2(18),
  ISCLOSED          VARCHAR2(1) default 'N' not null,
  QCSTATUS          VARCHAR2(10) default 'P' not null,
  PDUDF1            VARCHAR2(10),
  PDUDF2            VARCHAR2(10),
  PDUDF3            VARCHAR2(10),
  PICKNOTES         VARCHAR2(255),
  RECEIPTKEY        VARCHAR2(10),
  CROSSDOCKED       VARCHAR2(1),
  SEQNO             NUMBER(7) default 99999,
  LABELTYPE         VARCHAR2(10),
  COMPANYPREFIX     VARCHAR2(10),
  SERIALREFERENCE   VARCHAR2(15),
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null,
  OPTIMIZECOP       VARCHAR2(1),
  BOXNO             VARCHAR2(10),
  PICKNO            VARCHAR2(10),
  PICK_DATE         DATE,
  PICK_USER         VARCHAR2(18)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column PICKDETAIL.BOXNO
  is '--记录拣货周转箱货栈板号';
comment on column PICKDETAIL.PICKNO
  is '----拣货流水号';
comment on column PICKDETAIL.PICK_DATE
  is '-拣货时间';
comment on column PICKDETAIL.PICK_USER
  is '--拣货人';
alter table PICKDETAIL
  add constraint PK_SYS_C004738 primary key (PICKDETAILKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PICKDETAIL
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
alter table PICKDETAIL
  add check (STATUS IN ('0','1','2','3','4','5','6','7','8','9'));
create index IDX_PICKDETAIL_CASEID on PICKDETAIL (CASEID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_PICKDETAIL_DROPID on PICKDETAIL (DROPID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_PICKDETAIL_LOTLOCIDSKU on PICKDETAIL (LOT, SKU, LOC, ID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_PICKDETAIL_ORDERKEY on PICKDETAIL (ORDERKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_PICKDETAIL_PICKHEADERKEY on PICKDETAIL (PICKHEADERKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_PICKDETAIL_WAVEKEY on PICKDETAIL (WAVEKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PICKD_204 on PICKDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PICKHEADER
prompt =========================
prompt
create table PICKHEADER
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  PICKHEADERKEY  VARCHAR2(18) not null,
  WAVEKEY        VARCHAR2(10) default ' ' not null,
  ORDERKEY       VARCHAR2(10) default ' ' not null,
  EXTERNORDERKEY VARCHAR2(20) default ' ' not null,
  STORERKEY      VARCHAR2(15) default ' ' not null,
  CONSIGNEEKEY   VARCHAR2(30) default ' ' not null,
  PRIORITY       VARCHAR2(10) default '5' not null,
  TYPE           VARCHAR2(10) default '5' not null,
  ZONE           VARCHAR2(18) default ' ' not null,
  STATUS         VARCHAR2(10) default '0' not null,
  PICKTYPE       VARCHAR2(10) default '3' not null,
  EFFECTIVEDATE  DATE default SYSDATE not null,
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PICKHEADER
  add constraint PK_SYS_C004739 primary key (PICKHEADERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PICKHEADER
  add check (STATUS IN ('0','1','2','3','4','5','6','7','8','9'));
create unique index PICKH_205 on PICKHEADER (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PO
prompt =================
prompt
create table PO
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  POKEY              VARCHAR2(18) not null,
  EXTERNPOKEY        VARCHAR2(20) default ' ',
  POGROUP            VARCHAR2(20) default ' ' not null,
  STORERKEY          VARCHAR2(15) not null,
  PODATE             DATE default SYSDATE,
  SELLERSREFERENCE   VARCHAR2(18) default ' ',
  BUYERSREFERENCE    VARCHAR2(18) default ' ',
  OTHERREFERENCE     VARCHAR2(18) default ' ',
  POTYPE             VARCHAR2(10) default ' ',
  SELLERNAME         VARCHAR2(45) default ' ',
  SELLERADDRESS1     VARCHAR2(45) default ' ',
  SELLERADDRESS2     VARCHAR2(45) default ' ',
  SELLERADDRESS3     VARCHAR2(45) default ' ',
  SELLERADDRESS4     VARCHAR2(45) default ' ',
  SELLERCITY         VARCHAR2(45) default ' ',
  SELLERSTATE        VARCHAR2(2) default ' ',
  SELLERZIP          VARCHAR2(18) default ' ',
  SELLERPHONE        VARCHAR2(18) default ' ',
  SELLERVAT          VARCHAR2(18) default ' ',
  BUYERNAME          VARCHAR2(45) default ' ',
  BUYERADDRESS1      VARCHAR2(45) default ' ',
  BUYERADDRESS2      VARCHAR2(45) default ' ',
  BUYERADDRESS3      VARCHAR2(45) default ' ',
  BUYERADDRESS4      VARCHAR2(45) default ' ',
  BUYERCITY          VARCHAR2(45) default ' ',
  BUYERSTATE         VARCHAR2(2) default ' ',
  BUYERZIP           VARCHAR2(18) default ' ',
  BUYERPHONE         VARCHAR2(18) default ' ',
  BUYERVAT           VARCHAR2(18) default ' ',
  ORIGINCOUNTRY      VARCHAR2(30) default ' ',
  DESTINATIONCOUNTRY VARCHAR2(30) default ' ',
  VESSEL             VARCHAR2(30) default ' ',
  VESSELDATE         DATE,
  PLACEOFLOADING     VARCHAR2(18) default ' ',
  PLACEOFDISCHARGE   VARCHAR2(18) default ' ',
  PLACEOFDELIVERY    VARCHAR2(18) default ' ',
  INCOTERMS          VARCHAR2(10) default ' ',
  PMTTERM            VARCHAR2(10) default ' ',
  TRANSMETHOD        VARCHAR2(10) default ' ',
  TERMSNOTE          VARCHAR2(18) default ' ',
  SIGNATORY          VARCHAR2(18) default ' ',
  PLACEOFISSUE       VARCHAR2(18) default ' ',
  OPENQTY            NUMBER(22,5) default 0,
  STATUS             VARCHAR2(10) default '0' not null,
  EFFECTIVEDATE      DATE default SYSDATE not null,
  FORTE_FLAG         VARCHAR2(6) default 'I' not null,
  EXTERNALPOKEY2     VARCHAR2(20),
  SUSR1              VARCHAR2(30),
  SUSR2              VARCHAR2(30),
  SUSR3              VARCHAR2(30),
  SUSR4              VARCHAR2(30),
  SUSR5              VARCHAR2(30),
  APPORTIONRULE      VARCHAR2(10) default 0,
  CLOSEDDATE         DATE,
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null,
  NOTES              VARCHAR2(2000)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PO
  add constraint PK_SYS_C004743 primary key (POKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PO
  add foreign key (STORERKEY)
  references STORER (STORERKEY);
alter table PO
  add constraint CK_PO_STATUS
  check (TO_NUMBER(STATUS) >= 0 AND TO_NUMBER(STATUS) <= 20);
create unique index PO_206 on PO (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table POD
prompt ==================
prompt
create table POD
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  PO_ID       VARCHAR2(24) default '0' not null,
  POD_ID      VARCHAR2(10) default '0' not null,
  QTY_ORDERED NUMBER(22,5) default 0,
  UNIT_COST   NUMBER(22,5) default 0,
  UNIT_SHIP   NUMBER(22,5) default 0,
  SKU         VARCHAR2(50) default ' ',
  SKU_DESC    VARCHAR2(50) default ' ',
  SKU_HGT     NUMBER(22,5) default 0,
  SKU_WGT     NUMBER(22,5) default 0,
  SKU_CUBE    NUMBER(22,5) default 0,
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table POD
  add constraint PK_SYS_C004742 primary key (PO_ID, POD_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table POD
  add foreign key (PO_ID)
  references DOCKPO (PO_ID);
create unique index POD_207 on POD (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PODETAILSTATUSHISTORY
prompt ====================================
prompt
create table PODETAILSTATUSHISTORY
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  POKEY        VARCHAR2(18) not null,
  POLINENUMBER VARCHAR2(5) not null,
  STATUS       VARCHAR2(2) not null,
  SOURCE       VARCHAR2(30) not null,
  QTY          NUMBER(22,5) not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PODET_209 on PODETAILSTATUSHISTORY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PODETAIL_UDF
prompt ===========================
prompt
create table PODETAIL_UDF
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  POKEY        VARCHAR2(18) not null,
  POLINENUMBER VARCHAR2(5) not null,
  UDFLABEL     VARCHAR2(60) not null,
  UDFVALUE     VARCHAR2(60),
  UDFNOTES     VARCHAR2(60),
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null,
  FORTE_FLAG   VARCHAR2(6) default 'I' not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PODETAIL_UDF
  add constraint PK_SYS_C004741 primary key (POKEY, POLINENUMBER, UDFLABEL)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PODET_210 on PODETAIL_UDF (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table POLL_ALLOCATE
prompt ============================
prompt
create table POLL_ALLOCATE
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  ORDERKEY      VARCHAR2(10) not null,
  EFFECTIVEDATE DATE default SYSDATE not null,
  RETRYCOUNT    NUMBER(10) default 0 not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index POLL__211 on POLL_ALLOCATE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table POLL_PICK
prompt ========================
prompt
create table POLL_PICK
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  CASEID        VARCHAR2(20) not null,
  RETRYCOUNT    NUMBER(10) default 0 not null,
  EFFECTIVEDATE DATE default SYSDATE not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index POLL__212 on POLL_PICK (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table POLL_PRINT
prompt =========================
prompt
create table POLL_PRINT
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  PRINTTYPE     VARCHAR2(10) not null,
  ORDERKEY      VARCHAR2(10) default ' ' not null,
  CASEID        VARCHAR2(20) default ' ' not null,
  DROPID        VARCHAR2(18) default ' ' not null,
  STATUS        VARCHAR2(10) default '0' not null,
  EFFECTIVEDATE DATE default SYSDATE not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index POLL__213 on POLL_PRINT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table POLL_SHIP
prompt ========================
prompt
create table POLL_SHIP
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  CASEID        VARCHAR2(20) not null,
  RETRYCOUNT    NUMBER(10) default 0 not null,
  EFFECTIVEDATE DATE default SYSDATE not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index POLL__214 on POLL_SHIP (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table POLL_UPDATE
prompt ==========================
prompt
create table POLL_UPDATE
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  POLLUPDATEKEY NUMBER(10) not null,
  UPDATESTRING  VARCHAR2(250) default ' ' not null,
  STATUS        VARCHAR2(10) default '0' not null,
  RETRYCOUNT    NUMBER(10) default 0 not null,
  EFFECTIVEDATE DATE default SYSDATE not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index POLL__215 on POLL_UPDATE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table POSTATUSHISTORY
prompt ==============================
prompt
create table POSTATUSHISTORY
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  POKEY     VARCHAR2(18) not null,
  STATUS    VARCHAR2(2) not null,
  SOURCE    VARCHAR2(30) not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index POSTA_216 on POSTATUSHISTORY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PO_UDF
prompt =====================
prompt
create table PO_UDF
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  POKEY     VARCHAR2(18) not null,
  UDFLABEL  VARCHAR2(60) not null,
  UDFVALUE  VARCHAR2(60),
  UDFNOTES  VARCHAR2(60),
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PO_UDF
  add constraint PK_SYS_C004744 primary key (POKEY, UDFLABEL)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PO_UD_217 on PO_UDF (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PREALLOCATEPICKDETAIL
prompt ====================================
prompt
create table PREALLOCATEPICKDETAIL
(
  SERIALKEY                NUMBER not null,
  WHSEID                   VARCHAR2(30) default USER,
  PREALLOCATEPICKDETAILKEY VARCHAR2(10) default ' ' not null,
  ORDERKEY                 VARCHAR2(10) default ' ' not null,
  ORDERLINENUMBER          VARCHAR2(5) default ' ' not null,
  STORERKEY                VARCHAR2(15) default ' ' not null,
  SKU                      VARCHAR2(50) default ' ' not null,
  LOT                      VARCHAR2(10) default ' ' not null,
  UOM                      VARCHAR2(5) default ' ' not null,
  UOMQTY                   NUMBER(22,5) default 0 not null,
  QTY                      NUMBER(22,5) default 0 not null,
  PACKKEY                  VARCHAR2(50) default ' ' not null,
  WAVEKEY                  VARCHAR2(10) default ' ' not null,
  PREALLOCATESTRATEGYKEY   VARCHAR2(10) default ' ' not null,
  PREALLOCATEPICKCODE      VARCHAR2(10) default ' ' not null,
  DOCARTONIZE              VARCHAR2(1) default 'N' not null,
  PICKMETHOD               VARCHAR2(1) default ' ' not null,
  RUNKEY                   VARCHAR2(10) default ' ' not null,
  EFFECTIVEDATE            DATE default SYSDATE not null,
  FORTE_FLAG               VARCHAR2(6) default 'I' not null,
  ADDDATE                  DATE default SYSDATE not null,
  ADDWHO                   VARCHAR2(30) default USER not null,
  EDITDATE                 DATE default SYSDATE not null,
  EDITWHO                  VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PREALLOCATEPICKDETAIL
  add constraint PK_SYS_C004745 primary key (PREALLOCATEPICKDETAILKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PREALLOCATEPICKDETAIL
  add check (QTY >= 0);
create index IDX_PAPD_ORDERKEY on PREALLOCATEPICKDETAIL (ORDERKEY, ORDERLINENUMBER)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PREAL_218 on PREALLOCATEPICKDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PREALLOCATESTRATEGY
prompt ==================================
prompt
create table PREALLOCATESTRATEGY
(
  SERIALKEY              NUMBER not null,
  WHSEID                 VARCHAR2(30) default USER,
  PREALLOCATESTRATEGYKEY VARCHAR2(10) default ' ' not null,
  DESCR                  VARCHAR2(60) default ' ' not null,
  ADDDATE                DATE default SYSDATE not null,
  ADDWHO                 VARCHAR2(30) default USER not null,
  EDITDATE               DATE default SYSDATE not null,
  EDITWHO                VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PREALLOCATESTRATEGY
  add constraint PK_SYS_C004747 primary key (PREALLOCATESTRATEGYKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PREAL_219 on PREALLOCATESTRATEGY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PREALLOCATESTRATEGYDETAIL
prompt ========================================
prompt
create table PREALLOCATESTRATEGYDETAIL
(
  SERIALKEY                     NUMBER not null,
  WHSEID                        VARCHAR2(30) default USER,
  PREALLOCATESTRATEGYKEY        VARCHAR2(10) default ' ' not null,
  PREALLOCATESTRATEGYLINENUMBER VARCHAR2(5) default ' ' not null,
  DESCR                         VARCHAR2(60) default ' ' not null,
  UOM                           VARCHAR2(10) default ' ' not null,
  PREALLOCATEPICKCODE           VARCHAR2(10) default ' ' not null,
  PICKCODESQL                   VARCHAR2(2000),
  ADDDATE                       DATE default SYSDATE not null,
  ADDWHO                        VARCHAR2(30) default USER not null,
  EDITDATE                      DATE default SYSDATE not null,
  EDITWHO                       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PREALLOCATESTRATEGYDETAIL
  add constraint PK_SYS_C004746 primary key (PREALLOCATESTRATEGYKEY, PREALLOCATESTRATEGYLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PREAL_220 on PREALLOCATESTRATEGYDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRE_RECEIVE
prompt ==========================
prompt
create table PRE_RECEIVE
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER not null,
  XSOGROUPKEY VARCHAR2(11) not null,
  LINENUMBER  VARCHAR2(10),
  POKEY       VARCHAR2(10),
  VENDOR      VARCHAR2(50),
  SKU         VARCHAR2(50),
  ALTSKU      VARCHAR2(50),
  QTY         NUMBER(22,5),
  REC_USER    VARCHAR2(18),
  REC_DATE    DATE,
  SUSR1       VARCHAR2(30),
  SUSR2       VARCHAR2(30),
  SUSR3       VARCHAR2(30),
  SUSR4       VARCHAR2(30),
  SUSR5       VARCHAR2(30),
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null,
  STORERKEY   VARCHAR2(20),
  STATUS      VARCHAR2(2) default 0
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index IDX_PRE_RECEIVE_001 on PRE_RECEIVE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PK_SYS_PRE_RECEIVE on PRE_RECEIVE (XSOGROUPKEY, SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRINTSET
prompt =======================
prompt
create table PRINTSET
(
  ID            NUMBER not null,
  REPORT        VARCHAR2(40),
  PARAMETER     VARCHAR2(40),
  PRINTER_NAME  VARCHAR2(60),
  COMPUTER_NAME VARCHAR2(30),
  PACKLOC       VARCHAR2(10),
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column PRINTSET.ID
  is '序号';
comment on column PRINTSET.REPORT
  is '打印数据窗口';
comment on column PRINTSET.PARAMETER
  is '打印参数';
comment on column PRINTSET.PRINTER_NAME
  is '打印机名称';
comment on column PRINTSET.COMPUTER_NAME
  is '计算机名';
comment on column PRINTSET.PACKLOC
  is '打包台号';
alter table PRINTSET
  add constraint PK_SYS_PRINT_ID primary key (ID)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PK_SYS_COMPUTER_REPORT on PRINTSET (COMPUTER_NAME, REPORT)
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PTRACEDETAIL
prompt ===========================
prompt
create table PTRACEDETAIL
(
  SERIALKEY                    NUMBER not null,
  WHSEID                       VARCHAR2(30) default USER,
  PTRACETYPE                   VARCHAR2(30) not null,
  PTRACEHEADKEY                VARCHAR2(10) not null,
  PA_PUTAWAYSTRATEGYKEY        VARCHAR2(10) not null,
  PA_PUTAWAYSTRATEGYLINENUMBER VARCHAR2(10) not null,
  PTRACEDETAILKEY              VARCHAR2(10) not null,
  LOCKEY                       VARCHAR2(10) not null,
  REASON                       VARCHAR2(80) not null,
  ADDDATE                      DATE default SYSDATE not null,
  ADDWHO                       VARCHAR2(30) default USER not null,
  EDITDATE                     DATE default SYSDATE not null,
  EDITWHO                      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PTRACEDETAIL
  add constraint PK_SYS_C004748 primary key (PTRACEHEADKEY, PTRACEDETAILKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PTRAC_221 on PTRACEDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PTRACEHEAD
prompt =========================
prompt
create table PTRACEHEAD
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  PTRACETYPE      VARCHAR2(30) not null,
  PTRACEHEADKEY   VARCHAR2(10) not null,
  USERID          VARCHAR2(20),
  STORERKEY       VARCHAR2(15) not null,
  SKU             VARCHAR2(50) not null,
  LOT             VARCHAR2(10) not null,
  ID              VARCHAR2(10),
  PACKKEY         VARCHAR2(50) not null,
  QTY             NUMBER(22,5) not null,
  PA_MULTIPRODUCT NUMBER(10),
  PA_MULTILOT     NUMBER(10),
  STARTTIME       DATE,
  ENDTIME         DATE,
  PA_LOCSREVIEWED NUMBER(10),
  PA_LOCFOUND     VARCHAR2(10),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PTRACEHEAD
  add constraint PK_SYS_C004749 primary key (PTRACEHEADKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PTRAC_222 on PTRACEHEAD (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PUTAWAYSTRATEGY
prompt ==============================
prompt
create table PUTAWAYSTRATEGY
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  PUTAWAYSTRATEGYKEY VARCHAR2(10) not null,
  DESCR              VARCHAR2(60) default ' ' not null,
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PUTAWAYSTRATEGY
  add constraint PK_SYS_C004751 primary key (PUTAWAYSTRATEGYKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PUTAW_223 on PUTAWAYSTRATEGY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PUTAWAYSTRATEGYDETAIL
prompt ====================================
prompt
create table PUTAWAYSTRATEGYDETAIL
(
  SERIALKEY                    NUMBER not null,
  WHSEID                       VARCHAR2(30) default USER,
  PUTAWAYSTRATEGYKEY           VARCHAR2(10) not null,
  PUTAWAYSTRATEGYLINENUMBER    VARCHAR2(5) not null,
  PATYPE                       VARCHAR2(5) default ' ' not null,
  FROMLOC                      VARCHAR2(10) default ' ' not null,
  TOLOC                        VARCHAR2(10) default ' ' not null,
  AREAKEY                      VARCHAR2(10) default ' ' not null,
  ZONE                         VARCHAR2(10) default ' ' not null,
  LOCTYPE                      VARCHAR2(10) default ' ' not null,
  LOCSEARCHTYPE                VARCHAR2(10) default '1' not null,
  DIMENSIONRESTRICTION01       VARCHAR2(5) default '0' not null,
  DIMENSIONRESTRICTION02       VARCHAR2(5) default '0' not null,
  DIMENSIONRESTRICTION03       VARCHAR2(5) default '0' not null,
  DIMENSIONRESTRICTION04       VARCHAR2(5) default '0' not null,
  DIMENSIONRESTRICTION05       VARCHAR2(5) default '0' not null,
  DIMENSIONRESTRICTION06       VARCHAR2(5) default '0' not null,
  LOCATIONTYPEEXCLUDE01        VARCHAR2(10) default ' ' not null,
  LOCATIONTYPEEXCLUDE02        VARCHAR2(10) default ' ' not null,
  LOCATIONTYPEEXCLUDE03        VARCHAR2(10) default ' ' not null,
  LOCATIONTYPEEXCLUDE04        VARCHAR2(10) default 'PICKTO' not null,
  LOCATIONTYPEEXCLUDE05        VARCHAR2(10) default 'STAGED' not null,
  LOCATIONFLAGEXCLUDE01        VARCHAR2(10) default ' ' not null,
  LOCATIONFLAGEXCLUDE02        VARCHAR2(10) default ' ' not null,
  LOCATIONFLAGEXCLUDE03        VARCHAR2(10) default ' ' not null,
  LOCATIONFLAGINCLUDE01        VARCHAR2(10) default ' ' not null,
  LOCATIONFLAGINCLUDE02        VARCHAR2(10) default ' ' not null,
  LOCATIONFLAGINCLUDE03        VARCHAR2(10) default ' ' not null,
  LOCATIONHANDLINGEXCLUDE01    VARCHAR2(10) default ' ' not null,
  LOCATIONHANDLINGEXCLUDE02    VARCHAR2(10) default ' ' not null,
  LOCATIONHANDLINGEXCLUDE03    VARCHAR2(10) default ' ' not null,
  LOCATIONHANDLINGINCLUDE01    VARCHAR2(10) default ' ' not null,
  LOCATIONHANDLINGINCLUDE02    VARCHAR2(10) default ' ' not null,
  LOCATIONHANDLINGINCLUDE03    VARCHAR2(10) default ' ' not null,
  LOCATIONCATEGORYINCLUDE01    VARCHAR2(10) default ' ' not null,
  LOCATIONCATEGORYINCLUDE02    VARCHAR2(10) default ' ' not null,
  LOCATIONCATEGORYINCLUDE03    VARCHAR2(10) default ' ' not null,
  LOCATIONCATEGORYEXCLUDE01    VARCHAR2(10) default ' ' not null,
  LOCATIONCATEGORYEXCLUDE02    VARCHAR2(10) default ' ' not null,
  LOCATIONCATEGORYEXCLUDE03    VARCHAR2(10) default ' ' not null,
  AREATYPEEXCLUDE01            VARCHAR2(10) default ' ' not null,
  AREATYPEEXCLUDE02            VARCHAR2(10) default ' ' not null,
  AREATYPEEXCLUDE03            VARCHAR2(10) default ' ' not null,
  LOCATIONTYPERESTRICTION01    VARCHAR2(5) default ' ' not null,
  LOCATIONTYPERESTRICTION02    VARCHAR2(5) default ' ' not null,
  LOCATIONTYPERESTRICTION03    VARCHAR2(5) default ' ' not null,
  FITFULLRECEIPT               VARCHAR2(5) default 'N' not null,
  ORDERTYPE                    VARCHAR2(10) default ' ' not null,
  NUMBEROFDAYSOFFSET           NUMBER(10) default 0 not null,
  LOCATIONSTATERESTRICTION01   VARCHAR2(5) default '0' not null,
  LOCATIONSTATERESTRICTION02   VARCHAR2(5) default '0' not null,
  LOCATIONSTATERESTRICTION03   VARCHAR2(5) default '0' not null,
  ALLOWFULLPALLETS             VARCHAR2(5) default 'Y' not null,
  ALLOWFULLCASES               VARCHAR2(5) default 'Y' not null,
  ALLOWPIECES                  VARCHAR2(5) default 'Y' not null,
  CHECKEQUIPMENTPROFILEKEY     VARCHAR2(5) default 'N' not null,
  CHECKRESTRICTIONS            VARCHAR2(5) default 'Y' not null,
  SKUABCEXCLUDE01              VARCHAR2(10) default ' ' not null,
  SKUABCEXCLUDE02              VARCHAR2(10) default ' ' not null,
  SKUABCEXCLUDE03              VARCHAR2(10) default ' ' not null,
  SKUABCINCLUDE01              VARCHAR2(10) default ' ' not null,
  SKUABCINCLUDE02              VARCHAR2(10) default ' ' not null,
  SKUABCINCLUDE03              VARCHAR2(10) default ' ' not null,
  LOCABCEXCLUDE01              VARCHAR2(10) default ' ' not null,
  LOCABCEXCLUDE02              VARCHAR2(10) default ' ' not null,
  LOCABCEXCLUDE03              VARCHAR2(10) default ' ' not null,
  LOCABCINCLUDE01              VARCHAR2(10) default ' ' not null,
  LOCABCINCLUDE02              VARCHAR2(10) default ' ' not null,
  LOCABCINCLUDE03              VARCHAR2(10) default ' ' not null,
  RECEIPTTYPEEXCLUDE01         VARCHAR2(10) default ' ' not null,
  RECEIPTTYPEEXCLUDE02         VARCHAR2(10) default ' ' not null,
  RECEIPTTYPEEXCLUDE03         VARCHAR2(10) default ' ' not null,
  RECEIPTTYPEINCLUDE01         VARCHAR2(10) default ' ' not null,
  RECEIPTTYPEINCLUDE02         VARCHAR2(10) default ' ' not null,
  RECEIPTTYPEINCLUDE03         VARCHAR2(10) default ' ' not null,
  SKUFREIGHTCLASSEXCLUDE01     VARCHAR2(10) default ' ' not null,
  SKUFREIGHTCLASSEXCLUDE02     VARCHAR2(10) default ' ' not null,
  SKUFREIGHTCLASSEXCLUDE03     VARCHAR2(10) default ' ' not null,
  SKUFREIGHTCLASSINCLUDE01     VARCHAR2(10) default ' ' not null,
  SKUFREIGHTCLASSINCLUDE02     VARCHAR2(10) default ' ' not null,
  SKUFREIGHTCLASSINCLUDE03     VARCHAR2(10) default ' ' not null,
  SKUSUSR01EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR01EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR01EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR01INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR01INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR01INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR02EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR02EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR02EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR02INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR02INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR02INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR03EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR03EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR03EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR03INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR03INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR03INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR04EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR04EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR04EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR04INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR04INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR04INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR05EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR05EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR05EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR05INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR05INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR05INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR06EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR06EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR06EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR06INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR06INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR06INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR07EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR07EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR07EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR07INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR07INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR07INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR08EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR08EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR08EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR08INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR08INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR08INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR09EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR09EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR09EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR09INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR09INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR09INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR10EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR10EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR10EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUSUSR10INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUSUSR10INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUSUSR10INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR01EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR01EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR01EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR01INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR01INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR01INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR02EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR02EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR02EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR02INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR02INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR02INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR03EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR03EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR03EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR03INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR03INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR03INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR04EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR04EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR04EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR04INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR04INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR04INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR05EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR05EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR05EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR05INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR05INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR05INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR06EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR06EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR06EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR06INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR06INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR06INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR07EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR07EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR07EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR07INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR07INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR07INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR08EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR08EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR08EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR08INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR08INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR08INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR09EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR09EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR09EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR09INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR09INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR09INCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR10EXCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR10EXCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR10EXCLUDE03           VARCHAR2(10) default ' ' not null,
  SKUBUSR10INCLUDE01           VARCHAR2(10) default ' ' not null,
  SKUBUSR10INCLUDE02           VARCHAR2(10) default ' ' not null,
  SKUBUSR10INCLUDE03           VARCHAR2(10) default ' ' not null,
  DISPOSITIONTYPEINCLUDE01     VARCHAR2(10) default ' ' not null,
  DISPOSITIONTYPEINCLUDE02     VARCHAR2(10) default ' ' not null,
  DISPOSITIONTYPEINCLUDE03     VARCHAR2(10) default ' ' not null,
  DISPOSITIONTYPEEXCLUDE01     VARCHAR2(10) default ' ' not null,
  DISPOSITIONTYPEEXCLUDE02     VARCHAR2(10) default ' ' not null,
  DISPOSITIONTYPEEXCLUDE03     VARCHAR2(10) default ' ' not null,
  SINGLEPUTAWAYFORMULTIPALLETS VARCHAR2(1) default 'N' not null,
  ADDDATE                      DATE default SYSDATE not null,
  ADDWHO                       VARCHAR2(30) default USER not null,
  EDITDATE                     DATE default SYSDATE not null,
  EDITWHO                      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PUTAWAYSTRATEGYDETAIL
  add constraint PK_SYS_C004750 primary key (PUTAWAYSTRATEGYKEY, PUTAWAYSTRATEGYLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index PUTAW_224 on PUTAWAYSTRATEGYDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RECEIPT
prompt ======================
prompt
create table RECEIPT
(
  SERIALKEY             NUMBER not null,
  WHSEID                VARCHAR2(30) default USER,
  RECEIPTKEY            VARCHAR2(10) not null,
  EXTERNRECEIPTKEY      VARCHAR2(20) default ' ' not null,
  RECEIPTGROUP          VARCHAR2(20) default ' ' not null,
  STORERKEY             VARCHAR2(15) default ' ' not null,
  RECEIPTDATE           DATE default SYSDATE,
  POKEY                 VARCHAR2(18) default ' ',
  CARRIERKEY            VARCHAR2(15),
  CARRIERNAME           VARCHAR2(45),
  CARRIERADDRESS1       VARCHAR2(45),
  CARRIERADDRESS2       VARCHAR2(45),
  CARRIERCITY           VARCHAR2(45),
  CARRIERSTATE          VARCHAR2(2),
  CARRIERZIP            VARCHAR2(18),
  CARRIERREFERENCE      VARCHAR2(18),
  WAREHOUSEREFERENCE    VARCHAR2(18),
  ORIGINCOUNTRY         VARCHAR2(30),
  DESTINATIONCOUNTRY    VARCHAR2(30),
  VEHICLENUMBER         VARCHAR2(18),
  VEHICLEDATE           DATE,
  PLACEOFLOADING        VARCHAR2(18),
  PLACEOFDISCHARGE      VARCHAR2(30),
  PLACEOFDELIVERY       VARCHAR2(30),
  INCOTERMS             VARCHAR2(10),
  TERMSNOTE             VARCHAR2(18),
  CONTAINERKEY          VARCHAR2(18),
  SIGNATORY             VARCHAR2(18),
  PLACEOFISSUE          VARCHAR2(18),
  OPENQTY               NUMBER(22,5) default 0,
  FORTE_FLAG            VARCHAR2(6) default 'I' not null,
  STATUS                VARCHAR2(10) default '0' not null,
  EFFECTIVEDATE         DATE default SYSDATE not null,
  CONTAINERTYPE         VARCHAR2(20),
  CONTAINERQTY          NUMBER(22,5),
  BILLEDCONTAINERQTY    NUMBER(22,5),
  TRANSPORTATIONMODE    VARCHAR2(30) default '1',
  EXTERNALRECEIPTKEY2   VARCHAR2(20),
  SUSR1                 VARCHAR2(30),
  SUSR2                 VARCHAR2(30),
  SUSR3                 VARCHAR2(30),
  SUSR4                 VARCHAR2(30),
  SUSR5                 VARCHAR2(30),
  TYPE                  VARCHAR2(10) default '1' not null,
  RMA                   VARCHAR2(30),
  EXPECTEDRECEIPTDATE   DATE default SYSDATE not null,
  ALLOWAUTORECEIPT      VARCHAR2(1),
  CLOSEDDATE            DATE,
  TRACKINVENTORYBY      VARCHAR2(1) default '0',
  CARRIERCOUNTRY        VARCHAR2(30),
  CARRIERPHONE          VARCHAR2(18),
  DRIVERNAME            VARCHAR2(25),
  TRAILERNUMBER         VARCHAR2(25),
  TRAILEROWNER          VARCHAR2(25),
  ARRIVALDATETIME       DATE default SYSDATE not null,
  LOTTABLEMATCHREQUIRED VARCHAR2(1) default '0' not null,
  ADDDATE               DATE default SYSDATE not null,
  ADDWHO                VARCHAR2(30) default USER not null,
  EDITDATE              DATE default SYSDATE not null,
  EDITWHO               VARCHAR2(30) default USER not null,
  NOTES                 VARCHAR2(2000)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RECEIPT
  add constraint PK_SYS_C004755 primary key (RECEIPTKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RECEIPT
  add foreign key (STORERKEY)
  references STORER (STORERKEY);
alter table RECEIPT
  add constraint CK_RECEIPT_STATUS
  check (TO_NUMBER(STATUS) >= 0 AND TO_NUMBER(STATUS) <= 20);
create unique index RECEI_226 on RECEIPT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RECEIPTDETAIL
prompt ============================
prompt
create table RECEIPTDETAIL
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  RECEIPTKEY        VARCHAR2(10) not null,
  RECEIPTLINENUMBER VARCHAR2(5) not null,
  EXTERNRECEIPTKEY  VARCHAR2(32) default ' ' not null,
  EXTERNLINENO      VARCHAR2(20) default ' ' not null,
  STORERKEY         VARCHAR2(15) default ' ' not null,
  POKEY             VARCHAR2(18) default ' ' not null,
  TARIFFKEY         VARCHAR2(10) default 'XXXXXXXXXX' not null,
  SKU               VARCHAR2(50) default ' ' not null,
  ALTSKU            VARCHAR2(50) default ' ' not null,
  ID                VARCHAR2(18) default ' ' not null,
  STATUS            VARCHAR2(10) default '0' not null,
  DATERECEIVED      DATE default SYSDATE not null,
  QTYEXPECTED       NUMBER(22,5) default 0 not null,
  QTYADJUSTED       NUMBER(22,5) default 0 not null,
  QTYRECEIVED       NUMBER(22,5) default 0 not null,
  UOM               VARCHAR2(10) default ' ' not null,
  PACKKEY           VARCHAR2(50) default 'STD' not null,
  VESSELKEY         VARCHAR2(18) default ' ',
  VOYAGEKEY         VARCHAR2(18) default ' ',
  XDOCKKEY          VARCHAR2(18) default ' ',
  CONTAINERKEY      VARCHAR2(18) default ' ',
  TOLOC             VARCHAR2(10) not null,
  TOLOT             VARCHAR2(10),
  TOID              VARCHAR2(18) default ' ',
  CONDITIONCODE     VARCHAR2(10) default 'OK' not null,
  LOTTABLE01        VARCHAR2(50) default ' ' not null,
  LOTTABLE02        VARCHAR2(50) default ' ' not null,
  LOTTABLE03        VARCHAR2(50) default ' ' not null,
  LOTTABLE04        DATE,
  LOTTABLE05        DATE,
  LOTTABLE06        VARCHAR2(50) default ' ' not null,
  LOTTABLE07        VARCHAR2(50) default ' ' not null,
  LOTTABLE08        VARCHAR2(50) default ' ' not null,
  LOTTABLE09        VARCHAR2(50) default ' ' not null,
  LOTTABLE10        VARCHAR2(50) default ' ' not null,
  CASECNT           NUMBER(22,5) default 0 not null,
  INNERPACK         NUMBER(22,5) default 0 not null,
  PALLET            NUMBER(22,5) default 0 not null,
  CUBE              NUMBER(22,5) default 0 not null,
  GROSSWGT          NUMBER(22,5) default 0 not null,
  NETWGT            NUMBER(22,5) default 0 not null,
  OTHERUNIT1        NUMBER(22,5) default 0 not null,
  OTHERUNIT2        NUMBER(22,5) default 0 not null,
  UNITPRICE         NUMBER(22,5) default 0 not null,
  EXTENDEDPRICE     NUMBER(22,5) default 0 not null,
  EFFECTIVEDATE     DATE default SYSDATE not null,
  FORTE_FLAG        VARCHAR2(6) default 'I' not null,
  SUSR1             VARCHAR2(30),
  SUSR2             VARCHAR2(30),
  SUSR3             VARCHAR2(30),
  SUSR4             VARCHAR2(30),
  SUSR5             VARCHAR2(30),
  NOTES             VARCHAR2(2000),
  REASONCODE        VARCHAR2(20) default ' ',
  PALLETID          VARCHAR2(18),
  QTYREJECTED       NUMBER(22,5) default 0 not null,
  TYPE              VARCHAR2(1) default '0',
  RETURNTYPE        VARCHAR2(10),
  RETURNREASON      VARCHAR2(10),
  DISPOSITIONTYPE   VARCHAR2(10),
  DISPOSITIONCODE   VARCHAR2(10),
  RETURNCONDITION   VARCHAR2(10),
  QCREQUIRED        VARCHAR2(1) default '0' not null,
  QCQTYINSPECTED    NUMBER(22,5) default 0,
  QCQTYREJECTED     NUMBER(22,5) default 0,
  QCREJREASON       VARCHAR2(10),
  QCSTATUS          VARCHAR2(1) default 'N',
  QCUSER            VARCHAR2(18),
  QCAUTOADJUST      VARCHAR2(1) default '0',
  EXTERNALLOT       VARCHAR2(100),
  RMA               VARCHAR2(16),
  PACKINGSLIPQTY    NUMBER(22,5) default 0 not null,
  IPSKEY            VARCHAR2(10),
  SUPPLIERNAME      VARCHAR2(25),
  SUPPLIERKEY       VARCHAR2(10),
  MATCHLOTTABLE     VARCHAR2(1) default '0',
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RECEIPTDETAIL
  add constraint PK_SYS_C004753 primary key (RECEIPTKEY, RECEIPTLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RECEIPTDETAIL
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
alter table RECEIPTDETAIL
  add constraint CK_RECEIPTDETAIL_STATUS
  check (TO_NUMBER(STATUS) >= 0 AND TO_NUMBER(STATUS) <= 20);
create unique index RECEI_227 on RECEIPTDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RECEIPTDETAILSTATUSHISTORY
prompt =========================================
prompt
create table RECEIPTDETAILSTATUSHISTORY
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  RECEIPTKEY        VARCHAR2(10) not null,
  RECEIPTLINENUMBER VARCHAR2(5) not null,
  SOURCE            VARCHAR2(30) not null,
  STATUS            VARCHAR2(2) not null,
  QTY               NUMBER(22,5) not null,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index RECEI_228 on RECEIPTDETAILSTATUSHISTORY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RECEIPTDETAIL_UDF
prompt ================================
prompt
create table RECEIPTDETAIL_UDF
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  RECEIPTKEY        VARCHAR2(10) not null,
  RECEIPTLINENUMBER VARCHAR2(5) not null,
  UDFLABEL          VARCHAR2(60) not null,
  UDFVALUE          VARCHAR2(60),
  UDFNOTES          VARCHAR2(60),
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RECEIPTDETAIL_UDF
  add constraint PK_SYS_C004754 primary key (RECEIPTKEY, RECEIPTLINENUMBER, UDFLABEL)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index RECEI_229 on RECEIPTDETAIL_UDF (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RECEIPTSTATUSHISTORY
prompt ===================================
prompt
create table RECEIPTSTATUSHISTORY
(
  SERIALKEY  NUMBER not null,
  WHSEID     VARCHAR2(30) default USER,
  RECEIPTKEY VARCHAR2(10) not null,
  STATUS     VARCHAR2(2) not null,
  SOURCE     VARCHAR2(30) not null,
  ADDDATE    DATE default SYSDATE not null,
  ADDWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index RECEI_230 on RECEIPTSTATUSHISTORY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RECEIPTVALIDATION
prompt ================================
prompt
create table RECEIPTVALIDATION
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  RECEIPTVALIDATIONKEY    VARCHAR2(18) not null,
  DEFAULTFLAG             VARCHAR2(1) default '0' not null,
  RECEIPTWITHOUTPO        VARCHAR2(1) default '1' not null,
  RECEIPTWITHOUTASN       VARCHAR2(1) default '1' not null,
  COMMODITYNOTONPO        VARCHAR2(1) default '1' not null,
  COMMODITYNOTONASN       VARCHAR2(1) default '1' not null,
  COMMODITYNOTONPS        VARCHAR2(1) default '1' not null,
  LPNNOTONCASELEVELASN    VARCHAR2(1) default '1' not null,
  RECEIPTWITHOUTLPN       VARCHAR2(1) default '1' not null,
  PERFORMQTYVALIDATION    VARCHAR2(1) default '0' not null,
  OVERAGEMESSAGE          VARCHAR2(1) default '0' not null,
  SHORTAGEMESSAGE         VARCHAR2(1) default '0' not null,
  OVERAGEOVERRIDE         VARCHAR2(1) default '0' not null,
  OVERAGEOVERIDEPERCENT   NUMBER(22,5) default 0 not null,
  OVERAGEHARDERROR        VARCHAR2(1) default '0' not null,
  OVERAGEHARDERRORPERCENT NUMBER(22,5) default 0 not null,
  SHORTAGEOVERRIDE        VARCHAR2(1) default '0' not null,
  SHORTAGEOVERRIDEPERCENT NUMBER(22,5) default 0 not null,
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RECEIPTVALIDATION
  add constraint PK_SYS_C004756 primary key (RECEIPTVALIDATIONKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index RECEI_231 on RECEIPTVALIDATION (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RECEIPT_UDF
prompt ==========================
prompt
create table RECEIPT_UDF
(
  SERIALKEY  NUMBER not null,
  WHSEID     VARCHAR2(30) default USER,
  RECEIPTKEY VARCHAR2(10) not null,
  UDFLABEL   VARCHAR2(60) not null,
  UDFVALUE   VARCHAR2(60),
  UDFNOTES   VARCHAR2(60),
  ADDDATE    DATE default SYSDATE not null,
  ADDWHO     VARCHAR2(30) default USER not null,
  EDITDATE   DATE default SYSDATE not null,
  EDITWHO    VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table RECEIPT_UDF
  add constraint PK_SYS_C004757 primary key (RECEIPTKEY, UDFLABEL)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index RECEI_232 on RECEIPT_UDF (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REPLENISHMENT
prompt ============================
prompt
create table REPLENISHMENT
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  REPLENISHMENTKEY   VARCHAR2(10) not null,
  REPLENISHMENTGROUP VARCHAR2(10) not null,
  STORERKEY          VARCHAR2(15) not null,
  SKU                VARCHAR2(50) not null,
  FROMLOC            VARCHAR2(10) not null,
  TOLOC              VARCHAR2(10) not null,
  LOT                VARCHAR2(10) not null,
  ID                 VARCHAR2(18) not null,
  QTY                NUMBER(22,5) not null,
  QTYMOVED           NUMBER(22,5) default 0,
  QTYINPICKLOC       NUMBER(22,5) default 0,
  PRIORITY           VARCHAR2(5) default '99999' not null,
  UOM                VARCHAR2(10) not null,
  PACKKEY            VARCHAR2(50) not null,
  IDMOVED            VARCHAR2(18) default ' ',
  LOTMOVED           VARCHAR2(10) default ' ',
  LOCMOVEDFROM       VARCHAR2(10) default ' ',
  REASON             VARCHAR2(10) default ' ',
  TOID               VARCHAR2(18) default ' ',
  FINALTOLOC         VARCHAR2(10) default ' ' not null,
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table REPLENISHMENT
  add constraint PK_SYS_C004758 primary key (REPLENISHMENTGROUP, REPLENISHMENTKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index REPLE_233 on REPLENISHMENT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REPLENISHMENT_LOCK
prompt =================================
prompt
create table REPLENISHMENT_LOCK
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  PTCID     VARCHAR2(10) not null,
  STORERKEY VARCHAR2(15) not null,
  SKU       VARCHAR2(50) not null,
  FROMLOC   VARCHAR2(10) not null,
  TOLOC     VARCHAR2(10) not null,
  LOT       VARCHAR2(10) not null,
  ID        VARCHAR2(18) not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index REPLE_234 on REPLENISHMENT_LOCK (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RFDB_LOG
prompt =======================
prompt
create table RFDB_LOG
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null,
  USER_ID   VARCHAR2(30) default USER not null,
  MESSAGE   VARCHAR2(250)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index RFDB__236 on RFDB_LOG (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RFLOGINS
prompt =======================
prompt
create table RFLOGINS
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  USERID    VARCHAR2(20) not null,
  PASSWORD  VARCHAR2(20) not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index RFLOG_237 on RFLOGINS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ROUTEOPS
prompt =======================
prompt
create table ROUTEOPS
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  OPERATIONID      NUMBER(10) not null,
  OPERATIONKEY     VARCHAR2(32) not null,
  DESCRIPTION      VARCHAR2(64),
  SEQUENCE         NUMBER(10) not null,
  QTYCOMPLETE      NUMBER(18,7),
  TIMECODEBASIS    VARCHAR2(32) default 'MINUTES',
  STANDARDTIME     NUMBER(18) default 0,
  ACTUALTIME       NUMBER(18) default 0,
  CREWSIZE         NUMBER(10) default 1,
  EXTERNPROCCOST   NUMBER(18,3) default 0,
  SCRAPPERCENT     NUMBER(18,16) default 0,
  BATCHQTY         NUMBER(18,7) default 0,
  BATCHUOM         VARCHAR2(10) default 'EACH',
  ISDYNAMIC        NUMBER(1) default 0,
  SUSPENDAFTEROP   NUMBER(1) default 0,
  PICKRELEASEHOW   NUMBER(2) default 0,
  UPDATEINVENTORY  NUMBER(1) default 0,
  STATUS           NUMBER(2),
  WORKORDERID      NUMBER(10),
  WORKCENTERDEFNID NUMBER(10),
  OPCLASSID        NUMBER(10),
  INSTRUCTIONSURL  VARCHAR2(250),
  NOTES            VARCHAR2(250),
  CLOSEDATE        DATE,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROUTEOPS
  add constraint PK_SYS_C004761 primary key (OPERATIONID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROUTEOPS
  add foreign key (OPCLASSID)
  references OPERATIONCLASS (OPCLASSID);
alter table ROUTEOPS
  add foreign key (WORKCENTERDEFNID)
  references WORKCENTERDEFN (WORKCENTERDEFNID);
create index IDX_ROUTEOPS03 on ROUTEOPS (OPCLASSID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index ROUTEOPSF1 on ROUTEOPS (WORKORDERID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index ROUTEOPSF2 on ROUTEOPS (WORKCENTERDEFNID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ROUTEOPSU1 on ROUTEOPS (OPERATIONKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index ROUTE_238 on ROUTEOPS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RR_TEMP
prompt ======================
prompt
create table RR_TEMP
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  RECEIPTKEY        VARCHAR2(50),
  RECEIPTLINENUMBER VARCHAR2(50),
  SKU               VARCHAR2(50),
  PACKKEY           VARCHAR2(50),
  SOURCEKEY         VARCHAR2(50),
  UOM               VARCHAR2(50),
  UOMQTY            NUMBER(22,5),
  LOT               VARCHAR2(50),
  TOID              VARCHAR2(50),
  QTY               NUMBER(22,5),
  TOLOC             VARCHAR2(50),
  ITRNKEY           VARCHAR2(50),
  LOTTABLE01        VARCHAR2(50),
  LOTTABLE02        VARCHAR2(50),
  LOTTABLE03        VARCHAR2(50),
  LOTTABLE04        DATE,
  LOTTABLE05        DATE,
  LOTTABLE06        VARCHAR2(50),
  LOTTABLE07        VARCHAR2(50),
  LOTTABLE08        VARCHAR2(50),
  LOTTABLE09        VARCHAR2(50),
  LOTTABLE10        VARCHAR2(50)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index RR_TE_240 on RR_TEMP (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCHEDULERJOB
prompt ===========================
prompt
create table SCHEDULERJOB
(
  JOBID      NVARCHAR2(50),
  JOBNAME    NVARCHAR2(50),
  EXPRESSION NVARCHAR2(100)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEAL_INFO
prompt ========================
prompt
create table SEAL_INFO
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  APPT_ID         VARCHAR2(10) not null,
  SEAL_NUMBER     VARCHAR2(25) default ' ' not null,
  CDLKUP_POSITION VARCHAR2(10),
  EQPT_UNIT_ID    VARCHAR2(18) default ' ',
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SEAL_INFO
  add constraint PK_SYS_C004763 primary key (APPT_ID, SEAL_NUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SEAL_INFO
  add foreign key (APPT_ID)
  references APPT_HEADER (APPT_ID);
create unique index SEAL__242 on SEAL_INFO (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SECTION
prompt ======================
prompt
create table SECTION
(
  SERIALKEY  NUMBER not null,
  WHSEID     VARCHAR2(30) default USER,
  SECTIONKEY VARCHAR2(10) default ' ' not null,
  DESCR      VARCHAR2(60) default ' ' not null,
  ADDDATE    DATE default SYSDATE not null,
  ADDWHO     VARCHAR2(30) default USER not null,
  EDITDATE   DATE default SYSDATE not null,
  EDITWHO    VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SECTION
  add constraint PK_SYS_C004764 primary key (SECTIONKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index SECTI_243 on SECTION (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SKUXLOC
prompt ======================
prompt
create table SKUXLOC
(
  SERIALKEY                   NUMBER not null,
  WHSEID                      VARCHAR2(30) default USER,
  STORERKEY                   VARCHAR2(15) default ' ' not null,
  SKU                         VARCHAR2(50) default ' ' not null,
  LOC                         VARCHAR2(10) default ' ' not null,
  QTY                         NUMBER(22,5) default 0 not null,
  QTYALLOCATED                NUMBER(22,5) default 0 not null,
  QTYPICKED                   NUMBER(22,5) default 0 not null,
  QTYEXPECTED                 NUMBER(22,5) default 0 not null,
  QTYLOCATIONLIMIT            NUMBER(22,5) default 0 not null,
  QTYLOCATIONMINIMUM          NUMBER(22,5) default 0 not null,
  QTYPICKINPROCESS            NUMBER(22,5) default 0 not null,
  QTYREPLENISHMENTOVERRIDE    NUMBER(22,5) default 0 not null,
  REPLENISHMENTPRIORITY       VARCHAR2(5) default '9' not null,
  REPLENISHMENTSEVERITY       NUMBER(22,5) default 0 not null,
  REPLENISHMENTCASECNT        NUMBER(22,5) default 0 not null,
  LOCATIONTYPE                VARCHAR2(10) default 'OTHER' not null,
  LOCATIONUOM                 VARCHAR2(10) default ' ',
  REPLENISHMENTUOM            VARCHAR2(10) default '1',
  REPLENISHMENTQTY            NUMBER(22,5) default 0,
  TODOUSER                    VARCHAR2(18) default ' ',
  ALLOWREPLENISHFROMCASEPICK  NUMBER(1) default 0,
  ALLOWREPLENISHFROMBULK      NUMBER(1) default 0,
  ALLOWREPLENISHFROMPIECEPICK NUMBER(1) default 0,
  OPTBATCHID                  VARCHAR2(10),
  OPTSEQUENCE                 VARCHAR2(10),
  OPTADDDELFLAG               VARCHAR2(1),
  ADDDATE                     DATE default SYSDATE not null,
  ADDWHO                      VARCHAR2(30) default USER not null,
  EDITDATE                    DATE default SYSDATE not null,
  EDITWHO                     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SKUXLOC
  add constraint PK_SYS_C004766 primary key (STORERKEY, SKU, LOC)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SKUXLOC
  add foreign key (LOC)
  references LOC (LOC);
alter table SKUXLOC
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
alter table SKUXLOC
  add check (QTY >= 0 AND QTYALLOCATED >= 0 AND QTYPICKED >= 0 AND QTYEXPECTED >= 0);
create index IDX_SKUXLOC_EDITDATE on SKUXLOC (EDITDATE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_SKUXLOC_LOC on SKUXLOC (LOC)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_SKUXLOC_LOCTYPE on SKUXLOC (LOCATIONTYPE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_SKUXLOC_REPSEV on SKUXLOC (REPLENISHMENTSEVERITY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_SKUXLOC_SKU on SKUXLOC (SKU)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index SKUXL_246 on SKUXLOC (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SKU_UDF
prompt ======================
prompt
create table SKU_UDF
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  STORERKEY VARCHAR2(15) not null,
  SKU       VARCHAR2(50) not null,
  UDFLABEL  VARCHAR2(60) not null,
  UDFVALUE  VARCHAR2(60),
  UDFNOTES  VARCHAR2(60),
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SKU_UDF
  add constraint PK_SYS_C004768 primary key (SKU, STORERKEY, UDFLABEL)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index SKU_U_247 on SKU_UDF (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SORTATIONSTATION
prompt ===============================
prompt
create table SORTATIONSTATION
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  SORTATIONSTATIONKEY VARCHAR2(18) not null,
  SORTATIONZONE       VARCHAR2(18) default ' ' not null,
  STATIONSTATUS       VARCHAR2(1) default '1' not null,
  PUTRATEHOUR         NUMBER(10) default 0 not null,
  PUTAWAYZONE         VARCHAR2(10) default ' ' not null,
  WAVEKEY             VARCHAR2(10) default ' ' not null,
  ADDDATE             DATE default SYSDATE not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  EDITDATE            DATE default SYSDATE not null,
  EDITWHO             VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SORTATIONSTATION
  add constraint PK_SYS_C004770 primary key (SORTATIONSTATIONKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index SORTA_248 on SORTATIONSTATION (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SORTATIONSTATIONDETAIL
prompt =====================================
prompt
create table SORTATIONSTATIONDETAIL
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  SORTATIONSTATIONKEY VARCHAR2(18) not null,
  SORTLOCATION        VARCHAR2(18) not null,
  LOCATIONSTATUS      VARCHAR2(1) default '1' not null,
  NUMOFPOSITIONS      NUMBER(10) default 1 not null,
  DROPID              VARCHAR2(18) default ' ' not null,
  ADDDATE             DATE default SYSDATE not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  EDITDATE            DATE default SYSDATE not null,
  EDITWHO             VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SORTATIONSTATIONDETAIL
  add constraint PK_SYS_C004769 primary key (SORTATIONSTATIONKEY, SORTLOCATION)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SORTATIONSTATIONDETAIL
  add foreign key (SORTATIONSTATIONKEY)
  references SORTATIONSTATION (SORTATIONSTATIONKEY);
create unique index SORTA_249 on SORTATIONSTATIONDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STANDING_APPT
prompt ============================
prompt
create table STANDING_APPT
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  WHSE_ID                 VARCHAR2(15) default ' ' not null,
  APPT_ID                 VARCHAR2(10) not null,
  DOOR_ID                 VARCHAR2(10) default ' ' not null,
  DOCK_STORER_ID          VARCHAR2(15) not null,
  CDLKUP_DOCK_STORER_TYPE VARCHAR2(10) not null,
  APPROVE_REJECT          VARCHAR2(1) default '0' not null,
  CDLKUP_DAYOFWEEK        VARCHAR2(10) default '0' not null,
  DURATION_MIN            NUMBER(10) default 0 not null,
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STANDING_APPT
  add constraint PK_SYS_C004772 primary key (WHSE_ID, APPT_ID, DOOR_ID, DOCK_STORER_ID, CDLKUP_DOCK_STORER_TYPE)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STANDING_APPT
  add foreign key (APPT_ID)
  references APPT_HEADER (APPT_ID);
alter table STANDING_APPT
  add foreign key (DOOR_ID, WHSE_ID)
  references DOOR (DOOR_ID, WHSE_ID);
create unique index STAND_251 on STANDING_APPT (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STORERBILLING
prompt ============================
prompt
create table STORERBILLING
(
  SERIALKEY                 NUMBER not null,
  WHSEID                    VARCHAR2(30) default USER,
  STORERKEY                 VARCHAR2(15) not null,
  RSMINIMUMINVOICECHARGE    NUMBER(22,6) default 0.0 not null,
  RSMINIMUMINVOICETAXGROUP  VARCHAR2(10) default 'XXXXXXXXXX' not null,
  RSMINIMUMINVOICEGLDIST    VARCHAR2(10) default 'XXXXXXXXXX' not null,
  ISMINIMUMINVOICECHARGE    NUMBER(22,6) default 0.0 not null,
  ISMINIMUMINVOICETAXGROUP  VARCHAR2(10) default 'XXXXXXXXXX' not null,
  ISMINIMUMINVOICEGLDIST    VARCHAR2(10) default 'XXXXXXXXXX' not null,
  HIMINIMUMINVOICECHARGE    NUMBER(22,6) default 0.0 not null,
  HIMINIMUMINVOICETAXGROUP  VARCHAR2(10) default 'XXXXXXXXXX' not null,
  HIMINIMUMINVOICEGLDIST    VARCHAR2(10) default 'XXXXXXXXXX' not null,
  HOMINIMUMSHIPMENTCHARGE   NUMBER(22,6) default 0.0 not null,
  HOMINIMUMSHIPMENTTAXGROUP VARCHAR2(10) default 'XXXXXXXXXX' not null,
  HOMINIMUMSHIPMENTGLDIST   VARCHAR2(10) default 'XXXXXXXXXX' not null,
  ISMINIMUMRECEIPTCHARGE    NUMBER(22,6) default 0.0 not null,
  ISMINIMUMRECEIPTTAXGROUP  VARCHAR2(10) default 'XXXXXXXXXX' not null,
  ISMINIMUMRECEIPTGLDIST    VARCHAR2(10) default 'XXXXXXXXXX' not null,
  HIMINIMUMRECEIPTCHARGE    NUMBER(22,6) default 0.0 not null,
  HIMINIMUMRECEIPTTAXGROUP  VARCHAR2(10) default 'XXXXXXXXXX' not null,
  HIMINIMUMRECEIPTGLDIST    VARCHAR2(10) default 'XXXXXXXXXX' not null,
  INVOICENUMBERSTRATEGY     VARCHAR2(10) default '0' not null,
  ADDDATE                   DATE default SYSDATE not null,
  ADDWHO                    VARCHAR2(30) default USER not null,
  EDITDATE                  DATE default SYSDATE not null,
  EDITWHO                   VARCHAR2(30) default USER not null,
  BILLINGGROUP              VARCHAR2(10) default 'STD',
  LOCKWHO                   VARCHAR2(18) default ' ',
  INVOICEBATCH              VARCHAR2(10) default ' ',
  ALMINIMUMCHARGE           NUMBER(22,5) default 0.0,
  ALMINIMUMTAXGROUP         VARCHAR2(10) default 'XXXXXXXXXX',
  ALMINIMUMGLDIST           VARCHAR2(10) default 'XXXXXXXXXX'
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STORERBILLING
  add constraint PK_SYS_C004773 primary key (STORERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STORERBILLING
  add foreign key (STORERKEY)
  references STORER (STORERKEY);
create unique index STORE_253 on STORERBILLING (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STORERLABELS
prompt ===========================
prompt
create table STORERLABELS
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  STORERKEY    VARCHAR2(15) not null,
  CONSIGNEEKEY VARCHAR2(15) default 'DEFAULT' not null,
  LABELTYPE    VARCHAR2(20) not null,
  LABELNAME    VARCHAR2(20) not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STORERLABELS
  add constraint PK_SYS_C004776 primary key (STORERKEY, CONSIGNEEKEY, LABELTYPE)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STORERLABELS
  add foreign key (STORERKEY)
  references STORER (STORERKEY);
create unique index STORE_254 on STORERLABELS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STORER_UDF
prompt =========================
prompt
create table STORER_UDF
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  STORERKEY VARCHAR2(15) not null,
  UDFLABEL  VARCHAR2(60) not null,
  UDFVALUE  VARCHAR2(60),
  UDFNOTES  VARCHAR2(60),
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STORER_UDF
  add constraint PK_SYS_C004775 primary key (STORERKEY, UDFLABEL)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index STORE_255 on STORER_UDF (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STRATEGY
prompt =======================
prompt
create table STRATEGY
(
  SERIALKEY                NUMBER not null,
  WHSEID                   VARCHAR2(30) default USER,
  STRATEGYKEY              VARCHAR2(10) default ' ' not null,
  DESCR                    VARCHAR2(60) default ' ' not null,
  PREALLOCATESTRATEGYKEY   VARCHAR2(10) default ' ' not null,
  ALLOCATESTRATEGYKEY      VARCHAR2(10) default ' ' not null,
  REPLENISHMENTSTRATEGYKEY VARCHAR2(10) default ' ' not null,
  PUTAWAYSTRATEGYKEY       VARCHAR2(10) default ' ' not null,
  PICKSTRATEGYKEY          VARCHAR2(10) default ' ' not null,
  TTMSTRATEGYKEY           VARCHAR2(10) default ' ' not null,
  ADDDATE                  DATE default SYSDATE not null,
  ADDWHO                   VARCHAR2(30) default USER not null,
  EDITDATE                 DATE default SYSDATE not null,
  EDITWHO                  VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STRATEGY
  add constraint PK_SYS_C004777 primary key (STRATEGYKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index STRAT_256 on STRATEGY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SUBSTITUTESKU
prompt ============================
prompt
create table SUBSTITUTESKU
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  SEQUENCE      NUMBER(10) not null,
  STORERKEY     VARCHAR2(15) not null,
  SKU           VARCHAR2(50) not null,
  SUBSTITUTESKU VARCHAR2(50) not null,
  PACKKEY       VARCHAR2(50) default 'STD' not null,
  UOM           VARCHAR2(10) default 'EA' not null,
  UOMQTY        NUMBER(22,5) default 1 not null,
  QTY           NUMBER(22,5) default 1 not null,
  SUBPACKKEY    VARCHAR2(50) default 'STD' not null,
  SUBUOM        VARCHAR2(10) default 'EA' not null,
  SUBUOMQTY     NUMBER(22,5) default 1 not null,
  SUBQTY        NUMBER(22,5) default 1 not null,
  STATUS        VARCHAR2(1) default '1' not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SUBSTITUTESKU
  add constraint PK_SYS_C004778 primary key (SKU, STORERKEY, SUBSTITUTESKU)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SUBSTITUTESKU
  add unique (SUBSTITUTESKU, SKU, STORERKEY, SEQUENCE)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SUBSTITUTESKU
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
alter table SUBSTITUTESKU
  add foreign key (SUBSTITUTESKU, STORERKEY)
  references SKU (SKU, STORERKEY);
alter table SUBSTITUTESKU
  add check (QTY > 0 AND SUBQTY > 0 AND UOMQTY > 0 AND SUBUOMQTY > 0);
create unique index SUBST_257 on SUBSTITUTESKU (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYSTEM_RULES
prompt ===========================
prompt
create table SYSTEM_RULES
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  SYSTEM_RULES_ID   VARCHAR2(10) not null,
  SYSTEM_VALUE      VARCHAR2(10),
  SYSTEM_RULES_DESC VARCHAR2(50) not null,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SYSTEM_RULES
  add constraint PK_SYS_C004779 primary key (SYSTEM_RULES_ID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index SYSTE_258 on SYSTEM_RULES (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TARIFFDETAIL
prompt ===========================
prompt
create table TARIFFDETAIL
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  TARIFFDETAILKEY   VARCHAR2(10) not null,
  TARIFFKEY         VARCHAR2(10) not null,
  CHARGETYPE        VARCHAR2(10) not null,
  DESCRIP           VARCHAR2(30) default ' ' not null,
  RATE              NUMBER(22,6) not null,
  BASE              VARCHAR2(1) default 'Q' not null,
  MASTERUNITS       NUMBER(12,6) default 1.0 not null,
  ROUNDMASTERUNITS  VARCHAR2(10) default '0' not null,
  UOMSHOW           VARCHAR2(10) default ' ' not null,
  TAXGROUPKEY       VARCHAR2(10) default 'XXXXXXXXXX' not null,
  GLDISTRIBUTIONKEY VARCHAR2(10) default 'XXXXXXXXXX' not null,
  MINIMUMCHARGE     NUMBER(22,6) default 0.0 not null,
  MINIMUMGROUP      VARCHAR2(10) default 'LOT' not null,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null,
  COSTRATE          NUMBER(22,6) default 0.0,
  COSTBASE          VARCHAR2(1) default 'Q',
  COSTMASTERUNITS   NUMBER(12,6) default 1.0,
  COSTUOMSHOW       VARCHAR2(10) default ' ',
  UOM1MULT          NUMBER(12,6) default 1.0,
  UOM2MULT          NUMBER(12,6) default 1.0,
  UOM3MULT          NUMBER(12,6) default 1.0,
  UOM4MULT          NUMBER(12,6) default 1.0
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TARIFFDETAIL
  add constraint PK_SYS_C004780 primary key (TARIFFDETAILKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TARIFFDETAIL
  add foreign key (GLDISTRIBUTIONKEY)
  references GLDISTRIBUTION (GLDISTRIBUTIONKEY);
alter table TARIFFDETAIL
  add foreign key (TARIFFKEY)
  references TARIFF (TARIFFKEY);
alter table TARIFFDETAIL
  add foreign key (TAXGROUPKEY)
  references TAXGROUP (TAXGROUPKEY);
alter table TARIFFDETAIL
  add check (BASE = 'R' OR (BASE = 'P' OR (BASE = 'F' OR (BASE = 'C' OR (BASE = 'G' OR BASE = 'Q')))));
alter table TARIFFDETAIL
  add check (MASTERUNITS > 0.0);
alter table TARIFFDETAIL
  add check (COSTBASE = 'R' OR (COSTBASE = 'P' OR (COSTBASE = 'F' OR (COSTBASE = 'C' OR (COSTBASE = 'G' OR COSTBASE = 'Q')))));
alter table TARIFFDETAIL
  add check (MINIMUMGROUP = 'LOTTABLE03' OR (MINIMUMGROUP = 'LOTTABLE02' OR (MINIMUMGROUP = 'LOTTABLE01' OR MINIMUMGROUP = 'LOT')));
alter table TARIFFDETAIL
  add check (CHARGETYPE = 'MR' OR (CHARGETYPE = 'DO' OR (CHARGETYPE = 'DI' OR (CHARGETYPE = 'SP' OR (CHARGETYPE = 'AC' OR (CHARGETYPE = 'MI' OR (CHARGETYPE = 'HO' OR (CHARGETYPE = 'HI' OR (CHARGETYPE = 'RS' OR CHARGETYPE = 'IS')))))))));
alter table TARIFFDETAIL
  add check (COSTMASTERUNITS > 0.0);
create unique index TARIF_260 on TARIFFDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TARIFFXSTORERXSKU
prompt ================================
prompt
create table TARIFFXSTORERXSKU
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  TSSKEY    VARCHAR2(10) default ' ' not null,
  STORER    VARCHAR2(15) default ' ' not null,
  SKU       VARCHAR2(50) default ' ' not null,
  TARIFFKEY VARCHAR2(10) default ' ' not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TARIFFXSTORERXSKU
  add constraint PK_SYS_C004781 primary key (TSSKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TARIF_261 on TARIFFXSTORERXSKU (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TASKDETAIL
prompt =========================
prompt
create table TASKDETAIL
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  TASKDETAILKEY       VARCHAR2(10) default ' ' not null,
  TASKTYPE            VARCHAR2(10) default ' ' not null,
  STORERKEY           VARCHAR2(15) default ' ' not null,
  SKU                 VARCHAR2(50) default ' ' not null,
  LOT                 VARCHAR2(10) default ' ' not null,
  UOM                 VARCHAR2(5) default ' ' not null,
  UOMQTY              NUMBER(22,5) default 0 not null,
  QTY                 NUMBER(22,5) default 0 not null,
  FROMLOC             VARCHAR2(10) default ' ' not null,
  LOGICALFROMLOC      VARCHAR2(18) default ' ' not null,
  FROMID              VARCHAR2(18) default ' ' not null,
  TOLOC               VARCHAR2(10) default ' ' not null,
  LOGICALTOLOC        VARCHAR2(18) default ' ' not null,
  TOID                VARCHAR2(18) default ' ' not null,
  CASEID              VARCHAR2(20) default ' ' not null,
  PICKMETHOD          VARCHAR2(10) default ' ' not null,
  STATUS              VARCHAR2(10) default '0' not null,
  STATUSMSG           VARCHAR2(255) default ' ' not null,
  PRIORITY            VARCHAR2(10) default '5' not null,
  SOURCEPRIORITY      VARCHAR2(10) default ' ' not null,
  HOLDKEY             VARCHAR2(10) default ' ' not null,
  USERKEY             VARCHAR2(18) default ' ' not null,
  USERPOSITION        VARCHAR2(10) default '1' not null,
  USERKEYOVERRIDE     VARCHAR2(18) default ' ' not null,
  STARTTIME           DATE default SYSDATE not null,
  ENDTIME             DATE default SYSDATE not null,
  SOURCETYPE          VARCHAR2(30) default ' ' not null,
  SOURCEKEY           VARCHAR2(30) default ' ' not null,
  PICKDETAILKEY       VARCHAR2(10) default ' ' not null,
  ORDERKEY            VARCHAR2(10) default ' ' not null,
  ORDERLINENUMBER     VARCHAR2(5) default ' ' not null,
  LISTKEY             VARCHAR2(10) default ' ' not null,
  WAVEKEY             VARCHAR2(10) default ' ' not null,
  REASONKEY           VARCHAR2(10) default ' ' not null,
  MESSAGE01           VARCHAR2(20) default ' ' not null,
  MESSAGE02           VARCHAR2(20) default ' ' not null,
  MESSAGE03           VARCHAR2(20) default ' ' not null,
  FINALTOLOC          VARCHAR2(10) default ' ' not null,
  RELEASEDATE         DATE,
  OPTBATCHID          VARCHAR2(10),
  OPTTASKSEQUENCE     VARCHAR2(10),
  OPTREPLENISHMENTUOM VARCHAR2(10),
  OPTQTYLOCMINIMUM    NUMBER(22,5),
  OPTLOCATIONTYPE     VARCHAR2(10),
  OPTQTYLOCLIMIT      NUMBER(22,5),
  SEQNO               NUMBER(7) default 99999,
  ADDDATE             DATE default SYSDATE not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  EDITDATE            DATE default SYSDATE not null,
  EDITWHO             VARCHAR2(30) default USER not null,
  DOOR                VARCHAR2(10) default ' ',
  ROUTE               VARCHAR2(10) default ' ',
  STOP                VARCHAR2(10) default ' ',
  PUTAWAYZONE         VARCHAR2(10) default ' ',
  BOXNO               VARCHAR2(10),
  PICKNO              VARCHAR2(10),
  PICK_DATE           DATE,
  PICK_USER           VARCHAR2(18),
  CC_TYPE             VARCHAR2(10) default '0',
  QTY01               NUMBER(22,5) default 0,
  QTY02               NUMBER(22,5) default 0,
  QTY03               NUMBER(22,5) default 0
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TASKDETAIL
  add constraint PK_SYS_C004783 primary key (TASKDETAILKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TASKDETAIL_CASEID on TASKDETAIL (CASEID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TASKDETAIL_FROMID on TASKDETAIL (FROMID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TASKDETAIL_ORDERKEY on TASKDETAIL (ORDERKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TASKDETAIL_PD on TASKDETAIL (PICKDETAILKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TASKDETAIL_STATUS on TASKDETAIL (STATUS, USERKEY, TASKTYPE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TASKDETAIL_TASKTYPE on TASKDETAIL (TASKTYPE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TASKDETAIL_USERKEY on TASKDETAIL (USERKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TASKDETAIL_WAVEKEY on TASKDETAIL (WAVEKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TASKD_262 on TASKDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TASKMANAGERREASON
prompt ================================
prompt
create table TASKMANAGERREASON
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  TASKMANAGERREASONKEY    VARCHAR2(10) default ' ' not null,
  DESCR                   VARCHAR2(60) default ' ' not null,
  TOLOC                   VARCHAR2(10) default ' ' not null,
  VALIDINFROMLOC          VARCHAR2(10) default '1' not null,
  VALIDINTOLOC            VARCHAR2(10) default '1' not null,
  LOCHOLDKEY              VARCHAR2(10) default ' ' not null,
  IDHOLDKEY               VARCHAR2(10) default ' ' not null,
  REMOVETASKFROMUSERQUEUE VARCHAR2(10) default '0' not null,
  DOCYCLECOUNT            VARCHAR2(10) default '0' not null,
  TASKSTATUS              VARCHAR2(10) default ' ' not null,
  CONTINUEPROCESSING      VARCHAR2(10) default '0' not null,
  INTERVAL                NUMBER default 10,
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TASKMANAGERREASON
  add constraint PK_SYS_C004784 primary key (TASKMANAGERREASONKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TASKM_263 on TASKMANAGERREASON (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TASKMANAGERSKIPTASKS
prompt ===================================
prompt
create table TASKMANAGERSKIPTASKS
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  USERID        VARCHAR2(18) not null,
  TASKDETAILKEY VARCHAR2(10) not null,
  TASKTYPE      VARCHAR2(10) not null,
  CASEID        VARCHAR2(20) not null,
  LOT           VARCHAR2(10) not null,
  FROMLOC       VARCHAR2(10) not null,
  TOLOC         VARCHAR2(10) not null,
  FROMID        VARCHAR2(18) not null,
  TOID          VARCHAR2(18) not null,
  RELEASEDATE   DATE,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TMSKIPTASKS_TASKDETAILKEY on TASKMANAGERSKIPTASKS (TASKDETAILKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TMSKIPTASKS_USERID on TASKMANAGERSKIPTASKS (USERID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TASKM_264 on TASKMANAGERSKIPTASKS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TASKMANAGERUSER
prompt ==============================
prompt
create table TASKMANAGERUSER
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  USERKEY             VARCHAR2(18) default ' ' not null,
  PRIORITYTASKTYPE    VARCHAR2(10) default '1' not null,
  STRATEGYKEY         VARCHAR2(10) default ' ' not null,
  EQUIPMENTPROFILEKEY VARCHAR2(10) default ' ' not null,
  LASTCASEIDPICKED    VARCHAR2(20) default ' ' not null,
  LASTWAVEKEY         VARCHAR2(10) default ' ' not null,
  TTMSTRATEGYKEY      VARCHAR2(10) default 'STD',
  LASTLOC             VARCHAR2(10) default ' ' not null,
  USERGROUP           VARCHAR2(10) default ' ' not null,
  ADDDATE             DATE default SYSDATE not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  EDITDATE            DATE default SYSDATE not null,
  EDITWHO             VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TASKMANAGERUSER
  add constraint PK_SYS_C004786 primary key (USERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TASKM_265 on TASKMANAGERUSER (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TASKMANAGERUSERDETAIL
prompt ====================================
prompt
create table TASKMANAGERUSERDETAIL
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  USERKEY        VARCHAR2(18) default ' ' not null,
  USERLINENUMBER VARCHAR2(5) default ' ' not null,
  PERMISSIONTYPE VARCHAR2(10) default ' ' not null,
  AREAKEY        VARCHAR2(10) default ' ' not null,
  PERMISSION     VARCHAR2(10) default '1' not null,
  DESCR          VARCHAR2(60) default ' ' not null,
  ALLOWCASE      VARCHAR2(1) default '0',
  ALLOWIPS       VARCHAR2(1) default '0',
  ALLOWPALLET    VARCHAR2(1) default '0',
  ALLOWPIECE     VARCHAR2(1) default '0',
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TASKMANAGERUSERDETAIL
  add constraint PK_SYS_C004785 primary key (USERKEY, USERLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TASKM_266 on TASKMANAGERUSERDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TASK_DIF
prompt =======================
prompt
create table TASK_DIF
(
  TASK_DIFNO   VARCHAR2(20) not null,
  FROMTABLE    VARCHAR2(30) not null,
  TASKID       VARCHAR2(20) not null,
  TYPE         VARCHAR2(10) not null,
  DIF_USERID   VARCHAR2(18) default USER,
  DIF_DATE     DATE default SYSDATE,
  STATUS       VARCHAR2(10),
  DIF_AREA     VARCHAR2(10),
  DIF_LOC      VARCHAR2(10),
  DIF_BOXNO    VARCHAR2(10),
  DIF_CODE     VARCHAR2(50),
  DIF_QTY      NUMBER(10,4) default 0,
  CONFIRM_USER VARCHAR2(18) default USER,
  CONFIRM_DATE DATE default SYSDATE,
  SUSR1        VARCHAR2(30),
  SUSR2        VARCHAR2(30),
  SUSR3        VARCHAR2(30),
  SUSR4        VARCHAR2(30),
  SUSR5        VARCHAR2(30),
  ADDDATE      DATE default SYSDATE,
  ADDWHO       VARCHAR2(18) default USER,
  EDITDATE     DATE default SYSDATE,
  EDITWHO      VARCHAR2(18) default USER
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TASK_DIF
  add constraint PK_TASK_DIF primary key (TASK_DIFNO)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1224K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TAXRATE
prompt ======================
prompt
create table TAXRATE
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  TAXRATEKEY       VARCHAR2(10) not null,
  TAXAUTHORITY     VARCHAR2(30) default ' ' not null,
  SUPPORTFLAG      VARCHAR2(1) default 'A' not null,
  RATE             NUMBER(8,7) default 0.0 not null,
  EXTERNTAXRATEKEY VARCHAR2(30) default ' ' not null,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TAXRATE
  add constraint PK_SYS_C004789 primary key (TAXRATEKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TAXRATE
  add check (SUPPORTFLAG = 'D' OR (SUPPORTFLAG = 'I' OR SUPPORTFLAG = 'A'));
create unique index TAXRA_269 on TAXRATE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TAXGROUPDETAIL
prompt =============================
prompt
create table TAXGROUPDETAIL
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  TAXGROUPKEY       VARCHAR2(10) not null,
  TAXRATEKEY        VARCHAR2(10) not null,
  GLDISTRIBUTIONKEY VARCHAR2(10) default 'XXXXXXXXXX' not null,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TAXGROUPDETAIL
  add constraint PK_SYS_C004787 primary key (TAXGROUPKEY, TAXRATEKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TAXGROUPDETAIL
  add foreign key (GLDISTRIBUTIONKEY)
  references GLDISTRIBUTION (GLDISTRIBUTIONKEY);
alter table TAXGROUPDETAIL
  add foreign key (TAXGROUPKEY)
  references TAXGROUP (TAXGROUPKEY);
alter table TAXGROUPDETAIL
  add foreign key (TAXRATEKEY)
  references TAXRATE (TAXRATEKEY);
create unique index TAXGR_268 on TAXGROUPDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TEMP_REPORTS
prompt ===========================
prompt
create table TEMP_REPORTS
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  RPT_ID         VARCHAR2(50) not null,
  USER_ID        VARCHAR2(50) not null,
  DATETIME_STAMP DATE not null,
  CASEID         VARCHAR2(50),
  DROPID         VARCHAR2(50),
  STORERKEY      VARCHAR2(50),
  SKU            VARCHAR2(50),
  QTY            NUMBER(22,5),
  EXTERNORDERKEY VARCHAR2(30),
  CONSIGNEEKEY   VARCHAR2(15),
  WEIGHT         NUMBER,
  DESCR          VARCHAR2(60),
  STDGROSSWGT    NUMBER,
  STDNETWGT      NUMBER,
  STDCUBE        NUMBER,
  B_COMPANY      VARCHAR2(45),
  B_ADDRESS1     VARCHAR2(45),
  B_ADDRESS2     VARCHAR2(45),
  B_ADDRESS3     VARCHAR2(45),
  B_CITY         VARCHAR2(45),
  B_STATE        VARCHAR2(2),
  B_ZIP          VARCHAR2(18),
  COMPANY        VARCHAR2(45),
  ADDRESS1       VARCHAR2(45),
  ADDRESS2       VARCHAR2(45),
  ADDRESS3       VARCHAR2(45),
  CITY           VARCHAR2(45),
  STATE          VARCHAR2(2),
  ZIP            VARCHAR2(18),
  S_COMPANY      VARCHAR2(45),
  S_ADDRESS1     VARCHAR2(45),
  S_ADDRESS2     VARCHAR2(45),
  S_ADDRESS3     VARCHAR2(45),
  S_CITY         VARCHAR2(45),
  S_STATE        VARCHAR2(2),
  S_ZIP          VARCHAR2(18),
  DOC_NUM        VARCHAR2(60),
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TEMP__270 on TEMP_REPORTS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TRANSASN
prompt =======================
prompt
create table TRANSASN
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  TRANSASNKEY        VARCHAR2(20) not null,
  EXTERNTRANASNKEY   VARCHAR2(20) not null,
  PALLETID           VARCHAR2(20),
  STORERKEY          VARCHAR2(15) default ' ' not null,
  CUSTOMERKEY        VARCHAR2(20) not null,
  VENDORKEY          VARCHAR2(20) not null,
  VERIFYFLG          VARCHAR2(1) not null,
  WEIGHT             NUMBER not null,
  CUBE               NUMBER not null,
  STATUS             VARCHAR2(1) not null,
  UDF1               VARCHAR2(20),
  UDF2               VARCHAR2(20),
  UNITS              NUMBER(10) default 0 not null,
  MEMO               VARCHAR2(255),
  TRANSSHIPASNNUMBER VARCHAR2(20) default ' ',
  RPRTRECEIPT        NUMBER(10) default 0 not null,
  RPRTEXCEPTION      NUMBER(10) default 0 not null,
  RPRTSHIPMENT       NUMBER(10) default 0 not null,
  EXTERNALLOADID     VARCHAR2(20) default ' ',
  DELIVERYDATE       DATE default SYSDATE not null,
  OHTYPE             VARCHAR2(10) default '1',
  VEHICLECARRIER     VARCHAR2(30),
  ROUTE              VARCHAR2(10) default ' ',
  STOP               VARCHAR2(10) default ' ',
  DOOR               VARCHAR2(10),
  LOADID             VARCHAR2(20),
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TRANSASN
  add constraint PK_SYS_C004791 primary key (TRANSASNKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TRANSASN_EXTERNKEY on TRANSASN (EXTERNTRANASNKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TRANSASN_PALLET on TRANSASN (PALLETID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TRANS_271 on TRANSASN (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TRANSASND
prompt ========================
prompt
create table TRANSASND
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  TRANSASNKEY VARCHAR2(20) not null,
  LINENUMBER  VARCHAR2(5) not null,
  STORERKEY   VARCHAR2(15) not null,
  SKU         VARCHAR2(50) not null,
  QTY         NUMBER(22,5) not null,
  OVERQTY     NUMBER(22,5) default 0 not null,
  SHORTQTY    NUMBER(22,5) default 0 not null,
  STATUS      VARCHAR2(1) default '0' not null,
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null,
  DESCRIPTION VARCHAR2(20),
  VERIFIEDBY  VARCHAR2(20),
  PALLETID    VARCHAR2(20)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TRANSASND
  add constraint PK_SYS_C004790 primary key (TRANSASNKEY, LINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TRANSASND_STORERSKU on TRANSASND (STORERKEY, SKU)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TRANS_272 on TRANSASND (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TRANSDETAIL
prompt ==========================
prompt
create table TRANSDETAIL
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  TRANSSHIPKEY VARCHAR2(20) not null,
  LINENUMBER   VARCHAR2(5) not null,
  STORERKEY    VARCHAR2(15) default ' ' not null,
  SKU          VARCHAR2(50) not null,
  QTY          NUMBER(22,5) default 0 not null,
  DAMAGE       NUMBER(10) default 0 not null,
  MEMO         VARCHAR2(255),
  STATUS       VARCHAR2(10) default '0' not null,
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null,
  DESCRIPTION  VARCHAR2(20)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TRANSDETAIL
  add constraint PK_SYS_C004792 primary key (TRANSSHIPKEY, LINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TRANSDETAL_STORERSKU on TRANSDETAIL (STORERKEY, SKU)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TRANS_273 on TRANSDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TRANSFER
prompt =======================
prompt
create table TRANSFER
(
  SERIALKEY            NUMBER not null,
  WHSEID               VARCHAR2(30) default USER,
  TRANSFERKEY          VARCHAR2(10) not null,
  FROMSTORERKEY        VARCHAR2(15) default ' ' not null,
  TOSTORERKEY          VARCHAR2(15) default ' ' not null,
  TYPE                 VARCHAR2(12) not null,
  OPENQTY              NUMBER(22,5) default 0 not null,
  STATUS               VARCHAR2(10) default '0' not null,
  GENERATEHOCHARGES    VARCHAR2(10) default '1' not null,
  GENERATEIS_HICHARGES VARCHAR2(10) default '1' not null,
  EFFECTIVEDATE        DATE default SYSDATE not null,
  FORTE_FLAG           VARCHAR2(6) default 'I' not null,
  RELOT                VARCHAR2(1) default '0',
  ADDDATE              DATE default SYSDATE not null,
  ADDWHO               VARCHAR2(30) default USER not null,
  EDITDATE             DATE default SYSDATE not null,
  EDITWHO              VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TRANSFER
  add constraint PK_SYS_C004795 primary key (TRANSFERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TRANSFER
  add foreign key (FROMSTORERKEY)
  references STORER (STORERKEY);
alter table TRANSFER
  add foreign key (TOSTORERKEY)
  references STORER (STORERKEY);
alter table TRANSFER
  add check (TYPE = 'INTERCOMPANY' OR TYPE = 'STORER');
alter table TRANSFER
  add check (STATUS IN ('0','1','2','3','4','5','6','7,','8,','9'));
create unique index TRANS_274 on TRANSFER (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TRANSFERDETAIL
prompt =============================
prompt
create table TRANSFERDETAIL
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  TRANSFERKEY        VARCHAR2(10) not null,
  TRANSFERLINENUMBER VARCHAR2(5) not null,
  FROMSTORERKEY      VARCHAR2(15) default ' ' not null,
  FROMSKU            VARCHAR2(50) default ' ' not null,
  FROMLOC            VARCHAR2(10) default ' ' not null,
  FROMLOT            VARCHAR2(10) default ' ' not null,
  FROMID             VARCHAR2(18) default ' ' not null,
  FROMQTY            NUMBER(22,5) default 0 not null,
  FROMPACKKEY        VARCHAR2(50) default 'STD' not null,
  FROMUOM            VARCHAR2(10) default ' ' not null,
  LOTTABLE01         VARCHAR2(50) default ' ' not null,
  LOTTABLE02         VARCHAR2(50) default ' ' not null,
  LOTTABLE03         VARCHAR2(50) default ' ' not null,
  LOTTABLE04         DATE,
  LOTTABLE05         DATE,
  LOTTABLE06         VARCHAR2(50) default ' ' not null,
  LOTTABLE07         VARCHAR2(50) default ' ' not null,
  LOTTABLE08         VARCHAR2(50) default ' ' not null,
  LOTTABLE09         VARCHAR2(50) default ' ' not null,
  LOTTABLE10         VARCHAR2(50) default ' ' not null,
  TOSTORERKEY        VARCHAR2(15) default ' ' not null,
  TOSKU              VARCHAR2(50) default ' ' not null,
  TOLOC              VARCHAR2(10) default ' ' not null,
  TOLOT              VARCHAR2(10) default ' ' not null,
  TOID               VARCHAR2(18) default ' ' not null,
  TOQTY              NUMBER(22,5) default 0 not null,
  TOPACKKEY          VARCHAR2(50) default 'STD' not null,
  TOUOM              VARCHAR2(10) default ' ' not null,
  STATUS             VARCHAR2(10) default '0' not null,
  EFFECTIVEDATE      DATE default SYSDATE not null,
  FORTE_FLAG         VARCHAR2(6) default 'I' not null,
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TRANSFERDETAIL
  add constraint PK_SYS_C004793 primary key (TRANSFERKEY, TRANSFERLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TRANSFERDETAIL
  add foreign key (FROMLOC)
  references LOC (LOC);
alter table TRANSFERDETAIL
  add foreign key (TOLOC)
  references LOC (LOC);
alter table TRANSFERDETAIL
  add foreign key (FROMSKU, FROMSTORERKEY)
  references SKU (SKU, STORERKEY);
alter table TRANSFERDETAIL
  add foreign key (TOSKU, TOSTORERKEY)
  references SKU (SKU, STORERKEY);
alter table TRANSFERDETAIL
  add check (STATUS IN ('0','1','2','3','4','5','6','7,','8,','9'));
create unique index TRANS_275 on TRANSFERDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TRANSFERDETAIL_UDF
prompt =================================
prompt
create table TRANSFERDETAIL_UDF
(
  SERIALKEY          NUMBER not null,
  WHSEID             VARCHAR2(30) default USER,
  TRANSFERKEY        VARCHAR2(10) not null,
  TRANSFERLINENUMBER VARCHAR2(5) not null,
  UDFLABEL           VARCHAR2(60) not null,
  UDFVALUE           VARCHAR2(60),
  UDFNOTES           VARCHAR2(60),
  ADDDATE            DATE default SYSDATE not null,
  ADDWHO             VARCHAR2(30) default USER not null,
  EDITDATE           DATE default SYSDATE not null,
  EDITWHO            VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TRANSFERDETAIL_UDF
  add constraint PK_SYS_C004794 primary key (TRANSFERKEY, TRANSFERLINENUMBER, UDFLABEL)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TRANS_276 on TRANSFERDETAIL_UDF (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TRANSFER_UDF
prompt ===========================
prompt
create table TRANSFER_UDF
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  TRANSFERKEY VARCHAR2(10) not null,
  UDFLABEL    VARCHAR2(60) not null,
  UDFVALUE    VARCHAR2(60),
  UDFNOTES    VARCHAR2(60),
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TRANSFER_UDF
  add constraint PK_SYS_C004796 primary key (TRANSFERKEY, UDFLABEL)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TRANS_277 on TRANSFER_UDF (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TRANSMITLOG
prompt ==========================
prompt
create table TRANSMITLOG
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  TRANSMITLOGKEY    VARCHAR2(10) not null,
  TABLENAME         VARCHAR2(30) default ' ' not null,
  KEY1              VARCHAR2(10) default ' ' not null,
  KEY2              VARCHAR2(10) default ' ' not null,
  KEY3              VARCHAR2(20) default ' ' not null,
  KEY4              VARCHAR2(20) default ' ' not null,
  KEY5              VARCHAR2(20) default ' ' not null,
  TRANSMITFLAG      VARCHAR2(5) default '0' not null,
  TRANSMITFLAG2     VARCHAR2(5),
  TRANSMITFLAG3     VARCHAR2(5),
  TRANSMITFLAG4     VARCHAR2(5),
  TRANSMITFLAG5     VARCHAR2(5),
  TRANSMITFLAG6     VARCHAR2(5),
  TRANSMITFLAG7     VARCHAR2(5),
  TRANSMITFLAG8     VARCHAR2(5),
  TRANSMITFLAG9     VARCHAR2(5),
  TRANSMITBATCH     VARCHAR2(10) default ' ' not null,
  EVENTSTATUS       NUMBER(10) default 0 not null,
  EVENTFAILURECOUNT NUMBER(10) default 0 not null,
  EVENTCATEGORY     VARCHAR2(1) default 'E' not null,
  MESSAGE           LONG,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TRANSMITLOG
  add constraint PK_SYS_C004798 primary key (TRANSMITLOGKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TRANSMITLOG_KEY1KEY2 on TRANSMITLOG (KEY1, KEY2)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TRANSMITLOG_TNAME on TRANSMITLOG (TABLENAME, TRANSMITFLAG)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_XMITFLAG on TRANSMITLOG (TRANSMITFLAG)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TRANS_278 on TRANSMITLOG (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TRANSMITLOGSTATUS
prompt ================================
prompt
create table TRANSMITLOGSTATUS
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  TRANSMITLOGKEY VARCHAR2(10) not null,
  STATUSNAME     VARCHAR2(255) not null,
  STATUS         NUMBER(10) not null,
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TRANSMITLOGSTATUS
  add constraint PK_SYS_C004797 primary key (TRANSMITLOGKEY, STATUSNAME)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TRANS_279 on TRANSMITLOGSTATUS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TRANSSHIP
prompt ========================
prompt
create table TRANSSHIP
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  TRANSSHIPKEY   VARCHAR2(20) not null,
  CONTAINERID    VARCHAR2(20) not null,
  CUSTOMERKEY    VARCHAR2(20) not null,
  VENDORKEY      VARCHAR2(20) default ' ',
  DOCUMENTKEY    VARCHAR2(20) default ' ',
  STATUS         VARCHAR2(10) not null,
  CURRENTLOC     VARCHAR2(20) not null,
  FROMLOC        VARCHAR2(20),
  TOLOC          VARCHAR2(20),
  QTY            NUMBER(22,5) default 0,
  WEIGHT         NUMBER default 0,
  CUBE           NUMBER default 0,
  UDF1           VARCHAR2(20),
  UDF2           VARCHAR2(20),
  MEMO           VARCHAR2(255),
  LOADID         VARCHAR2(18),
  ROUTE          VARCHAR2(10) default ' ',
  DOOR           VARCHAR2(10),
  STOP           VARCHAR2(10) default ' ',
  DELIVERYDATE   DATE default SYSDATE not null,
  OHTYPE         VARCHAR2(10) default '1',
  VEHICLECARRIER VARCHAR2(30),
  TRANSASNKEY    VARCHAR2(20),
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_TRANSSHIP on TRANSSHIP (TRANSSHIPKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TRANS_280 on TRANSSHIP (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TRIDENTSCHEDULER
prompt ===============================
prompt
create table TRIDENTSCHEDULER
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  TRIDENTSCHEDULERKEY VARCHAR2(10) not null,
  HIKEY               VARCHAR2(10),
  HIIMPEXP            VARCHAR2(1),
  NEXTRUNDATE         DATE,
  LASTRUNDATE         DATE,
  FREQUENCY           VARCHAR2(10) default 'D',
  STARTWINDOW         VARCHAR2(30),
  STARTSTRING         VARCHAR2(30),
  ENABLEFLAG          VARCHAR2(10) default 'D' not null,
  SKIPDAYS            VARCHAR2(10),
  SKIPTIME            VARCHAR2(10),
  ADDDATE             DATE default SYSDATE not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  EDITDATE            DATE default SYSDATE not null,
  EDITWHO             VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TRIDENTSCHEDULER
  add constraint PK_SYS_C004799 primary key (TRIDENTSCHEDULERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TRIDE_281 on TRIDENTSCHEDULER (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TTMSTRATEGY
prompt ==========================
prompt
create table TTMSTRATEGY
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  TTMSTRATEGYKEY  VARCHAR2(10) default ' ' not null,
  DESCR           VARCHAR2(60) default ' ' not null,
  INTERLEAVETASKS VARCHAR2(10) default '0' not null,
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TTMSTRATEGY
  add constraint PK_SYS_C004801 primary key (TTMSTRATEGYKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TTMST_282 on TTMSTRATEGY (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TTMSTRATEGYDETAIL
prompt ================================
prompt
create table TTMSTRATEGYDETAIL
(
  SERIALKEY             NUMBER not null,
  WHSEID                VARCHAR2(30) default USER,
  TTMSTRATEGYKEY        VARCHAR2(10) default ' ' not null,
  TTMSTRATEGYLINENUMBER VARCHAR2(5) default ' ' not null,
  DESCR                 VARCHAR2(60) default ' ' not null,
  TASKTYPE              VARCHAR2(10) default ' ' not null,
  TTMPICKCODE           VARCHAR2(10) default ' ' not null,
  TTMOVERRIDE           VARCHAR2(10) default ' ' not null,
  ADDDATE               DATE default SYSDATE not null,
  ADDWHO                VARCHAR2(30) default USER not null,
  EDITDATE              DATE default SYSDATE not null,
  EDITWHO               VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TTMSTRATEGYDETAIL
  add constraint PK_SYS_C004800 primary key (TTMSTRATEGYKEY, TTMSTRATEGYLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index TTMST_283 on TTMSTRATEGYDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USERACTIVITY
prompt ===========================
prompt
create table USERACTIVITY
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  USERACTIVITYKEY   VARCHAR2(10) not null,
  TYPE              VARCHAR2(10) not null,
  USERID            VARCHAR2(40),
  STATUS            VARCHAR2(2) default '0' not null,
  USERATTENDANCEKEY VARCHAR2(10),
  ASSIGNMENTNUMBER  VARCHAR2(10),
  ITRNKEY           VARCHAR2(10),
  PICKDETAILKEY     VARCHAR2(18),
  TASKDETAILKEY     VARCHAR2(10),
  WAVEKEY           VARCHAR2(10),
  OTHERSOURCE       VARCHAR2(30),
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERACTIVITY
  add constraint PK_SYS_C004821 primary key (USERACTIVITYKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USERATTENDANCE
prompt =============================
prompt
create table USERATTENDANCE
(
  SERIALKEY         NUMBER not null,
  WHSEID            VARCHAR2(30) default USER,
  USERATTENDANCEKEY VARCHAR2(10) not null,
  USERID            VARCHAR2(40) not null,
  STATUS            VARCHAR2(2) default '1' not null,
  DATETIMEIN        DATE default SYSDATE not null,
  DATETIMEOUT       DATE,
  ADDDATE           DATE default SYSDATE not null,
  ADDWHO            VARCHAR2(30) default USER not null,
  EDITDATE          DATE default SYSDATE not null,
  EDITWHO           VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USERATTENDANCE
  add constraint PK_SYS_C004822 primary key (USERATTENDANCEKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WAVE
prompt ===================
prompt
create table WAVE
(
  SERIALKEY                NUMBER not null,
  WHSEID                   VARCHAR2(30) default USER,
  WAVEKEY                  VARCHAR2(10) not null,
  WAVETYPE                 VARCHAR2(18) default '0' not null,
  DESCR                    VARCHAR2(60) default ' ' not null,
  DISPATCHPALLETPICKMETHOD VARCHAR2(10) default '1' not null,
  DISPATCHCASEPICKMETHOD   VARCHAR2(10) default '1' not null,
  LABELSPERCASE            NUMBER(10) default 0 not null,
  LABELSPERPALLET          NUMBER(10) default 0 not null,
  DISPATCHPIECEPICKMETHOD  VARCHAR2(10) default '1' not null,
  STATUS                   VARCHAR2(10) default '0' not null,
  BATCHFLAG                VARCHAR2(1) default '0' not null,
  AUTOBATCH                VARCHAR2(1) default '0' not null,
  ALLOWCONSOLIDATION       VARCHAR2(1) default '0',
  EXTERNALWAVEKEY          VARCHAR2(20),
  ADDDATE                  DATE default SYSDATE not null,
  ADDWHO                   VARCHAR2(30) default USER not null,
  EDITDATE                 DATE default SYSDATE not null,
  EDITWHO                  VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WAVE
  add constraint PK_SYS_C004803 primary key (WAVEKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WAVE_284 on WAVE (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WAVEDETAIL
prompt =========================
prompt
create table WAVEDETAIL
(
  SERIALKEY     NUMBER not null,
  WHSEID        VARCHAR2(30) default USER,
  WAVEDETAILKEY VARCHAR2(10) not null,
  WAVEKEY       VARCHAR2(10) not null,
  ORDERKEY      VARCHAR2(10) default ' ' not null,
  PROCESSFLAG   VARCHAR2(10) default ' ' not null,
  ADDDATE       DATE default SYSDATE not null,
  ADDWHO        VARCHAR2(30) default USER not null,
  EDITDATE      DATE default SYSDATE not null,
  EDITWHO       VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WAVEDETAIL
  add constraint PK_SYS_C004802 primary key (WAVEKEY, WAVEDETAILKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WAVED_285 on WAVEDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WAVEINPROCESS
prompt ============================
prompt
create table WAVEINPROCESS
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  WAVEKEY   VARCHAR2(10) not null,
  ADDDATE   DATE default SYSDATE,
  ADDWHO    VARCHAR2(30) default USER
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WAVEINPROCESS
  add constraint PK_WAVEINPROCESS primary key (WAVEKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WCS_BCW
prompt ======================
prompt
create table WCS_BCW
(
  BATCHNO    VARCHAR2(20) not null,
  ID         NUMBER not null,
  BOXNO      VARCHAR2(10) not null,
  BOXWEIGHT  NUMBER(10,4),
  NET_WEIGHT NUMBER(10,4),
  ACT_WEIGHT NUMBER(10,4) not null,
  DOC_STATUS VARCHAR2(2),
  DOC_DONE   VARCHAR2(1),
  ADDDATE    DATE default SYSDATE,
  ADDWHO     VARCHAR2(18) default USER,
  EDITDATE   DATE default SYSDATE,
  EDITWHO    VARCHAR2(18) default USER,
  FLAG       VARCHAR2(1)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column WCS_BCW.BATCHNO
  is '分拣机批次号，此处为空';
comment on column WCS_BCW.ID
  is 'Id';
comment on column WCS_BCW.BOXNO
  is '箱号';
comment on column WCS_BCW.BOXWEIGHT
  is '箱重量（KG）';
comment on column WCS_BCW.NET_WEIGHT
  is '理论重量（KG）';
comment on column WCS_BCW.ACT_WEIGHT
  is '实际重量（KG）';
comment on column WCS_BCW.ADDDATE
  is '新增时间';
comment on column WCS_BCW.ADDWHO
  is '新增人';
comment on column WCS_BCW.EDITDATE
  is '修改时间';
comment on column WCS_BCW.EDITWHO
  is '修改人';
comment on column WCS_BCW.FLAG
  is '打包是否成功(0：成功，1：未成功)';
alter table WCS_BCW
  add constraint PK_SYS_ID primary key (ID)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WCS_TASK
prompt =======================
prompt
create table WCS_TASK
(
  BATCHNO    VARCHAR2(20) not null,
  FROMWHO    VARCHAR2(10),
  TOWHO      VARCHAR2(10),
  TYPE       VARCHAR2(10),
  TASKNO     VARCHAR2(10) not null,
  BOXNO      VARCHAR2(10),
  DOC_STATUS VARCHAR2(2),
  DOC_DONE   VARCHAR2(1),
  EXPORTNO   VARCHAR2(10),
  PLACE      VARCHAR2(10),
  ADDDATE    DATE default SYSDATE,
  ADDWHO     VARCHAR2(18) default USER,
  EDITDATE   DATE default SYSDATE,
  EDITWHO    VARCHAR2(18) default USER
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WCS_TASK
  add constraint PK_WCS_TASK primary key (TASKNO)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1224K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WCTASK
prompt =====================
prompt
create table WCTASK
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  WCTASKKEY   VARCHAR2(10) not null,
  WORKORDERID NUMBER(10),
  FROMOPS     NUMBER(10),
  FROMLOC     NUMBER(10),
  FROMLOCTYPE VARCHAR2(18),
  FROMID      VARCHAR2(18),
  TOOPS       NUMBER(10),
  TOLOC       NUMBER(10),
  TOLOCTYPE   VARCHAR2(18),
  TOID        VARCHAR2(18),
  QTY         NUMBER(22,5),
  STATUS      NUMBER(10),
  FLOC        VARCHAR2(10),
  TLOC        VARCHAR2(10)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WCTASK
  add constraint PK_SYS_C004804 primary key (WCTASKKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WCTASK
  add foreign key (FLOC)
  references LOC (LOC);
alter table WCTASK
  add foreign key (TLOC)
  references LOC (LOC);
create unique index WCTAS_286 on WCTASK (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WOGROUP
prompt ======================
prompt
create table WOGROUP
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  GROUPID      NUMBER(10) not null,
  GROUPKEY     VARCHAR2(32) not null,
  EXTERNJOBKEY VARCHAR2(32),
  DESCRIPTION  VARCHAR2(64),
  STATUS       NUMBER(2) default 0,
  ISRELEASED   NUMBER(1),
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WOGROUP
  add constraint PK_SYS_C004806 primary key (GROUPID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WOGROUPU1 on WOGROUP (GROUPKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WOGRO_288 on WOGROUP (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WOPROPERTYDEFN
prompt =============================
prompt
create table WOPROPERTYDEFN
(
  SERIALKEY    NUMBER not null,
  WHSEID       VARCHAR2(30) default USER,
  WOPROPID     NUMBER(10) not null,
  WOPROPKEY    VARCHAR2(32) not null,
  TYPE         VARCHAR2(16),
  DEFAULTVALUE VARCHAR2(32),
  STATUS       NUMBER(2),
  SEQUENCE     NUMBER(10),
  ADDDATE      DATE default SYSDATE not null,
  ADDWHO       VARCHAR2(30) default USER not null,
  EDITDATE     DATE default SYSDATE not null,
  EDITWHO      VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WOPROPERTYDEFN
  add constraint PK_SYS_C004807 primary key (WOPROPID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WOPROPERTYDEFNU1 on WOPROPERTYDEFN (WOPROPKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WOPRO_289 on WOPROPERTYDEFN (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WORKORDER
prompt ========================
prompt
create table WORKORDER
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  WORKORDERID     NUMBER(10) not null,
  WORKORDERKEY    VARCHAR2(32) not null,
  EXTERNWOKEY     VARCHAR2(32),
  DESCRIPTION     VARCHAR2(64),
  STATUS          NUMBER(2),
  WOLISTNAME      VARCHAR2(10),
  WOTYPE          VARCHAR2(10),
  BOMHDRID        NUMBER(10),
  QUANTITY        NUMBER(18,7),
  QTYCOMPLETE     NUMBER(18,7),
  GROUPID         NUMBER(10),
  PICKRELEASEHOW  NUMBER(2) default 0,
  ADJSKUQTYHOW    NUMBER(2) default 0,
  ISSHIPORDBYOP   NUMBER(1) default 0,
  INSTRUCTIONSURL VARCHAR2(250),
  NOTES           VARCHAR2(250),
  EXTERNORDERDATE DATE,
  DUEDATE         DATE,
  CLOSEDATE       DATE,
  ORDERKEYREF     VARCHAR2(10),
  UDF1            VARCHAR2(32),
  UDF2            VARCHAR2(32),
  UDF3            VARCHAR2(32),
  UDF4            VARCHAR2(32),
  UDF5            VARCHAR2(32),
  ISCOMBINED      NUMBER(1),
  ISRELEASED      NUMBER(1),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null,
  ORDERKEY        VARCHAR2(10) default ' ',
  ORDERLINENUMBER VARCHAR2(5) default ' ',
  WAVEKEY         VARCHAR2(10) default ' '
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WORKORDER
  add constraint PK_SYS_C004810 primary key (WORKORDERID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WORKORDER
  add foreign key (BOMHDRID)
  references BOMHDR (BOMHDRID);
alter table WORKORDER
  add foreign key (GROUPID)
  references WOGROUP (GROUPID);
create index IDX_WORKORDER01 on WORKORDER (BOMHDRID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_WORKORDER02 on WORKORDER (WOLISTNAME, WOTYPE)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_WORKORDERF3 on WORKORDER (GROUPID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WORKORDERU1 on WORKORDER (WORKORDERKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WORKO_291 on WORKORDER (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WPBATCH
prompt ======================
prompt
create table WPBATCH
(
  SERIALKEY   NUMBER not null,
  WHSEID      VARCHAR2(30) default USER,
  BATCHID     NUMBER(7) default 99999 not null,
  EXBATCHID   VARCHAR2(10) not null,
  STATUS      VARCHAR2(10) default '0' not null,
  DESCRIPTION VARCHAR2(45),
  ADDDATE     DATE default SYSDATE not null,
  ADDWHO      VARCHAR2(30) default USER not null,
  EDITDATE    DATE default SYSDATE not null,
  EDITWHO     VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WPBATCH
  add constraint PK_SYS_C004811 primary key (EXBATCHID)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WPBATCH
  add unique (BATCHID)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WPBAT_293 on WPBATCH (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WPBATCHDETAIL
prompt ============================
prompt
create table WPBATCHDETAIL
(
  SERIALKEY NUMBER not null,
  WHSEID    VARCHAR2(30) default USER,
  BATCHID   NUMBER(7) default 99999 not null,
  EXBATCHID VARCHAR2(10) not null,
  ORDERKEY  VARCHAR2(10) not null,
  ADDDATE   DATE default SYSDATE not null,
  ADDWHO    VARCHAR2(30) default USER not null,
  EDITDATE  DATE default SYSDATE not null,
  EDITWHO   VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WPBATCHDETAIL
  add constraint PK_SYS_C004812 primary key (EXBATCHID, ORDERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table WPBATCHDETAIL
  add foreign key (EXBATCHID)
  references WPBATCH (EXBATCHID);
create unique index WPBAT_294 on WPBATCHDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WPORDERDETAIL
prompt ============================
prompt
create table WPORDERDETAIL
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  BATCHID         NUMBER(7),
  ORDERKEY        VARCHAR2(10) not null,
  ORDERLINENUMBER VARCHAR2(5) not null,
  STORERKEY       VARCHAR2(15),
  SKU             VARCHAR2(20) not null,
  LOT             VARCHAR2(10) not null,
  QTYORDERED      NUMBER(22,5) not null,
  QTYSHIPPED      NUMBER(22,5),
  UOM             VARCHAR2(10),
  PACKKEY         VARCHAR2(50),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WPORD_295 on WPORDERDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WPORDERDETAILXVAS
prompt ================================
prompt
create table WPORDERDETAILXVAS
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  BATCHID         NUMBER(7),
  ORDERKEY        VARCHAR2(10) not null,
  ORDERLINENUMBER VARCHAR2(5) not null,
  SERVICEKEY      VARCHAR2(10),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WPORD_296 on WPORDERDETAILXVAS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WPORDERS
prompt =======================
prompt
create table WPORDERS
(
  SERIALKEY        NUMBER not null,
  WHSEID           VARCHAR2(30) default USER,
  BATCHID          NUMBER(7),
  ORDERKEY         VARCHAR2(10) not null,
  ORDERDATE        DATE not null,
  EXPECTEDSHIPDATE DATE,
  ORDERTYPE        VARCHAR2(10) not null,
  ORDERCATEGORY    VARCHAR2(20),
  SHIPMETHOD       VARCHAR2(10) not null,
  CARRIER          VARCHAR2(30) not null,
  ZIPCODE          VARCHAR2(18) not null,
  ACTUALSHIPDATE   DATE,
  NUMOFLINES       NUMBER,
  SHIPTYPE         VARCHAR2(30),
  CUSTOMERID       VARCHAR2(15) not null,
  ORDERCUBE        NUMBER,
  ADDDATE          DATE default SYSDATE not null,
  ADDWHO           VARCHAR2(30) default USER not null,
  EDITDATE         DATE default SYSDATE not null,
  EDITWHO          VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WPORD_297 on WPORDERS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table WPPICKDETAIL
prompt ===========================
prompt
create table WPPICKDETAIL
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  BATCHID         NUMBER(7) not null,
  EXTERNALWAVEKEY VARCHAR2(10) not null,
  STORERKEY       VARCHAR2(15),
  ORDERKEY        VARCHAR2(10) not null,
  ORDERLINENUMBER VARCHAR2(5) not null,
  LOT             VARCHAR2(10) not null,
  SKU             VARCHAR2(20) not null,
  QTY             NUMBER(22,5) not null,
  ID              VARCHAR2(20) default ' ',
  UOM             VARCHAR2(10) not null,
  SEQNO           NUMBER not null,
  REPLENISHZONE   VARCHAR2(10),
  LOC             VARCHAR2(10) not null,
  USERKEY         VARCHAR2(18),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index WPPIC_298 on WPPICKDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table XDOCK
prompt ====================
prompt
create table XDOCK
(
  SERIALKEY               NUMBER not null,
  WHSEID                  VARCHAR2(30) default USER,
  XDOCKKEY                VARCHAR2(10) not null,
  HAWBKEY                 VARCHAR2(15) default ' ' not null,
  MAWBKEY                 VARCHAR2(15) default ' ' not null,
  CONSIGNEEKEY            VARCHAR2(15) default ' ' not null,
  C_CONTACT1              VARCHAR2(30),
  C_CONTACT2              VARCHAR2(30),
  C_COMPANY               VARCHAR2(30),
  C_ADDRESS1              VARCHAR2(30),
  C_ADDRESS2              VARCHAR2(30),
  C_ADDRESS3              VARCHAR2(30),
  C_ADDRESS4              VARCHAR2(30),
  C_CITY                  VARCHAR2(30),
  C_STATE                 VARCHAR2(2),
  C_ZIP                   VARCHAR2(18),
  C_COUNTRY               VARCHAR2(30),
  C_ISOCNTRYCODE          VARCHAR2(10),
  C_PHONE1                VARCHAR2(18),
  C_FAX1                  VARCHAR2(18),
  SHIPPERKEY              VARCHAR2(15) default ' ' not null,
  S_CONTACT1              VARCHAR2(30),
  S_CONTACT2              VARCHAR2(30),
  S_COMPANY               VARCHAR2(30),
  S_ADDRESS1              VARCHAR2(30),
  S_ADDRESS2              VARCHAR2(30),
  S_ADDRESS3              VARCHAR2(30),
  S_ADDRESS4              VARCHAR2(30),
  S_CITY                  VARCHAR2(30),
  S_STATE                 VARCHAR2(2),
  S_ZIP                   VARCHAR2(18),
  S_COUNTRY               VARCHAR2(30),
  S_ISOCNTRYCODE          VARCHAR2(10),
  S_PHONE1                VARCHAR2(18),
  S_FAX1                  VARCHAR2(18),
  AGENTKEY                VARCHAR2(15) default ' ' not null,
  A_CONTACT1              VARCHAR2(30),
  A_CONTACT2              VARCHAR2(30),
  A_COMPANY               VARCHAR2(30),
  A_ADDRESS1              VARCHAR2(30),
  A_ADDRESS2              VARCHAR2(30),
  A_ADDRESS3              VARCHAR2(30),
  A_ADDRESS4              VARCHAR2(30),
  A_CITY                  VARCHAR2(30),
  A_STATE                 VARCHAR2(2),
  A_ZIP                   VARCHAR2(18),
  A_COUNTRY               VARCHAR2(30),
  A_ISOCNTRYCODE          VARCHAR2(10),
  A_PHONE1                VARCHAR2(18),
  A_FAX1                  VARCHAR2(18),
  CURRENCY                VARCHAR2(10) default 'USD',
  WTVALPPD                VARCHAR2(10) default ' ',
  WTVALCOL                VARCHAR2(10) default ' ',
  OTHERPPD                VARCHAR2(10) default ' ',
  OTHERCOL                VARCHAR2(10) default ' ',
  DECLAREDVALUEFORCUSTOMS VARCHAR2(30) default 'AS PER INVOICE',
  PLACEOFLOADING          VARCHAR2(18) default ' ',
  ROUTETO01               VARCHAR2(18) default ' ',
  ROUTETO02               VARCHAR2(18) default ' ',
  ROUTETO03               VARCHAR2(18) default ' ',
  CARRIER01               VARCHAR2(18) default ' ',
  CARRIER02               VARCHAR2(18) default ' ',
  CARRIER03               VARCHAR2(18) default ' ',
  AIRPORTOFDESTINATION    VARCHAR2(18) default ' ',
  FLIGHTDATE01            VARCHAR2(18) default ' ' not null,
  FLIGHTDATE02            VARCHAR2(18) default ' ' not null,
  AMOUNTOFINSURANCE       VARCHAR2(18) default ' ' not null,
  CHARGEDESC01            VARCHAR2(10) default ' ' not null,
  PPDCHARGE01             NUMBER default 0 not null,
  COLLCHARGE01            NUMBER default 0 not null,
  CHARGEDESC02            VARCHAR2(10) default ' ' not null,
  PPDCHARGE02             NUMBER default 0 not null,
  COLLCHARGE02            NUMBER default 0 not null,
  CHARGEDESC03            VARCHAR2(10) default ' ' not null,
  PPDCHARGE03             NUMBER default 0 not null,
  COLLCHARGE03            NUMBER default 0 not null,
  CHARGEDESC04            VARCHAR2(10) default ' ' not null,
  PPDCHARGE04             NUMBER default 0 not null,
  COLLCHARGE04            NUMBER default 0 not null,
  CHARGEDESC05            VARCHAR2(10) default ' ' not null,
  PPDCHARGE05             NUMBER default 0 not null,
  COLLCHARGE05            NUMBER default 0 not null,
  CHARGEDESC06            VARCHAR2(10) default ' ' not null,
  PPDCHARGE06             NUMBER default 0 not null,
  COLLCHARGE06            NUMBER default 0 not null,
  PPDCHARGETOTAL          NUMBER default 0 not null,
  COLLCHARGETOTAL         NUMBER default 0 not null,
  TOTALCHARGE             NUMBER default 0 not null,
  EXPECTEDTOTALQTY        NUMBER(22,5) default 0 not null,
  EXPECTEDTOTALGROSSWGT   NUMBER default 0 not null,
  EXPECTEDTOTALNETWGT     NUMBER default 0 not null,
  EXPECTEDTOTALCUBE       NUMBER default 0 not null,
  RECEIVEDTOTALQTY        NUMBER(22,5) default 0 not null,
  RECEIVEDTOTALGROSSWGT   NUMBER default 0 not null,
  RECEIVEDTOTALNETWGT     NUMBER default 0 not null,
  RECEIVEDTOTALCUBE       NUMBER default 0 not null,
  SHIPPEDTOTALQTY         NUMBER(22,5) default 0 not null,
  SHIPPEDTOTALGROSSWGT    NUMBER default 0 not null,
  SHIPPEDTOTALNETWGT      NUMBER default 0 not null,
  SHIPPEDTOTALCUBE        NUMBER default 0 not null,
  ALTERNATECURRENCY       VARCHAR2(10) default 'USD' not null,
  CONVERSIONRATE          NUMBER default 1 not null,
  RECEIVESTATUS           VARCHAR2(10) default '0' not null,
  SHIPSTATUS              VARCHAR2(10) default '0' not null,
  EFFECTIVEDATE           DATE default SYSDATE not null,
  ADDDATE                 DATE default SYSDATE not null,
  ADDWHO                  VARCHAR2(30) default USER not null,
  EDITDATE                DATE default SYSDATE not null,
  EDITWHO                 VARCHAR2(30) default USER not null,
  ACCOUNTINGINFO          VARCHAR2(2000),
  HANDLINGINFO            VARCHAR2(2000),
  NOTES                   VARCHAR2(2000)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table XDOCK
  add constraint PK_SYS_C004814 primary key (XDOCKKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table XDOCK
  add check (RECEIVESTATUS LIKE '[0-9]');
alter table XDOCK
  add check (SHIPSTATUS LIKE '[0-9]');
create unique index XDOCK_299 on XDOCK (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table XDOCKDETAIL
prompt ==========================
prompt
create table XDOCKDETAIL
(
  SERIALKEY           NUMBER not null,
  WHSEID              VARCHAR2(30) default USER,
  XDOCKKEY            VARCHAR2(10) not null,
  XDOCKLINENUMBER     VARCHAR2(5) default ' ' not null,
  RECEIVEDQTY         NUMBER(22,5) default 1 not null,
  RECEIVEDGROSSWEIGHT NUMBER default 0 not null,
  RECEIVEDNETWEIGHT   NUMBER default 0 not null,
  RECEIVEDCUBE        NUMBER default 0 not null,
  EXPECTEDQTY         NUMBER(22,5) default 0 not null,
  EXPECTEDGROSSWEIGHT NUMBER default 0 not null,
  EXPECTEDNETWEIGHT   NUMBER default 0 not null,
  EXPECTEDCUBE        NUMBER default 0 not null,
  SHIPPEDQTY          NUMBER(22,5) default 0 not null,
  SHIPPEDGROSSWEIGHT  NUMBER default 0 not null,
  SHIPPEDNETWEIGHT    NUMBER default 0 not null,
  SHIPPEDCUBE         NUMBER default 0 not null,
  UOMWEIGHT           VARCHAR2(10) default ' ' not null,
  UOMCUBE             VARCHAR2(10) default ' ' not null,
  RATECLASS           VARCHAR2(10) default ' ' not null,
  STORERKEY           VARCHAR2(15) default ' ' not null,
  SKU                 VARCHAR2(50) default ' ' not null,
  SKUDESCRIPTION      VARCHAR2(45) default ' ' not null,
  LOTTABLE01          VARCHAR2(50) default ' ' not null,
  LOTTABLE02          VARCHAR2(50) default ' ' not null,
  LOTTABLE03          VARCHAR2(50) default ' ' not null,
  LOTTABLE04          DATE,
  LOTTABLE05          DATE,
  LOTTABLE06          VARCHAR2(50) default ' ' not null,
  LOTTABLE07          VARCHAR2(50) default ' ' not null,
  LOTTABLE08          VARCHAR2(50) default ' ' not null,
  LOTTABLE09          VARCHAR2(50) default ' ' not null,
  LOTTABLE10          VARCHAR2(50) default ' ' not null,
  TOLOC               VARCHAR2(10) not null,
  TOID                VARCHAR2(18) default ' ',
  CONDITIONCODE       VARCHAR2(10) default 'OK' not null,
  CHARGEABLEWEIGHT    NUMBER default 0 not null,
  RATE                NUMBER default 0 not null,
  EXTENSION           NUMBER default 0 not null,
  UOMVOLUME           VARCHAR2(10) default ' ' not null,
  LENGTH              NUMBER default 0 not null,
  WIDTH               NUMBER default 0 not null,
  HEIGHT              NUMBER default 0 not null,
  EFFECTIVEDATE       DATE default SYSDATE not null,
  ADDDATE             DATE default SYSDATE not null,
  ADDWHO              VARCHAR2(30) default USER not null,
  EDITDATE            DATE default SYSDATE not null,
  EDITWHO             VARCHAR2(30) default USER not null,
  NOTES               VARCHAR2(2000)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table XDOCKDETAIL
  add constraint PK_SYS_C004813 primary key (XDOCKKEY, XDOCKLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table XDOCKDETAIL
  add foreign key (SKU, STORERKEY)
  references SKU (SKU, STORERKEY);
alter table XDOCKDETAIL
  add foreign key (STORERKEY)
  references STORER (STORERKEY);
create unique index XDOCK_300 on XDOCKDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table XORDERDETAIL
prompt ===========================
prompt
create table XORDERDETAIL
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  ORDERKEY        VARCHAR2(20) not null,
  ORDERLINENUMBER VARCHAR2(5) not null,
  STORERKEY       VARCHAR2(15) not null,
  SKU             VARCHAR2(50) not null,
  ORIGINALQTY     NUMBER(22,5) not null,
  SHIPPEDQTY      NUMBER(22,5) not null,
  OPENQTY         NUMBER(22,5) not null,
  PROCESSEDQTY    NUMBER(22,5) not null,
  STATUS          VARCHAR2(10) default '02' not null,
  QTYTOPROCESS    NUMBER(22,5) not null,
  SEQUENCE        NUMBER(18) not null,
  BASEORDERKEY    VARCHAR2(10),
  CONVERTEDQTY    NUMBER(22,5),
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table XORDERDETAIL
  add constraint PK_SYS_C004815 primary key (ORDERKEY, ORDERLINENUMBER)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_XORDERDETAIL_STORERSKU on XORDERDETAIL (STORERKEY, SKU)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index XORDE_301 on XORDERDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table XORDERS
prompt ======================
prompt
create table XORDERS
(
  SERIALKEY      NUMBER not null,
  WHSEID         VARCHAR2(30) default USER,
  ORDERKEY       VARCHAR2(20) not null,
  EXTERNORDERKEY VARCHAR2(30) default ' ',
  ORDERTYPE      VARCHAR2(10) not null,
  STORERKEY      VARCHAR2(15) not null,
  POKEY          VARCHAR2(18) not null,
  STATUS         VARCHAR2(10) default '02' not null,
  LOADID         VARCHAR2(18),
  ROUTE          VARCHAR2(10) default ' ',
  DOOR           VARCHAR2(10),
  STOP           VARCHAR2(10) default ' ',
  EXTERNALLOADID VARCHAR2(20) default ' ',
  DELIVERYDATE   DATE default SYSDATE not null,
  OHTYPE         VARCHAR2(10) default '1',
  VEHICLECARRIER VARCHAR2(30),
  APPORTION      VARCHAR2(1) default '0',
  ADDDATE        DATE default SYSDATE not null,
  ADDWHO         VARCHAR2(30) default USER not null,
  EDITDATE       DATE default SYSDATE not null,
  EDITWHO        VARCHAR2(30) default USER not null,
  CONSIGNEEKEY   VARCHAR2(15)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table XORDERS
  add constraint PK_SYS_C004816 primary key (ORDERKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_XORDERS_POKEY on XORDERS (POKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index XORDE_302 on XORDERS (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table XPICKDETAIL
prompt ==========================
prompt
create table XPICKDETAIL
(
  SERIALKEY       NUMBER not null,
  WHSEID          VARCHAR2(30) default USER,
  PICKDETAILKEY   VARCHAR2(18) not null,
  CASEID          VARCHAR2(20) default ' ' not null,
  PICKHEADERKEY   VARCHAR2(18) default ' ' not null,
  ORDERKEY        VARCHAR2(10) not null,
  ORDERLINENUMBER VARCHAR2(5) not null,
  LOT             VARCHAR2(10) not null,
  STORERKEY       VARCHAR2(15) not null,
  SKU             VARCHAR2(50) not null,
  ALTSKU          VARCHAR2(50) default ' ' not null,
  UOM             VARCHAR2(10) default ' ' not null,
  UOMQTY          NUMBER(22,5) default 0 not null,
  QTY             NUMBER(22,5) default 0 not null,
  QTYMOVED        NUMBER(22,5) default 0 not null,
  STATUS          VARCHAR2(10) default '0' not null,
  DROPID          VARCHAR2(18) default ' ' not null,
  LOC             VARCHAR2(10) default 'UNKNOWN' not null,
  ID              VARCHAR2(18) not null,
  REFID           VARCHAR2(18) not null,
  PACKKEY         VARCHAR2(50) default ' ' not null,
  UPDATESOURCE    VARCHAR2(10) default '0' not null,
  CARTONGROUP     VARCHAR2(10),
  CARTONTYPE      VARCHAR2(10),
  TOLOC           VARCHAR2(10) default ' ',
  DOREPLENISH     VARCHAR2(1) default 'N',
  REPLENISHZONE   VARCHAR2(10) default ' ',
  DOCARTONIZE     VARCHAR2(1) default 'N',
  PICKMETHOD      VARCHAR2(1) default ' ' not null,
  WAVEKEY         VARCHAR2(10) default ' ' not null,
  EFFECTIVEDATE   DATE default SYSDATE not null,
  FORTE_FLAG      VARCHAR2(6) default 'I' not null,
  ADDDATE         DATE default SYSDATE not null,
  ADDWHO          VARCHAR2(30) default USER not null,
  EDITDATE        DATE default SYSDATE not null,
  EDITWHO         VARCHAR2(30) default USER not null,
  OPTIMIZECOP     VARCHAR2(1),
  LOADID          NUMBER(10),
  STOP            NUMBER(10),
  DOOR            VARCHAR2(18),
  ROUTE           VARCHAR2(18)
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table XPICKDETAIL
  add constraint PK_SYS_C004817 primary key (PICKDETAILKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_XPICKDETAIL_CASEID on XPICKDETAIL (CASEID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_XPICKDETAIL_DROPID on XPICKDETAIL (DROPID)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index IDX_XPICKDETAIL_ORDERKEY on XPICKDETAIL (ORDERKEY, ORDERLINENUMBER)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index XPICK_303 on XPICKDETAIL (SERIALKEY)
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table XSOGROUP
prompt =======================
prompt
create table XSOGROUP
(
  XSOGROUPKEY  VARCHAR2(11) not null,
  ARRIVE_DATE  DATE,
  TYPE         VARCHAR2(2),
  FROM_STATION VARCHAR2(15) not null,
  FROM_VENDOR  VARCHAR2(15),
  CARRIER_NO   VARCHAR2(15),
  SHIP_NO      VARCHAR2(20),
  FLAG         VARCHAR2(10),
  EXPECT_QTY   INTEGER,
  RECEIVE_QTY  INTEGER,
  ERROR_FLAG   VARCHAR2(10),
  ERROR_QTY    INTEGER,
  TRANSPORT    VARCHAR2(10),
  SHIP_TYPE    VARCHAR2(10),
  SHIP_USER    VARCHAR2(18),
  SHIP_DATE    DATE,
  RECEIVE_USER VARCHAR2(18),
  RECEIVE_DATE DATE,
  SEND_USER    VARCHAR2(18),
  SEND_DATE    DATE,
  NOTE         VARCHAR2(50) default SYSDATE,
  GROUPKEY     VARCHAR2(10) default USER,
  STATUS       VARCHAR2(10),
  ADDDATE      DATE default SYSDATE,
  ADDWHO       VARCHAR2(18) default USER,
  EDITDATE     DATE default SYSDATE,
  EDITWHO      VARCHAR2(18) default USER
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table XSOGROUP
  add constraint PK_XSOGROUP primary key (XSOGROUPKEY)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1224K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table XSOGROUPDETAIL
prompt =============================
prompt
create table XSOGROUPDETAIL
(
  XSOGROUPKEY VARCHAR2(11) not null,
  LINENO      VARCHAR2(5) not null,
  LOC         VARCHAR2(10),
  QTY         INTEGER,
  INPUT_USER  VARCHAR2(18),
  INPUT_DATE  DATE default SYSDATE,
  NOTE        VARCHAR2(50),
  PONO        VARCHAR2(20),
  POKEY       VARCHAR2(10),
  ADDDATE     DATE default SYSDATE,
  ADDWHO      VARCHAR2(18) default USER,
  EDITDATE    DATE default SYSDATE,
  EDITWHO     VARCHAR2(18) default USER
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table XSOGROUPDETAIL
  add constraint PK_XSOGROUPDETAIL primary key (XSOGROUPKEY, LINENO)
  using index 
  tablespace WH1_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1224K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table XSO_CASEDETAIL
prompt =============================
prompt
create table XSO_CASEDETAIL
(
  FROMWHO    VARCHAR2(10) default 'WES',
  FROMTYPE   VARCHAR2(10),
  BATCHNO    VARCHAR2(20),
  REGISTER   VARCHAR2(10) not null,
  STORERKEY  VARCHAR2(10) not null,
  WH         VARCHAR2(10) default 'WH1',
  BOXNO      VARCHAR2(10) not null,
  CASEID     VARCHAR2(20) not null,
  CASELINENO VARCHAR2(5) not null,
  TYPE       NUMBER(2) not null,
  XSO_NUMBER VARCHAR2(10),
  SEQ        VARCHAR2(5),
  SKU        VARCHAR2(20) not null,
  DESCR      VARCHAR2(60),
  PACKQTY    NUMBER not null,
  PRICE      NUMBER(18,4) default 0,
  DISCOUNT   NUMBER(18,4) default 100,
  MY         NUMBER(18,4) default 0,
  STATUS     VARCHAR2(2),
  DONE       VARCHAR2(1),
  CONSK      VARCHAR2(15),
  EXPORTNO   VARCHAR2(10),
  LOC        VARCHAR2(10),
  SHORTNAME  VARCHAR2(20),
  CAT        VARCHAR2(10),
  CATNAME    VARCHAR2(20),
  SUSR1      VARCHAR2(30),
  SUSR2      VARCHAR2(30),
  SUSR3      VARCHAR2(30),
  SUSR4      VARCHAR2(30),
  SUSR5      VARCHAR2(30),
  ADDDATE    DATE default SYSDATE not null,
  ADDWHO     VARCHAR2(18) default USER not null,
  EDITDATE   DATE default SYSDATE not null,
  EDITWHO    VARCHAR2(18) default USER not null,
  XSO_DATE   DATE default SYSDATE not null,
  XSO_USER   VARCHAR2(18) default USER not null
)
tablespace WH1_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column XSO_CASEDETAIL.FROMWHO
  is '数据来源';
comment on column XSO_CASEDETAIL.FROMTYPE
  is 'Wms主配时（PICK/SOW）';
comment on column XSO_CASEDETAIL.BATCHNO
  is '分拣机批次号';
comment on column XSO_CASEDETAIL.REGISTER
  is '到货登记号';
comment on column XSO_CASEDETAIL.STORERKEY
  is '货主码';
comment on column XSO_CASEDETAIL.WH
  is '仓别号:仓库1(WH1)';
comment on column XSO_CASEDETAIL.BOXNO
  is '箱号';
comment on column XSO_CASEDETAIL.CASEID
  is '系统箱号';
comment on column XSO_CASEDETAIL.CASELINENO
  is '系统箱明细序号';
comment on column XSO_CASEDETAIL.TYPE
  is '原始任务单据类型0=主配1=客退';
comment on column XSO_CASEDETAIL.XSO_NUMBER
  is '主配:任务单号退货:退货单号';
comment on column XSO_CASEDETAIL.SEQ
  is '任务单序号,对应主配明细中的SEQ';
comment on column XSO_CASEDETAIL.SKU
  is '商品内码: 必须事先已存在在接口的数据中';
comment on column XSO_CASEDETAIL.DESCR
  is '品名';
comment on column XSO_CASEDETAIL.PACKQTY
  is '此箱中此商品对应SEQ的数量';
comment on column XSO_CASEDETAIL.PRICE
  is '商品价格';
comment on column XSO_CASEDETAIL.DISCOUNT
  is '商品折扣';
comment on column XSO_CASEDETAIL.MY
  is '码洋';
comment on column XSO_CASEDETAIL.CONSK
  is '发货对象代码(门店号或供应商号或走道)';
comment on column XSO_CASEDETAIL.EXPORTNO
  is '流水线出口';
comment on column XSO_CASEDETAIL.LOC
  is '储位';
comment on column XSO_CASEDETAIL.SHORTNAME
  is '发货对象简称';
comment on column XSO_CASEDETAIL.CAT
  is '柜组合代码';
comment on column XSO_CASEDETAIL.CATNAME
  is '柜组合名称';
comment on column XSO_CASEDETAIL.SUSR1
  is '扩展字段';
comment on column XSO_CASEDETAIL.ADDDATE
  is '新增时间';
comment on column XSO_CASEDETAIL.ADDWHO
  is '新增人';
comment on column XSO_CASEDETAIL.EDITDATE
  is '修改时间';
comment on column XSO_CASEDETAIL.EDITWHO
  is '修改人';
comment on column XSO_CASEDETAIL.XSO_DATE
  is '主配时间';
comment on column XSO_CASEDETAIL.XSO_USER
  is '主配（摘果/播种人';
alter table XSO_CASEDETAIL
  add constraint PK_XSO_CASEDETAIL primary key (CASEID, CASELINENO)
  using index 
  tablespace WH1_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence ACC_1_SEQ
prompt ===========================
prompt
create sequence ACC_1_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence ACC_2_SEQ
prompt ===========================
prompt
create sequence ACC_2_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence ACC_3_SEQ
prompt ===========================
prompt
create sequence ACC_3_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ADD_4_SEQ
prompt ===========================
prompt
create sequence ADD_4_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ADJ_5_SEQ
prompt ===========================
prompt
create sequence ADJ_5_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ADJ_6_SEQ
prompt ===========================
prompt
create sequence ADJ_6_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ADJ_7_SEQ
prompt ===========================
prompt
create sequence ADJ_7_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ADJ_8_SEQ
prompt ===========================
prompt
create sequence ADJ_8_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ALE_9_SEQ
prompt ===========================
prompt
create sequence ALE_9_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ALL_10_SEQ
prompt ============================
prompt
create sequence ALL_10_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence ALL_11_SEQ
prompt ============================
prompt
create sequence ALL_11_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence ALT_12_SEQ
prompt ============================
prompt
create sequence ALT_12_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence APP_13_SEQ
prompt ============================
prompt
create sequence APP_13_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence APP_14_SEQ
prompt ============================
prompt
create sequence APP_14_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence APP_15_SEQ
prompt ============================
prompt
create sequence APP_15_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence APP_16_SEQ
prompt ============================
prompt
create sequence APP_16_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence APP_17_SEQ
prompt ============================
prompt
create sequence APP_17_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence APP_18_SEQ
prompt ============================
prompt
create sequence APP_18_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence APP_19_SEQ
prompt ============================
prompt
create sequence APP_19_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence APP_20_SEQ
prompt ============================
prompt
create sequence APP_20_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence APP_21_SEQ
prompt ============================
prompt
create sequence APP_21_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence APP_22_SEQ
prompt ============================
prompt
create sequence APP_22_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence APP_23_SEQ
prompt ============================
prompt
create sequence APP_23_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence APP_24_SEQ
prompt ============================
prompt
create sequence APP_24_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ARC_25_SEQ
prompt ============================
prompt
create sequence ARC_25_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence ARC_26_SEQ
prompt ============================
prompt
create sequence ARC_26_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ARC_27_SEQ
prompt ============================
prompt
create sequence ARC_27_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ARC_28_SEQ
prompt ============================
prompt
create sequence ARC_28_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence ARC_29_SEQ
prompt ============================
prompt
create sequence ARC_29_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence ARC_30_SEQ
prompt ============================
prompt
create sequence ARC_30_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence ARC_31_SEQ
prompt ============================
prompt
create sequence ARC_31_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence ARC_32_SEQ
prompt ============================
prompt
create sequence ARC_32_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence ARE_312_SEQ
prompt =============================
prompt
create sequence ARE_312_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence ARE_33_SEQ
prompt ============================
prompt
create sequence ARE_33_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence BAR_34_SEQ
prompt ============================
prompt
create sequence BAR_34_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BAR_35_SEQ
prompt ============================
prompt
create sequence BAR_35_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BAT_36_SEQ
prompt ============================
prompt
create sequence BAT_36_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence BAT_37_SEQ
prompt ============================
prompt
create sequence BAT_37_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BIL_38_SEQ
prompt ============================
prompt
create sequence BIL_38_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BIL_39_SEQ
prompt ============================
prompt
create sequence BIL_39_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BIL_40_SEQ
prompt ============================
prompt
create sequence BIL_40_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BIL_41_SEQ
prompt ============================
prompt
create sequence BIL_41_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BIL_42_SEQ
prompt ============================
prompt
create sequence BIL_42_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BIL_43_SEQ
prompt ============================
prompt
create sequence BIL_43_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BIL_44_SEQ
prompt ============================
prompt
create sequence BIL_44_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BIL_45_SEQ
prompt ============================
prompt
create sequence BIL_45_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BIL_46_SEQ
prompt ============================
prompt
create sequence BIL_46_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BIL_47_SEQ
prompt ============================
prompt
create sequence BIL_47_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BIL_48_SEQ
prompt ============================
prompt
create sequence BIL_48_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BIL_49_SEQ
prompt ============================
prompt
create sequence BIL_49_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BIL_50_SEQ
prompt ============================
prompt
create sequence BIL_50_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BOM_51_SEQ
prompt ============================
prompt
create sequence BOM_51_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BOM_52_SEQ
prompt ============================
prompt
create sequence BOM_52_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BOM_53_SEQ
prompt ============================
prompt
create sequence BOM_53_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BOM_54_SEQ
prompt ============================
prompt
create sequence BOM_54_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence BOX_001_SEQ
prompt =============================
prompt
create sequence BOX_001_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 921
increment by 1
cache 20;

prompt
prompt Creating sequence CAL_55_SEQ
prompt ============================
prompt
create sequence CAL_55_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CAL_56_SEQ
prompt ============================
prompt
create sequence CAL_56_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CAR_57_SEQ
prompt ============================
prompt
create sequence CAR_57_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence CASE_BATCHNO
prompt ==============================
prompt
create sequence CASE_BATCHNO
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CAS_58_SEQ
prompt ============================
prompt
create sequence CAS_58_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CCA_307_SEQ
prompt =============================
prompt
create sequence CCA_307_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence CCD_60_SEQ
prompt ============================
prompt
create sequence CCD_60_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CCG_61_SEQ
prompt ============================
prompt
create sequence CCG_61_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence CCL_62_SEQ
prompt ============================
prompt
create sequence CCL_62_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CCR_308_SEQ
prompt =============================
prompt
create sequence CCR_308_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CCS_63_SEQ
prompt ============================
prompt
create sequence CCS_63_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CC_59_SEQ
prompt ===========================
prompt
create sequence CC_59_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CHA_64_SEQ
prompt ============================
prompt
create sequence CHA_64_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence CHE_65_SEQ
prompt ============================
prompt
create sequence CHE_65_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CLASSTOZONE_001_SEQ
prompt =====================================
prompt
create sequence CLASSTOZONE_001_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence CLP_66_SEQ
prompt ============================
prompt
create sequence CLP_66_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CLP_67_SEQ
prompt ============================
prompt
create sequence CLP_67_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence COD_69_SEQ
prompt ============================
prompt
create sequence COD_69_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence COD_70_SEQ
prompt ============================
prompt
create sequence COD_70_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 301
increment by 1
cache 20;

prompt
prompt Creating sequence COD_71_SEQ
prompt ============================
prompt
create sequence COD_71_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1661
increment by 1
cache 20;

prompt
prompt Creating sequence CON_72_SEQ
prompt ============================
prompt
create sequence CON_72_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence CON_73_SEQ
prompt ============================
prompt
create sequence CON_73_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence CON_74_SEQ
prompt ============================
prompt
create sequence CON_74_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CON_75_SEQ
prompt ============================
prompt
create sequence CON_75_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CON_76_SEQ
prompt ============================
prompt
create sequence CON_76_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CON_77_SEQ
prompt ============================
prompt
create sequence CON_77_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CO_68_SEQ
prompt ===========================
prompt
create sequence CO_68_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DC_78_SEQ
prompt ===========================
prompt
create sequence DC_78_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DC__79_SEQ
prompt ============================
prompt
create sequence DC__79_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DEM_80_SEQ
prompt ============================
prompt
create sequence DEM_80_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DOC_81_SEQ
prompt ============================
prompt
create sequence DOC_81_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DOC_82_SEQ
prompt ============================
prompt
create sequence DOC_82_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DOC_83_SEQ
prompt ============================
prompt
create sequence DOC_83_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DOO_84_SEQ
prompt ============================
prompt
create sequence DOO_84_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DOO_85_SEQ
prompt ============================
prompt
create sequence DOO_85_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DOO_86_SEQ
prompt ============================
prompt
create sequence DOO_86_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DOO_87_SEQ
prompt ============================
prompt
create sequence DOO_87_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DOO_88_SEQ
prompt ============================
prompt
create sequence DOO_88_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DOO_89_SEQ
prompt ============================
prompt
create sequence DOO_89_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DRO_90_SEQ
prompt ============================
prompt
create sequence DRO_90_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence DRO_91_SEQ
prompt ============================
prompt
create sequence DRO_91_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ECS_92_SEQ
prompt ============================
prompt
create sequence ECS_92_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence EDI_93_SEQ
prompt ============================
prompt
create sequence EDI_93_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence EQP_94_SEQ
prompt ============================
prompt
create sequence EQP_94_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence EQP_95_SEQ
prompt ============================
prompt
create sequence EQP_95_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence EQU_96_SEQ
prompt ============================
prompt
create sequence EQU_96_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence ERR_97_SEQ
prompt ============================
prompt
create sequence ERR_97_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence EXE_98_SEQ
prompt ============================
prompt
create sequence EXE_98_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence FAC_99_SEQ
prompt ============================
prompt
create sequence FAC_99_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence FOR_100_SEQ
prompt =============================
prompt
create sequence FOR_100_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence FXR_101_SEQ
prompt =============================
prompt
create sequence FXR_101_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence GAT_102_SEQ
prompt =============================
prompt
create sequence GAT_102_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence GLD_103_SEQ
prompt =============================
prompt
create sequence GLD_103_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence GLD_104_SEQ
prompt =============================
prompt
create sequence GLD_104_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence GLO_105_SEQ
prompt =============================
prompt
create sequence GLO_105_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence GLO_106_SEQ
prompt =============================
prompt
create sequence GLO_106_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence GLO_107_SEQ
prompt =============================
prompt
create sequence GLO_107_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence GRA_108_SEQ
prompt =============================
prompt
create sequence GRA_108_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence HAZ_109_SEQ
prompt =============================
prompt
create sequence HAZ_109_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence HAZ_110_SEQ
prompt =============================
prompt
create sequence HAZ_110_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence HAZ_111_SEQ
prompt =============================
prompt
create sequence HAZ_111_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence HEL_112_SEQ
prompt =============================
prompt
create sequence HEL_112_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 2981
increment by 1
cache 20;

prompt
prompt Creating sequence HIE_113_SEQ
prompt =============================
prompt
create sequence HIE_113_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence HOU_114_SEQ
prompt =============================
prompt
create sequence HOU_114_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence HOU_115_SEQ
prompt =============================
prompt
create sequence HOU_115_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence IAC_311_SEQ
prompt =============================
prompt
create sequence IAC_311_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence IDS_117_SEQ
prompt =============================
prompt
create sequence IDS_117_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ID_116_SEQ
prompt ============================
prompt
create sequence ID_116_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence IMP_PUTAWAYZONE_252_SEQ
prompt =========================================
prompt
create sequence IMP_PUTAWAYZONE_252_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 141
increment by 1
cache 20;

prompt
prompt Creating sequence INT_118_SEQ
prompt =============================
prompt
create sequence INT_118_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence INT_119_SEQ
prompt =============================
prompt
create sequence INT_119_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence INV_120_SEQ
prompt =============================
prompt
create sequence INV_120_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence INV_305_SEQ
prompt =============================
prompt
create sequence INV_305_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence IPS_306_SEQ
prompt =============================
prompt
create sequence IPS_306_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ITR_121_SEQ
prompt =============================
prompt
create sequence ITR_121_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ITR_122_SEQ
prompt =============================
prompt
create sequence ITR_122_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence JXR_SERIALKEY
prompt ===============================
prompt
create sequence JXR_SERIALKEY
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LAB_123_SEQ
prompt =============================
prompt
create sequence LAB_123_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence LAB_124_SEQ
prompt =============================
prompt
create sequence LAB_124_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence LAB_125_SEQ
prompt =============================
prompt
create sequence LAB_125_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence LAN_126_SEQ
prompt =============================
prompt
create sequence LAN_126_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LCD_777_SEQ
prompt =============================
prompt
create sequence LCD_777_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOA_127_SEQ
prompt =============================
prompt
create sequence LOA_127_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOA_128_SEQ
prompt =============================
prompt
create sequence LOA_128_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOA_129_SEQ
prompt =============================
prompt
create sequence LOA_129_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOA_130_SEQ
prompt =============================
prompt
create sequence LOA_130_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOA_131_SEQ
prompt =============================
prompt
create sequence LOA_131_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOA_132_SEQ
prompt =============================
prompt
create sequence LOA_132_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOA_133_SEQ
prompt =============================
prompt
create sequence LOA_133_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOA_134_SEQ
prompt =============================
prompt
create sequence LOA_134_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOA_135_SEQ
prompt =============================
prompt
create sequence LOA_135_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence LOC_136_SEQ
prompt =============================
prompt
create sequence LOC_136_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 14581
increment by 1
cache 20;

prompt
prompt Creating sequence LOT_137_SEQ
prompt =============================
prompt
create sequence LOT_137_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOT_138_SEQ
prompt =============================
prompt
create sequence LOT_138_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOT_139_SEQ
prompt =============================
prompt
create sequence LOT_139_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOT_140_SEQ
prompt =============================
prompt
create sequence LOT_140_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence LOT_141_SEQ
prompt =============================
prompt
create sequence LOT_141_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence LOT_142_SEQ
prompt =============================
prompt
create sequence LOT_142_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOT_143_SEQ
prompt =============================
prompt
create sequence LOT_143_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOT_144_SEQ
prompt =============================
prompt
create sequence LOT_144_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LOT_145_SEQ
prompt =============================
prompt
create sequence LOT_145_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LPN_146_SEQ
prompt =============================
prompt
create sequence LPN_146_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence MAS_147_SEQ
prompt =============================
prompt
create sequence MAS_147_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence MAS_148_SEQ
prompt =============================
prompt
create sequence MAS_148_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence MAS_149_SEQ
prompt =============================
prompt
create sequence MAS_149_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence MAS_150_SEQ
prompt =============================
prompt
create sequence MAS_150_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence MBO_151_SEQ
prompt =============================
prompt
create sequence MBO_151_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence MBO_152_SEQ
prompt =============================
prompt
create sequence MBO_152_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence NCO_153_SEQ
prompt =============================
prompt
create sequence NCO_153_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 81
increment by 1
cache 20;

prompt
prompt Creating sequence NSQ_154_SEQ
prompt =============================
prompt
create sequence NSQ_154_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence OPE_155_SEQ
prompt =============================
prompt
create sequence OPE_155_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence OPP_156_SEQ
prompt =============================
prompt
create sequence OPP_156_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence OPP_157_SEQ
prompt =============================
prompt
create sequence OPP_157_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence OPS_158_SEQ
prompt =============================
prompt
create sequence OPS_158_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence OPS_159_SEQ
prompt =============================
prompt
create sequence OPS_159_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence OPT_160_SEQ
prompt =============================
prompt
create sequence OPT_160_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence OPX_161_SEQ
prompt =============================
prompt
create sequence OPX_161_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence OPX_162_SEQ
prompt =============================
prompt
create sequence OPX_162_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence OP__163_SEQ
prompt =============================
prompt
create sequence OP__163_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence OP__164_SEQ
prompt =============================
prompt
create sequence OP__164_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence OP__165_SEQ
prompt =============================
prompt
create sequence OP__165_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence OP__166_SEQ
prompt =============================
prompt
create sequence OP__166_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence OP__167_SEQ
prompt =============================
prompt
create sequence OP__167_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence OP__168_SEQ
prompt =============================
prompt
create sequence OP__168_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ORD_169_SEQ
prompt =============================
prompt
create sequence ORD_169_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ORD_170_SEQ
prompt =============================
prompt
create sequence ORD_170_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ORD_171_SEQ
prompt =============================
prompt
create sequence ORD_171_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ORD_172_SEQ
prompt =============================
prompt
create sequence ORD_172_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ORD_173_SEQ
prompt =============================
prompt
create sequence ORD_173_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence ORD_174_SEQ
prompt =============================
prompt
create sequence ORD_174_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ORD_175_SEQ
prompt =============================
prompt
create sequence ORD_175_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence ORD_176_SEQ
prompt =============================
prompt
create sequence ORD_176_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PAC_177_SEQ
prompt =============================
prompt
create sequence PAC_177_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 65561
increment by 1
cache 20;

prompt
prompt Creating sequence PAL_178_SEQ
prompt =============================
prompt
create sequence PAL_178_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PAL_179_SEQ
prompt =============================
prompt
create sequence PAL_179_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PAL_180_SEQ
prompt =============================
prompt
create sequence PAL_180_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PAT_181_SEQ
prompt =============================
prompt
create sequence PAT_181_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PAZ_182_SEQ
prompt =============================
prompt
create sequence PAZ_182_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PBS_183_SEQ
prompt =============================
prompt
create sequence PBS_183_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence PBS_184_SEQ
prompt =============================
prompt
create sequence PBS_184_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 541
increment by 1
cache 20;

prompt
prompt Creating sequence PBS_185_SEQ
prompt =============================
prompt
create sequence PBS_185_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 101
increment by 1
cache 20;

prompt
prompt Creating sequence PBS_186_SEQ
prompt =============================
prompt
create sequence PBS_186_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence PBS_187_SEQ
prompt =============================
prompt
create sequence PBS_187_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_188_SEQ
prompt =============================
prompt
create sequence PHY_188_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_189_SEQ
prompt =============================
prompt
create sequence PHY_189_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_190_SEQ
prompt =============================
prompt
create sequence PHY_190_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_191_SEQ
prompt =============================
prompt
create sequence PHY_191_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_192_SEQ
prompt =============================
prompt
create sequence PHY_192_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_193_SEQ
prompt =============================
prompt
create sequence PHY_193_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_194_SEQ
prompt =============================
prompt
create sequence PHY_194_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_195_SEQ
prompt =============================
prompt
create sequence PHY_195_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_196_SEQ
prompt =============================
prompt
create sequence PHY_196_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_197_SEQ
prompt =============================
prompt
create sequence PHY_197_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_198_SEQ
prompt =============================
prompt
create sequence PHY_198_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_199_SEQ
prompt =============================
prompt
create sequence PHY_199_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_200_SEQ
prompt =============================
prompt
create sequence PHY_200_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_201_SEQ
prompt =============================
prompt
create sequence PHY_201_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PHY_202_SEQ
prompt =============================
prompt
create sequence PHY_202_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PIC_203_SEQ
prompt =============================
prompt
create sequence PIC_203_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PIC_204_SEQ
prompt =============================
prompt
create sequence PIC_204_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PIC_205_SEQ
prompt =============================
prompt
create sequence PIC_205_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence POD_207_SEQ
prompt =============================
prompt
create sequence POD_207_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence POD_208_SEQ
prompt =============================
prompt
create sequence POD_208_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence POD_209_SEQ
prompt =============================
prompt
create sequence POD_209_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence POD_210_SEQ
prompt =============================
prompt
create sequence POD_210_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence POL_211_SEQ
prompt =============================
prompt
create sequence POL_211_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence POL_212_SEQ
prompt =============================
prompt
create sequence POL_212_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence POL_213_SEQ
prompt =============================
prompt
create sequence POL_213_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence POL_214_SEQ
prompt =============================
prompt
create sequence POL_214_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence POL_215_SEQ
prompt =============================
prompt
create sequence POL_215_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence POS_216_SEQ
prompt =============================
prompt
create sequence POS_216_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PO_206_SEQ
prompt ============================
prompt
create sequence PO_206_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PO__217_SEQ
prompt =============================
prompt
create sequence PO__217_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PRE_218_SEQ
prompt =============================
prompt
create sequence PRE_218_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PRE_219_SEQ
prompt =============================
prompt
create sequence PRE_219_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence PRE_220_SEQ
prompt =============================
prompt
create sequence PRE_220_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence PRE_RECEIVE_001_SEQ
prompt =====================================
prompt
create sequence PRE_RECEIVE_001_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 461
increment by 1
cache 20;

prompt
prompt Creating sequence PTR_221_SEQ
prompt =============================
prompt
create sequence PTR_221_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PTR_222_SEQ
prompt =============================
prompt
create sequence PTR_222_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PUT_223_SEQ
prompt =============================
prompt
create sequence PUT_223_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence PUT_224_SEQ
prompt =============================
prompt
create sequence PUT_224_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence PUT_225_SEQ
prompt =============================
prompt
create sequence PUT_225_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence REC_226_SEQ
prompt =============================
prompt
create sequence REC_226_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence REC_227_SEQ
prompt =============================
prompt
create sequence REC_227_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence REC_228_SEQ
prompt =============================
prompt
create sequence REC_228_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence REC_229_SEQ
prompt =============================
prompt
create sequence REC_229_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence REC_230_SEQ
prompt =============================
prompt
create sequence REC_230_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence REC_231_SEQ
prompt =============================
prompt
create sequence REC_231_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence REC_232_SEQ
prompt =============================
prompt
create sequence REC_232_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence REP_233_SEQ
prompt =============================
prompt
create sequence REP_233_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence REP_234_SEQ
prompt =============================
prompt
create sequence REP_234_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence RES_235_SEQ
prompt =============================
prompt
create sequence RES_235_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence RFD_236_SEQ
prompt =============================
prompt
create sequence RFD_236_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence RFL_237_SEQ
prompt =============================
prompt
create sequence RFL_237_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence ROU_238_SEQ
prompt =============================
prompt
create sequence ROU_238_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence ROU_239_SEQ
prompt =============================
prompt
create sequence ROU_239_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence RR__240_SEQ
prompt =============================
prompt
create sequence RR__240_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SCH_241_SEQ
prompt =============================
prompt
create sequence SCH_241_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEA_242_SEQ
prompt =============================
prompt
create sequence SEA_242_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEC_243_SEQ
prompt =============================
prompt
create sequence SEC_243_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_AUTO_PRINT
prompt ================================
prompt
create sequence SEQ_AUTO_PRINT
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CASEID
prompt ============================
prompt
create sequence SEQ_CASEID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PACKID
prompt ============================
prompt
create sequence SEQ_PACKID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PICKKEY
prompt =============================
prompt
create sequence SEQ_PICKKEY
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PICKNO
prompt ============================
prompt
create sequence SEQ_PICKNO
minvalue 1
maxvalue 999999999999999999999999999
start with 841
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TASKNO
prompt ============================
prompt
create sequence SEQ_TASKNO
minvalue 1
maxvalue 999999999999999999999999999
start with 100
increment by 1
cache 20;

prompt
prompt Creating sequence SER_244_SEQ
prompt =============================
prompt
create sequence SER_244_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SKU_245_SEQ
prompt =============================
prompt
create sequence SKU_245_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 67561
increment by 1
cache 20;

prompt
prompt Creating sequence SKU_246_SEQ
prompt =============================
prompt
create sequence SKU_246_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SKU_247_SEQ
prompt =============================
prompt
create sequence SKU_247_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SOR_248_SEQ
prompt =============================
prompt
create sequence SOR_248_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SOR_249_SEQ
prompt =============================
prompt
create sequence SOR_249_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence STA_250_SEQ
prompt =============================
prompt
create sequence STA_250_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence STA_251_SEQ
prompt =============================
prompt
create sequence STA_251_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence STO_252_SEQ
prompt =============================
prompt
create sequence STO_252_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 4361
increment by 1
cache 20;

prompt
prompt Creating sequence STO_253_SEQ
prompt =============================
prompt
create sequence STO_253_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence STO_254_SEQ
prompt =============================
prompt
create sequence STO_254_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence STO_255_SEQ
prompt =============================
prompt
create sequence STO_255_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence STR_256_SEQ
prompt =============================
prompt
create sequence STR_256_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence SUB_257_SEQ
prompt =============================
prompt
create sequence SUB_257_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SYS_258_SEQ
prompt =============================
prompt
create sequence SYS_258_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence TAR_259_SEQ
prompt =============================
prompt
create sequence TAR_259_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence TAR_260_SEQ
prompt =============================
prompt
create sequence TAR_260_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TAR_261_SEQ
prompt =============================
prompt
create sequence TAR_261_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TASK_SEQ
prompt ==========================
prompt
create sequence TASK_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TAS_262_SEQ
prompt =============================
prompt
create sequence TAS_262_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TAS_263_SEQ
prompt =============================
prompt
create sequence TAS_263_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence TAS_264_SEQ
prompt =============================
prompt
create sequence TAS_264_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TAS_265_SEQ
prompt =============================
prompt
create sequence TAS_265_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence TAS_266_SEQ
prompt =============================
prompt
create sequence TAS_266_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence TAX_267_SEQ
prompt =============================
prompt
create sequence TAX_267_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence TAX_268_SEQ
prompt =============================
prompt
create sequence TAX_268_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TAX_269_SEQ
prompt =============================
prompt
create sequence TAX_269_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TEM_270_SEQ
prompt =============================
prompt
create sequence TEM_270_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TRA_271_SEQ
prompt =============================
prompt
create sequence TRA_271_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TRA_272_SEQ
prompt =============================
prompt
create sequence TRA_272_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TRA_273_SEQ
prompt =============================
prompt
create sequence TRA_273_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TRA_274_SEQ
prompt =============================
prompt
create sequence TRA_274_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TRA_275_SEQ
prompt =============================
prompt
create sequence TRA_275_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TRA_276_SEQ
prompt =============================
prompt
create sequence TRA_276_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TRA_277_SEQ
prompt =============================
prompt
create sequence TRA_277_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TRA_278_SEQ
prompt =============================
prompt
create sequence TRA_278_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TRA_279_SEQ
prompt =============================
prompt
create sequence TRA_279_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TRA_280_SEQ
prompt =============================
prompt
create sequence TRA_280_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TRI_281_SEQ
prompt =============================
prompt
create sequence TRI_281_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TTM_282_SEQ
prompt =============================
prompt
create sequence TTM_282_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence TTM_283_SEQ
prompt =============================
prompt
create sequence TTM_283_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence UAT_310_SEQ
prompt =============================
prompt
create sequence UAT_310_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence USA_309_SEQ
prompt =============================
prompt
create sequence USA_309_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WAV_284_SEQ
prompt =============================
prompt
create sequence WAV_284_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WAV_285_SEQ
prompt =============================
prompt
create sequence WAV_285_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WAV_304_SEQ
prompt =============================
prompt
create sequence WAV_304_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WCS_BCW_001_SEQ
prompt =================================
prompt
create sequence WCS_BCW_001_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence WCT_286_SEQ
prompt =============================
prompt
create sequence WCT_286_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WHS_287_SEQ
prompt =============================
prompt
create sequence WHS_287_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WOG_288_SEQ
prompt =============================
prompt
create sequence WOG_288_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WOP_289_SEQ
prompt =============================
prompt
create sequence WOP_289_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WOR_290_SEQ
prompt =============================
prompt
create sequence WOR_290_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WOR_291_SEQ
prompt =============================
prompt
create sequence WOR_291_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WOR_292_SEQ
prompt =============================
prompt
create sequence WOR_292_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WPB_293_SEQ
prompt =============================
prompt
create sequence WPB_293_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WPB_294_SEQ
prompt =============================
prompt
create sequence WPB_294_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WPO_295_SEQ
prompt =============================
prompt
create sequence WPO_295_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WPO_296_SEQ
prompt =============================
prompt
create sequence WPO_296_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WPO_297_SEQ
prompt =============================
prompt
create sequence WPO_297_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence WPP_298_SEQ
prompt =============================
prompt
create sequence WPP_298_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence XDO_299_SEQ
prompt =============================
prompt
create sequence XDO_299_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence XDO_300_SEQ
prompt =============================
prompt
create sequence XDO_300_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence XOR_301_SEQ
prompt =============================
prompt
create sequence XOR_301_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence XOR_302_SEQ
prompt =============================
prompt
create sequence XOR_302_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence XPI_303_SEQ
prompt =============================
prompt
create sequence XPI_303_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating view DAQTYALLOCATED
prompt ============================
prompt
CREATE OR REPLACE VIEW DAQTYALLOCATED
(storerkey, sku, qtyallocated)
AS
SELECT demandallocation.storerkey,
    		demandallocation.sku,
		sum(demandallocation.QtyAllocated)
      FROM WH1.DEMANDALLOCATION
	 GROUP BY demandallocation.StorerKey,  demandallocation.Sku HAVING Sum(QtyAllocated) > 0
/

prompt
prompt Creating view SKUQTY
prompt ====================
prompt
CREATE OR REPLACE VIEW SKUQTY
(storerkey, sku, qty, sqtyallocated, qtypicked, available)
AS
SELECT SKUxLOC.StorerKey,
            SKUxLOC.Sku,
            Sum(SKUxLOC.Qty),
            Sum(SKUxLOC.QtyAllocated),
            Sum(SKUxLOC.QtyPicked),
            Sum(SKUxLOC.Qty-SKUxLOC.QtyAllocated-SKUxLOC.QtyPicked)
     FROM WH1.SKUxLOC
	GROUP BY SKUxLOC.StorerKey, SKUxLOC.Sku
/

prompt
prompt Creating view DAQTYALLOCATEDXSKUQTY
prompt ===================================
prompt
CREATE OR REPLACE VIEW DAQTYALLOCATEDXSKUQTY
(storerkey, sku, qty, qtyallocated, qtypicked, available)
AS
SELECT SKUQTY.storerkey,
    		 SKUQTY.sku,
		 SKUQTY.Qty,
		 (SKUQTY.SQTYALLOCATED+DAQTYALLOCATED.QtyAllocated),
		 SKUQTY.QtyPicked,
        	 (SKUQTY.AVAILABLE-DAQTYALLOCATED.QtyAllocated)
      FROM WH1.SKUQTY, WH1.DAQTYALLOCATED
     WHERE ( SKUQTY.STORERKEY = DAQTYALLOCATED.STORERKEY ) AND
        	 ( SKUQTY.SKU = DAQTYALLOCATED.SKU )
	ORDER BY SKUQTY.storerkey, SKUQTY.sku
/

prompt
prompt Creating view ENTTABLELIST
prompt ==========================
prompt
CREATE OR REPLACE VIEW ENTTABLELIST AS
(SELECT "SEQNO","ENTTABLENAME","KEY1","KEY2","KEY3","UPDATEALLCOLUMNS","UPDATECOLLIST","INCLUDEINUPDATE" FROM ssaadmin.ENTTABLELIST)
/

prompt
prompt Creating view IDXLOC
prompt ====================
prompt
CREATE OR REPLACE VIEW IDXLOC
(loc, id, qty)
AS
SELECT  LOTxLOCxID.Loc,
	LOTxLOCxID.Id,
	Sum(Qty)
FROM 	LOTxLOCxID
GROUP BY  LOTxLOCxID.Loc,LOTxLOCxID.Id HAVING Sum(Qty) > 0
/

prompt
prompt Creating view JOBS_SUM
prompt ======================
prompt
CREATE OR REPLACE VIEW JOBS_SUM
(dat, company, type, workgroup, qty, skuqty, eqty, amt, qty_f, skuqty_f, eqty_f, amt_f, qty_i, skuqty_i, eqty_i, amt_i)
AS
SELECT TO_CHAR(JX.ADDDATE,'YYYYMMDD') DAT,JX.DOC_COMPANY,JX.DOC_TYPE,JX.DOC_WORKGROUP,COUNT(DISTINCT JX.DOC_NUMBER) QTY,
 COUNT(DISTINCT DOC_SKU) SKUQTY ,sum(doc_eqty) eqty,sum(doc_amt) amt,0,0,0,0,0,0,0,0
FROM JOBS_XSO JX,JOBSCONTEXT_XSO JXDETAIL
WHERE JX.DOC_NUMBER=JXDETAIL.DOC_NUMBER
GROUP BY TO_CHAR(JX.ADDDATE,'YYYYMMDD'),JX.DOC_COMPANY,JX.DOC_TYPE,JX.DOC_WORKGROUP
UNION
SELECT TO_CHAR(JX.ADDDATE,'YYYYMMDD') DAT,JX.DOC_COMPANY,JX.DOC_TYPE,JX.DOC_WORKGROUP,0,0,0,0,
COUNT(DISTINCT JX.DOC_NUMBER) QTY, COUNT(DISTINCT DOC_SKU) SKUQTY ,sum(doc_eqty) eqty,sum(doc_amt) amt,
0,0,0,0
FROM JOBS_XSO JX,JOBSCONTEXT_XSO JXDETAIL
WHERE JX.DOC_NUMBER=JXDETAIL.DOC_NUMBER
 AND jx.doc_status >= '9'
GROUP BY TO_CHAR(JX.ADDDATE,'YYYYMMDD'),JX.DOC_COMPANY,JX.DOC_TYPE,JX.DOC_WORKGROUP
UNION
SELECT TO_CHAR(JX.ADDDATE,'YYYYMMDD') DAT,JX.DOC_COMPANY,JX.DOC_TYPE,JX.DOC_WORKGROUP,0,0,0,0,0,0,0,0,
COUNT(DISTINCT JX.DOC_NUMBER) QTY, COUNT(DISTINCT DOC_SKU) SKUQTY ,sum(doc_eqty) eqty,sum(doc_amt) amt
FROM JOBS_XSO JX,JOBSCONTEXT_XSO JXDETAIL
WHERE JX.DOC_NUMBER=JXDETAIL.DOC_NUMBER
 AND jx.doc_status in('4','5','8')
GROUP BY TO_CHAR(JX.ADDDATE,'YYYYMMDD'),JX.DOC_COMPANY,JX.DOC_TYPE,JX.DOC_WORKGROUP
/

prompt
prompt Creating view LOTAVAILABLE
prompt ==========================
prompt
CREATE OR REPLACE VIEW LOTAVAILABLE AS
SELECT 	StorerKey,
	Sku,
	Lot,
	(Qty - QtyAllocated - QtyPicked - QtyPreAllocated) QtyAvailable
FROM LOT
/

prompt
prompt Creating view LOTXID
prompt ====================
prompt
CREATE OR REPLACE VIEW LOTXID
(lot, id, qty)
AS
SELECT	LOTxLOCxID.Lot,
	LOTxLOCxID.Id,
	Sum(Qty)
FROM LOTxLOCxID
GROUP BY  LOTxLOCxID.Lot,LOTxLOCxID.Id HAVING Sum(Qty) > 0
/

prompt
prompt Creating view LOTXLOC
prompt =====================
prompt
CREATE OR REPLACE VIEW LOTXLOC
(lot, loc, storerkey, sku, qty)
AS
SELECT	LOTxLOCxID.Lot,
	LOTxLOCxID.Loc,
	LOTxLOCxID.Storerkey,
	LOTxLOCxID.Sku,
	Sum(Qty)
FROM 	LOTxLOCxID
GROUP BY  LOTxLOCxID.Lot,LOTxLOCxID.Loc,LOTxLOCxID.Storerkey,LOTxLOCxID.Sku HAVING Sum(Qty) > 0
/

prompt
prompt Creating view LOTXLOCXIDAVAILABLE
prompt =================================
prompt
CREATE OR REPLACE VIEW LOTXLOCXIDAVAILABLE AS
SELECT 	LLI.StorerKey,
	LLI.SKU,
	LLI.LOT,
	(SUM(LLI.Qty) - SUM(LLI.QtyAllocated) -  SUM(LLI.QtyPicked)) QtyAvailable
FROM	LOTXLOCXID LLI,
	LOC,
	LOT
WHERE 	LLI.Loc = LOC.LOC
AND  	LOC.LocationFlag <> 'HOLD'
AND     LOC.Locationflag <> 'DAMAGE'
AND     LOC.LocationType = 'OTHER'
AND    	LLI.LOT = LOT.LOT
GROUP BY LLI.LOT,LLI.StorerKey,LLI.SKU
/

prompt
prompt Creating view MESSAGE_ID
prompt ========================
prompt
CREATE OR REPLACE VIEW MESSAGE_ID AS
(SELECT "MSGID","MSGICON","MSGBUTTON","MSGDEFAULTBUTTON","MSGSEVERITY","MSGPRINT","MSGUSERINPUT","ADDDATE","ADDWHO","EDITDATE","EDITWHO" FROM ssaadmin.message_id)
/

prompt
prompt Creating view MESSAGE_TEXT
prompt ==========================
prompt
CREATE OR REPLACE VIEW MESSAGE_TEXT AS
(SELECT "MSGID","MSGLANGID","MSGTITLE","MSGTEXT","ADDDATE","ADDWHO","EDITDATE","EDITWHO" FROM ssaadmin.message_text)
/

prompt
prompt Creating view ORDERSEXP
prompt =======================
prompt
CREATE OR REPLACE VIEW ORDERSEXP AS
(
SELECT 	ORDERDETAIL.ORDERKEY,
	ORDERDETAIL.ORDERLINENUMBER,
	ORDERDETAIL.EXTERNORDERKEY,
	ORDERDETAIL.SKU,
	ORDERDETAIL.STORERKEY,
	ITRN.QTY,
	ORDERDETAIL.PACKKEY,
	ORDERDETAIL.UOM,
	TRANSMITLOG.TRANSMITLOGKEY,
	TRANSMITLOG.ADDDATE
FROM 	TRANSMITLOG,
	ITRN,
	ORDERDETAIL
WHERE  (TRANSMITLOG.TRANSMITFLAG = '0' OR TRANSMITLOG.TRANSMITFLAG = '5')
AND 	TRANSMITLOG.KEY1 = ITRN.ITRNKEY
AND 	LENGTH(ITRN.SOURCEKEY) > 4
AND 	SUBSTR(ITRN.SOURCEKEY,1,LENGTH(ITRN.SOURCEKEY)-5) = ORDERDETAIL.ORDERKEY
AND 	SUBSTR(ITRN.SOURCEKEY,LENGTH(ITRN.SOURCEKEY)-4,5) = ORDERDETAIL.ORDERLINENUMBER
AND 	ITRN.SOURCETYPE NOT LIKE '%NTRTRANS%'
AND 	ITRN.TRANTYPE='WD'
AND 	ORDERDETAIL.ORDERKEY IN (SELECT DISTINCT ORDERS.ORDERKEY
			    	 FROM 	ORDERS,
					ORDERDETAIL,
					PICKDETAIL
				 WHERE 	ORDERS.ORDERKEY = ORDERDETAIL.ORDERKEY
				 AND ORDERS.ORDERKEY = PICKDETAIL.ORDERKEY
				 AND ORDERDETAIL.ORDERLINENUMBER = PICKDETAIL.ORDERLINENUMBER ))
/

prompt
prompt Creating view QTYHOLD
prompt =====================
prompt
CREATE OR REPLACE VIEW QTYHOLD
(storerkey, sku, qty)
AS
SELECT STORERKEY, SKU, SUM(QTY) from (
    SELECT STORERKEY, SKU, sum(QTY) QTY
    FROM WH1.LOTXLOCXID
    WHERE LOTXLOCXID.STATUS = 'HOLD'
    GROUP BY STORERKEY, SKU
Union
    SELECT distinct STORERKEY,SKU, (QTY-QTY) QTY
    FROM WH1.LOTXLOCXID
    where LOTXLOCXID.STATUS <> 'HOLD')
    GROUP BY STORERKEY, SKU
/

prompt
prompt Creating view QTYHOLDXLOC
prompt =========================
prompt
CREATE OR REPLACE VIEW QTYHOLDXLOC
(storerkey, sku, qty, loc)
AS
SELECT STORERKEY, SKU, SUM(QTY), LOC
	from
    		(SELECT STORERKEY, SKU, sum(QTY) QTY, LOC
	    	FROM WH1.LOTXLOCXID
    		WHERE LOTXLOCXID.STATUS = 'HOLD'
    		GROUP BY STORERKEY, SKU , LOC
   	   UNION
     	SELECT distinct STORERKEY,SKU, (QTY-QTY) QTY , LOC
    		FROM WH1.LOTXLOCXID
    		where LOTXLOCXID.STATUS <> 'HOLD')
	GROUP BY STORERKEY, SKU, LOC
/

prompt
prompt Creating view RECEIPTEXP
prompt ========================
prompt
CREATE OR REPLACE VIEW RECEIPTEXP AS
(SELECT	RECEIPTDETAIL.POKEY,
	RECEIPTDETAIL.STORERKEY,
	RECEIPTDETAIL.SKU,
	ITRN.QTY,
	RECEIPT.RECEIPTDATE,
	RECEIPT.CARRIERNAME,
	TRANSMITLOG.TRANSMITLOGKEY,
	TRANSMITLOG.ADDDATE
FROM 	TRANSMITLOG,
	ITRN,
	RECEIPTdetail,
	PO,
	RECEIPT
WHERE  (TRANSMITLOG.TRANSMITFLAG = '0' OR TRANSMITLOG.TRANSMITFLAG = '5')
AND 	TRANSMITLOG.KEY1 = ITRN.ITRNKEY
AND 	LENGTH(ITRN.SOURCEKEY) > 4
AND 	SUBSTR(ITRN.SOURCEKEY,1,LENGTH(ITRN.SOURCEKEY)-5) = RECEIPTDETAIL.RECEIPTKEY
AND 	SUBSTR(ITRN.SOURCEKEY,LENGTH(ITRN.SOURCEKEY)-4,5) = RECEIPTDETAIL.RECEIPTLINENUMBER
AND 	ITRN.SOURCETYPE NOT LIKE '%NTRTRANS%'
AND 	ITRN.TRANTYPE='DP'
AND 	RECEIPTDETAIL.POKEY = PO.POKEY
AND 	RECEIPTDETAIL.RECEIPTKEY = RECEIPT.RECEIPTKEY)
/

prompt
prompt Creating view SKUINVENTORY
prompt ==========================
prompt
CREATE OR REPLACE VIEW SKUINVENTORY AS
SELECT LLI.storerkey,
       LLI.sku,
       sum(LLI.qty) qty,
       sum(DECODE(LLI.STATUS,'OK',0,LLI.qty)) qtyonhold,
       sum(LLI.QTYALLOCATED) qtyallocated,
       sum(LLI.QTYPICKED) qtypicked,
       sum(LLI.QTYEXPECTED) qtyexpected,
       sum(LLI.QTYPICKINPROCESS) qtypickinprocess,
       sum(LLI.PENDINGMOVEIN) pendingmovein,
       sum(LOT.QTYPREALLOCATED) qtypreallocated
FROM WH1.LOTxLOCxID LLI, WH1.LOT LOT
WHERE LLI.STORERKEY = LOT.STORERKEY
  AND LLI.SKU = LOT.SKU
  AND LLI.LOT = LOT.LOT
GROUP BY LLI.storerkey, LLI.sku
/

prompt
prompt Creating view VACTIVITYTYPE
prompt ===========================
prompt
CREATE OR REPLACE VIEW VACTIVITYTYPE
(type, description)
AS
SELECT WH1.CODELKUP.CODE, WH1.CODELKUP.DESCRIPTION FROM WH1.CODELKUP WHERE WH1.CODELKUP.LISTNAME = 'ACTIVTYPE'
UNION
SELECT WH1.INDIRECTACTIVITY.ACTIVITY, WH1.INDIRECTACTIVITY.DESCR FROM WH1.INDIRECTACTIVITY
/

prompt
prompt Creating view VINVPREVIEW
prompt =========================
prompt
CREATE OR REPLACE VIEW VINVPREVIEW AS
SELECT WH1.ACCUMULATEDCHARGES.AccumulatedChargesKey,
	 WH1.ACCUMULATEDCHARGES.ReferenceKey,
	 WH1.ACCUMULATEDCHARGES.Descrip,
         WH1.ACCUMULATEDCHARGES.Status,
         WH1.ACCUMULATEDCHARGES.PrintCount,
         WH1.ACCUMULATEDCHARGES.ServiceKey,
         WH1.ACCUMULATEDCHARGES.StorerKey,
         WH1.storer.Company,
         WH1.storer.Address1,
         WH1.storer.Address2,
         WH1.storer.Address3,
         WH1.storer.Address4,
         WH1.storer.City,
         WH1.storer.State,
         WH1.storer.Zip,
         WH1.storer.Country,
         WH1.ACCUMULATEDCHARGES.Sku,
	 WH1.SKU.Descr,
         WH1.ACCUMULATEDCHARGES.Lot,
         WH1.ACCUMULATEDCHARGES.UOMShow,
         WH1.ACCUMULATEDCHARGES.TariffKey,
         WH1.ACCUMULATEDCHARGES.TaxGroupKey,
         WH1.ACCUMULATEDCHARGES.Rate,
         WH1.ACCUMULATEDCHARGES.Base,
         WH1.ACCUMULATEDCHARGES.MasterUnits,
         WH1.ACCUMULATEDCHARGES.SystemGeneratedCharge,
         WH1.ACCUMULATEDCHARGES.Debit,
         WH1.ACCUMULATEDCHARGES.Credit,
         WH1.ACCUMULATEDCHARGES.BilledUnits,
         WH1.ACCUMULATEDCHARGES.ChargeType,
         WH1.ACCUMULATEDCHARGES.LineType,
         WH1.ACCUMULATEDCHARGES.BillFromDate,
         WH1.ACCUMULATEDCHARGES.BillThruDate,
         WH1.ACCUMULATEDCHARGES.SourceKey,
         WH1.ACCUMULATEDCHARGES.SourceType,
         WH1.ACCUMULATEDCHARGES.AccessorialDetailKey,
         WH1.ACCUMULATEDCHARGES.GLDistributionKey,
         WH1.ACCUMULATEDCHARGES.InvoiceBatch,
         WH1.ACCUMULATEDCHARGES.InvoiceKey,
         WH1.ACCUMULATEDCHARGES.TariffDetailKey,
  	 WH1.ACCUMULATEDCHARGES.CostRate,
	 WH1.ACCUMULATEDCHARGES.CostBase,
	 WH1.ACCUMULATEDCHARGES.CostMasterUnits,
	 WH1.ACCUMULATEDCHARGES.CostUOMShow,
	 WH1.ACCUMULATEDCHARGES.CostSystemGeneratedCharge,
	 WH1.ACCUMULATEDCHARGES.Cost,
	 WH1.ACCUMULATEDCHARGES.CostUnits
    FROM WH1.accumulatedCharges, WH1.SKU, WH1.STORER
    WHERE WH1.ACCUMULATEDCHARGES.StorerKey = WH1.SKU.StorerKey
    AND WH1.ACCUMULATEDCHARGES.SKU = WH1.SKU.SKU
    AND WH1.ACCUMULATEDCHARGES.StorerKey = WH1.STORER.StorerKey
    AND WH1.ACCUMULATEDCHARGES.STATUS BETWEEN '5' AND '9'
UNION
  SELECT WH1.ACCUMULATEDCHARGES.AccumulatedChargesKey,
   	 WH1.ACCUMULATEDCHARGES.ReferenceKey,
 	 WH1.ACCUMULATEDCHARGES.Descrip,
         WH1.ACCUMULATEDCHARGES.Status,
         WH1.ACCUMULATEDCHARGES.PrintCount,
         WH1.ACCUMULATEDCHARGES.ServiceKey,
         WH1.ACCUMULATEDCHARGES.StorerKey,
         WH1.storer.Company,
         WH1.storer.Address1,
         WH1.storer.Address2,
         WH1.storer.Address3,
         WH1.storer.Address4,
         WH1.storer.City,
         WH1.storer.State,
         WH1.storer.Zip,
         WH1.storer.Country,
         WH1.ACCUMULATEDCHARGES.Sku,
	 '',
	 WH1.ACCUMULATEDCHARGES.Lot,
         WH1.ACCUMULATEDCHARGES.UOMShow,
         WH1.ACCUMULATEDCHARGES.TariffKey,
         WH1.ACCUMULATEDCHARGES.TaxGroupKey,
         WH1.ACCUMULATEDCHARGES.Rate,
         WH1.ACCUMULATEDCHARGES.Base,
         WH1.ACCUMULATEDCHARGES.MasterUnits,
         WH1.ACCUMULATEDCHARGES.SystemGeneratedCharge,
         WH1.ACCUMULATEDCHARGES.Debit,
         WH1.ACCUMULATEDCHARGES.Credit,
         WH1.ACCUMULATEDCHARGES.BilledUnits,
         WH1.ACCUMULATEDCHARGES.ChargeType,
         WH1.ACCUMULATEDCHARGES.LineType,
         WH1.ACCUMULATEDCHARGES.BillFromDate,
         WH1.ACCUMULATEDCHARGES.BillThruDate,
         WH1.ACCUMULATEDCHARGES.SourceKey,
         WH1.ACCUMULATEDCHARGES.SourceType,
         WH1.ACCUMULATEDCHARGES.AccessorialDetailKey,
         WH1.ACCUMULATEDCHARGES.GLDistributionKey,
         WH1.ACCUMULATEDCHARGES.InvoiceBatch,
         WH1.ACCUMULATEDCHARGES.InvoiceKey,
         WH1.ACCUMULATEDCHARGES.TariffDetailKey,
  	 WH1.ACCUMULATEDCHARGES.CostRate,
	 WH1.ACCUMULATEDCHARGES.CostBase,
	 WH1.ACCUMULATEDCHARGES.CostMasterUnits,
	 WH1.ACCUMULATEDCHARGES.CostUOMShow,
	 WH1.ACCUMULATEDCHARGES.CostSystemGeneratedCharge,
	 WH1.ACCUMULATEDCHARGES.Cost,
	 WH1.ACCUMULATEDCHARGES.CostUnits
    FROM WH1.accumulatedCharges, WH1.STORER
    WHERE WH1.ACCUMULATEDCHARGES.StorerKey = WH1.STORER.StorerKey
    AND WH1.ACCUMULATEDCHARGES.SKU = ' '
    AND WH1.ACCUMULATEDCHARGES.STATUS BETWEEN '5' AND '9'
/

prompt
prompt Creating view VLOTEXPIRED
prompt =========================
prompt
create or replace view vlotexpired as
Select a.Lot LOT,
	'Expiration' CHECKBY,
	b.RotateBy ROTATEBY,
	(trunc(sysdate)+1+b.ShelfLife) DATEX,
	a.Lottable04 LOTTABLE04,
	a.Lottable05 LOTTABLE05,
	b.ShelfLife SHELFLIFE,
	c.Qty QTY,
	a.StorerKey STORERKEY,
	a.Sku SKU
From 	LOTATTRIBUTE a,
	SKU b,
	LOT c
Where 	a.lot = c.lot
and 	c.qty > 0
and 	(a.lottable04 is not null OR a.lottable05 is not null)
and 	a.storerkey = b.storerkey
and 	a.sku = b.sku
and 	b.shelflifeindicator = 'Y'
and 	b.ShelfLifeCodeType = 'E'
and 	((upper(b.rotateby) = 'LOTTABLE04'
and 	a.lottable04 is not null
and 	a.lottable04 < (trunc(sysdate)+1+b.ShelfLife) )     or (upper(b.rotateby) = 'LOTTABLE05'
and 	a.lottable05 is not null
and 	a.lottable05 < (trunc(sysdate)+1+b.ShelfLife) )     )
UNION--List of Expired product by Manufacturing Date
Select 	a.Lot,     'Manufactured',
	b.RotateBy,
	(trunc(sysdate)+1-b.ShelfLife),
	a.Lottable04,
	a.Lottable05,
	b.ShelfLife,
	c.Qty,
	a.StorerKey,
	a.Sku
From 	LOTATTRIBUTE a,
	SKU b,
	LOT c
Where 	a.lot = c.lot
and 	c.qty > 0
and 	(a.lottable04 is not null OR a.lottable05 is not null)
and 	a.storerkey = b.storerkey
and 	a.sku = b.sku
and 	b.ShelfLifeCodeType = 'M'
and 	b.shelflifeindicator = 'Y'
and 	b.shelflife > 0
and 	((upper(b.rotateby) = 'LOTTABLE04'
and 	a.lottable04 is not null
and 	a.lottable04 < (trunc(sysdate)-b.ShelfLife) )   or (upper(b.rotateby) = 'LOTTABLE05'
and 	a.lottable05 is not null
and 	a.lottable05 < (trunc(sysdate)-b.ShelfLife) ))
/

prompt
prompt Creating view VPICKDETAILPROCESSING
prompt ===================================
prompt
create or replace view vpickdetailprocessing as
select orderkey, orderlinenumber, count(*) PICKSTOTAL,
	sum(decode(a.status,'0',1,0)) NEW,
	sum(decode( (sign(a.status - 1)+1) * sign(length(wavekey)), 1, 1, 0 )) RELEASED,
	sum(decode(a.status, '2', 1, '3', 1, 0)) INPICKING,
	sum(decode(a.status, '5', 1, '6', 1, '7', 1, '8', 1, 0 )) PICKED,
	sum(decode(locationtype, 'PICKTO', 1, 0)) INPICKTO,
	sum(decode(dropid,' ',0,decode(sign(length(dropid)), 1, 1, 0))) PACKED,
	sum(decode(locationtype, 'STAGED', 1, 0))  INSTAGED,
	sum(decode(a.status, '8', 1, 0)) LOADED ,
	sum(decode(a.status, '9', 1, 0)) SHIPPED
from WH1.pickdetail a, WH1.loc b
where a.loc = b.loc
group by orderkey, orderlinenumber
UNION
select 	orderkey,
	orderlinenumber,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0
from WH1.orderdetail c
where 0 = (select count(*) from WH1.pickdetail
           where orderkey = c.orderkey and orderlinenumber = c.orderlinenumber)
/

prompt
prompt Creating view VORDERDETAILSTATUSCODE
prompt ====================================
prompt
create or replace view vorderdetailstatuscode
(orderkey, orderlinenumber, code, openqty, qtypreallocated, qtyallocated, qtypicked, shippedqty, qtysubstituted, pickstotal, picksreleased, picksinpicking, pickspicked, pickspacked, picksinstaged, picksloaded, picksshipped)
as
select  a.OrderKey,
	a.OrderLineNumber,
	decode( (sign(openqty)+sign(shippedqty))*sign(shippedqty),1,'95',      																--Shipped
	decode( (sign(openqty-qtypreallocated-qtyallocated) + sign(openqty) + sign(shippedqty))*sign(openqty)*sign(shippedqty),2,'92', 									--Part Shipped
	decode( (sign(Loaded-PicksTotal)+sign(Loaded))*sign(Loaded),1,'88', 																--Loaded
	decode( sign(Loaded),1,'82', 																					--PartLoaded
	decode( (sign(InStaged-PicksTotal)+sign(InStaged))*sign(InStaged),1,'75', 															--Staged
	decode( (sign(Packed-PicksTotal)+sign(Packed))*sign(Packed),1,'68', 																--PackComplete
	decode( sign(Packed),1,'61', 																					-- InPacking
	decode( sign(openqty)*sign(qtypicked)*sign(shippedqty)*(sign(openqty-qtypicked)+sign(openqty)+sign(qtypicked)+sign(shippedqty)),3,'57', 							--Picked/Part Shipped
	decode( sign(openqty)*sign(qtypicked)*(sign(openqty-qtypicked)+sign(shippedqty)+sign(openqty)+sign(qtypicked)),2,'55', 										--Picked
	decode( sign(openqty)*sign(qtyallocated)*sign(qtypicked)*sign(shippedqty)*(sign(openqty-qtyallocated-qtypicked)+sign(openqty)+sign(qtyallocated)+sign(qtypicked)+sign(shippedqty)),4,'53', 	--Part Picked/Part Shipped
	decode( sign(openqty)*sign(qtyallocated)*sign(qtypicked)*(sign(openqty-qtyallocated-qtypicked)+sign(openqty)+sign(qtyallocated)+sign(qtypicked)+sign(shippedqty)),3,'52', 			--Allocated/Part Picked
	decode( sign(InPicking),1,'51', 																				--InPicking
	decode( sign(openqty)*sign(Released)*(sign(openqty)+sign(openqty-qtyallocated)+sign(Released)+sign(qtypicked)+sign(shippedqty)),2,'19', 							--Released
	decode( sign(IsSubstitute)*(sign(openqty)+sign(IsSubstitute)+sign(qtypicked)+sign(shippedqty)),1,'18', 												--Substituted
	decode( sign(openqty)*(sign(openqty)+sign(openqty-qtyallocated)),1,'17', 															--Allocated
	decode( sign(openqty)*sign(openqty-qtyallocated)*sign(shippedqty)*(sign(openqty)+sign(openqty-qtyallocated)+sign(shippedqty)+sign(qtypicked)),3,'16', 						--Part Allocated/PartShipped
  	decode( sign(openqty)+sign(qtyallocated)+sign(qtypicked)+sign(openqty-qtyallocated-qtypicked),4,'15', 												-- PartAlloccated/PartPicked
  	decode( sign(openqty)*sign(qtyallocated)*sign(openqty-qtyallocated-qtypicked)*(sign(openqty)+sign(qtyallocated)+sign(openqty-qtyallocated-qtypicked)),3,'14', 					-- Part Alloccated
  	decode( sign(TO_NUMBER(WPReleased)),1,'13', 												--WPlanner released
  	decode( sign(openqty)*(sign(openqty)+sign(openqty-qtypreallocated)),1,'12', 															--Preallocated
  	decode( sign(openqty)+sign(qtypreallocated),2,'11', 																		--Part Preallocated
	decode( sign(openqty)*(sign(qtypreallocated+qtyallocated+qtypicked+shippedqty)+sign(openqty)),1,'09', 												--Not Started
	decode( sign(openqty+shippedqty),0,'95',                               																--Cancelled Internally (backordered and consider shipped in order to fire ship event)
	decode( sign(openqty-qtypreallocated-qtyallocated-qtypicked),-1,'-2',  																--OutOfSync
  		'-1')))))))))))))))))))))))) CODE,                                                              											--Unknown
	OpenQty,
	QtyPreallocated,
	QtyAllocated,
	QtyPicked,
	ShippedQty,
	IsSubstitute,
	PicksTotal,
	Released,
	InPicking,
	Picked,
	Packed,
	InStaged,
	Loaded,
	Shipped
from WH1.orderdetail a, WH1.vPickDetailProcessing b
where a.orderkey = b.orderkey
and a.orderlinenumber = b.orderlinenumber
/

prompt
prompt Creating view VORDERDETAILSTATUS
prompt ================================
prompt
create or replace view vorderdetailstatus
(orderkey, orderlinenumber, statuscode, statusdescription, loghistory, openqty, qtypreallocated, qtyallocated, qtypicked, shippedqty)
as
select orderkey,
	orderlinenumber,
	Code,
	description,
	detailhistoryflag,
	OpenQty,
	QtyPreallocated,
	QtyAllocated,
	QtyPicked,
	ShippedQty
from WH1.orderdetail a, WH1.orderstatussetup b
where b.code = (select decode(sign(to_number(max(code))-9),
			0, decode(sign(to_number(a.status)-2)+sign(to_number(a.status)-8),
				0, a.status, max(code)),
			max(code))
		from WH1.orderstatussetup
		where orderflag = '1' and detailflag = '1' and enabled = '1'
		and code <= (
			select code from WH1.vorderdetailstatuscode
			where orderkey = a.orderkey and orderlinenumber = a.orderlinenumber
			)
		)
/

prompt
prompt Creating view VORDERPROCESSINGSTATUS
prompt ====================================
prompt
create or replace view vorderprocessingstatus as
select orders.orderkey,
	decode((sign(sum(orderdetail.openqty))+sign(sum(shippedqty)))*sign(sum(shippedqty)),1,'Shipped',decode((sign(sum(orderdetail.openqty-qtypicked))+sign(sum(shippedqty)))*sign(sum(shippedqty)),1,'Picked/Part Shipped',decode(sign(sum(orderdetail.openqty))+sign(sum(qtypicked))+sign(sum(shippedqty))+sign(sum(orderdetail.openqty-qtypicked)),4,'Part Picked/Part Shipped',decode((sign(sum(orderdetail.openqty-qtyallocated))+sign(sum(shippedqty)))*sign(sum(shippedqty)),1,'Allocated/Part Shipped',decode(sign(sum(orderdetail.openqty-qtyallocated))+sign(sum(orderdetail.openqty))+sign(sum(qtyallocated))+sign(sum(shippedqty)),4,'Part Allocated/Part Shipped',decode(sign(sum(orderdetail.openqty))+sign(sum(shippedqty)),2,'Open/Part Shipped',decode(sign(sum(orderdetail.openqty-qtypicked))+sign(sum(orderdetail.openqty)),1,'Picked',decode((sign(sum(orderdetail.openqty-qtypreallocated-qtyallocated-qtypicked))+sign(sum(orderdetail.openqty))+sign(sum(qtyallocated)))*sign(sum(qtypicked)),2,'Allocated/Part Picked',decode(sign(sum(orderdetail.openqty-qtyallocated-qtypicked))+sign(sum(orderdetail.openqty))+sign(sum(qtyallocated))+sign(sum(qtypicked)),4,'Part Allocated/Part Picked',decode(sign(sum(orderdetail.openqty-qtyallocated))+sign(sum(orderdetail.openqty)),1,'Allocated',decode(sign(sum(orderdetail.openqty-qtyallocated))+sign(sum(orderdetail.openqty))+sign(sum(qtypreallocated))+sign(sum(qtyallocated)),4,'PreAllocated/Part Allocated',decode(sign(sum(orderdetail.openqty-qtyallocated))+sign(sum(orderdetail.openqty))+sign(sum(qtyallocated)),3,'Part Allocated',decode(sign(sum(orderdetail.openqty-qtypreallocated))+sign(sum(orderdetail.openqty)),1,'PreAllocated',decode(sign(sum(orderdetail.openqty-qtypreallocated))+sign(sum(orderdetail.openqty))+sign(sum(qtypreallocated)),3,'Part PreAllocated',decode((sign(sum(qtypreallocated+qtyallocated+qtypicked+shippedqty))+sign(sum(orderdetail.openqty)))*sign(sum(orderdetail.openqty)),1,'Has Not Started',decode(sign(sum(orderdetail.openqty+shippedqty)),0,'Empty order',decode(sign(sum(orderdetail.openqty-qtypreallocated-qtyallocated-qtypicked)),-1,'OutOfSync','Unknown'))))))))))))))))) STATUS,
	sum(originalqty) ORIGINALQTY,
	sum(orderdetail.openqty) OPENQTY,
	sum(qtypreallocated) QTYPREALLOCATED,
	sum(qtyallocated) QTYALLOCATED,
	sum(qtypicked) QTYPICKED,
	sum(shippedqty) SHIPPEDQTY,
	count(*) NDETAILS
FROM orders, orderdetail
WHERE orders.orderkey = orderdetail.orderkey (+)group by orders.orderkey
/

prompt
prompt Creating view VORDERSTATUS
prompt ==========================
prompt
create or replace view vorderstatus
(orderkey, statuscode, statusdescription, loghistory)
as
Select 	orderkey,
	code,
	description,
	headerhistoryflag
	from WH1.Orders a, WH1.Orderstatussetup b
where b.code = (select (case when (max(code) = '09' and a.status between '02' and '08')
				or (max(code) between '02' and '08' and a.status >= '96')
				then a.status else max(code) end)
		from WH1.Orderstatussetup
		where orderflag = '1' and headerflag = '1' and enabled = '1'
		and code <= (select (case
	when (max(c.status) = '99' and min(c.status) = '99') then '99'
	when (max(c.status) = '98' and min(c.status) = '98') then '98'
	when (max(c.status) = '97' and min(c.status) = '97') then '97'
	when (max(c.status) = '96' and min(c.status) = '96') then '96'
	when (max(c.status) >= '95' and max(c.status) <= '99' and min(c.status) = '95') then '95'
	when (max(c.status) >= '92' and max(c.status) <= '95' and min(c.status) < '95') then '92'
	when (max(c.status) = '16' and min(c.status) <= '16') then '92'
	when (max(c.status) = '53' and min(c.status) <= '53') then '92'
	when (max(c.status) = '57' and min(c.status) <= '57') then '92'
	when (max(c.status) = '88' and min(c.status) = '88') then '88'
	when (max(c.status) = '88' and min(c.status) < '88') then '82'
	when (max(c.status) >= '75' and max(c.status) <= '78' and min(c.status) <= '52' and min(c.status) >= '17') then '52'
	when (max(c.status) >= '75' and max(c.status) <= '78' and min(c.status) <= '15') then '52'
	when (max(c.status) >= '75' and max(c.status) <= '78' and min(c.status) = '55') then '52'
	when (max(c.status) = '75' and min(c.status) = '75') then '75'
	when (max(c.status) = '68' and min(c.status) = '68') then '68'
	when (max(c.status) >= '61' and max(c.status) <= '68' and min(c.status) <= '61') then '61'
	when (max(c.status) = '55' and min(c.status) = '55') then '55'
	when (max(c.status) = '15' and min(c.status) <= '15') then '52'
	when (max(c.status) >= '52' and max(c.status) <= '55' and min(c.status) < '55') then '52'
	when (max(c.status) >= '19' and max(c.status) <= '51' and min(c.status) <= '51') then '19'
	when (max(c.status) = '17' and min(c.status) = '17') then '17'
	when (max(c.status) >= '14' and max(c.status) <= '17' and min(c.status) < '17') then '14'
	when (max(c.status) = '13' and min(c.status) = '13') then '13'
	when (max(c.status) = '12' and min(c.status) = '12') then '12'
	when (max(c.status) = '12' and min(c.status) < '12') then '11'
	when (max(c.status) = '08' and min(c.status) = '08') then '08'
	when (max(c.status) = '04' and min(c.status) = '04') then '04'
	when (max(c.status) <= '04' and min(c.status) = '02') then '02'
	when (max(c.status) <= '09') Then '09'
	else '-1' end)
	from WH1.Orderdetail c
	where c.orderkey = a.orderkey
	group by c.orderkey))
or (b.code = '00'
	and 0 = (select count(*)
		from WH1.orderdetail
		where orderkey = a.orderkey
		)
	)
/

prompt
prompt Creating view VRECEIPTDETAILUOMCONV
prompt ===================================
prompt
CREATE OR REPLACE VIEW VRECEIPTDETAILUOMCONV AS
SELECT
	RECEIPTKEY,
	RECEIPTLINENUMBER,
	PACKKEY,
	UOM,
	QTYEXPECTED,
	QTYRECEIVED,
	DECODE( SIGN(MULTIPLE), 1, QTYEXPECTED/MULTIPLE, QTYEXPECTED) UOMQTYEXPECTED,
	DECODE( SIGN(MULTIPLE), 1, QTYRECEIVED/MULTIPLE, QTYRECEIVED) UOMQTYRECEIVED,
	DECODE( SIGN(MULTIPLE), 1, QTYREJECTED/MULTIPLE, QTYREJECTED) UOMQTYREJECTED
FROM (
	SELECT
		A.RECEIPTKEY,
		A.RECEIPTLINENUMBER,
		A.PACKKEY,
		A.UOM,
		A.QTYEXPECTED,
		A.QTYRECEIVED,
		A.QTYREJECTED,
		DECODE(A.UOM, B.PACKUOM1, B.CASECNT,
		              B.PACKUOM2, B.INNERPACK,
		              B.PACKUOM3, B.QTY,
		              B.PACKUOM4, B.PALLET,
		              B.PACKUOM5, B.CUBE,
		              B.PACKUOM6, B.GROSSWGT,
		              B.PACKUOM7, B.NETWGT,
		              B.PACKUOM8, B.OTHERUNIT1,
		              B.PACKUOM9, B.OTHERUNIT2,
		              0 ) MULTIPLE
	FROM WH1.RECEIPTDETAIL A, WH1.PACK B
	WHERE A.PACKKEY = B.PACKKEY ) T1
/

prompt
prompt Creating view VSKUXLOCREPLENISHMENT
prompt ===================================
prompt
CREATE OR REPLACE VIEW VSKUXLOCREPLENISHMENT AS
SELECT  decode(sign(a.qtyreplenishmentoverride),1,'1', decode(sign(sum(b.qtypickinprocess + b.qtypicked - b.qty - b.pendingmovein)),1, '2',           decode(sign(sum(b.qtyexpected)*(a.qtylocationminimum + 1 - sum(b.qty + b.pendingmovein - b.qtypicked))),1, '3',              decode(sign(a.qtylocationminimum - sum(b.qty + b.pendingmovein - b.qtypicked)),1,'4',0,'4',                  decode(sign(sum(b.qtyexpected)),1,'5',          '8'))))) REPLENISHMENTPRIORITY,      a.storerkey STORERKEY,     a.sku SKU,     a.loc LOC,      floor((a.qtylocationlimit - sum(b.qty + b.pendingmovein - b.qtypicked))             / decode( a.ReplenishmentUOM, '1',d.pallet, '3',d.innerpack, '6', 1, d.casecnt) ) REPLENISHMENTSEVERITY,     decode( a.ReplenishmentUOM, '1',d.pallet, '3',d.innerpack, '6', 1, d.casecnt) REPLENISHMENTCASECNT,     a.qtyreplenishmentoverride QTYREPLENISHMENTOVERRIDE,     sum(b.qty + b.pendingmovein - b.qtypicked) QTYONHAND,     sum(b.qtyexpected) QTYEXPECTED,     sum(b.qtypickinprocess) QTYPICKINPROCESS
 FROM SKUxLOC a, LOTxLOCxID b, SKU c, PACK d
 WHERE a.locationtype in ('CASE','PICK')  and a.qtylocationlimit > 0  and a.storerkey = b.storerkey  and a.sku = b.sku  and a.loc = b.loc  and a.storerkey = c.storerkey  and a.sku = c.sku  and c.packkey = d.packkey  and 0 < decode(a.replenishmentuom,'1',d.pallet,'3',d.innerpack,'6',1,d.casecnt)  and a.qtylocationlimit       - decode(a.replenishmentuom,'1',d.pallet,'3',d.innerpack,'6',1,d.casecnt)       >= (Select SUM(qty + pendingmovein - qtypicked)
	FROM LOTxLOCxID
	WHERE loc = a.loc and sku = a.sku and storerkey = a.storerkey)GROUP BY a.storerkey,a.sku,a.loc, a.qtylocationlimit, a.qtylocationminimum,          a.qtyreplenishmentoverride,a.replenishmentuom,d.casecnt,d.pallet,d.innerpack
/

prompt
prompt Creating view VTMUSERLOGINS
prompt ===========================
prompt
CREATE OR REPLACE VIEW VTMUSERLOGINS AS
(SELECT "USR_LOGIN","USR_NAME","USR_STATUS","USR_FNAME","USR_LNAME" FROM ssaadmin.vTMUserlogins)
/

prompt
prompt Creating view VVERIFIEDCLOSED
prompt =============================
prompt
CREATE OR REPLACE VIEW VVERIFIEDCLOSED AS
SELECT 	Receipt.Storerkey Storerkey,
       		Receipt.Receiptkey Sourcekey,
      		'ASN' SourceType,
		 Receipt.Adddate Adddate,
		 Receipt.ClosedDate ClosedDate,
 		 '1' Checkbox,
		 Receipt.Status Status,
		 SUM(ReceiptDetail.QtyExpected) QtyExpected,
		 SUM(ReceiptDetail.QtyReceived) QtyReceived,
		 SUM(ReceiptDetail.QtyRejected) QtyRejected,
		 decode( sign (SUM(ReceiptDetail.QtyExpected - ReceiptDetail.QtyReceived)),1,SUM(ReceiptDetail.QtyExpected - ReceiptDetail.QtyReceived),0) short,
		 decode( sign (SUM(ReceiptDetail.QtyReceived - ReceiptDetail.QtyExpected)),1,SUM(ReceiptDetail.QtyReceived - ReceiptDetail.QtyExpected),0) QtyOver
FROM WH1.Receipt, WH1.ReceiptDetail
WHERE Receipt.Receiptkey = ReceiptDetail.Receiptkey AND
	   Receipt.Status = '11'
		GROUP BY Receipt.Storerkey,
					Receipt.Receiptkey,
					Receipt.Adddate,
					Receipt.ClosedDate,
					Receipt.Status
UNION
SELECT PO.Storerkey Storerkey,
       PO.POkey Sourcekey,
       'PO'	  SourceType,
 	 	 PO.Adddate Adddate,
		 PO.ClosedDate ClosedDate,
 		 '1' Checkbox,
		 PO.Status Status,
		 SUM(PODetail.QtyOrdered) QtyExpected,
		 SUM(PODetail.QtyReceived) QtyReceived,
		 SUM(PODetail.QtyRejected) QtyRejected,
		 decode( sign (SUM(PODetail.QtyOrdered - PODetail.QtyReceived)),1,SUM(PODetail.QtyOrdered - PODetail.QtyReceived),0) Short,
		 decode( sign (SUM(PODetail.QtyReceived - PODetail.QtyOrdered)),1,SUM(PODetail.QtyReceived - PODetail.QtyOrdered),0) QtyOver
FROM WH1.PO, WH1.PODetail
WHERE PO.POkey = PODetail.Pokey AND
	   PO.Status = '11'
GROUP BY PO.Storerkey,
			PO.POkey,
			PO.Adddate,
			PO.ClosedDate,
			PO.Status
/

prompt
prompt Creating view VWAVEPROCESSINGSTATUS
prompt ===================================
prompt
CREATE OR REPLACE VIEW VWAVEPROCESSINGSTATUS AS
SELECT a.wavekey WAVEKEY,
	decode((sign(sum(openqty))+sign(sum(shippedqty)))*sign(sum(shippedqty)),1,'Shipped',
	decode((sign(sum(openqty-qtypicked))+sign(sum(shippedqty)))*sign(sum(shippedqty)),1,'Picked/Part Shipped',
	decode(sign(sum(openqty))+sign(sum(qtypicked))+sign(sum(shippedqty))+sign(sum(openqty-qtypicked)),4,'Part Picked/Part Shipped',
	decode((sign(sum(openqty-qtyallocated))+sign(sum(shippedqty)))*sign(sum(shippedqty)),1,'Allocated/Part Shipped',
	decode(sign(sum(openqty-qtyallocated))+sign(sum(openqty))+sign(sum(qtyallocated))+sign(sum(shippedqty)),4,'Part Allocated/Part Shipped',
	decode(sign(sum(openqty))+sign(sum(shippedqty)),2,'Open/Part Shipped',
	decode(sign(sum(openqty-qtypicked))+sign(sum(openqty)),1,'Picked',
	decode((sign(sum(openqty-qtypreallocated-qtyallocated-qtypicked))+sign(sum(openqty))+sign(sum(qtyallocated)))*sign(sum(qtypicked)),2,'Allocated/Part Picked',
	decode(sign(sum(openqty-qtyallocated-qtypicked))+sign(sum(openqty))+sign(sum(qtyallocated))+sign(sum(qtypicked)),4,'Part Allocated/Part Picked',
	decode(sign(sum(openqty-qtyallocated))+sign(sum(openqty))+sign(to_number(a.status)-1),1,'Released',
	decode(sign(sum(openqty-qtyallocated))+sign(sum(openqty)),1,'Allocated',
	decode(sign(sum(openqty-qtyallocated))+sign(sum(openqty))+sign(sum(qtypreallocated))+sign(sum(qtyallocated)),4,'PreAllocated/Part Allocated',
	decode(sign(sum(openqty-qtyallocated))+sign(sum(openqty))+sign(sum(qtyallocated)),3,'Part Allocated',
	decode(sign(sum(openqty-qtypreallocated))+sign(sum(openqty)),1,'PreAllocated',decode(sign(sum(openqty-qtypreallocated))+sign(sum(openqty))+sign(sum(qtypreallocated)),3,'Part PreAllocated',
	decode((sign(sum(qtypreallocated+qtyallocated+qtypicked+shippedqty))+sign(sum(openqty)))*sign(sum(openqty)),1,'Not started',
	decode(sign(sum(openqty+shippedqty)),0,'Empty wave',
	decode(sign(sum(openqty-qtypreallocated-qtyallocated-qtypicked)),-1,'OutOfSync','Unknown')))))))))))))))))) STATUS,
	sum(originalqty) ORIGINALQTY,
	sum(openqty) OPENQTY,
	sum(qtypreallocated) QTYPREALLOCATED,
	sum(qtyallocated) QTYALLOCATED,
	sum(qtypicked) QTYPICKED,
	sum(shippedqty) SHIPPEDQTY,
	count(*) NORDERS
FROM 	WH1.wave A, WH1.wavedetail B, WH1.orderdetail C
WHERE 	a.wavekey = b.wavekey	and b.orderkey = c.orderkey
GROUP BY a.wavekey, a.status
UNION
SELECT
a.wavekey,
' ',
0,
0,
0,
0,
0,
0,
0
FROM WH1.wave a
WHERE 0 = (Select Count(*) From WH1.Wavedetail where wavekey = a.wavekey)
UNION
SELECT
a.wavekey,
' ',
0,
0,
0,
0,
0,
0,
0
FROM WH1.wave a, WH1.wavedetail b
WHERE a.wavekey = b.wavekey and 0 = (Select Count(*) From WH1.Orderdetail where orderkey = b.orderkey)
/

prompt
prompt Creating view VWPDXUOMCONV
prompt ==========================
prompt
CREATE OR REPLACE VIEW VWPDXUOMCONV AS
SELECT ORDERKEY,
	ORDERLINENUMBER,
	PACKKEY,
	UOM,
	UOMQTY,
	UOMCUBE,
	UOMLENGTH,
	UOMHEIGHT,
	UOMWIDTH
FROM
(SELECT		A.ORDERKEY,
		A.ORDERLINENUMBER,
		A.PACKKEY,
		A.UOM,
		DECODE(A.UOM, B.PACKUOM1, B.CASECNT,
		B.PACKUOM2, B.INNERPACK,
		B.PACKUOM3, B.QTY,
		B.PACKUOM4, B.PALLET,
		B.PACKUOM5, B.CUBE,
		B.PACKUOM6, B.GROSSWGT,
		B.PACKUOM7, B.NETWGT,
		B.PACKUOM8, B.OTHERUNIT1,
		B.PACKUOM9, B.OTHERUNIT2,
		0) UOMQTY,
		DECODE(A.UOM, B.PACKUOM1, B.CUBEUOM1,
		B.PACKUOM2, B.CUBEUOM2,
		B.PACKUOM3, B.CUBEUOM3,
		B.PACKUOM4, B.CUBEUOM4,
		B.PACKUOM5, '0',
		B.PACKUOM6, '0',
		B.PACKUOM7, '0',
		B.PACKUOM8, '0',
		B.PACKUOM9, '0',
		0) UOMCUBE,
		DECODE( A.UOM, B.PACKUOM1, B.LENGTHUOM1,
		B.PACKUOM2, B.LENGTHUOM2,
		B.PACKUOM3, B.LENGTHUOM3,
		B.PACKUOM4, B.LENGTHUOM4,
		B.PACKUOM5, '0',
		B.PACKUOM6, '0',
		B.PACKUOM7, '0',
		B.PACKUOM8, B.LENGTHUOM8,
		B.PACKUOM9, B.LENGTHUOM9,
		0 ) UOMLENGTH,
		DECODE( A.UOM, B.PACKUOM1, B.HEIGHTUOM1,
		B.PACKUOM2, B.HEIGHTUOM2,
		B.PACKUOM3, B.HEIGHTUOM3,
		B.PACKUOM4, B.HEIGHTUOM4,
		B.PACKUOM5, '0',
		B.PACKUOM6, '0',
		B.PACKUOM7, '0',
		B.PACKUOM8, B.HEIGHTUOM8,
		B.PACKUOM9, B.HEIGHTUOM9,
		0 ) UOMHEIGHT,
		DECODE( A.UOM, B.PACKUOM1, B.WIDTHUOM1,
		B.PACKUOM2, B.WIDTHUOM2,
		B.PACKUOM3, B.WIDTHUOM3,
		B.PACKUOM4, B.WIDTHUOM4,
		B.PACKUOM5, '0',
		B.PACKUOM6, '0',
		B.PACKUOM7, '0',
		B.PACKUOM8, B.WIDTHUOM8,
		B.PACKUOM9, B.WIDTHUOM9,
		0 ) UOMWIDTH
	FROM  WH1.WPORDERDETAIL A,WH1.PACK B
	WHERE A.PACKKEY = B.PACKKEY )
/

prompt
prompt Creating view VXPICKDETAILPROCESSING
prompt ====================================
prompt
create or replace view vxpickdetailprocessing as
select  a.orderkey,
	a.orderlinenumber,
	count(*) PicksTotal,
	sum(decode(a.status,'0',1,0)) NEW,
	sum(decode( sign(sign(a.status - 1)+1) + sign(length(wavekey)), 0, 1, 0 )) RELEASED,
	sum(decode(a.status, '2', 1, '3', 1, 0)) INPICKING,
	sum(decode(a.status, '5', 1, '6', 1, '7', 1, '8', 1, 0 )) PICKED,
	sum(decode(locationtype, 'PICKTO', 1, 0)) INPICKTO,
	sum(decode(dropid,' ',0,decode(sign(length(dropid)), 1, 1, 0))) PACKED,
	sum(decode(locationtype, 'STAGED', 1, 0))  INSTAGED,
	sum(decode(a.status, '8', 1, 0)) LOADED ,
	sum(decode(a.status, '9', 1, 0)) SHIPPED
from WH1.xpickdetail a, WH1.loc b, WH1.xorderdetail c
where a.loc = b.loc
and a.orderkey = c.orderkey
and a.orderlinenumber = c.orderlinenumber
group by a.orderkey, a.orderlinenumber
UNION
select orderkey, orderlinenumber, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
from WH1.xorderdetail c
where 0 = (select count(*)
	   from WH1.xpickdetail
           where orderkey = c.orderkey
	   and orderlinenumber = c.orderlinenumber)
/

prompt
prompt Creating view VXORDERDETAILSTATUSCODE
prompt =====================================
prompt
create or replace view vxorderdetailstatuscode
(orderkey, orderlinenumber, code, openqty, qtytoprocess, processedqty, convertedqty, shippedqty, pickstotal, picksreleased, picksinpicking, pickspicked, pickspacked, picksinstaged, picksloaded, picksshipped)
as
select  a.OrderKey,
	a.OrderLineNumber,
	decode( (sign(QtyToProcess)+sign(ProcessedQty)+sign(shippedqty))*sign(shippedqty),1,'95',			--Shipped
	decode( (sign(QtyToProcess)+sign(ProcessedQty)+sign(shippedqty))*sign(ProcessedQty)*sign(shippedqty),2,'92',	--PartShipped
	decode( (sign(Loaded-PicksTotal)+sign(Loaded))*sign(Loaded),1,'88', 						--Loaded
	decode( sign(Loaded),1,'82', 											--PartLoaded
	decode( (sign(InStaged-PicksTotal)+sign(InStaged))*sign(InStaged),1,'75', 					--Staged
	decode( (sign(Packed-PicksTotal)+sign(Packed))*sign(Packed),1,'68', 						--PackComplete
	decode( sign(Packed),1,'61', 											-- InPacking
	decode( (sign(QtyToProcess)+Sign(ProcessedQty)+sign(ShippedQty)+sign(Picked)+sign(PicksTotal-Picked))*sign(ProcessedQty)*sign(ShippedQty)*sign(Picked),3,'57', 				--Picked/PartShipped
	decode( (sign(QtyToProcess)+Sign(ProcessedQty)+sign(ShippedQty)+sign(Picked)+sign(PicksTotal-Picked))*sign(ProcessedQty)*sign(Picked),2,'55', 						--Picked
	decode( (sign(QtyToProcess)+Sign(ProcessedQty)+sign(ShippedQty)+sign(Picked)+sign(PicksTotal-Picked))*sign(ProcessedQty)*sign(ShippedQty)*sign(Picked)*sign(PicksTotal-Picked),4,'53', 	--PartPicked/PartShipped
	decode( (sign(QtyToProcess)+Sign(ProcessedQty)+sign(ShippedQty)+sign(Picked)+sign(PicksTotal-Picked))*sign(ProcessedQty)*sign(Picked)*sign(PicksTotal-Picked),3,'52', 			--Allocated/PartPicked
	decode( sign(InPicking),1,'51', 										--InPicking
	decode( (sign(QtyToProcess)+Sign(ProcessedQty))*sign(ProcessedQty),1,'17',					--Allocated
	decode( sign(QtyToProcess)+sign(Picked)+sign(ShippedQty),3,'16',						--PartAlloccated/PartShipped
	decode( sign(QtyToProcess)+sign(Picked),2,'15',									--PartAlloccated/PartPicked
	decode( sign(QtyToProcess)+sign(ProcessedQty),2,'14',								--Part Allocated
	decode( (sign(ProcessedQty + ShippedQty)+sign(QtyToProcess))*sign(QtyToProcess),1,'09', 			--Not Started
	decode( sign(QtyToProcess + ProcessedQty + ShippedQty),0,'00',                               			--Empty Line
		'-1')))))))))))))))))) CODE,                                                            		--Unknown
	OpenQty, QtyToProcess, ProcessedQty, ConvertedQty, ShippedQty,
	PicksTotal, Released, InPicking, Picked, Packed, InStaged, Loaded, Shipped
from WH1.xorderdetail a, WH1.vXPickDetailProcessing b
where a.orderkey = b.orderkey
and a.orderlinenumber = b.orderlinenumber
/

prompt
prompt Creating view VXORDERDETAILSTATUS
prompt =================================
prompt
create or replace view vxorderdetailstatus
(orderkey, orderlinenumber, statuscode, statusdescription, loghistory, openqty, qtytoprocess, processedqty, shippedqty)
as
select  orderkey,
	orderlinenumber,
	Code,
	description,
	detailhistoryflag,
	OpenQty,
	QtyToProcess,
	ProcessedQty,
	ShippedQty
from WH1.xorderdetail a, WH1.orderstatussetup b
where b.code = (select decode(sign(to_number(max(code))-9),
			0, decode(sign(to_number(a.status)-2)+sign(to_number(a.status)-8),
				0, a.status, max(code)),
			max(code))
		from WH1.orderstatussetup
		where orderflag = '1' and detailflag = '1' and enabled = '1'
		and code <= (
			select code from WH1.vxorderdetailstatuscode
			where orderkey = a.orderkey
			and orderlinenumber = a.orderlinenumber
			)
		)
/

prompt
prompt Creating view VXORDERSTATUS
prompt ===========================
prompt
create or replace view vxorderstatus
(orderkey, statuscode, statusdescription, loghistory)
as
Select 	orderkey,
	code,
	description,
	headerhistoryflag
	from WH1.XOrders a, WH1.Orderstatussetup b
where b.code = (select (case when (max(code) = '09' and a.status between '02' and '08')
				or (max(code) between '02' and '08' and a.status >= '96')
				then a.status else max(code) end)
		from WH1.Orderstatussetup
		where orderflag = '1' and headerflag = '1' and enabled = '1'
		and code <= (select (case
	when (max(c.status) = '99' and min(c.status) = '99') then '99'
	when (max(c.status) = '98' and min(c.status) = '98') then '98'
	when (max(c.status) = '97' and min(c.status) = '97') then '97'
	when (max(c.status) = '96' and min(c.status) = '96') then '96'
	when (max(c.status) >= '95' and max(c.status) <= '99' and min(c.status) = '95') then '95'
	when (max(c.status) >= '92' and max(c.status) <= '95' and min(c.status) < '95') then '92'
	when (max(c.status) = '16' and min(c.status) <= '16') then '92'
	when (max(c.status) = '53' and min(c.status) <= '53') then '92'
	when (max(c.status) = '57' and min(c.status) <= '57') then '92'
	when (max(c.status) = '88' and min(c.status) = '88') then '88'
	when (max(c.status) = '88' and min(c.status) < '88') then '82'
	when (max(c.status) >= '75' and max(c.status) <= '78' and min(c.status) <= '52' and min(c.status) >= '17') then '52'
	when (max(c.status) >= '75' and max(c.status) <= '78' and min(c.status) <= '15') then '52'
	when (max(c.status) >= '75' and max(c.status) <= '78' and min(c.status) = '55') then '52'
	when (max(c.status) = '75' and min(c.status) = '75') then '75'
	when (max(c.status) = '68' and min(c.status) = '68') then '68'
	when (max(c.status) >= '61' and max(c.status) <= '68' and min(c.status) <= '61') then '61'
	when (max(c.status) = '55' and min(c.status) = '55') then '55'
	when (max(c.status) = '15' and min(c.status) <= '15') then '52'
	when (max(c.status) >= '52' and max(c.status) <= '55' and min(c.status) < '55') then '52'
	when (max(c.status) >= '19' and max(c.status) <= '51' and min(c.status) <= '51') then '19'
	when (max(c.status) = '17' and min(c.status) = '17') then '17'
	when (max(c.status) >= '14' and max(c.status) <= '17' and min(c.status) < '17') then '14'
	when (max(c.status) = '13' and min(c.status) = '13') then '13'
	when (max(c.status) = '12' and min(c.status) = '12') then '12'
	when (max(c.status) = '12' and min(c.status) < '12') then '11'
	when (max(c.status) = '08' and min(c.status) = '08') then '08'
	when (max(c.status) = '04' and min(c.status) = '04') then '04'
	when (max(c.status) <= '04' and min(c.status) = '02') then '02'
	when (max(c.status) <= '09') Then '09'
	else '-1' end)
	from WH1.XOrderdetail c
	where c.orderkey = a.orderkey
	group by c.orderkey))
or (b.code = '00'
	and 0 = (select count(*)
		from WH1.Xorderdetail
		where orderkey = a.orderkey
		)
)
/

prompt
prompt Creating view XSO_ALL
prompt =====================
prompt
CREATE OR REPLACE VIEW XSO_ALL AS
SELECT TO_CHAR(JX.ADDDATE,'YYYYMMDD') DAT,JX.DOC_COMPANY,JX.DOC_TYPE,JX.DOC_WORKGROUP,COUNT(DISTINCT JX.DOC_NUMBER) QTY,
 COUNT(DISTINCT DOC_SKU) SKUQTY ,sum(doc_eqty) eqty,sum(doc_amt) amt
FROM JOBS_XSO JX,JOBSCONTEXT_XSO JXDETAIL
WHERE JX.DOC_NUMBER=JXDETAIL.DOC_NUMBER
 AND jx.doc_status in('4','5','8')
GROUP BY TO_CHAR(JX.ADDDATE,'YYYYMMDD'),JX.DOC_COMPANY,JX.DOC_TYPE,JX.DOC_WORKGROUP
/

prompt
prompt Creating procedure NSP_GETKEY
prompt =============================
prompt
CREATE OR REPLACE PROCEDURE nsp_getkey(keyname in varchar2 ,
                                        lenght in number ,
                                        keyvalue out varchar2 ) IS
BEGIN
    --打包批次号
    IF KEYNAME='CAES_BATCH' THEN
        SELECT TO_CHAR(SYSDATE,'YYMMDD')||lpad(case_batchno.NEXTVAL,lenght - 6,0)
            INTO   keyvalue
            FROM   dual;
    END IF;
    --pickdetailkey
    IF KEYNAME='PICKDETAIL' THEN
        SELECT 'P'||lpad(SEQ_PICKKEY.NEXTVAL,lenght - 1,0)
            INTO   keyvalue
            FROM   dual;
    END IF;
    --生成打包唯一号
    IF KEYNAME='PACKCASE' THEN
        SELECT 'P'||lpad(SEQ_PACKID.NEXTVAL,lenght - 1,0)
            INTO   keyvalue
            FROM   dual;
    END IF;
    --包件号CASEID 
     IF KEYNAME='CASEID' THEN
        SELECT lpad(SEQ_CASEID.NEXTVAL,lenght,0)
            INTO   keyvalue
            FROM   dual;
    END IF;
     --拣货流水号
     IF KEYNAME='PICKNO' THEN
        SELECT lpad(SEQ_PICKNO.NEXTVAL,lenght,0)
            INTO   keyvalue
            FROM   dual;
    END IF;
    IF KEYNAME='TASKDETAIL' THEN
        SELECT 'X'||lpad(TASK_SEQ.NEXTVAL,lenght - 1,0)
            INTO   keyvalue
            FROM   dual;
    END IF;
   
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
     WHEN OTHERS THEN
       RAISE;
END nsp_getkey;
/

prompt
prompt Creating procedure NSP_CALCULATE_XSO_TASK
prompt =========================================
prompt
create or replace procedure NSP_CALCULATE_XSO_TASK(
                                                   v_boxno in varchar2, --箱号                                                    
                                                    v_consk in varchar2,
                                                   p_message out varchar2,
                                                   p_fromtable in varchar2
                                          
)

as

vnum number :=0;
v_toloc nvarchar2(10):='UNKNOWN';
v_toLogicalLocation nvarchar2(20);
v_fromLogicalLocation nvarchar2(20);
v_taskdetailkey nvarchar2(20);

v_count number;
v_packid varchar(20);
--v_eqty number;

v_fromtable varchar2(20):='XSO_CASEDETAIL';
  begin
    --首先根据周转箱号且未封箱 是否有需要封箱的数据
  select count(1) into v_count
        from xso_casedetail x
       where x.boxno = v_boxno and x.consk=v_consk  and x.fromtype=p_fromtable and(x.status<> 9 or x.status is null); 
       if(v_count=0) then
            p_message := '周转箱内无数据';
            RETURN;
        end if;

  select count(1) into v_count
  from storer s  where s.storerkey = v_consk;
   /*(select consk  from XSO_CASEDETAIL where caseid = v_caseid and caselineno = v_caselineno);
    savepoint point1;*/
  
   savepoint point1;--定义回滚点
 
   --如果consk为货主则打包数据
   if(v_count>0) then
    --定义声明遍历游标 根据箱号获取系统箱号与系统箱号明细
    
      DECLARE CURSOR C IS
      SELECT X.CASEID, X.CASELINENO
        FROM XSO_CASEDETAIL X
       WHERE X.BOXNO = V_BOXNO AND X.CONSK=V_CONSK AND X.FROMTYPE=P_FROMTABLE AND ( X.STATUS<> 9 OR X.STATUS IS NULL);-- X.STATUS=9 表示已封过箱
        v_caseid     varchar2(20); --系统箱号
        v_caselineno varchar2(5); --系统箱号明细
          begin
            open c;
            fetch c into v_caseid,v_caselineno ;
                while (c%found) 
                loop
                  --
              -- select  PACK_CASE_SEQ.Nextval into v_packid from dual;
               /*select j.doc_eqty into v_eqty from  jobscontext_xso j where j.doc_number=( select x.xso_number from XSO_CASEDETAIL x
                  where x.caseid = v_caseid and x.caselineno= v_caselineno) and j.doc_seq=( select x.seq from XSO_CASEDETAIL x
                   where x.caseid = v_caseid and x.caselineno= v_caselineno);*/
                   INSERT INTO PACK_CASE  (BATCH_NO,FROMTABLE,FROMTYPE,PICKDETAILKEY,STORERKEY,BOXNO,BOXNOBAK,CASEID, CASELINENO,TYPE,DOC_NUMBER,SEQ,SKU,PACKQTY,PRICE,DISCOUNT,MY,STATUS,CONSK,SHORTNAME, EXPORTNO,DESCR,BARCODE,ROUTE,PACKLOC,STATION)
                  SELECT  X.BATCHNO,V_FROMTABLE,X.TYPE,'',X.STORERKEY,X.BOXNO,X.BOXNO,X.CASEID,X.CASELINENO,X.TYPE,X.XSO_NUMBER,X.SEQ,X.SKU, X.PACKQTY,X.PRICE,X.DISCOUNT,X.MY,'0',X.CONSK,X.SHORTNAME,X.EXPORTNO,DESCR,
                   (SELECT BARCODE FROM SKU WHERE SKU.SKU=X.SKU AND SKU.STORERKEY=X.STORERKEY),
                   (SELECT NVL(ROUTE,' ') FROM STORER WHERE STORERKEY=X.CONSK),
                   (SELECT PACKLOC FROM STORER WHERE STORERKEY=X.CONSK),
                   (SELECT STATION FROM STORER WHERE STORERKEY=X.CONSK)
                    FROM XSO_CASEDETAIL X
                  WHERE X.CASEID = V_CASEID AND X.CASELINENO= V_CASELINENO AND X.BOXNO=V_BOXNO ;
                  --
                  fetch c into v_caseid,v_caselineno ;
                end loop;
                close c;
          end;
  
        p_message:='true0';
        --否则consk不是货主上架
    else    
        SELECT COUNT(1) INTO V_COUNT
        FROM RECEIPTDETAIL RPT,XSO_CASEDETAIL XSOCASE
        WHERE RPT.EXTERNRECEIPTKEY=XSOCASE.XSO_NUMBER
         AND  RPT.EXTERNLINENO=XSOCASE.SEQ
         AND  XSOCASE.BOXNO =  V_BOXNO
         AND XSOCASE.CONSK=V_CONSK
         AND XSOCASE.FROMTYPE=P_FROMTABLE
         AND (XSOCASE.STATUS<>9 OR XSOCASE.STATUS IS NULL);
  
         if(v_count<=0) then
               p_message:='上架时无此收货信息!';
               RETURN;
          end if;  
        declare cursor vCursor is  SELECT xsocase.xso_number, xsocase.packqty qty, xsocase.storerkey, xsocase.sku, rpt.tolot, rpt.toid, rpt.uom, rpt.toloc
        from receiptdetail rpt,XSO_CASEDETAIL xsocase
        where rpt.externreceiptkey=xsocase.xso_number
         and  rpt.externlineno=xsocase.seq
         and  xsocase.boxno =  v_boxno
         and xsocase.consk=v_consk
         and xsocase.fromtype=p_fromtable
         and (xsocase.status<>9 or xsocase.status is null);
    -- group by xsocase.storerkey, xsocase.sku, rpt.tolot, rpt.toid, rpt.uom, rpt.toloc;
        vreceiptkey nvarchar2(32);
        vqty number:=0;
        vstorerkey nvarchar2(20);
        vsku nvarchar2(20);
        vlot nvarchar2(20);
        vtoid nvarchar2(20);
        vuom nvarchar2(10); 
        vloc nvarchar2(20);
            begin
                open vCursor;
                fetch vCursor into vreceiptkey,vqty,vstorerkey,vsku,vlot,vtoid,vuom,vloc;
                while vCursor%found
                loop
                    begin
             
              
                              NSP_GETKEY('TASKDETAIL',10,V_TASKDETAILKEY); 
                              SELECT NVL(LOGICALLOCATION,'') INTO V_FROMLOGICALLOCATION FROM LOC WHERE LOC=VLOC;
                              SELECT NVL(LOGICALLOCATION,'UNKNOWN') INTO V_TOLOGICALLOCATION FROM LOC WHERE LOC=V_TOLOC;
                             INSERT INTO TASKDETAIL ( TASKDETAILKEY, TASKTYPE, STORERKEY, SKU, LOT, FROMLOC, FROMID, TOLOC, TOID, UOM, UOMQTY, QTY, LOGICALFROMLOC, LOGICALTOLOC, SOURCEKEY, SOURCETYPE, BOXNO)
                             VALUES ( V_TASKDETAILKEY, 'PA', VSTORERKEY, VSKU, VLOT, VLOC, VTOID,V_TOLOC,VTOID , '6', VQTY, VQTY, V_FROMLOGICALLOCATION, V_TOLOGICALLOCATION,VRECEIPTKEY, ' ', V_BOXNO);
              
                    end;
                    fetch vCursor into vreceiptkey,vqty,vstorerkey,vsku,vlot,vtoid,vuom,vloc;
                end loop;
      
                close vCursor;
        
             end;
   
            p_message:='true1';
    end if;
    --封箱后将 xso_casedetail.status='9' 表示已封箱 
    update xso_casedetail set status='9' where boxno=v_boxno; 
    --update box set status='1' where boxno=v_boxno; --将周转箱状态改为使用中
     COMMIT;
    
     EXCEPTION
      WHEN OTHERS
      THEN
      
      rollback to savepoint point1;     
   
      p_message := '封箱失败!';
  

 end;
/

prompt
prompt Creating procedure NSP_CAL_CASE_LOC
prompt ===================================
prompt
CREATE OR REPLACE PROCEDURE NSP_CAL_CASE_LOC(C_RECEIPTKEY IN VARCHAR2,C_RECEIPTLINENUMBER IN VARCHAR2,C_SKU IN VARCHAR2,C_TOLOC OUT VARCHAR2)
AS
    C_ROW                   NUMBER:=0;
    C_ROW_1                 NUMBER:=0;
    C_STORERKEY             VARCHAR2(10);
    C_EXTERNRECEIPTKEY      VARCHAR2(30);
    C_EXTERNLINENO          VARCHAR2(10);
    C_INVQTY                NUMBER:=0;
    C_QTY                   NUMBER:=0;
    C_AISLEWAY              VARCHAR2(2);
    C_PACKKEY               VARCHAR2(10);
    C_UOM                   VARCHAR2(2);
    C_QTYRECEIVED           NUMBER:=0;
    C_TOLOT                 VARCHAR2(10);
    C_TOID                  VARCHAR2(18);
    C_LOTTABLE02            VARCHAR2(10);
    C_FROMID                VARCHAR2(18);
    C_FROMLOC               VARCHAR2(10);
    C_SUSR7                 VARCHAR2(18);
    C_BARCODE               VARCHAR2(30);
    C_LENGTHUOM3            NUMBER:=0;
    C_WIDTHUOM3             NUMBER:=0;
    C_HEIGHTUOM3            NUMBER:=0;
    C_LENGTH                NUMBER:=0;
    C_WIDTH                 NUMBER:=0;
    C_HEIGHT                NUMBER:=0;
    C_CONTINUE              INT:=1;
    C_VOLUME_SKU            NUMBER:=0;
    C_VOLUME_SKU_1          NUMBER:=0;
    C_VOLUME_LOC            NUMBER:=0;
    C_PUTAWAYZONE           VARCHAR2(10);
    C_SUSR1                 VARCHAR2(10);
    C_LOCATIONHANDLING      VARCHAR2(1);
    C_CUBICCAPACITY         NUMBER:=0;
    C_STDCUBE               NUMBER:=0;
    C_QTY1                   NUMBER:=0;


BEGIN

    DECLARE CURSOR CURSOR_RECEIPTDETAIL_PUTAWAY IS SELECT EXTERNRECEIPTKEY,EXTERNLINENO,STORERKEY,PACKKEY,UOM,QTYRECEIVED,TOLOC,TOLOT,TOID,SUSR1 FROM RECEIPTDETAIL WHERE RECEIPTKEY=C_RECEIPTKEY AND RECEIPTLINENUMBER=C_RECEIPTLINENUMBER;
    BEGIN
        OPEN CURSOR_RECEIPTDETAIL_PUTAWAY;
        FETCH CURSOR_RECEIPTDETAIL_PUTAWAY INTO C_EXTERNRECEIPTKEY,C_EXTERNLINENO,C_STORERKEY,C_PACKKEY,C_UOM,C_QTYRECEIVED,C_FROMLOC,C_TOLOT,C_FROMID,C_SUSR1;
        WHILE CURSOR_RECEIPTDETAIL_PUTAWAY%FOUND
        LOOP

            BEGIN
                IF C_SUSR1='0' THEN
                BEGIN
                    RETURN;
                END;
                END IF;

                SELECT STDCUBE INTO C_STDCUBE   
                FROM SKU 
                WHERE STORERKEY=C_STORERKEY 
                AND SKU=C_SKU;
                
                --计算得到此商品待上架数量的总体积
                C_VOLUME_SKU:=C_STDCUBE*C_QTYRECEIVED;

                SELECT LOTTABLE02 INTO C_LOTTABLE02 FROM LOTATTRIBUTE WHERE STORERKEY=C_STORERKEY AND LOT=C_TOLOT;

                IF C_CONTINUE=1 THEN
                BEGIN

                    SELECT BARCODE INTO C_BARCODE FROM SKU WHERE STORERKEY=C_STORERKEY AND SKU=C_SKU;

                    DECLARE CURSOR CURSOR_1 IS
                    /*SELECT LOC.LOC FROM LOC
                    WHERE (LOC.LOCATIONHANDLING='2') 
                    AND LOC.LOC NOT IN(SELECT DISTINCT SKUXLOC.LOC FROM SKUXLOC
                                        WHERE EXISTS (SELECT 1 FROM LOTXLOCXID,LOTATTRIBUTE,SKU
                                                        WHERE LOTXLOCXID.SKU=SKU.SKU
                                                        AND LOTXLOCXID.LOT=LOTATTRIBUTE.LOT
                                                        AND LOTXLOCXID.QTY>0
                                                        AND LOTXLOCXID.SKU<>C_SKU
                                                        AND LOTATTRIBUTE.LOTTABLE02=C_LOTTABLE02)
                                        AND SKUXLOC.LOC NOT IN (SELECT SKUXLOC.LOC FROM SKUXLOC,SKU
                                            WHERE SKUXLOC.SKU=SKU.SKU
                                            AND SKUXLOC.SKU<>C_SKU
                                            AND BARCODE=C_BARCODE))
                    AND LOC.LOCATIONFLAG='NONE'
                    ORDER BY LOC.LOC ASC;*/
                    SELECT SKUXLOC.LOC,SKUXLOC.QTY FROM LOC,SKUXLOC
                    WHERE SKUXLOC.LOC=LOC.LOC
                    AND SKUXLOC.SKU=C_SKU
                    AND LOCATIONHANDLING='2'
                    AND SKUXLOC.QTY>0
                    AND SKUXLOC.LOC NOT IN (SELECT LOTXLOCXID.LOC FROM LOTXLOCXID,LOTATTRIBUTE,SKU
                                    WHERE LOTXLOCXID.SKU=SKU.SKU
                                    AND LOTXLOCXID.LOT=LOTATTRIBUTE.LOT
                                    AND LOTXLOCXID.QTY>0
                                    AND LOTXLOCXID.SKU<>C_SKU
                                    AND LOTATTRIBUTE.LOTTABLE02=C_LOTTABLE02)
                    AND SKUXLOC.LOC NOT IN (SELECT SKUXLOC.LOC FROM SKUXLOC,SKU
                                    WHERE SKUXLOC.SKU=SKU.SKU
                                    AND SKUXLOC.SKU<>C_SKU
                                    AND BARCODE=C_BARCODE) 
                    UNION 
                    SELECT LOC,0 QTY FROM LOC
                    WHERE LOCATIONHANDLING='2'
                    AND LOC.LOC NOT IN (SELECT DISTINCT SKUXLOC.LOC FROM SKUXLOC WHERE QTY>0)
                    ORDER BY QTY DESC,LOC ASC;

                    BEGIN
                        OPEN CURSOR_1;
                        FETCH CURSOR_1 INTO C_TOLOC,C_QTY1;
                        WHILE CURSOR_1%FOUND
                        LOOP
                        <<TOP>>
                            BEGIN

                                SELECT SUM(STDCUBE*QTY) 
                                INTO C_VOLUME_SKU_1
                                FROM (
                                    SELECT SKUXLOC.SERIALKEY,SKU.STDCUBE,SKUXLOC.QTY
                                                    
                                    FROM SKUXLOC,SKU
                                    WHERE SKUXLOC.SKU=SKU.SKU
                                    AND SKUXLOC.QTY>0
                                    AND SKUXLOC.LOC=C_TOLOC
                                GROUP BY SKUXLOC.SERIALKEY,SKU.STDCUBE,SKUXLOC.QTY) A;


                                IF C_VOLUME_SKU_1 IS NULL THEN
                                BEGIN
                                    C_VOLUME_SKU_1:=0;
                                END;
                                END IF;

                                IF C_TOLOC<>' 'THEN
                                BEGIN
                                    SELECT CUBICCAPACITY INTO C_CUBICCAPACITY FROM LOC WHERE LOC=C_TOLOC;
                                END;
                                END IF;
                                
                                C_VOLUME_LOC:=C_CUBICCAPACITY;
                                C_VOLUME_LOC:=(C_VOLUME_LOC-C_VOLUME_SKU_1)*0.8;

                                IF C_VOLUME_LOC>=C_VOLUME_SKU THEN
                                BEGIN
                                    C_TOLOC:=C_TOLOC;
                                    C_CONTINUE:=1;
                                    EXIT;
                                END;
                                ELSE
                                BEGIN
                                    C_TOLOC:=' ';
                                    C_CONTINUE:=9;

                                    FETCH CURSOR_1 INTO C_TOLOC,C_QTY1;
                                    GOTO TOP;
                                END;
                                END IF;

                            END;
                        FETCH CURSOR_1 INTO C_TOLOC,C_QTY1;
                        END LOOP;
                        CLOSE CURSOR_1;
                    END;

                END;
                END IF;


                IF C_CONTINUE=9 THEN
                BEGIN
                    SELECT COUNT(1) INTO C_ROW FROM PUTAWAYZONE WHERE PUTAWAYZONE.PUTAWAYZONE=C_PUTAWAYZONE;
                    IF C_ROW>0 THEN
                    BEGIN

                        SELECT PUTAWAYZONE.PUT_LOC INTO C_TOLOC FROM PUTAWAYZONE WHERE PUTAWAYZONE.PUTAWAYZONE=C_PUTAWAYZONE;
                    END;
                    END IF;
                END;
                END IF;

                IF C_TOLOC IS NULL OR C_TOLOC=' ' THEN
                BEGIN
                    C_TOLOC:='UNKNOWN';
                END;
                END IF;

            END;
        FETCH CURSOR_RECEIPTDETAIL_PUTAWAY INTO C_EXTERNRECEIPTKEY,C_EXTERNLINENO,C_STORERKEY,C_PACKKEY,C_UOM,C_QTYRECEIVED,C_FROMLOC,C_TOLOT,C_FROMID,C_SUSR1;
        END LOOP;
        CLOSE CURSOR_RECEIPTDETAIL_PUTAWAY;
    END;

    C_CONTINUE:=1;



END;
/

prompt
prompt Creating procedure NSP_CAL_EACH_LOC
prompt ===================================
prompt
CREATE OR REPLACE PROCEDURE NSP_CAL_EACH_LOC(C_RECEIPTKEY IN VARCHAR2)

/************************************************************************************************************************************************************************************
********************************上架逻辑说明 20111221 lxj add for jxxh
**一.请配each：根据jobs_xso表的Doc_type字段 doc_type = 1,3,5为退货
**         a.退货：1-9区按sku+storerkey找库存---->1.找到库存---->正常上架；---->走到b
**                                    |
**                                    |---->2.无库存到0区按类别找走道
**
**         b.(其他)正常上架---->按商品类别找区域(通过sku+storerkey在sku表找到skugroup，---->这个sku+storerkey的库存---->有---->（要判断有这个商品sku+storerkey的loc是否放得下，如果能放下，要按照剩余的体积排序，如果放不下，同没有找到库存）
**                              然后在classzone表中找到zone) （没区域则unknown）                                  |---->没有---->找到出版社(sku+storerkey-->susr7) susr7+storerkey----->找到一批sku 276
**                                                                                                                                                                  |
**                                                                                                                                                                  |
**                                                                                 储位4-5位就是走道,得到走道(按走道排序) <---通过一批sku去找对应的储位(同区域+出版社+sku+storerkey)
**                                                                                             |
**                                                                                     通过体积计算最合适的储位---->找到 OK
**                                                                                             |---->没找到---->现有的区内的空储位---->找到 OK
**                                                                                                                  |---->找不到 则上到 默认储位（根据zone 去 putawayzone表的put_loc字段）如果还找不到上到 unknow
**
**二.大宗case：a.找库存--->有  按体积找合适的
**             |---->没有  找空的；体积合适的
**         b.同一sku不同批次
**         c.同一barcode不同sku
**         d.最后，默认储位
************************************************************************************************************************************************************************************
************************************************ 注意：1.中间如果找到合适的，要查看barcode
************************************************       2.去第0区域---->skugroup --->classzone表---->走道字段---->有库存就OK(正常上架类似)
************************************************       3.计算体积： 储位体积---->每个商品体积*个数---->要存入的体积>0
************************************************                      loc表          sku表   
************************************************       4.同区域+sku+storerkey:100%要放入的区域可以体积100% 若不是则只能放入80%
************************************************       5.找到储位都要计算体积，判断是否可以放入商品(在putawayzone里面找到的储位不要判断：默认储位)
************************************************************************************************************************************************************************************/
AS
    C_ROW                   NUMBER:=0;
    C_ROW_1                 NUMBER:=0;
    C_STORERKEY             VARCHAR2(10);
    C_SKU                   VARCHAR2(30);
    C_EXTERNRECEIPTKEY      VARCHAR2(30);
    C_RECEIPTLINENUMBER     VARCHAR2(5);
    C_EXTERNLINENO          VARCHAR2(10);
    C_DOC_TYPE              NUMBER:=0;
    C_RZONE                 VARCHAR2(10);
    C_INVQTY                NUMBER:=0;
    C_AISLEWAY              VARCHAR2(2);
    C_PACKKEY               VARCHAR2(10);
    C_UOM                   VARCHAR2(2);
    C_QTYRECEIVED           NUMBER:=0;
    C_TOLOT                 VARCHAR2(10);
    C_TOID                  VARCHAR2(18);
    C_TOLOC                 VARCHAR2(10);
    C_FROMLOT               VARCHAR2(10);
    C_FROMID                VARCHAR2(18);
    C_FROMLOC               VARCHAR2(10);
    C_SUSR7                 VARCHAR2(18);
    C_BARCODE               VARCHAR2(30);
    C_LENGTHUOM3            NUMBER:=0;
    C_WIDTHUOM3             NUMBER:=0;
    C_HEIGHTUOM3            NUMBER:=0;
    C_LENGTH                NUMBER:=0;
    C_WIDTH                 NUMBER:=0;
    C_HEIGHT                NUMBER:=0;
    C_BARCOEDE              VARCHAR2(30);
    C_CONTINUE              INT:=1;
    C_CONTINUE_OLD          INT:=1;
    C_VOLUME_SKU            NUMBER:=0;
    C_VOLUME_SKU_1          NUMBER:=0;
    C_VOLUME_SKU_2          NUMBER:=0;
    C_VOLUME_LOC            NUMBER:=0;
    C                       NUMBER:=0;
    H                       NUMBER:=0;
    I                       NUMBER:=0;
    J                       NUMBER:=0;
    K                       NUMBER:=0;
    L                       NUMBER:=0;
    C_PUTAWAYZONE           VARCHAR2(10);
    C_AREAQTY               NUMBER:=0;
    X_EXPORTNO              VARCHAR2(10);
    C_LOC                   VARCHAR2(10);
    C_QTY                   NUMBER:=0;
    C_STDCUBE               NUMBER:=0;
    C_CUBICCAPACITY         NUMBER:=0;
    C_VOLUME_SKU_3          NUMBER:=0;
  


BEGIN

    --查询出主配单类型
    SELECT DOC_TYPE
    INTO C_DOC_TYPE
    FROM JOBS_XSO,RECEIPT
    WHERE JOBS_XSO.DOC_NUMBER=RECEIPT.EXTERNRECEIPTKEY
    AND RECEIPT.RECEIPTKEY=C_RECEIPTKEY;

    --判断是否为退货类型
    IF(C_DOC_TYPE=1 OR C_DOC_TYPE=3 OR C_DOC_TYPE=5)THEN
    BEGIN
        C_CONTINUE:=2;
        C_CONTINUE_OLD:=2;
    END;
    END IF;

    --判断是否非退货类型
    IF(C_DOC_TYPE=0 OR C_DOC_TYPE=2 OR C_DOC_TYPE=4 OR C_DOC_TYPE=6) THEN
    BEGIN
        C_CONTINUE:=3;
        C_CONTINUE_OLD:=3;
    END;
    END IF;

    --非退货类型和退货类型都进行收货单明细循环，逐条做判断
    IF C_CONTINUE=2 OR C_CONTINUE=3 THEN
    BEGIN
        DECLARE CURSOR CURSOR_RECEIPTDETAIL_PUTAWAY IS SELECT EXTERNRECEIPTKEY,RECEIPTLINENUMBER,EXTERNLINENO,STORERKEY,SKU,PACKKEY,UOM,QTYRECEIVED,TOLOC,TOLOT,TOID FROM RECEIPTDETAIL WHERE RECEIPTKEY=C_RECEIPTKEY AND SUSR1='0';
        BEGIN
            OPEN CURSOR_RECEIPTDETAIL_PUTAWAY;
            FETCH CURSOR_RECEIPTDETAIL_PUTAWAY INTO C_EXTERNRECEIPTKEY,C_RECEIPTLINENUMBER,C_EXTERNLINENO,C_STORERKEY,C_SKU,C_PACKKEY,C_UOM,C_QTYRECEIVED,C_FROMLOC,C_FROMLOT,C_FROMID;
            WHILE CURSOR_RECEIPTDETAIL_PUTAWAY%FOUND
            LOOP

                BEGIN
                   
                    C_CONTINUE:=C_CONTINUE_OLD;
                    C_TOLOC:=' ';


                    --若此条收货明细为退货类型，则到CLASSTOZONE表里找到预先维护的，第0区的对应的走道编号
                    SELECT COUNT(1) INTO C_ROW FROM CODELKUP WHERE LISTNAME='0ZONE' AND CODE='0';
                    IF C_ROW>0 THEN--有维护，则查找出此商品对应的上架区域
                    BEGIN
                        --得到第0区的区域编号
                        SELECT DESCRIPTION INTO C_RZONE FROM CODELKUP WHERE LISTNAME='0ZONE' AND CODE='0';
                    END;
                    END IF;

                    --主配单位退货类型
                    IF C_CONTINUE=2 THEN
                    BEGIN

                        SELECT COUNT(1) INTO C_ROW
                        FROM LOC,SKUXLOC
                        WHERE LOC.LOC=SKUXLOC.LOC
                        AND LOC.PUTAWAYZONE<>C_RZONE
                        AND LOC.LOC NOT IN('QC','QC99','STAGE','DAMAGE','PICKTO','LOST','RETURN','UNKNOWN','DOCK','IDZ')
                        AND SKUXLOC.STORERKEY=C_STORERKEY
                        AND SKUXLOC.SKU=C_SKU
                        AND SKUXLOC.QTY>0;
                        
                        --计算查找出此商品在非第0区库存数
                        IF C_ROW>0 THEN
                        BEGIN
                            SELECT SUM(SKUXLOC.QTY) INTO C_INVQTY
                            FROM LOC,SKUXLOC
                            WHERE LOC.LOC=SKUXLOC.LOC
                            AND LOC.PUTAWAYZONE<>C_RZONE
                            AND LOC.LOC NOT IN('QC','QC99','STAGE','DAMAGE','PICKTO','LOST','RETURN','UNKNOWN','DOCK','IDZ')
                            AND SKUXLOC.STORERKEY=C_STORERKEY
                            AND SKUXLOC.SKU=C_SKU
                            AND SKUXLOC.QTY>0;
                        END;
                        ELSE
                        BEGIN
                            C_INVQTY:=0;
                        END;
                        END IF;

                        IF C_INVQTY>0 THEN--判断此商品在非第0区库存数大于0，
                        BEGIN

                            SELECT COUNT(1) INTO C_ROW
                            FROM SKU,CLASSTOZONE
                            WHERE SKU.SKUGROUP=CLASSTOZONE.SKUGROUP
                            AND CLASSTOZONE.ZONE<>C_RZONE
                            AND SKU.SKU=C_SKU;    
                        
                            --查找此商品在非第0区的对应的入库区域
                            IF C_ROW>0 THEN
                            BEGIN 
                                SELECT MIN(CLASSTOZONE.ZONE) INTO C_PUTAWAYZONE
                                FROM SKU,CLASSTOZONE
                                WHERE SKU.SKUGROUP=CLASSTOZONE.SKUGROUP
                                AND CLASSTOZONE.ZONE<>C_RZONE
                                AND SKU.SKU=C_SKU;
                            END;
                            ELSE
                            BEGIN
                                C_TOLOC:='UNKNOWN';
                                C_CONTINUE:=9;
                                
                                GOTO TOP4;
                            END;
                            END IF; 
                            

                            C_CONTINUE:=4;
                        END;
                        ELSE
                        BEGIN
                            C_INVQTY:=0;
                        END;
                        END IF;

                        --判断此商品在非第0区库存数为0
                        IF C_INVQTY<=0 THEN
                        BEGIN
                            C_PUTAWAYZONE:=C_RZONE;

                            --查找此商品在第0区的对应的走道
                                                        
                            SELECT MIN(CLASSTOZONE.AISLEWAY)
                            INTO C_AISLEWAY
                            FROM SKU,CLASSTOZONE
                            WHERE SKU.SKUGROUP=CLASSTOZONE.SKUGROUP
                            AND CLASSTOZONE.ZONE=C_RZONE;

                            C_CONTINUE:=4;
                        END;
                        END IF;

                    END;
                    END IF;

                    --非退货型主配单
                    IF C_CONTINUE=3 THEN
                    BEGIN
                        --查找此商品在非第0区的对应的入库区域
                        SELECT MIN(CLASSTOZONE.ZONE) INTO C_PUTAWAYZONE
                        FROM SKU,CLASSTOZONE
                        WHERE SKU.SKUGROUP=CLASSTOZONE.SKUGROUP
                        AND CLASSTOZONE.ZONE<>C_RZONE
                        AND SKU.STORERKEY=C_STORERKEY
                        AND SKU.SKU=C_SKU;

                        C_CONTINUE:=4;
                    END;
                    END IF;


                    --判断此主配单为一般主配类型

                    IF C_CONTINUE=4 THEN--找储位
                    BEGIN

                        --计算查找出此商品的单位体积
                        SELECT STDCUBE
                        INTO C_STDCUBE
                        FROM SKU WHERE STORERKEY=C_STORERKEY AND SKU=C_SKU;
                        
                        --计算得到此商品待上架数量的总体积
                        C_VOLUME_SKU:=C_STDCUBE*C_QTYRECEIVED;

                        --查找出此商品的条码
                        SELECT SUSR7 INTO C_SUSR7 FROM SKU WHERE STORERKEY=C_STORERKEY AND SKU=C_SKU;

                        IF C_TOLOC <>' 'THEN
                        BEGIN
                            GOTO TOP4;
                        END;
                        END IF;

                        --循环1，先找此区域中，已有此商品的所有储位
                        /*DECLARE CURSOR CURSOR_SKU IS
                        SELECT SKUXLOC.LOC,SUM(SKU.STDCUBE*SKUXLOC.QTY) QTY
                        FROM SKUXLOC,SKU,LOC
                        WHERE SKUXLOC.SKU=SKU.SKU
                        AND SKUXLOC.LOC=LOC.LOC
                        AND (LOC.LOCATIONHANDLING='0' OR LOC.LOCATIONHANDLING='1' OR LOC.LOCATIONHANDLING='9')
                        --AND SKU.STORERKEY=C_STORERKEY
                        AND LOC.PUTAWAYZONE=C_PUTAWAYZONE
                        AND SKUXLOC.SKU=C_SKU
                        AND SKUXLOC.QTY>0
                        AND LOC.LOCATIONFLAG='NONE'
                        GROUP BY SKUXLOC.LOC
                        ORDER BY QTY DESC;*/

                        DECLARE CURSOR CURSOR_SKU IS
                        SELECT LOC,SUM(QTY*STDCUBE) FROM (
                            SELECT SUM(B.QTY) QTY,A.LOC,B.SKU,C.STDCUBE FROM SKUXLOC B,SKU C,
                                (SELECT SKUXLOC.LOC
                                                        FROM SKUXLOC,LOC
                                                        WHERE SKUXLOC.SKU=C_SKU
                                                        AND SKUXLOC.LOC=LOC.LOC
                                                        AND SKUXLOC.QTY>0
                                                        AND LOCATIONFLAG='NONE'
                                                        AND LOC.LOC<>'PICKTO') A
                            WHERE A.LOC=B.LOC
                            AND B.QTY>0 
                            AND B.SKU=C.SKU
                            GROUP BY A.LOC,B.SKU,STDCUBE) 
                        GROUP BY LOC;

                        BEGIN
                            OPEN CURSOR_SKU;
                            FETCH CURSOR_SKU INTO C_LOC,C_VOLUME_SKU_1;
                            WHILE CURSOR_SKU%FOUND
                            LOOP
                                BEGIN
                                                
                                    --查找计算之前有计算到此储位的，并且尚未确认上架的体积
                                    SELECT SUM(SKU.STDCUBE*JOBSCONTEXT_XSO.DOC_WESQTY)
                                    INTO C_VOLUME_SKU_2
                                    FROM JOBSCONTEXT_XSO,SKU
                                    WHERE JOBSCONTEXT_XSO.STATUS<>'9'
                                    AND JOBSCONTEXT_XSO.DOC_SKU=SKU.SKU
                                    AND JOBSCONTEXT_XSO.DOC_LOC=C_LOC;
                                    
                                  

                                    IF C_VOLUME_SKU_1 IS NULL THEN
                                    BEGIN
                                        C_VOLUME_SKU_1:=0;
                                    END;
                                    END IF;

                                    IF C_VOLUME_SKU_2 IS NULL THEN
                                    BEGIN
                                        C_VOLUME_SKU_2:=0;
                                    END;
                                    END IF;

                                    SELECT CUBICCAPACITY  INTO C_CUBICCAPACITY  FROM LOC WHERE LOC=C_LOC;
                                    C_VOLUME_LOC:=C_CUBICCAPACITY ;--得到此储位的体积
                                    C_VOLUME_LOC:=(C_VOLUME_LOC-C_VOLUME_SKU_1-C_VOLUME_SKU_2); --得到此储位的剩余容量体积

                                    --判断此储位的空余体积是否可以容纳此商品待上架的体积容量
                                    IF C_VOLUME_LOC>=C_VOLUME_SKU THEN
                                    BEGIN
                                        C_TOLOC:=C_LOC;--可以容纳，则返回此储位
                                        C_CONTINUE:=1;
                                        EXIT;
                                    END;
                                    ELSE--不可以，则循环下一储位再做相应判断
                                    BEGIN
                                        C_TOLOC:=' ';
                                        C_CONTINUE:=9;
                                    END;
                                    END IF;

                                END;

                            FETCH CURSOR_SKU INTO C_LOC,C_VOLUME_SKU_1;
                            END LOOP;
                            CLOSE CURSOR_SKU;
                        END;


                        IF C_TOLOC <>' 'THEN
                        BEGIN
                            GOTO TOP4;
                        END;
                        END IF;

                        --循环2，找此区域中，相同版别的走道
                        DECLARE CURSOR CURSOR_AISLEWAY IS
                        SELECT DISTINCT SUBSTR(SKUXLOC.LOC,4,2) AISLEWAY
                        FROM SKUXLOC,SKU,LOC
                        WHERE SKUXLOC.SKU=SKU.SKU
                        AND SKUXLOC.LOC=LOC.LOC
                        AND (LOC.LOCATIONHANDLING='0' OR LOC.LOCATIONHANDLING='1' OR LOC.LOCATIONHANDLING='9')
                        --AND SKU.STORERKEY=C_STORERKEY
                        AND LOC.PUTAWAYZONE=C_PUTAWAYZONE
                        AND SKU.SUSR7=C_SUSR7
                        AND SKUXLOC.QTY>0;

                        BEGIN
                            OPEN CURSOR_AISLEWAY;
                            FETCH CURSOR_AISLEWAY INTO C_AISLEWAY;
                            WHILE CURSOR_AISLEWAY%FOUND
                            LOOP
                                BEGIN

                                    --查找出此商品的条码
                                    SELECT BARCODE INTO C_BARCODE FROM SKU WHERE STORERKEY=C_STORERKEY AND SKU=C_SKU;

                                    --定义游标，查询出相应条件的储位，并循环做判断
                                    DECLARE CURSOR CURSOR_1 IS
                                    
                                    SELECT LOC.LOC LOC,SKUXLOC.QTY QTY
                                    FROM LOC,SKUXLOC,SKU
                                    WHERE LOC.PUTAWAYZONE=C_PUTAWAYZONE
                                    AND (LOC.LOCATIONHANDLING='0' OR LOC.LOCATIONHANDLING='1' OR LOC.LOCATIONHANDLING='9')
                                    AND SUBSTR(LOC.LOC,4,2)=C_AISLEWAY
                                    AND SKUXLOC.LOC=LOC.LOC
                                    AND LOC.LOCATIONFLAG='NONE'
                                    AND SKUXLOC.SKU=SKU.SKU
                                    AND SKU.SUSR7=C_SUSR7
                                    AND LOC.LOC NOT IN(SELECT SKUXLOC.LOC FROM SKUXLOC,SKU
                                                                    WHERE SKUXLOC.SKU=SKU.SKU
                                                                    AND SKUXLOC.SKU<>C_SKU
                                                                    AND BARCODE=C_BARCODE)
                                    UNION
                                    SELECT LOC.LOC LOC,0 QTY
                                    FROM LOC
                                    WHERE LOC.PUTAWAYZONE=C_PUTAWAYZONE
                                    AND (LOC.LOCATIONHANDLING='0' OR LOC.LOCATIONHANDLING='1' OR LOC.LOCATIONHANDLING='9')
                                    AND SUBSTR(LOC.LOC,4,2)=C_AISLEWAY
                                    AND LOC.LOC NOT IN(SELECT SKUXLOC.LOC FROM SKUXLOC,SKU WHERE SKUXLOC.QTY>0)
                                    AND LOC.LOCATIONFLAG='NONE'
                                    ORDER BY QTY DESC ,LOC; 
                                    
                                    BEGIN
                                        OPEN CURSOR_1;
                                        FETCH CURSOR_1 INTO C_TOLOC,C_QTY;
                                        WHILE CURSOR_1%FOUND
                                        LOOP
                                        <<TOP>>
                                            BEGIN
                                                --计算得到此储位上已有库存的体积
                                                SELECT SUM(STDCUBE*QTY) 
                                                INTO C_VOLUME_SKU_1
                                                FROM (
                                                    SELECT SKUXLOC.SERIALKEY,SKU.STDCUBE,SKUXLOC.QTY
                                                    
                                                    FROM SKUXLOC,SKU
                                                    WHERE SKUXLOC.SKU=SKU.SKU
                                                    AND SKUXLOC.QTY>0
                                                    --AND SKUXLOC.STORERKEY=C_STORERKEY
                                                    AND SKUXLOC.LOC=C_TOLOC
                                                GROUP BY SKUXLOC.SERIALKEY,SKU.STDCUBE,SKUXLOC.QTY) A;

                                                --查找计算之前有计算到此储位的，并且尚未确认上架的体积
                                                SELECT SUM(SKU.STDCUBE*JOBSCONTEXT_XSO.DOC_WESQTY)
                                                INTO C_VOLUME_SKU_2
                                                FROM JOBSCONTEXT_XSO,SKU
                                                WHERE JOBSCONTEXT_XSO.STATUS<>'9'
                                                AND JOBSCONTEXT_XSO.DOC_SKU=SKU.SKU
                                                AND JOBSCONTEXT_XSO.DOC_LOC=C_TOLOC;
                                                
                                              

                                                IF C_VOLUME_SKU_1 IS NULL THEN
                                                BEGIN
                                                    C_VOLUME_SKU_1:=0;
                                                END;
                                                END IF;

                                                IF C_VOLUME_SKU_2 IS NULL THEN
                                                BEGIN
                                                    C_VOLUME_SKU_2:=0;
                                                END;
                                                END IF;

                                                SELECT CUBICCAPACITY INTO C_CUBICCAPACITY FROM LOC WHERE LOC=C_TOLOC;
                                                C_VOLUME_LOC:=C_CUBICCAPACITY;--得到此储位的体积
                                                C_VOLUME_LOC:=(C_VOLUME_LOC-C_VOLUME_SKU_1-C_VOLUME_SKU_2)*0.8; --得到此储位的剩余容量体积

                                                --判断此储位的空余体积是否可以容纳此商品待上架的体积容量
                                                IF C_VOLUME_LOC>=C_VOLUME_SKU THEN
                                                BEGIN
                                                    C_TOLOC:=C_TOLOC;--可以容纳，则返回此储位
                                                    C_CONTINUE:=1;
                                                    EXIT;
                                                END;
                                                ELSE--不可以，则循环下一储位再做相应判断
                                                BEGIN
                                                    C_TOLOC:=' ';
                                                    C_CONTINUE:=9;

                                                    --FETCH CURSOR_1 INTO C_TOLOC;
                                                    --GOTO TOP;
                                                END;
                                                END IF;

                                            END;
                                        FETCH CURSOR_1 INTO C_TOLOC,C_QTY;
                                        END LOOP;
                                        CLOSE CURSOR_1;
                                    END;


                                END;

                            FETCH CURSOR_AISLEWAY INTO C_AISLEWAY;
                            END LOOP;
                            CLOSE CURSOR_AISLEWAY;
                        END;




                        IF C_TOLOC <>' 'THEN
                        BEGIN
                            GOTO TOP4;
                        END;
                        END IF;

                        --循环3，找此区域中空储位
                        DECLARE CURSOR CURSOR_LOC IS
                        SELECT LOC.LOC
                        FROM LOC
                        WHERE LOC.PUTAWAYZONE=C_PUTAWAYZONE
                        AND LOC.LOC NOT IN(SELECT SKUXLOC.LOC FROM LOC,SKUXLOC WHERE LOC.LOC=SKUXLOC.LOC AND SKUXLOC.QTY>0)
                        AND (LOC.LOCATIONHANDLING='0' OR LOC.LOCATIONHANDLING='1' OR LOC.LOCATIONHANDLING='9')
                        AND LOC.LOCATIONFLAG='NONE';

                        BEGIN
                            OPEN CURSOR_LOC;
                            FETCH CURSOR_LOC INTO C_LOC;
                            WHILE CURSOR_LOC%FOUND
                            LOOP
                                BEGIN

                                    --计算得到此储位上已有库存的体积
                                    SELECT SUM(STDCUBE*QTY) 
                                    INTO C_VOLUME_SKU_1
                                    FROM (
                                        SELECT SKUXLOC.SERIALKEY,SKU.STDCUBE,SKUXLOC.QTY
                                                    
                                        FROM SKUXLOC,SKU
                                        WHERE SKUXLOC.SKU=SKU.SKU
                                        AND SKUXLOC.QTY>0
                                        --AND SKUXLOC.STORERKEY=C_STORERKEY
                                        AND SKUXLOC.LOC=C_TOLOC
                                    GROUP BY SKUXLOC.SERIALKEY,SKU.STDCUBE,SKUXLOC.QTY) A;


                                    --查找计算之前有计算到此储位的，并且尚未确认上架的体积
                                    SELECT SUM(SKU.STDCUBE*(JOBSCONTEXT_XSO.DOC_WESQTY - to_number(nvl(JOBSCONTEXT_XSO.DOC_susr5,'0'))))
                                    INTO C_VOLUME_SKU_2
                                    FROM JOBSCONTEXT_XSO,SKU
                                    WHERE JOBSCONTEXT_XSO.STATUS<>'11'
                                    AND JOBSCONTEXT_XSO.DOC_SKU=SKU.SKU
                                    AND JOBSCONTEXT_XSO.DOC_LOC=C_LOC;
                                  

                                    IF C_VOLUME_SKU_1 IS NULL THEN
                                    BEGIN
                                        C_VOLUME_SKU_1:=0;
                                    END;
                                    END IF;

                                    IF C_VOLUME_SKU_2 IS NULL THEN
                                    BEGIN
                                        C_VOLUME_SKU_2:=0;
                                    END;
                                    END IF;

                                    IF C_LOC <>' ' THEN
                                    BEGIN
                                        SELECT CUBICCAPACITY INTO C_CUBICCAPACITY FROM LOC WHERE LOC=C_LOC;
                                    END;
                                    END IF;
                                    C_VOLUME_LOC:=C_CUBICCAPACITY;--得到此储位的体积
                                    C_VOLUME_LOC:=(C_VOLUME_LOC-C_VOLUME_SKU_1-C_VOLUME_SKU_2)*0.8; --得到此储位的剩余容量体积

                                    --判断此储位的空余体积是否可以容纳此商品待上架的体积容量
                                    IF C_VOLUME_LOC>=C_VOLUME_SKU THEN
                                    BEGIN
                                        C_TOLOC:=C_LOC;--可以容纳，则返回此储位
                                        C_CONTINUE:=1;
                                        EXIT;
                                    END;
                                    ELSE--不可以，则循环下一储位再做相应判断
                                    BEGIN
                                        C_TOLOC:=' ';
                                        C_CONTINUE:=9;

                                    END;
                                    END IF;

                                END;

                            FETCH CURSOR_LOC INTO C_LOC;
                            END LOOP;
                            CLOSE CURSOR_LOC;
                        END;

                    END;
                    END IF;


                    IF C_CONTINUE=9 THEN
                    BEGIN

                        SELECT COUNT(1) INTO C_ROW FROM PUTAWAYZONE WHERE PUTAWAYZONE.PUTAWAYZONE=C_PUTAWAYZONE ;
                        IF C_ROW>0 THEN
                        BEGIN

                            SELECT PUTAWAYZONE.PUT_LOC INTO C_TOLOC FROM PUTAWAYZONE WHERE PUTAWAYZONE.PUTAWAYZONE=C_PUTAWAYZONE ;
                        END;
                        END IF;

                        IF C_TOLOC IS NULL OR C_TOLOC=' ' THEN
                        BEGIN
                            C_TOLOC:='UNKNOWN';
                        END;
                        END IF;
                    END;
                    END IF;

                    <<TOP4>>
                    IF (C_TOLOC IS NOT NULL OR C_TOLOC<>' ') THEN
                    BEGIN
                        UPDATE JOBSCONTEXT_XSO SET DOC_LOC=C_TOLOC WHERE DOC_NUMBER=C_EXTERNRECEIPTKEY AND DOC_SEQ=C_EXTERNLINENO;

                    END;
                    END IF;

                    SELECT COUNT(1) INTO C_ROW FROM LOC WHERE LOC=C_TOLOC;
                    IF C_ROW>0 THEN
                    BEGIN
                        SELECT EXPORTNO INTO X_EXPORTNO FROM LOC WHERE LOC=C_TOLOC;
                    END;
                    ELSE
                    BEGIN
                        X_EXPORTNO:=' ';
                    END;
                    END IF;

                    UPDATE JOBSCONTEXT_XSO SET DOC_EXPORTNO=X_EXPORTNO WHERE DOC_NUMBER=C_EXTERNRECEIPTKEY AND DOC_SEQ=C_EXTERNLINENO;

                END;
            FETCH CURSOR_RECEIPTDETAIL_PUTAWAY INTO C_EXTERNRECEIPTKEY,C_RECEIPTLINENUMBER,C_EXTERNLINENO,C_STORERKEY,C_SKU,C_PACKKEY,C_UOM,C_QTYRECEIVED,C_FROMLOC,C_FROMLOT,C_FROMID;
            END LOOP;
            CLOSE CURSOR_RECEIPTDETAIL_PUTAWAY;
        END;

        SELECT COUNT(DISTINCT LOC.PUTAWAYZONE) INTO C_AREAQTY FROM JOBSCONTEXT_XSO,LOC
        WHERE JOBSCONTEXT_XSO.DOC_LOC=LOC.LOC
        AND DOC_NUMBER=C_EXTERNRECEIPTKEY;

        UPDATE JOBS_XSO SET DOC_AREA_QTY=C_AREAQTY,STATUS='1' WHERE DOC_NUMBER=C_EXTERNRECEIPTKEY;

        C_CONTINUE:=1;
        COMMIT;

    END;
    END IF;


END;
/

prompt
prompt Creating procedure NSP_CAL_PICK_ROUTE
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE NSP_CAL_PICK_ROUTE(C_TYPE IN VARCHAR2,C_BOXNO IN VARCHAR2)
/**动态计算排序 分上架、拣货
**
**
*/
AS  

    C_LOGICALTOLOC          VARCHAR2(18);
    C_LOGICALFROMLOC        VARCHAR2(18);
    C_EXPORTNO              VARCHAR2(10);
    C_ROW                   NUMBER:=0;
    C_TOLOC                 VARCHAR2(10);
    C_CONSK                 VARCHAR2(10); 
    C_AISLEWAY              VARCHAR2(10):=' ';   
    LS_SORT                  VARCHAR(10) :='A';--记录排序字段 
    LL_COUNT                NUMBER :=0;
    LL_MAX_PUT              NUMBER :=0; 
    L_LINE                  NUMBER :=0;
    C_FROMLOC               VARCHAR2(10);
BEGIN        
    IF C_TYPE = 'PUTAWAY' THEN
    BEGIN
        /*
        **查找不同的走道号，按照走道号由小到大排序
        **按走道分别处理上架任务（按c_sort='A'按asc排序，c_sort=‘D’ 按desc排序）
        **计算上架动线编号（2位走道+8位流水号）逐个更新上架任务
        */
        --创建走道游标
        DECLARE CURSOR CUR_AISLEWAY
        IS
        SELECT DISTINCT SUBSTR(TOLOC,1,5)
        FROM TASKDETAIL
        WHERE (TASKTYPE='PP' OR TASKTYPE='PA') AND (STATUS='0' or STATUS='3') AND BOXNO=C_BOXNO
        ORDER BY SUBSTR(TOLOC,1,5);
         BEGIN 
            OPEN CUR_AISLEWAY;
            FETCH CUR_AISLEWAY INTO C_AISLEWAY;
            WHILE CUR_AISLEWAY%FOUND
            LOOP
                IF LS_SORT='A'THEN--A时按正序排序，其他倒序排列
                    BEGIN
                        L_LINE :=1;
                        DECLARE CURSOR CUR_TOLOC
                        IS
                        SELECT DISTINCT TOLOC
                        FROM TASKDETAIL
                        WHERE (TASKTYPE='PP' OR TASKTYPE='PA') AND (STATUS='0' or STATUS='3') AND BOXNO=C_BOXNO AND SUBSTR(TOLOC,1,5)=C_AISLEWAY
                        ORDER BY TOLOC ASC;
                        BEGIN
                            OPEN CUR_TOLOC;
                            FETCH CUR_TOLOC INTO C_TOLOC;
                            WHILE CUR_TOLOC%FOUND
                            LOOP
                                BEGIN
                                  UPDATE TASKDETAIL SET LOGICALTOLOC=C_AISLEWAY||LPAD(TO_CHAR(L_LINE),5,'0')  
                                  WHERE (TASKTYPE='PP' OR TASKTYPE='PA') AND BOXNO=C_BOXNO AND (STATUS='0' or STATUS='3') and toloc=C_TOLOC; 
                                END;
                                L_LINE :=L_LINE+1;
                                FETCH CUR_TOLOC INTO C_TOLOC;
                            END LOOP;
                            CLOSE CUR_TOLOC;
                          END;
                          --判断最后一个储位在高位还是低位，在高位排序值变为 D 低位
                           SELECT COUNT(DISTINCT SUBSTR(LOC,6,2)) INTO LL_COUNT
                           FROM LOC WHERE SUBSTR(LOC,1,5)=C_AISLEWAY;
                           IF LL_COUNT>=4 THEN--当货架小于4座时，无计算动线必要，下个区域默认 按 A排序 
                                SELECT TO_NUMBER(SUBSTR(C_TOLOC,6,2))*2
                                INTO LL_MAX_PUT
                                FROM DUAL;
                                -- FROM TASKDETAIL  
                                 -- WHERE (TASKTYPE='PP' OR TASKTYPE='PA') AND (STATUS='0' or STATUS='3') AND BOXNO=C_BOXNO AND SUBSTR(TOLOC,1,5)=C_AISLEWAY;
                                  IF LL_MAX_PUT >LL_COUNT THEN
                                    LS_SORT :='D';
                                  END IF;                                 
                           END IF;
                    END;
                 ELSE--否则倒序
                       BEGIN
                            L_LINE :=1;
                            DECLARE CURSOR CUR_TOLOC
                            IS
                            SELECT DISTINCT TOLOC
                            FROM TASKDETAIL
                            WHERE (TASKTYPE='PP' OR TASKTYPE='PA') AND (STATUS='0' or STATUS='3') AND BOXNO=C_BOXNO AND SUBSTR(TOLOC,1,5)=C_AISLEWAY
                            ORDER BY TOLOC DESC;
                            BEGIN
                                OPEN CUR_TOLOC;
                                FETCH CUR_TOLOC INTO C_TOLOC;
                                WHILE CUR_TOLOC%FOUND
                                LOOP
                                    BEGIN
                                      UPDATE TASKDETAIL SET LOGICALTOLOC=C_AISLEWAY||LPAD(TO_CHAR(L_LINE),5,'0')  
                                      WHERE (TASKTYPE='PP' OR TASKTYPE='PA') AND BOXNO=C_BOXNO AND (STATUS='0' or STATUS='3') and toloc=C_TOLOC; 
                                    END;
                                    L_LINE :=L_LINE+1;
                                    FETCH CUR_TOLOC INTO C_TOLOC;
                                END LOOP;
                                CLOSE CUR_TOLOC;
                              END;
                              --判断最后一个储位在高位还是低位，在高位排序值变为 D 低位
                           select count(distinct substr(loc,6,2)) into ll_count
                           from loc where SUBSTR(LOC,1,5)=C_AISLEWAY;
                           IF LL_COUNT>=4 THEN--当货架小于4座时，无计算动线必要，下个区域默认 按 A排序 
                                SELECT TO_NUMBER(SUBSTR(C_TOLOC,6,2))*2
                                INTO LL_MAX_PUT
                                FROM DUAL;
                                -- FROM TASKDETAIL  
                                --  WHERE (TASKTYPE='PP' OR TASKTYPE='PA') AND (STATUS='0' or STATUS='3') AND BOXNO=C_BOXNO AND SUBSTR(TOLOC,1,5)=C_AISLEWAY;
                                  IF LL_MAX_PUT <LL_COUNT THEN
                                    LS_SORT :='A';
                                    ELSE
                                    LS_SORT :='D';
                                  END IF;                                 
                           END IF;
                    END;
                END IF;
                FETCH CUR_AISLEWAY INTO C_AISLEWAY;
            END LOOP;
            CLOSE CUR_AISLEWAY;
          END ;
        END ;
     END IF;
        
    IF C_TYPE = 'PICK' THEN
       BEGIN
        /*
        **查找不同的走道号，按照走道号由小到大排序
        **按走道分别处理上架任务（按c_sort='A'按asc排序，c_sort=‘D’ 按desc排序）
        **计算上架动线编号（2位走道+8位流水号）逐个更新上架任务
        */
        --创建走道游标
        DECLARE CURSOR CUR_AISLEWAY
        IS
        SELECT DISTINCT SUBSTR(FROMLOC,1,5)
        FROM TASKDETAIL
        WHERE TASKTYPE='PK'  AND (STATUS='0' or STATUS='3') AND BOXNO=C_BOXNO
        ORDER BY SUBSTR(FROMLOC,1,5);
         BEGIN 
            OPEN CUR_AISLEWAY;
            FETCH CUR_AISLEWAY INTO C_AISLEWAY;
            WHILE CUR_AISLEWAY%FOUND
            LOOP
                IF LS_SORT='A'THEN--A时按正序排序，其他倒序排列
                    BEGIN
                        L_LINE :=1;
                        DECLARE CURSOR CUR_FROMLOC
                        IS
                        SELECT DISTINCT FROMLOC
                        FROM TASKDETAIL
                        WHERE TASKTYPE='PK' AND (STATUS='0' or STATUS='3') AND BOXNO=C_BOXNO AND SUBSTR(FROMLOC,1,5)=C_AISLEWAY
                        ORDER BY FROMLOC ASC;
                        BEGIN
                            OPEN CUR_FROMLOC;
                            FETCH CUR_FROMLOC INTO C_FROMLOC;
                            WHILE CUR_FROMLOC%FOUND
                            LOOP
                                BEGIN
                                  UPDATE TASKDETAIL SET LOGICALFROMLOC=C_AISLEWAY||LPAD(TO_CHAR(L_LINE),5,'0')  
                                  WHERE TASKTYPE='PK' AND BOXNO=C_BOXNO AND (STATUS='0' or STATUS='3') and FROMLOC=C_FROMLOC; 
                                END;
                                L_LINE :=L_LINE+1;
                                FETCH CUR_FROMLOC INTO C_FROMLOC;
                            END LOOP;
                            CLOSE CUR_FROMLOC;
                          END;
                          --判断最后一个储位在高位还是低位，在高位排序值变为 D 低位
                           SELECT COUNT(DISTINCT SUBSTR(LOC,6,2)) INTO LL_COUNT
                           FROM LOC WHERE SUBSTR(LOC,1,5)=C_AISLEWAY;
                           IF LL_COUNT>=4 THEN--当货架小于4座时，无计算动线必要，下个区域默认 按 A排序 
                                SELECT TO_NUMBER(SUBSTR(C_FROMLOC,6,2))*2
                                INTO LL_MAX_PUT
                                FROM DUAL;
                                -- FROM TASKDETAIL  
                                 -- WHERE TASKTYPE='PK' AND (STATUS='0' or STATUS='3') AND BOXNO=C_BOXNO AND SUBSTR(FROMLOC,1,5)=C_AISLEWAY;
                                  IF LL_MAX_PUT >LL_COUNT THEN
                                    LS_SORT :='D';
                                  END IF;                                 
                           END IF;
                    END;
                ELSE--否则倒序
                     BEGIN
                            L_LINE :=1;
                            DECLARE CURSOR CUR_FROMLOC
                            IS
                            SELECT DISTINCT FROMLOC
                            FROM TASKDETAIL
                            WHERE TASKTYPE='PK' AND (STATUS='0' or STATUS='3') AND BOXNO=C_BOXNO AND SUBSTR(FROMLOC,1,5)=C_AISLEWAY
                            ORDER BY FROMLOC DESC;
                            BEGIN
                                OPEN CUR_FROMLOC;
                                FETCH CUR_FROMLOC INTO C_FROMLOC;
                                WHILE CUR_FROMLOC%FOUND
                                LOOP
                                    BEGIN
                                      UPDATE TASKDETAIL SET LOGICALFROMLOC=C_AISLEWAY||LPAD(TO_CHAR(L_LINE),5,'0')  
                                      WHERE  BOXNO=C_BOXNO AND (STATUS='0' or STATUS='3') and FROMLOC=C_FROMLOC AND TASKTYPE='PK'; 
                                    END;
                                    L_LINE :=L_LINE+1;
                                    FETCH CUR_FROMLOC INTO C_FROMLOC;
                                END LOOP;
                                CLOSE CUR_FROMLOC;
                              END;
                              --判断最后一个储位在高位还是低位，在高位排序值变为 D 低位
                           select count(distinct substr(loc,6,2)) into ll_count
                           from loc where SUBSTR(LOC,1,5)=C_AISLEWAY;
                           IF LL_COUNT>=4 THEN--当货架小于4座时，无计算动线必要，下个区域默认 按 A排序 
                                SELECT TO_NUMBER(SUBSTR(C_FROMLOC,6,2))*2
                                INTO LL_MAX_PUT
                                FROM DUAL ;
                                 --FROM TASKDETAIL  
                                 -- WHERE TASKTYPE='PK' AND (STATUS='0' or STATUS='3') AND BOXNO=C_BOXNO AND SUBSTR(FROMLOC,1,5)=C_AISLEWAY;
                                  IF LL_MAX_PUT <LL_COUNT THEN
                                    LS_SORT :='A';
                                    ELSE
                                    LS_SORT :='D';
                                  END IF;                                 
                           END IF;
                    END;
                END IF;
                FETCH CUR_AISLEWAY INTO C_AISLEWAY;
            END LOOP;
            CLOSE CUR_AISLEWAY;
         END ;
      END ;
     END IF;  
    
END;
/

prompt
prompt Creating procedure NSP_CASEPICK
prompt ===============================
prompt
CREATE OR REPLACE PROCEDURE NSP_CASEPICK(C_BOXID_START IN VARCHAR2,C_BOXID_END IN VARCHAR2,C_PICKNO IN VARCHAR2,C_CASEID IN VARCHAR2,C_STORERKEY IN VARCHAR2,C_SKU IN VARCHAR2,L_QTY IN INT )
AS  
    C_PICKDETAILKEY         VARCHAR2(10);     
    L_PICKQTY               INT;     
	L_CASEQTY               INT;      
	C_LINENO                CHAR(5);    
	D_PRICE                 NUMBER(18,2);    
	D_DISCOUNT              NUMBER(18,2);
	C_DOC_TYPE              VARCHAR2(10);
	C_NOTES                 VARCHAR2(200);  
    C_ROW                   INT;  
       
BEGIN  
    DECLARE CURSOR PKDETAIL_CURSOR1 IS
    SELECT A.PICKDETAILKEY,A.QTY,NVL(C.CONFIRM_QTY,0),B.TYPE      
    FROM PICKDETAIL A,ORDERS B,PACK_CASE C    
    WHERE A.ORDERKEY = B.ORDERKEY  
          AND A.PICKDETAILKEY=C.PICKDETAILKEY
          AND C.BOXNO >= C_BOXID_START
          AND C.BOXNO <= C_BOXID_END
          AND A.STORERKEY = C_STORERKEY 
          AND A.SKU=C_SKU 
          AND A.STATUS = '5'      
    ORDER BY A.PICKDETAILKEY;
    
    BEGIN  
    	OPEN PKDETAIL_CURSOR1;
    	FETCH  PKDETAIL_CURSOR1 INTO C_PICKDETAILKEY,L_PICKQTY,L_CASEQTY,C_DOC_TYPE;
          
    	WHILE PKDETAIL_CURSOR1%FOUND
        LOOP
        	BEGIN
        		IF L_QTY <= 0 THEN
            		BEGIN
            			RETURN;
            		END;
                END IF;
      
        		IF L_PICKQTY - L_CASEQTY > 0 AND L_PICKQTY - L_CASEQTY >= L_QTY THEN
            		BEGIN
                    
                    SELECT COUNT(1) INTO C_ROW FROM CASEDETAIL WHERE CASEID = C_CASEID AND PICKDETAILKEY =C_PICKDETAILKEY AND STORERKEY =C_STORERKEY AND SKU = C_SKU; 
            			IF (C_ROW>0) THEN
                			BEGIN

                				UPDATE CASEDETAIL SET QTY = QTY + L_QTY ,EDITWHO = USER,EDITDATE = SYSDATE--,ITEMCOUNT=L_ITEMCOUNT--LIUWEI ADD 2010-11-15      
                				WHERE CASEID = C_CASEID AND PICKDETAILKEY =C_PICKDETAILKEY AND STORERKEY =C_STORERKEY AND SKU = C_SKU;

                			END;
            			ELSE
                			BEGIN
                        
                                SELECT MAX(TO_CHAR(TO_NUMBER(LINENUMBER)+1))INTO C_LINENO FROM CASEDETAIL WHERE CASEID = C_CASEID;         
                                IF (C_LINENO IS NULL) OR (C_LINENO ='') THEN
                                    C_LINENO:=1;
                                    
                                END IF;
                                C_LINENO:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(C_LINENO))),-5);
                                            
                                SELECT B.NOTES INTO C_NOTES FROM PICKDETAIL A,ORDERDETAIL B WHERE A.ORDERKEY = B.ORDERKEY AND A.ORDERLINENUMBER = B.ORDERLINENUMBER AND PICKDETAILKEY = C_PICKDETAILKEY;  

                				INSERT INTO CASEDETAIL(FROMTABLE,FROMTYPE,TYPE,DOC_NUMBER,CASEID,LINENUMBER,PICKDETAILKEY,STORERKEY,SKU,QTY,PRICE,ADDDATE,ADDWHO,EDITDATE,EDITWHO,DISCOUNT) --LIUWEI ADD 2010-11-15     
                				VALUES ('PACK_CASE','0','0',C_PICKNO,C_CASEID,C_LINENO,C_PICKDETAILKEY,C_STORERKEY,C_SKU,L_QTY,D_PRICE,SYSDATE,USER,SYSDATE,USER,D_DISCOUNT);  --LIUWEI ADD 2010-11-15     
                			END;
                        END IF;
        
            			UPDATE PACK_CASE SET CONFIRM_QTY = L_CASEQTY + L_QTY WHERE PICKDETAILKEY = C_PICKDETAILKEY;      
			  
            			--L_QTY:=0;
            		END;
                END IF;
	        
        		IF L_PICKQTY - L_CASEQTY > 0 AND L_PICKQTY - L_CASEQTY < L_QTY THEN  
            		BEGIN      
            			SELECT COUNT(1) INTO C_ROW FROM CASEDETAIL WHERE CASEID = C_CASEID AND PICKDETAILKEY =C_PICKDETAILKEY AND STORERKEY =C_STORERKEY AND SKU = C_SKU; 
            			IF (C_ROW>0) THEN
                            BEGIN      
                				UPDATE CASEDETAIL SET QTY = QTY + L_PICKQTY - L_CASEQTY ,EDITWHO = USER,EDITDATE = SYSDATE--,ITEMCOUNT=L_ITEMCOUNT--LIUWEI ADD 2010-11-15      
                				WHERE CASEID = C_CASEID AND PICKDETAILKEY =C_PICKDETAILKEY AND STORERKEY =C_STORERKEY AND SKU = C_SKU;
			      
                			END;      
            			ELSE      
                			BEGIN      
                				SELECT MAX(TO_CHAR(TO_NUMBER(LINENUMBER)+1))INTO C_LINENO FROM CASEDETAIL WHERE CASEID = C_CASEID;         
                                IF (C_LINENO IS NULL) OR (C_LINENO ='') THEN
                                    C_LINENO:=1;
                                    
                                END IF;
                                C_LINENO:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(C_LINENO))),-5);
                                
                				SELECT B.NOTES INTO C_NOTES FROM PICKDETAIL A,ORDERDETAIL B WHERE A.ORDERKEY = B.ORDERKEY AND A.ORDERLINENUMBER = B.ORDERLINENUMBER AND PICKDETAILKEY = C_PICKDETAILKEY;
				        
                				INSERT INTO CASEDETAIL(FROMTABLE,FROMTYPE,TYPE,DOC_NUMBER,CASEID,LINENUMBER,PICKDETAILKEY,STORERKEY,SKU,QTY,PRICE,ADDDATE,ADDWHO,EDITDATE,EDITWHO,DISCOUNT)--LIUWEI ADD 2010-11-15     
                				VALUES ('PACK_CASE','0','0',C_PICKNO,C_CASEID,C_LINENO,C_PICKDETAILKEY,C_STORERKEY,C_SKU,L_PICKQTY - L_CASEQTY,D_PRICE,SYSDATE,USER,SYSDATE,USER,D_DISCOUNT);  --LIUWEI ADD 2010-11-15        
			       
                			END;
                        END IF;
                    END;
                END IF;
		     
        		UPDATE PACK_CASE SET CONFIRM_QTY = L_CASEQTY + L_QTY WHERE PICKDETAILKEY = C_PICKDETAILKEY;      
		  
        		--L_QTY := L_QTY - L_PICKQTY + L_CASEQTY; 

        	END;      

        		FETCH PKDETAIL_CURSOR1 INTO C_PICKDETAILKEY,L_PICKQTY,L_CASEQTY,C_DOC_TYPE;      
        	
        END LOOP;
    	CLOSE PKDETAIL_CURSOR1;
    END;
       
END;
/

prompt
prompt Creating procedure NSP_CASEPICK_ALL
prompt ===================================
prompt
CREATE OR REPLACE PROCEDURE NSP_CASEPICK_ALL(C_BOXID_START IN VARCHAR2,C_BOXID_END IN VARCHAR2,C_PICKNO IN VARCHAR2,C_CASEID IN VARCHAR2,C_STORERKEY IN VARCHAR2)
AS  
    C_PICKDETAILKEY         VARCHAR2(10);     
    L_PICKQTY               INT;     
    L_CASEQTY               INT;      
    C_LINENO                CHAR(5);    
    D_PRICE                 NUMBER(18,2);    
    D_DISCOUNT              NUMBER(18,2);
    C_DOC_TYPE              VARCHAR2(10);
    C_NOTES                 VARCHAR2(200);  
    C_ROW                   INT;  
    C_SKU                   VARCHAR2(30);
    L_QTY                   INT;
       
BEGIN  
    DECLARE CURSOR PKDETAIL_CURSOR1 IS
    SELECT A.PICKDETAILKEY,A.QTY,NVL(C.CONFIRM_QTY,0),B.TYPE,C.SKU     
    FROM PICKDETAIL A,ORDERS B,PACK_CASE C    
    WHERE A.ORDERKEY = B.ORDERKEY  
          AND A.PICKDETAILKEY=C.PICKDETAILKEY
          AND C.BOXNO >= C_BOXID_START
          AND C.BOXNO <= C_BOXID_END
          AND A.STORERKEY = C_STORERKEY 
          AND A.STATUS = '5'      
    ORDER BY A.PICKDETAILKEY;
    
    BEGIN  
        OPEN PKDETAIL_CURSOR1;
        FETCH  PKDETAIL_CURSOR1 INTO C_PICKDETAILKEY,L_PICKQTY,L_CASEQTY,C_DOC_TYPE,C_SKU;
          
        WHILE PKDETAIL_CURSOR1%FOUND
        LOOP
            BEGIN
            
                L_QTY:=L_PICKQTY - L_CASEQTY;
            
                IF L_QTY <= 0 THEN
                    BEGIN
                        RETURN;
                    END;
                END IF;
      
                IF L_PICKQTY - L_CASEQTY > 0 AND L_PICKQTY - L_CASEQTY >= L_QTY THEN
                    BEGIN
                    
                    SELECT COUNT(1) INTO C_ROW FROM CASEDETAIL WHERE CASEID = C_CASEID AND PICKDETAILKEY =C_PICKDETAILKEY AND STORERKEY =C_STORERKEY AND SKU = C_SKU; 
                        IF (C_ROW>0) THEN
                            BEGIN

                                UPDATE CASEDETAIL SET QTY = QTY + L_QTY ,EDITWHO = USER,EDITDATE = SYSDATE--,ITEMCOUNT=L_ITEMCOUNT--LIUWEI ADD 2010-11-15      
                                WHERE CASEID = C_CASEID AND PICKDETAILKEY =C_PICKDETAILKEY AND STORERKEY =C_STORERKEY AND SKU = C_SKU;

                            END;
                        ELSE
                            BEGIN
                        
                                SELECT MAX(TO_CHAR(TO_NUMBER(LINENUMBER)+1))INTO C_LINENO FROM CASEDETAIL WHERE CASEID = C_CASEID;         
                                IF (C_LINENO IS NULL) OR (C_LINENO ='') THEN
                                    C_LINENO:=1;
                                    
                                END IF;
                                C_LINENO:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(C_LINENO))),-5);
                                            
                                SELECT B.NOTES INTO C_NOTES FROM PICKDETAIL A,ORDERDETAIL B WHERE A.ORDERKEY = B.ORDERKEY AND A.ORDERLINENUMBER = B.ORDERLINENUMBER AND PICKDETAILKEY = C_PICKDETAILKEY;  

                                INSERT INTO CASEDETAIL(FROMTABLE,FROMTYPE,TYPE,DOC_NUMBER,CASEID,LINENUMBER,PICKDETAILKEY,STORERKEY,SKU,QTY,PRICE,ADDDATE,ADDWHO,EDITDATE,EDITWHO,DISCOUNT) --LIUWEI ADD 2010-11-15     
                                VALUES ('PACK_CASE','0','0',C_PICKNO,C_CASEID,C_LINENO,C_PICKDETAILKEY,C_STORERKEY,C_SKU,L_QTY,D_PRICE,SYSDATE,USER,SYSDATE,USER,D_DISCOUNT);  --LIUWEI ADD 2010-11-15     
                            END;
                        END IF;
        
                        UPDATE PACK_CASE SET CONFIRM_QTY = L_CASEQTY + L_QTY WHERE PICKDETAILKEY = C_PICKDETAILKEY;      
              
                        --L_QTY:=0;
                    END;
                END IF;
            
                IF L_PICKQTY - L_CASEQTY > 0 AND L_PICKQTY - L_CASEQTY < L_QTY THEN  
                    BEGIN      
                        SELECT COUNT(1) INTO C_ROW FROM CASEDETAIL WHERE CASEID = C_CASEID AND PICKDETAILKEY =C_PICKDETAILKEY AND STORERKEY =C_STORERKEY AND SKU = C_SKU; 
                        IF (C_ROW>0) THEN
                            BEGIN      
                                UPDATE CASEDETAIL SET QTY = QTY + L_PICKQTY - L_CASEQTY ,EDITWHO = USER,EDITDATE = SYSDATE--,ITEMCOUNT=L_ITEMCOUNT--LIUWEI ADD 2010-11-15      
                                WHERE CASEID = C_CASEID AND PICKDETAILKEY =C_PICKDETAILKEY AND STORERKEY =C_STORERKEY AND SKU = C_SKU;
                  
                            END;      
                        ELSE      
                            BEGIN      
                                SELECT MAX(TO_CHAR(TO_NUMBER(LINENUMBER)+1))INTO C_LINENO FROM CASEDETAIL WHERE CASEID = C_CASEID;         
                                IF (C_LINENO IS NULL) OR (C_LINENO ='') THEN
                                    C_LINENO:=1;
                                    
                                END IF;
                                C_LINENO:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(C_LINENO))),-5);
                                
                                SELECT B.NOTES INTO C_NOTES FROM PICKDETAIL A,ORDERDETAIL B WHERE A.ORDERKEY = B.ORDERKEY AND A.ORDERLINENUMBER = B.ORDERLINENUMBER AND PICKDETAILKEY = C_PICKDETAILKEY;
                        
                                INSERT INTO CASEDETAIL(FROMTABLE,FROMTYPE,TYPE,DOC_NUMBER,CASEID,LINENUMBER,PICKDETAILKEY,STORERKEY,SKU,QTY,PRICE,ADDDATE,ADDWHO,EDITDATE,EDITWHO,DISCOUNT)--LIUWEI ADD 2010-11-15     
                                VALUES ('PACK_CASE','0','0',C_PICKNO,C_CASEID,C_LINENO,C_PICKDETAILKEY,C_STORERKEY,C_SKU,L_PICKQTY - L_CASEQTY,D_PRICE,SYSDATE,USER,SYSDATE,USER,D_DISCOUNT);  --LIUWEI ADD 2010-11-15        
                   
                            END;
                        END IF;
                    END;
                END IF;
             
                UPDATE PACK_CASE SET CONFIRM_QTY = L_CASEQTY + L_QTY WHERE PICKDETAILKEY = C_PICKDETAILKEY;      
          
                --L_QTY := L_QTY - L_PICKQTY + L_CASEQTY; 

            END;      

                FETCH PKDETAIL_CURSOR1 INTO C_PICKDETAILKEY,L_PICKQTY,L_CASEQTY,C_DOC_TYPE,C_SKU;     
            
        END LOOP;
        CLOSE PKDETAIL_CURSOR1;
    END;
       
END;
/

prompt
prompt Creating procedure NSP_CHECKBOXNO
prompt =================================
prompt
create or replace procedure NSP_CHECKBOXNO(V_BOXNO in varchar2,V_TYPE in varchar2,
p_message out varchar2 , v_retrun out varchar2) is
V_COUNT number :=0;
begin
  --参数说明 V_BOXNO：“传入的箱号”；V_TYPE：“传入的类型 0，验证箱子是否存在；1，修改箱子为使用状态；2，释放箱子状态”；
  --p_message：“返回的消息”；v_retrun：“返回的成功与否的信息 true or false”。2011-11-27
   v_retrun := 'false';
  --首先根据周转箱号查询是否有该箱号
  select count(1) into V_COUNT
        from box b
       where b.boxno = V_BOXNO ;
       if(V_COUNT=0) then
        p_message := '无该箱号';
         RETURN;
      end if;
      -- 若传入 V_TYPE = '0'即查找箱号 状态为0判断是否可以使用该箱
        if(v_count>0 and V_TYPE = '0') then
           select nvl(count(1),0) into V_COUNT
          from box b
            where b.boxno = V_BOXNO and b.status = '0';
           if(V_COUNT>0) then
              p_message := '该箱号存在';
              v_retrun := 'true';
               RETURN;
           end if;
            p_message := '该箱号不存在';
      end if;
      -- 若传入 V_TYPE = '1' 状态为1 则查找状态为‘0’箱子，修改为在使用中
        if(v_count>0 and V_TYPE = '1') then
           select count(1) into V_COUNT
          from box b
            where b.boxno = V_BOXNO and b.status = '0';
           if(V_COUNT>0) then
             update box set status='1' where boxno=V_BOXNO and status='0';
              p_message := '该箱号可用';
              v_retrun := 'true';
               RETURN;
           end if;
           p_message := '该箱号正在使用，请换箱号';
      end if;
      -- 若传入 V_TYPE = '2' 状态为2 则查找状态为‘1’箱子，则释放该箱子，修改为0
        if(v_count>0 and V_TYPE = '2') then
           select count(1) into V_COUNT
          from box b
            where b.boxno = V_BOXNO and b.status = '1';
           if(V_COUNT>0) then
             update box set status='0' where boxno=V_BOXNO and status='1';
              p_message := '该箱号释放成功';
              v_retrun := 'true';
               RETURN;
           end if;
           p_message := '该箱号释放失败';
      end if;
end NSP_CHECKBOXNO;
/

prompt
prompt Creating procedure NSP_CREATEORDERSPICKNO
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE NSP_CREATEORDERSPICKNO(C_ORDERKEY IN VARCHAR2,C_TYPE IN VARCHAR2)
/**
'PICKNOTYPE','0','按单据'   '1','按客户'  '2','按货品' 
当PICKNOTYPE=0 or 1时直接根据订单号 更新拣货流水号
***/  
AS  

    C_WAVEKEY               VARCHAR2(10);      
    C_PUTAWAYZONE           VARCHAR2(10);      
    C_PICKNO                VARCHAR2(10);
    C_SKU                   VARCHAR2(30);      
    B_SUCCESS               NUMBER:=0;      
    N_ERR                   NUMBER:=0;      
    C_ERRMSG                VARCHAR2(250);     
    C_CONSIGNEEKEY          VARCHAR2(15);    
    C_STATUS                VARCHAR2(10);    
    C_PRIORITY              VARCHAR2(10);  
    C_STORERKEY             VARCHAR2(15);
    C_ORDERTYPE             VARCHAR2(10);
    C_PICKZONE              VARCHAR2(10);
    C_KEYCOUNT              VARCHAR2(10);
    C_ORDERKEY_VAR          VARCHAR2(10);
    C_ROW                   NUMBER:=0;
    C_PICKGRPTYPE           VARCHAR2(10);
    
          
BEGIN        
    SELECT STORERKEY ,NVL(PICKGRPTYPE,'0') INTO C_STORERKEY,C_PICKGRPTYPE  FROM ORDERS WHERE ORDERKEY = C_ORDERKEY;  

    IF C_STORERKEY IS NULL OR C_STORERKEY = '' THEN 
        C_STORERKEY := 'JXXH';
    END IF;  

    IF C_TYPE = 'A' THEN --全区拣货
    BEGIN
        --当产生拣货类型为按订单或客户号时
        IF C_PICKGRPTYPE=0 OR  C_PICKGRPTYPE=1 THEN
            BEGIN
                nsp_getkey('PICKNO',10 ,C_PICKNO );
                UPDATE PICKDETAIL SET PICKNO = C_PICKNO WHERE ORDERKEY =C_ORDERKEY;
            END ;
        END IF;
        /*** 
        --PICKGRPTYPE='0'
        DECLARE CURSOR PKDETAIL_CURSOR1 IS  
        SELECT A.ORDERKEY        
        FROM PICKDETAIL A,LOC B,ORDERS C       
        WHERE A.LOC = B.LOC 
        AND A.ORDERKEY = C.ORDERKEY 
        AND A.ORDERKEY = C_ORDERKEY 
        AND C.PICKGRPTYPE='0'
        AND  (A.PICKNO = '' OR A.PICKNO = ' ' OR A.PICKNO IS  NULL)    
        GROUP BY A.ORDERKEY    
        ORDER BY A.ORDERKEY;
        
        BEGIN  

            OPEN PKDETAIL_CURSOR1;       
            FETCH PKDETAIL_CURSOR1 INTO C_ORDERKEY_VAR;      
            WHILE PKDETAIL_CURSOR1%FOUND
            LOOP      
                BEGIN      
        
                    SELECT COUNT(1) INTO C_ROW FROM NCOUNTER WHERE KEYNAME='PICKGRPNO';
                    IF (C_ROW=0 OR C_ROW IS NULL) THEN
                        INSERT INTO NCOUNTER(KEYNAME,KEYCOUNT)VALUES('PICKGRPNO',1);
                        --COMMIT;
                    END IF;
            
                    SELECT KEYCOUNT INTO C_KEYCOUNT FROM NCOUNTER WHERE KEYNAME='PICKGRPNO';
                    C_KEYCOUNT:=C_KEYCOUNT+1;
                    UPDATE NCOUNTER SET KEYCOUNT=C_KEYCOUNT WHERE KEYNAME='PICKGRPNO';
                    --COMMIT;
                  
                    C_PICKNO:=SUBSTR(CONCAT('000000000',TRIM(TO_CHAR(C_KEYCOUNT))),-10);
    
                    UPDATE PICKDETAIL SET PICKNO = C_PICKNO WHERE ORDERKEY = C_ORDERKEY_VAR;
                    --COMMIT; 

                    FETCH PKDETAIL_CURSOR1 INTO C_ORDERKEY_VAR;  
                END;
            END LOOP;      
            CLOSE PKDETAIL_CURSOR1;       
        END;
        
        
        --PICKGRPTYPE='1'
        DECLARE CURSOR PKDETAIL_CURSOR1 IS  
        SELECT C.CONSIGNEEKEY         
        FROM PICKDETAIL A,LOC B,ORDERS C       
        WHERE A.LOC = B.LOC 
        AND A.ORDERKEY = C.ORDERKEY 
        AND A.ORDERKEY = C_ORDERKEY
        AND C.PICKGRPTYPE='1'
        AND  (A.PICKNO = '' OR A.PICKNO = ' ' OR A.PICKNO IS  NULL)   
        GROUP BY C.CONSIGNEEKEY     
        ORDER BY C.CONSIGNEEKEY;  
        
        BEGIN  
            
            OPEN PKDETAIL_CURSOR1;       
            FETCH PKDETAIL_CURSOR1 INTO C_CONSIGNEEKEY;      
            WHILE PKDETAIL_CURSOR1%FOUND
            LOOP      
                BEGIN      
        
                    SELECT COUNT(1) INTO C_ROW FROM NCOUNTER WHERE KEYNAME='PICKGRPNO';
                    IF (C_ROW=0 OR C_ROW IS NULL) THEN
                        INSERT INTO NCOUNTER(KEYNAME,KEYCOUNT)VALUES('PICKGRPNO',1);
                        --COMMIT;
                    END IF;
            
                    SELECT KEYCOUNT INTO C_KEYCOUNT FROM NCOUNTER WHERE KEYNAME='PICKGRPNO';
                    C_KEYCOUNT:=C_KEYCOUNT+1;
                    UPDATE NCOUNTER SET KEYCOUNT=C_KEYCOUNT WHERE KEYNAME='PICKGRPNO';
                    --COMMIT;
                  
                    C_PICKNO:=SUBSTR(CONCAT('000000000',TRIM(TO_CHAR(C_KEYCOUNT))),-10);
    
                    UPDATE PICKDETAIL SET PICKNO = C_PICKNO WHERE ORDERKEY = C_ORDERKEY;
                    --COMMIT; 
                    
                                                    
                    FETCH PKDETAIL_CURSOR1 INTO C_CONSIGNEEKEY;  
                END;
            END LOOP;      
            CLOSE PKDETAIL_CURSOR1;       
        END;
       **/ 
        --PICKGRPTYPE='2'
        IF C_PICKGRPTYPE='2' THEN
            /* MORRIS 20111219 DELETE
            DECLARE CURSOR PKDETAIL_CURSOR1 IS  
            SELECT A.SKU        
            FROM PICKDETAIL A,LOC B,ORDERS C       
            WHERE A.LOC = B.LOC 
            AND A.ORDERKEY = C.ORDERKEY 
            AND A.ORDERKEY = C_ORDERKEY
            AND C.PICKGRPTYPE='2'
            --AND  (A.PICKNO = '' OR A.PICKNO = ' ' OR A.PICKNO IS  NULL)    
            GROUP BY A.SKU     
            ORDER BY A.SKU;  
            **/
            DECLARE CURSOR PKDETAIL_CURSOR1 IS 
            SELECT DISTINCT SKU
            FROM PICKDETAIL
            WHERE  ORDERKEY =C_ORDERKEY AND (STATUS='0' OR STATUS='1')
            GROUP BY SKU;
            BEGIN  

                OPEN PKDETAIL_CURSOR1;       
                FETCH PKDETAIL_CURSOR1 INTO C_SKU;      
                WHILE PKDETAIL_CURSOR1%FOUND
                LOOP      
                    BEGIN      
                        --MORRIS 20111219 MODIFY  ADD SKU=C_SKU
                        nsp_getkey('PICKNO',10 ,C_PICKNO );
                        UPDATE PICKDETAIL SET PICKNO = C_PICKNO WHERE ORDERKEY = C_ORDERKEY AND SKU=C_SKU AND (STATUS='0' OR STATUS='1');
                        --COMMIT; 
                        FETCH PKDETAIL_CURSOR1 INTO C_SKU;  
                    END;
                END LOOP;      
                CLOSE PKDETAIL_CURSOR1;       
            END;  
          END IF;      --IF C_PICKGRPTYPE='2' THEN       
        
        COMMIT;
        
    END;     
    END IF;  

    IF C_TYPE = 'B' THEN --分配拣货
        BEGIN
            IF (C_PICKGRPTYPE='0' OR C_PICKGRPTYPE='1') THEN
                BEGIN
                    DECLARE CURSOR PKDETAIL_CURSOR1 IS  
                    SELECT DISTINCT B.PUTAWAYZONE      
                    FROM PICKDETAIL A,LOC B       
                    WHERE A.LOC = B.LOC  
                    AND   A.ORDERKEY =C_ORDERKEY AND (A.STATUS='0' OR A.STATUS='1')
                    ORDER BY B.PUTAWAYZONE; 
                    BEGIN  

                    OPEN PKDETAIL_CURSOR1;       
                    FETCH PKDETAIL_CURSOR1 INTO C_PUTAWAYZONE;      
                    WHILE PKDETAIL_CURSOR1%FOUND
                    LOOP      
                        BEGIN      
        
                            nsp_getkey('PICKNO',10 ,C_PICKNO );
    
                            UPDATE PICKDETAIL SET PICKNO = C_PICKNO 
                            WHERE ORDERKEY = C_ORDERKEY AND 
                            LOC IN(SELECT LOC FROM LOC WHERE PUTAWAYZONE=C_PUTAWAYZONE) AND (STATUS='0' OR STATUS='1') ;
                            --COMMIT; 

                            FETCH PKDETAIL_CURSOR1 INTO C_PUTAWAYZONE;        
                        END;      
                    END LOOP;      
                    CLOSE PKDETAIL_CURSOR1;       
                END;
                END;
             END IF;
          IF C_PICKGRPTYPE='2' THEN
                BEGIN
                    DECLARE CURSOR PKDETAIL_CURSOR1 IS    
                    SELECT DISTINCT A.SKU, B.PUTAWAYZONE      
                    FROM PICKDETAIL A,LOC B       
                    WHERE A.LOC = B.LOC  
                    AND   A.ORDERKEY =C_ORDERKEY AND  (A.STATUS='0' OR A.STATUS='1')
                    ORDER BY  A.SKU,B.PUTAWAYZONE; 
                     BEGIN  

                        OPEN PKDETAIL_CURSOR1;       
                        FETCH PKDETAIL_CURSOR1 INTO C_SKU,C_PUTAWAYZONE;      
                        WHILE PKDETAIL_CURSOR1%FOUND
                        LOOP      
                            BEGIN      
        
                                nsp_getkey('PICKNO',10 ,C_PICKNO );
    
                                UPDATE PICKDETAIL SET PICKNO = C_PICKNO 
                                WHERE ORDERKEY = C_ORDERKEY
                                AND SKU=C_SKU
                                AND LOC IN(SELECT LOC FROM LOC WHERE PUTAWAYZONE=C_PUTAWAYZONE)
                                AND (STATUS='0' OR STATUS='1') ;
                                --COMMIT; 

                                FETCH PKDETAIL_CURSOR1 INTO C_SKU,C_PUTAWAYZONE;  
                            END;      
                        END LOOP;      
                        CLOSE PKDETAIL_CURSOR1;  
                     END;     
                END;
         END IF;
        
         COMMIT;
        END;     
    END IF;    
    
END;
/

prompt
prompt Creating procedure NSP_CREATEWAVEPICKNO
prompt =======================================
prompt
CREATE OR REPLACE PROCEDURE NSP_CREATEWAVEPICKNO(C_WAVEKEY IN VARCHAR2,C_TYPE IN VARCHAR2)
/**
'PICKNOTYPE','0','按单据'   '1','按客户'  '2','按货品' 
当PICKNOTYPE=0 查询波次中不同的订单，根据订单号更新拣货流水号
当PICKNOTYPE=2 查询波次中不同的客户，根据客户号更新拣货流水号
当PICKNOTYPE=0 查询波次中不同的商品，根据商品号更新拣货流水号
***/  
AS  

    C_ORDERKEY              VARCHAR2(10);      
    C_PUTAWAYZONE           VARCHAR2(10);      
    C_PICKNO                VARCHAR2(10);
    C_SKU                   VARCHAR2(30);      
    B_SUCCESS               NUMBER:=0;      
    N_ERR                   NUMBER:=0;      
    C_ERRMSG                VARCHAR2(250);     
    C_CONSIGNEEKEY          VARCHAR2(15);    
    C_STATUS                VARCHAR2(10);    
    C_PRIORITY              VARCHAR2(10);  
    C_STORERKEY             VARCHAR2(15);
    C_ORDERTYPE             VARCHAR2(10);
    C_PICKZONE              VARCHAR2(10);
    C_KEYCOUNT              VARCHAR2(10);
    C_ORDERKEY_VAR          VARCHAR2(10);
    C_ROW                   NUMBER:=0;
    
          
BEGIN        
 
    IF C_TYPE = 'A' THEN --全区拣货
    BEGIN
        --查询需要按订单号更新拣货流水号的订单
        --PICKGRPTYPE='0'
        DECLARE CURSOR PKDETAIL_CURSOR1 IS  
        SELECT DISTINCT A.ORDERKEY        
        FROM PICKDETAIL A,LOC B,ORDERS C       
        WHERE A.LOC = B.LOC 
        AND A.ORDERKEY = C.ORDERKEY 
        AND A.WAVEKEY=C_WAVEKEY
        AND C.PICKGRPTYPE='0'
        AND  (PICKNO = '' OR PICKNO IS  NULL)    
        GROUP BY A.ORDERKEY    
        ORDER BY A.ORDERKEY;
        
        BEGIN  

            OPEN PKDETAIL_CURSOR1;       
            FETCH PKDETAIL_CURSOR1 INTO C_ORDERKEY_VAR;      
            WHILE PKDETAIL_CURSOR1%FOUND
            LOOP      
                BEGIN      
                    nsp_getkey('PICKNO',10 ,C_PICKNO );
                    UPDATE PICKDETAIL SET PICKNO = C_PICKNO WHERE WAVEKEY=C_WAVEKEY AND ORDERKEY = C_ORDERKEY_VAR;
                    --COMMIT; 

                    FETCH PKDETAIL_CURSOR1 INTO C_ORDERKEY_VAR;  
                END;
            END LOOP;      
            CLOSE PKDETAIL_CURSOR1;       
        END;
        
        
        --PICKGRPTYPE='1'
        DECLARE CURSOR PKDETAIL_CURSOR1 IS  
        SELECT DISTINCT  C.CONSIGNEEKEY         
        FROM PICKDETAIL A,LOC B,ORDERS C       
        WHERE A.LOC = B.LOC 
        AND A.ORDERKEY = C.ORDERKEY 
        AND A.WAVEKEY = C_WAVEKEY
        AND C.PICKGRPTYPE='1'
        AND  (PICKNO = '' OR PICKNO IS  NULL)    
        GROUP BY C.CONSIGNEEKEY     
        ORDER BY C.CONSIGNEEKEY;  
        
        BEGIN  
            
            OPEN PKDETAIL_CURSOR1;       
            FETCH PKDETAIL_CURSOR1 INTO C_CONSIGNEEKEY;      
            WHILE PKDETAIL_CURSOR1%FOUND
            LOOP      
                BEGIN      
        
                   nsp_getkey('PICKNO',10 ,C_PICKNO );
    
                    UPDATE PICKDETAIL SET PICKNO = C_PICKNO 
                    WHERE WAVEKEY=C_WAVEKEY 
                    AND ORDERKEY IN (SELECT ORDERS.ORDERKEY FROM ORDERS  WHERE ORDERS.CONSIGNEEKEY = C_CONSIGNEEKEY AND ORDERS.PICKGRPTYPE = '1');
                    --COMMIT; 
                    
                                                    
                    FETCH PKDETAIL_CURSOR1 INTO C_CONSIGNEEKEY;  
                END;
            END LOOP;      
            CLOSE PKDETAIL_CURSOR1;       
        END;
        
        --PICKGRPTYPE='2'
        DECLARE CURSOR PKDETAIL_CURSOR1 IS  
        SELECT A.SKU        
        FROM PICKDETAIL A,LOC B,ORDERS C       
        WHERE A.LOC = B.LOC 
        AND A.ORDERKEY = C.ORDERKEY 
        AND C.PICKGRPTYPE='2'
        AND  (PICKNO = '' OR PICKNO IS  NULL)    
        GROUP BY A.SKU     
        ORDER BY A.SKU;  
        
        BEGIN  

            OPEN PKDETAIL_CURSOR1;       
            FETCH PKDETAIL_CURSOR1 INTO C_SKU;      
            WHILE PKDETAIL_CURSOR1%FOUND
            LOOP      
                BEGIN      
        
                    nsp_getkey('PICKNO',10 ,C_PICKNO );
    
                    UPDATE PICKDETAIL SET PICKNO = C_PICKNO 
                    WHERE WAVEKEY = C_WAVEKEY
                    AND SKU=C_SKU
                    AND ORDERKEY IN (SELECT ORDERS.ORDERKEY FROM ORDERS WHERE ORDERS.PICKGRPTYPE = '2');
                    --COMMIT; 

                    FETCH PKDETAIL_CURSOR1 INTO C_SKU;  
                END;
            END LOOP;      
            CLOSE PKDETAIL_CURSOR1;       
        END;        
        
        COMMIT;
        
        
    END;     
    END IF;  

    IF C_TYPE = 'B' THEN --分配拣货
    BEGIN
    
        --PICKGRPTYPE='0'
        DECLARE CURSOR PKDETAIL_CURSOR1 IS  
        SELECT A.ORDERKEY,B.PUTAWAYZONE      
        FROM PICKDETAIL A,LOC B,ORDERS C       
        WHERE A.LOC = B.LOC 
        AND A.ORDERKEY = C.ORDERKEY 
        AND A.WAVEKEY = C_WAVEKEY
        AND C.PICKGRPTYPE='0'
        AND  (PICKNO = '' OR PICKNO IS  NULL)    
        GROUP BY A.ORDERKEY,B.PUTAWAYZONE   
        ORDER BY B.PUTAWAYZONE;   
        
        BEGIN  

            OPEN PKDETAIL_CURSOR1;       
            FETCH PKDETAIL_CURSOR1 INTO C_ORDERKEY_VAR,C_PUTAWAYZONE;      
            WHILE PKDETAIL_CURSOR1%FOUND
            LOOP      
                BEGIN      
        
                    nsp_getkey('PICKNO',10 ,C_PICKNO );
    
                    UPDATE PICKDETAIL SET PICKNO = C_PICKNO 
                    WHERE WAVEKEY = C_WAVEKEY
                    AND ORDERKEY = C_ORDERKEY_VAR
                    AND LOC IN (SELECT LOC FROM LOC WHERE PUTAWAYZONE = C_PUTAWAYZONE);
                    --COMMIT; 

                    FETCH PKDETAIL_CURSOR1 INTO C_ORDERKEY_VAR,C_PUTAWAYZONE;  
                END;      
            END LOOP;      
            CLOSE PKDETAIL_CURSOR1;       
        END;
        
        --PICKGRPTYPE='1'
        DECLARE CURSOR PKDETAIL_CURSOR1 IS  
        SELECT C.CONSIGNEEKEY,B.PUTAWAYZONE      
        FROM PICKDETAIL A,LOC B,ORDERS C       
        WHERE A.LOC = B.LOC 
        AND A.ORDERKEY = C.ORDERKEY 
        AND A.WAVEKEY = C_WAVEKEY
        AND C.PICKGRPTYPE='1'
        AND  (PICKNO = '' OR PICKNO IS  NULL)    
        GROUP BY C.CONSIGNEEKEY,B.PUTAWAYZONE   
        ORDER BY B.PUTAWAYZONE;   
        
        BEGIN  

            OPEN PKDETAIL_CURSOR1;       
            FETCH PKDETAIL_CURSOR1 INTO C_CONSIGNEEKEY,C_PUTAWAYZONE;      
            WHILE PKDETAIL_CURSOR1%FOUND
            LOOP      
                BEGIN      
        
                    nsp_getkey('PICKNO',10 ,C_PICKNO );
    
                    UPDATE PICKDETAIL SET PICKNO = C_PICKNO 
                    WHERE WAVEKEY = C_WAVEKEY
                    AND LOC IN(SELECT LOC FROM LOC WHERE PUTAWAYZONE=C_PUTAWAYZONE)
                    AND ORDERKEY IN (SELECT ORDERS.ORDERKEY FROM ORDERS WHERE ORDERS.CONSIGNEEKEY = C_CONSIGNEEKEY AND ORDERS.PICKGRPTYPE = '1');
                    --COMMIT; 

                    FETCH PKDETAIL_CURSOR1 INTO C_CONSIGNEEKEY,C_PUTAWAYZONE;  
                END;      
            END LOOP;      
            CLOSE PKDETAIL_CURSOR1;       
        END;
        
        --PICKGRPTYPE='2'
        DECLARE CURSOR PKDETAIL_CURSOR1 IS  
        SELECT A.SKU,B.PUTAWAYZONE      
        FROM PICKDETAIL A,LOC B,ORDERS C       
        WHERE A.LOC = B.LOC 
        AND A.ORDERKEY = C.ORDERKEY 
        AND A.WAVEKEY = C_WAVEKEY
        AND C.PICKGRPTYPE='2'
        AND  (PICKNO = '' OR PICKNO IS  NULL)    
        GROUP BY A.SKU,B.PUTAWAYZONE   
        ORDER BY B.PUTAWAYZONE,A.SKU;   
        
        BEGIN  

            OPEN PKDETAIL_CURSOR1;       
            FETCH PKDETAIL_CURSOR1 INTO C_SKU,C_PUTAWAYZONE;      
            WHILE PKDETAIL_CURSOR1%FOUND
            LOOP      
                BEGIN      
        
                    nsp_getkey('PICKNO',10 ,C_PICKNO );
    
                    UPDATE PICKDETAIL SET PICKNO = C_PICKNO 
                    WHERE WAVEKEY = C_WAVEKEY
                    AND SKU=C_SKU
                    AND LOC IN(SELECT LOC FROM LOC WHERE PUTAWAYZONE=C_PUTAWAYZONE)
                    AND ORDERKEY IN (SELECT ORDERKEY FROM ORDERS WHERE ORDERS.PICKGRPTYPE = '2');
                    --COMMIT; 

                    FETCH PKDETAIL_CURSOR1 INTO C_SKU,C_PUTAWAYZONE;  
                END;      
            END LOOP;      
            CLOSE PKDETAIL_CURSOR1;       
        END;
        
        COMMIT;
    END;     
    END IF; 

    
    
END;
/

prompt
prompt Creating procedure NSP_CREATE_CASEID
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE NSP_CREATE_CASEID(V_CASEID IN VARCHAR2,V_BOXNO IN VARCHAR2,V_BATCHNO IN VARCHAR2,
                                                V_USERID IN VARCHAR2,V_USERID1 IN VARCHAR2 ,v_flag out varchar2,v_message out varchar2) 

/*
**拆分，拆分pickdetail、pack_case表数据
**生成caseid
**生成casedetail
**update pack_cae表数据
**morris 20111210 add 
**参数说明：包件号V_CASEID ；箱号或拣货流水号v_boxno;包件批次号v_batchno；复合人员v_userid ；打包人员v_userid1
**v_flag 记录执行成功失败  1：成功  0失败 v_message 记录返回消息 
**************************************************************************/  
AS  
    
    
    C_PACKID                VARCHAR2(10);--打包id
    C_FROMTABLE             VARCHAR2(20);--来源表
    C_FROMTYPE              VARCHAR2(10);--来源类型
    C_PICKDETAILKEY         VARCHAR2(10);--pickdetailkey
    C_NEW_PICKDETAILKEY     VARCHAR2(10);--pickdetailkey
    C_NEW_PACKID            VARCHAR2(10);--
    L_PACKQTY               NUMBER:=0;--打包数量
    L_CONFIRM_QTY           NUMBER:=0;--确认数量
    L_REMAINQTY             NUMBER:=0;--剩余数量
    L_PICKQTY               NUMBER:=0;--拣货数量
    LL_LINE                 NUMBER:=0; --包件明细行号
    LL_COUNT                NUMBER:=0; --计数
    LL_RET                  NUMBER :=0;
    LS_SORT                 VARCHAR2(20);
    LL_COUNT_BOX            NUMBER :=0;--根据箱号查询出的任务号
    LL_COUNT_PICKNO         NUMBER :=0;--根据拣货流水号查询出的任务数
          
BEGIN        
    v_flag :='1';
    v_message :='SUCCESS';
    --若存在部分打包
    SELECT COUNT(1) INTO LL_COUNT
    FROM PACK_CASE
    WHERE (BOXNO=V_BOXNO OR PICKNO=V_BOXNO)
    AND STATUS<'9'
    AND PACKQTY>CONFIRM_QTY AND CONFIRM_QTY>0 ;
    IF ll_count>0 THEN--拆分pickdetail、拆分pack_case
    BEGIN
        DECLARE CURSOR PACK_CASE_CUR
        is
        SELECT PACKID,FROMTABLE,FROMTYPE,PICKDETAILKEY,PACKQTY,CONFIRM_QTY,PACKQTY - CONFIRM_QTY
        FROM PACK_CASE
        WHERE  (BOXNO=V_BOXNO OR PICKNO=V_BOXNO)
        AND STATUS<'9'
        AND PACKQTY>CONFIRM_QTY AND CONFIRM_QTY>0 
        ORDER BY PACKID;
        BEGIN
            OPEN PACK_CASE_CUR;       
            FETCH PACK_CASE_CUR INTO C_PACKID,C_FROMTABLE,C_FROMTYPE,C_PICKDETAILKEY,L_PACKQTY,L_CONFIRM_QTY,L_REMAINQTY;      
            WHILE PACK_CASE_CUR%FOUND
            LOOP      
                BEGIN 
                    --当来源数据为拣货时，需要先拆分pickdetail数据
                    IF C_FROMTABLE='PICKDETAIL' THEN
                        SELECT COUNT(1) INTO LL_COUNT
                         FROM PICKDETAIL
                        WHERE PICKDETAILKEY=C_PICKDETAILKEY AND STATUS<'9';
                        IF LL_COUNT<1 THEN
                            LL_RET :=-1;
                            RETURN ;
                        END IF;
                        SELECT nvl(PICKDETAILKEY,'AAA'),QTY
                        INTO C_PICKDETAILKEY,L_PICKQTY
                        FROM PICKDETAIL
                        WHERE PICKDETAILKEY=C_PICKDETAILKEY AND STATUS<'9';
                        IF  C_PICKDETAILKEY<>'AAA' THEN
                             NSP_GETKEY('PICKDETAIL',10,C_NEW_PICKDETAILKEY);
                            INSERT INTO PICKDETAIL(PICKHEADERKEY,PICKDETAILKEY,CASEID,ORDERKEY,ORDERLINENUMBER,STORERKEY,SKU,UOM,PACKKEY,QTY,UOMQTY,STATUS,TOLOC,LOT,LOC,ID,CARTONGROUP,PICKMETHOD,BOXNO,PICKNO)
                            SELECT PICKHEADERKEY,C_NEW_PICKDETAILKEY,CASEID,ORDERKEY,ORDERLINENUMBER,STORERKEY,SKU,UOM,PACKKEY,L_REMAINQTY,L_REMAINQTY,STATUS,TOLOC,LOT,LOC,ID,CARTONGROUP,PICKMETHOD,BOXNO,PICKNO
                            FROM PICKDETAIL
                            WHERE PICKDETAILKEY=C_PICKDETAILKEY;
                            UPDATE PICKDETAIL
                            SET QTY=QTY - L_REMAINQTY,UOMQTY=UOMQTY - L_REMAINQTY
                            WHERE PICKDETAILKEY=C_PICKDETAILKEY;
                        END IF;--IF  C_PICKDETAILKEY<>'' THEN
                    END IF;--IF C_FROMTABLE='PICKDETAIL' THEN
                    --c拆分pack_case表数据
                      NSP_GETKEY('PACKCASE',10,C_NEW_PACKID);
                     INSERT INTO PACK_CASE(PACKID,FROMTABLE,FROMTYPE,PICKDETAILKEY,STORERKEY,BOXNO,BOXNOBAK,CASEID,CASELINENO,TYPE,DOC_NUMBER,SEQ,SKU,PACKQTY,CONFIRM_QTY,PRICE,DISCOUNT,MY,STATUS,CONSK,SHORTNAME,SUSR1,SUSR2,SUSR3,SUSR4,SUSR5,PACK_USER,PACK_DATE,CONFIRM_USER,CONFIRM_DATE,MERGE_USER,MERGE_DATE,SOW_USER,SOW_DATE,
                            NET_WEIGHT,ACT_WEIGHT,BARCODE,DESCR,IS_MERGE,PICKNO,ROUTE,PUTAWAYZONE,EXPORTNO)
                     SELECT C_NEW_PACKID,FROMTABLE,FROMTYPE,C_NEW_PICKDETAILKEY,STORERKEY,BOXNO,BOXNOBAK,CASEID,CASELINENO,TYPE,DOC_NUMBER,SEQ,SKU,L_REMAINQTY,0,PRICE,DISCOUNT,L_REMAINQTY*PRICE,0,CONSK,SHORTNAME,SUSR1,SUSR2,SUSR3,SUSR4,SUSR5,PACK_USER,PACK_DATE,CONFIRM_USER,CONFIRM_DATE,MERGE_USER,MERGE_DATE,SOW_USER,SOW_DATE,
                            L_REMAINQTY* (SELECT NVL(STDNETWGT,0) FROM SKU WHERE SKU.STORERKEY=PACK_CASE.STORERKEY AND SKU.SKU=PACK_CASE.SKU),ACT_WEIGHT,BARCODE,DESCR,IS_MERGE,PICKNO,ROUTE,PUTAWAYZONE,EXPORTNO
                     FROM PACK_CASE
                     WHERE PACKID=C_PACKID;
                     UPDATE PACK_CASE
                    SET PACKQTY=PACKQTY - L_REMAINQTY
                    WHERE PACKID=C_PACKID;
                    FETCH PACK_CASE_CUR INTO C_PACKID,C_FROMTABLE,C_FROMTYPE,C_PICKDETAILKEY,L_PACKQTY,L_CONFIRM_QTY,L_REMAINQTY; 
                END ;
             END LOOP;
             CLOSE  PACK_CASE_CUR;  
        END;
    END;-- IF ll_count>0 THEN--拆分pickdetail、拆分pack_case
    END IF;
    --是否有差异 ，都需要插入包件信息
    --生成caseid、casedetail
    --插入caseid 
    SELECT COUNT(1) INTO LL_COUNT_BOX
    FROM PACK_CASE
    WHERE BOXNO=V_BOXNO AND STATUS<'9' and CONFIRM_QTY>0 ;
    IF LL_COUNT_BOX>0 THEN
        INSERT INTO CASEID(batchno,caseid,caseid_bak,doc_storerkey,wh,consk,shortname,status,qty,amt,net,weight,netweight,volume,box_wgt,pack_user,pack_date)
        SELECT V_BATCHNO,V_CASEID,V_CASEID,STORERKEY,(SELECT WHSEID FROM STORER WHERE STORERKEY=PACK_CASE.STORERKEY),CONSK,max(SHORTNAME),'-1',SUM(CONFIRM_QTY),SUM(MY),SUM(MY*DISCOUNT/100),
        max(act_weight),sum(net_weight),sum(confirm_qty *(select stdcube from sku where sku.storerkey=pack_case.storerkey and sku.sku=pack_case.sku)),
        (select weight from box where box.boxno=pack_case.boxno),max(pack_user),max(pack_date)
        from pack_case 
        where  BOXNO=V_BOXNO  and status<'9' and CONFIRM_QTY>0 
        group by storerkey,CONSK,BOXNO;
    END IF; 
    SELECT COUNT(1) INTO LL_COUNT_PICKNO
    FROM PACK_CASE
    WHERE PICKNO=V_BOXNO AND STATUS<'9' and CONFIRM_QTY>0 ;
    IF LL_COUNT_PICKNO>0 THEN
        INSERT INTO CASEID(batchno,caseid,caseid_bak,doc_storerkey,wh,consk,shortname,status,qty,amt,net,weight,netweight,volume,pack_user,pack_date)--box_wgt,
        SELECT V_BATCHNO,V_CASEID,V_CASEID,STORERKEY,(SELECT WHSEID FROM STORER WHERE STORERKEY=PACK_CASE.STORERKEY),CONSK,max(SHORTNAME),'-1',SUM(CONFIRM_QTY),SUM(MY),SUM(MY*DISCOUNT/100),
        max(act_weight),sum(net_weight),sum(confirm_qty *(select stdcube from sku where sku.storerkey=pack_case.storerkey and sku.sku=pack_case.sku)),
        --(select weight from box where box.boxno=pack_case.boxno),
        max(pack_user),max(pack_date)
        from pack_case 
        where  PICKNO=V_BOXNO and status<'9' and CONFIRM_QTY>0 
        group by storerkey,CONSK,PICKNO;
    END IF; 
    --当箱号和拣货流水号都查询不到任务时，失败 返回
    IF (LL_COUNT_PICKNO = 0 AND LL_COUNT_BOX=0 )THEN
        ROLLBACK ;
        v_flag :='0';
        v_message :='根据号码查询'+V_BOXNO+'不出打包任务';
        RETURN ;
    END IF;
    LL_LINE :=0;
    --循环插入casedetail
    DECLARE CURSOR CREATE_CASEID_CUR
    IS
        SELECT PACKID,FROMTABLE,FROMTYPE,PICKDETAILKEY,PACKQTY,CONFIRM_QTY
        FROM PACK_CASE
        WHERE  (BOXNO=V_BOXNO OR PICKNO=V_BOXNO)
        AND STATUS<'9' AND CONFIRM_QTY>0 
        ORDER BY PACKID;
         BEGIN
                OPEN CREATE_CASEID_CUR;       
                FETCH CREATE_CASEID_CUR INTO C_PACKID,C_FROMTABLE,C_FROMTYPE,C_PICKDETAILKEY,L_PACKQTY,L_CONFIRM_QTY;      
                WHILE CREATE_CASEID_CUR%FOUND
                LOOP      
                    BEGIN 
                        LL_LINE :=LL_LINE + 1; 
                        INSERT INTO CASEDETAIL(FROMTABLE,FROMTYPE,CASEID, CASEID_BAK,LINENUMBER, PACKID,  PICKDETAILKEY, STORERKEY, TYPE, DOC_NUMBER,SKU,QTY,SEQ,PRICE,DISCOUNT,AMT,NET,NETWEIGHT)
                        SELECT 'PACK_CASE','0',V_CASEID,V_CASEID,LPAD(TO_CHAR(LL_LINE),5,'0'),PACKID,PICKDETAILKEY,STORERKEY,'0',DOC_NUMBER,SKU, PACKQTY,SEQ,PRICE,DISCOUNT,MY,MY*DISCOUNT,NET_WEIGHT
                        FROM PACK_CASE
                        WHERE PACKID=C_PACKID ;
                        FETCH CREATE_CASEID_CUR INTO C_PACKID,C_FROMTABLE,C_FROMTYPE,C_PICKDETAILKEY,L_PACKQTY,L_CONFIRM_QTY; 
                    END;
                 END LOOP;
                CLOSE CREATE_CASEID_CUR;      
          END  ;
      --更新打包数据状态为9
      UPDATE PACK_CASE
      SET STATUS='9' ,PACK_USER=V_USERID,PACK_USER1=V_USERID1,PACK_DATE=SYSDATE,PACK_DATE1=SYSDATE 
    WHERE  (BOXNO=V_BOXNO OR PICKNO=V_BOXNO) AND STATUS<'9' AND CONFIRM_QTY>0 ; 

END ;
/

prompt
prompt Creating procedure NSP_CREATE_CASEID_XSO
prompt ========================================
prompt
CREATE OR REPLACE PROCEDURE NSP_CREATE_CASEID_XSO(V_DOC_NUMBER IN VARCHAR2,v_flag out varchar2,v_message out varchar2)

/*
**拆分，拆分够包剥离量
**生成caseid
**生成casedetail
**根据主配明细中的DOC_CASE_QTY拆分生成包件信息
**
**v_flag 记录执行成功失败  1：成功  0失败 v_message 记录返回消息 
**************************************************************************/  
AS  
    
    
    LL_COUNT                NUMBER:=0; --计数
    LL_RET                  NUMBER :=0;
    LS_SORT                 VARCHAR2(20);
    C_SEQ                   VARCHAR2(5);
    V_CASEID                VARCHAR2(10);
    L_CQTY                  NUMBER :=0;
    L_CASE_QTY              NUMBER :=0;
          
BEGIN        
    v_flag :='1';
    v_message :='SUCCESS';
    --循环插入casedetail
        DECLARE CURSOR CREATE_CASEID_CUR
        IS
        SELECT B.DOC_SEQ,B.DOC_CQTY,B.DOC_CASE_QTY
        FROM JOBS_XSO A,JOBSCONTEXT_XSO B
        WHERE A.DOC_NUMBER = B.DOC_NUMBER 
        AND A.DOC_NUMBER = V_DOC_NUMBER AND DOC_CQTY>0 
        ORDER BY B.DOC_SEQ;
         BEGIN
                OPEN CREATE_CASEID_CUR;       
                FETCH CREATE_CASEID_CUR INTO C_SEQ,L_CQTY,L_CASE_QTY;      
                WHILE CREATE_CASEID_CUR%FOUND
                LOOP--循环处理每一条主配明细
                    BEGIN 
                        WHILE L_CQTY >0 LOOP
                            NSP_GETKEY('CASEID',10,V_CASEID);                            
                            --插入caseid
                            INSERT INTO CASEID(BATCHNO,CASEID,CASEID_BAK,DOC_STORERKEY,WH,CONSK,SHORTNAME,STATUS,QTY,AMT,NET,WEIGHT,NETWEIGHT,VOLUME,PACK_USER,PACK_DATE)--BOX_WGT,
                            SELECT JX.DOC_NUMBER,V_CASEID,V_CASEID,JX.DOC_STORERKEY,(SELECT WHSEID FROM STORER WHERE STORERKEY=JX.DOC_STORERKEY),JCX.DOC_CONSK,DOC_SHORTNAME,'0',DOC_CASE_QTY,DOC_AMT,DOC_NET,
                            DOC_CASE_QTY*(SELECT DECODE(NVL(STDNETWGT,0),0,1,STDNETWGT) FROM SKU WHERE SKU.SKU=JCX.DOC_SKU AND SKU.STORERKEY=JX.DOC_STORERKEY),
                            DOC_CASE_QTY*(SELECT DECODE(NVL(STDNETWGT,0),0,1,STDNETWGT) FROM SKU WHERE SKU.SKU=JCX.DOC_SKU AND SKU.STORERKEY=JX.DOC_STORERKEY),
                            DOC_CASE_QTY*(SELECT DECODE(NVL(STDCUBE,0),0,1,STDCUBE) FROM SKU WHERE SKU.SKU=JCX.DOC_SKU AND SKU.STORERKEY=JX.DOC_STORERKEY),
                            DOC_WORKGROUP,SYSDATE
                           FROM JOBS_XSO JX,JOBSCONTEXT_XSO JCX
                            WHERE JX.DOC_NUMBER = JCX.DOC_NUMBER 
                            AND  JX.DOC_NUMBER=V_DOC_NUMBER
                            AND     JCX.DOC_SEQ=C_SEQ
                            AND  JCX.DOC_CQTY>0;
                            --插入casedetail
                            INSERT INTO CASEDETAIL(FROMTABLE,FROMTYPE,CASEID, CASEID_BAK,LINENUMBER, PACKID,  PICKDETAILKEY, STORERKEY, TYPE, DOC_NUMBER,SKU,QTY,SEQ,PRICE,DISCOUNT,AMT,NET,NETWEIGHT)
                            SELECT 'JOBS_XSO','1',V_CASEID,V_CASEID,'00001','','',JX.DOC_STORERKEY,JX.DOC_TYPE,JX.DOC_NUMBER,JCX.DOC_SKU,JCX.DOC_CASE_QTY, JCX.DOC_SEQ,JCX.DOC_PRICE,JCX.DOC_DISCOUNT,JCX.DOC_CASE_QTY*JCX.DOC_PRICE,(JCX.DOC_CASE_QTY*JCX.DOC_PRICE)*JCX.DOC_DISCOUNT/100,
                            DOC_CASE_QTY*(SELECT DECODE(NVL(STDNETWGT,0),0,1,STDNETWGT) FROM SKU WHERE SKU.SKU=JCX.DOC_SKU AND SKU.STORERKEY=JX.DOC_STORERKEY)
                            FROM JOBS_XSO JX,JOBSCONTEXT_XSO JCX
                             WHERE JX.DOC_NUMBER = JCX.DOC_NUMBER 
                             AND    JX.DOC_NUMBER=V_DOC_NUMBER
                             AND     JCX.DOC_SEQ=C_SEQ
                            AND  JCX.DOC_CQTY>0;
                            L_CQTY :=L_CQTY - L_CASE_QTY;
                            
                            
                        END LOOP;
                    END;
                     FETCH CREATE_CASEID_CUR INTO C_SEQ,L_CQTY,L_CASE_QTY;
                 END LOOP;
                CLOSE CREATE_CASEID_CUR;      
          END  ;
     

END ;
/

prompt
prompt Creating procedure NSP_CREATE_WCSTASK
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE NSP_CREATE_WCSTASK(C_TYPE IN VARCHAR2,C_FROMWHO  IN VARCHAR2,C_TOWHO  IN VARCHAR2,C_BOXNO IN VARCHAR2,C_STATUS IN VARCHAR2,C_USER IN VARCHAR2)
/*
**MORRIS 20111216 MODIFY
**插入流水线任务
**当c_type=‘'PUTAWAY' 插入上架流水线任务，根据箱任务 查询不同的上架区域，插入流水线任务
**


*/

AS  

    C_TASKNO                VARCHAR2(10);
    C_EXPORTNO              VARCHAR2(10);
    C_ROW                   NUMBER:=0;
    C_PACKLOC               VARCHAR2(10);
    C_CONSK                 VARCHAR2(10); 
    ll_row                  number :=1;     
BEGIN        
    --查询不到流水线出口时，给temp
    IF C_TYPE = 'PUTAWAY' THEN
    BEGIN
        INSERT INTO WCS_TASK(EXPORTNO,BATCHNO,FROMWHO,TOWHO,TYPE,BOXNO,DOC_STATUS,DOC_DONE,PLACE)
        SELECT distinct 
        CASE WHEN (LOC.EXPORTNO IS NOT NULL OR LOC.EXPORTNO<>'') 
           THEN LOC.EXPORTNO
           ELSE NVL(PZ.EXPORTNO,'TEMP')
           END EXPORTNO,
          ' ',C_FROMWHO,C_TOWHO,C_TYPE,C_BOXNO,'0','0',''
        FROM TASKDETAIL TK,PUTAWAYZONE PZ,LOC
        WHERE TK.TOLOC = LOC.LOC
        AND PZ.PUTAWAYZONE=LOC.PUTAWAYZONE
        AND TK.BOXNO=C_BOXNO  AND (TK.STATUS='0' OR TK.STATUS='3') AND (TK.TASKTYPE='PP' OR TK.TASKTYPE='PA');
        COMMIT;
        /*
        DECLARE CURSOR PKDETAIL_CURSOR1 IS  
        SELECT DISTINCT EXPORTNO FROM 
            (SELECT CASE WHEN (LOC.EXPORTNO IS NOT NULL OR LOC.EXPORTNO<>'') 
                   THEN LOC.EXPORTNO
                   ELSE PUTAWAYZONE.EXPORTNO
                   END EXPORTNO
            FROM TASKDETAIL,PUTAWAYZONE,LOC
            WHERE TASKDETAIL.TOLOC = LOC.LOC
            AND PUTAWAYZONE.PUTAWAYZONE=LOC.PUTAWAYZONE
            AND TASKDETAIL.BOXNO=C_BOXNO AND (STATUS='0' OR STATUS='3')) 
        GROUP BY EXPORTNO;
        
        BEGIN
            OPEN PKDETAIL_CURSOR1;       
            FETCH PKDETAIL_CURSOR1 INTO C_EXPORTNO;      
            WHILE PKDETAIL_CURSOR1%FOUND
            LOOP      
                BEGIN
                    
                    SELECT COUNT(1) INTO C_ROW FROM WCS_TASK;
                    IF C_ROW<1 THEN
                    BEGIN
                        C_TASKNO:='0000000001';
                    END;
                    ELSE 
                    BEGIN    
                
                        SELECT SUBSTR(CONCAT('000000000',TRIM(TO_CHAR(MAX(TO_NUMBER(TASKNO))+1))),-10) INTO C_TASKNO FROM WCS_TASK;
                    
                    END;
                    END IF;             
                    
        
                    INSERT INTO WCS_TASK(BATCHNO,FROMWHO,TOWHO,TYPE,TASKNO,BOXNO,DOC_STATUS,DOC_DONE,EXPORTNO,PLACE)
                    VALUES(' ',C_FROMWHO,C_TOWHO,C_TYPE,C_TASKNO,C_BOXNO,'0','0',C_EXPORTNO,'');
                    --COMMIT; 

                    FETCH PKDETAIL_CURSOR1 INTO C_EXPORTNO;   
                END;
            END LOOP;      
            CLOSE PKDETAIL_CURSOR1;       
        END;
        */
      
        
    END;     
    END IF;  
    
    
    IF C_TYPE = 'PICK' THEN 
    BEGIN
       
        DECLARE CURSOR PKDETAIL_CURSOR1 IS  
        SELECT DISTINCT EXPORTNO FROM 
            (SELECT CASE WHEN (LOC.EXPORTNO IS NOT NULL OR LOC.EXPORTNO<>'') 
                   THEN LOC.EXPORTNO
                   ELSE NVL(PUTAWAYZONE.EXPORTNO,'TEMP')
                   END EXPORTNO
            FROM TASKDETAIL TK,PUTAWAYZONE,LOC
            WHERE TK.FROMLOC = LOC.LOC
            AND PUTAWAYZONE.PUTAWAYZONE=LOC.PUTAWAYZONE
            AND TK.BOXNO=C_BOXNO AND TK.TASKTYPE='PK' AND (TK.STATUS='3' OR TK.STATUS='0')) 
        GROUP BY EXPORTNO;
       
        BEGIN
            OPEN PKDETAIL_CURSOR1;       
            FETCH PKDETAIL_CURSOR1 INTO C_EXPORTNO;      
            WHILE PKDETAIL_CURSOR1%FOUND
            LOOP      
                BEGIN
                    --第一个出口已经在做拣货任务，不需要插入流水线
                    IF ll_row>1 THEN
                        BEGIN 
                            INSERT INTO WCS_TASK(BATCHNO,FROMWHO,TOWHO,TYPE,BOXNO,DOC_STATUS,DOC_DONE,EXPORTNO,PLACE)--TASKNO,
                            VALUES(' ',C_FROMWHO,C_TOWHO,C_TYPE,C_BOXNO,'0','0',C_EXPORTNO,'');--C_TASKNO,
                        END;
                     END IF;
                     
                    ll_row := ll_row+1;
                    FETCH PKDETAIL_CURSOR1 INTO C_EXPORTNO;   
                END;
            END LOOP; 
            --插入打包台流水线任务
            SELECT COUNT(1) INTO C_ROW FROM WCS_TASK WHERE BOXNO=C_BOXNO AND TYPE = 'PACK' AND DOC_STATUS='0';
        
            IF C_ROW=0 THEN
            BEGIN
                SELECT NVL(PACKLOC,'TEMP') INTO  C_PACKLOC
                FROM STORER
                WHERE STORERKEY=(/* Formatted on 2011/12/17 15:14 (Formatter Plus v4.8.8) */
                    SELECT MAX(consigneekey)
                      FROM orders
                     WHERE orderkey IN (SELECT orderkey
                                         FROM pickdetail
                                        WHERE PICKDETAILKEY IN (SELECT pickdetailkey
                                                                FROM taskdetail
                                                               WHERE  BOXNO=C_BOXNO AND  (STATUS='0' OR STATUS='3') AND TASKTYPE='PK')));
                IF C_PACKLOC='TEMP' THEN
                    C_EXPORTNO :='TEMP';
                ELSE
                    SELECT CASE WHEN (LOC.EXPORTNO IS NOT NULL OR LOC.EXPORTNO<>'') 
                       THEN LOC.EXPORTNO
                       ELSE NVL(PUTAWAYZONE.EXPORTNO,'TEMP')
                       END EXPORTNO
                     INTO C_EXPORTNO
                     FROM LOC,PUTAWAYZONE
                     WHERE LOC.PUTAWAYZONE=PUTAWAYZONE.PUTAWAYZONE
                     AND LOC.LOC= C_PACKLOC;
                END IF;
                INSERT INTO WCS_TASK(BATCHNO,FROMWHO,TOWHO,TYPE,TASKNO,BOXNO,DOC_STATUS,DOC_DONE,EXPORTNO,PLACE)
                VALUES(' ',C_FROMWHO,C_TOWHO,'PACK',C_TASKNO,C_BOXNO,'0','0',C_EXPORTNO,'');
            END;
            END IF;
                
            CLOSE PKDETAIL_CURSOR1;       
        END;        
        COMMIT;       
        
    END;     
    END IF;  

    IF C_TYPE = 'PACK' THEN 
       BEGIN
    
            SELECT COUNT(1) INTO C_ROW FROM WCS_TASK WHERE BOXNO=C_BOXNO AND DOC_STATUS='0' AND TYPE='PICK';
    
            IF (C_ROW >0) THEN
            BEGIN
                UPDATE WCS_TASK SET DOC_STATUS='9' WHERE BOXNO=C_BOXNO AND DOC_STATUS='0' AND TYPE='PICK';
                --COMMIT;
            END;
            END IF;
       
            SELECT COUNT(1) INTO C_ROW FROM WCS_TASK WHERE BOXNO=C_BOXNO AND TYPE = 'PACK' AND DOC_STATUS='0';
        
            IF C_ROW>0 THEN
            BEGIN
                RETURN;
            END;
            END IF;
        
            /* FORMATTED ON 2011/12/17 15:31 (FORMATTER PLUS V4.8.8) */
            SELECT MAX (DECODE (NVL (PC.EXPORTNO, ''),
                                '', (SELECT NVL (EXPORTNO, 'TEMP')
                                       FROM LOC
                                      WHERE LOC = (SELECT PACKLOC
                                                     FROM STORER
                                                    WHERE STORERKEY = PC.CONSK))
                               )
                       )
              INTO C_EXPORTNO
              FROM PACK_CASE PC
             WHERE BOXNO = C_BOXNO AND STATUS='0';
             INSERT INTO WCS_TASK(BATCHNO,FROMWHO,TOWHO,TYPE,TASKNO,BOXNO,DOC_STATUS,DOC_DONE,EXPORTNO,PLACE)
             VALUES('',C_FROMWHO,C_TOWHO,C_TYPE,C_TASKNO,C_BOXNO,'0','0',C_EXPORTNO,'');
           
        END;
        
        COMMIT;
     END IF;  
         
    
END;
/

prompt
prompt Creating procedure NSP_GETQCLOC
prompt ===============================
prompt
CREATE OR REPLACE PROCEDURE NSP_GETQCLOC(V_LOC IN VARCHAR2 ,
                                        V_TYPE IN VARCHAR2 ,
                                        R_QCLOC OUT VARCHAR2 ) IS
/************************************************************
**morris 20111210 add for jxxh
**根据输入储位 获取对应区域的默认储位
**参数说明：loc 当前操作储位 ；type 0 查询上架默认储位（PUT_LOC ） 1 查找质检少储位（QC_LOC1 ）2查找质检多默认储位（QC_LOC2 ）
COMMENT ON COLUMN PUTAWAYZONE.PUT_LOC IS '上架默认储位';
COMMENT ON COLUMN PUTAWAYZONE.QC_LOC1 IS '质检少默认储位';
COMMENT ON COLUMN PUTAWAYZONE.QC_LOC2 IS '质检多默认储位';
*******************************************************************/ 
LL_COUNT INT  :=0 ;                                       
BEGIN
    --type 0 查询上架默认储位（PUT_LOC ）
    IF V_TYPE='0' THEN
        SELECT NVL(PUT_LOC,'QC99')
            INTO  R_QCLOC
             FROM PUTAWAYZONE WHERE PUTAWAYZONE =(SELECT PUTAWAYZONE FROM LOC WHERE LOC=V_LOC);
    END IF;
    -- 1 查找质检少储位（QC_LOC1 ）
    IF V_TYPE='1' THEN
        SELECT NVL(QC_LOC1,'QC99')
            INTO  R_QCLOC
             FROM PUTAWAYZONE WHERE PUTAWAYZONE =(SELECT PUTAWAYZONE FROM LOC WHERE LOC=V_LOC);
    END IF;
    --2查找质检多默认储位（QC_LOC2 ）
     IF V_TYPE='2' THEN
        SELECT NVL(QC_LOC2,'QC99')
            INTO  R_QCLOC
             FROM PUTAWAYZONE WHERE PUTAWAYZONE =(SELECT PUTAWAYZONE FROM LOC WHERE LOC=V_LOC);
    END IF;
  
    --当获取的储位不存在时，给出默认储位为QC99
    SELECT COUNT(1) INTO LL_COUNT
    FROM LOC WHERE LOC=R_QCLOC;
    IF LL_COUNT<1 THEN
        R_QCLOC :='QC99';
    END IF;
   
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
     WHEN OTHERS THEN
       RAISE;
END NSP_GETQCLOC;
/

prompt
prompt Creating procedure NSP_INSERT_DIF
prompt =================================
prompt
CREATE OR REPLACE PROCEDURE NSP_INSERT_DIF(C_FROMTABLE IN VARCHAR2,C_TASKID IN VARCHAR2,C_TYPE  IN VARCHAR2,C_DIF_CODE IN VARCHAR2,C_DIF_QTY IN NUMBER)
AS  
    C_TASK_DIFO             VARCHAR2(20);
    C_BOXNO                VARCHAR2(10);
    C_TOLOC              VARCHAR2(10);
    C_PUTAWAYZONE                 VARCHAR2(10);
    C_EDITWHO               VARCHAR2(10);
    C_EDITDATE                 VARCHAR2(10);      
BEGIN           

    IF C_TYPE = 'PUTAWAY' AND C_FROMTABLE='TASKDETAIL' THEN
    BEGIN
 
        SELECT A.BOXNO,A.TOLOC,B.PUTAWAYZONE,A.EDITWHO INTO C_BOXNO,C_TOLOC,C_PUTAWAYZONE,C_EDITWHO
        FROM TASKDETAIL A,LOC B 
        WHERE A.TOLOC=B.LOC
        AND A.TASKDETAILKEY=C_TASKID; 
        
        SELECT TO_CHAR(SYSDATE,'YYYYMMDD')||SUBSTR(CONCAT('0000',TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(TASK_DIFNO,9,12))),0) +1)),-4)
        INTO C_TASK_DIFO
        FROM TASK_DIF  
        WHERE SUBSTR(TASK_DIFNO,1,8) = TO_CHAR(SYSDATE,'YYYYMMDD');
        
        INSERT INTO TASK_DIF(TASK_DIFNO,FROMTABLE,TASKID,TYPE,DIF_USERID,DIF_DATE,STATUS,DIF_AREA,DIF_LOC,DIF_BOXNO,DIF_CODE,DIF_QTY)
        VALUES(C_TASK_DIFO,C_FROMTABLE,C_TASKID,C_TYPE,C_EDITWHO,SYSDATE,'0',C_PUTAWAYZONE,C_TOLOC,C_BOXNO,C_DIF_CODE,C_DIF_QTY);
        COMMIT;
        
        
    END;     
    END IF;  
    
    
    IF C_TYPE = 'PICK' AND C_FROMTABLE='PICKDETAIL' THEN 
    BEGIN
    
        SELECT A.BOXNO,A.FROMLOC,B.PUTAWAYZONE,A.EDITWHO INTO C_BOXNO,C_TOLOC,C_PUTAWAYZONE,C_EDITWHO
        FROM TASKDETAIL A,LOC B 
        WHERE A.FROMLOC=B.LOC
        AND A.TASKDETAILKEY=C_TASKID;
        
        SELECT TO_CHAR(SYSDATE,'YYYYMMDD')||SUBSTR(CONCAT('0000',TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(TASK_DIFNO,9,12))),0) +1)),-4)
        INTO C_TASK_DIFO
        FROM TASK_DIF  
        WHERE SUBSTR(TASK_DIFNO,1,8) = TO_CHAR(SYSDATE,'YYYYMMDD');
        
        INSERT INTO TASK_DIF(TASK_DIFNO,FROMTABLE,TASKID,TYPE,DIF_USERID,DIF_DATE,STATUS,DIF_AREA,DIF_LOC,DIF_BOXNO,DIF_CODE,DIF_QTY)
        VALUES(C_TASK_DIFO,C_FROMTABLE,C_TASKID,C_TYPE,C_EDITWHO,SYSDATE,'0',C_PUTAWAYZONE,C_TOLOC,C_BOXNO,C_DIF_CODE,C_DIF_QTY);
        COMMIT;
        
    END;     
    END IF;  

    IF C_TYPE = 'BOZHONG' AND C_FROMTABLE='TASKDETAIL' THEN 
    BEGIN
    
        SELECT A.BOXNO,A.TOLOC,B.PUTAWAYZONE,A.EDITWHO INTO C_BOXNO,C_TOLOC,C_PUTAWAYZONE,C_EDITWHO--,C_EDITDATE
        FROM TASKDETAIL A,LOC B 
        WHERE A.TOLOC=B.LOC
        AND A.TASKDETAILKEY=C_TASKID;
        
        SELECT TO_CHAR(SYSDATE,'YYYYMMDD')||SUBSTR(CONCAT('0000',TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(TASK_DIFNO,9,12))),0) +1)),-4)
        INTO C_TASK_DIFO
        FROM TASK_DIF  
        WHERE SUBSTR(TASK_DIFNO,1,8) = TO_CHAR(SYSDATE,'YYYYMMDD');
        
        INSERT INTO TASK_DIF(TASK_DIFNO,FROMTABLE,TASKID,TYPE,DIF_USERID,DIF_DATE,STATUS,DIF_AREA,DIF_LOC,DIF_BOXNO,DIF_CODE,DIF_QTY)
        VALUES(C_TASK_DIFO,C_FROMTABLE,C_TASKID,C_TYPE,C_EDITWHO,sysdate,'0',C_PUTAWAYZONE,C_TOLOC,C_BOXNO,C_DIF_CODE,C_DIF_QTY);
        COMMIT;
        
    END;     
    END IF;
    
    
    
    IF C_TYPE = 'PACK' AND C_FROMTABLE='PACK_CASE' THEN 
    BEGIN
        /*
        SELECT A.BOXNO,C.PACKLOC,B.PUTAWAYZONE,A.EDITWHO,A.EDITDATE 
        INTO C_BOXNO,C_TOLOC,C_PUTAWAYZONE,C_EDITWHO,C_EDITDATE
        FROM PACK_CASE A,LOC B,STORER C
        WHERE A.CONSK=C.STORERKEY
        AND C.PACKLOC=B.LOC
        AND A.PACKID=C_TASKID;
        */
         
        SELECT BOXNO ,(SELECT PACKLOC FROM STORER WHERE STORERKEY=PC.CONSK),PUTAWAYZONE,PACK_USER--,NVL(PACK_DATE,SYSDATE)
        INTO C_BOXNO,C_TOLOC,C_PUTAWAYZONE,C_EDITWHO--,C_EDITDATE
        FROM PACK_CASE PC
        WHERE PACKID=C_TASKID;
        
        SELECT TO_CHAR(SYSDATE,'YYYYMMDD')||SUBSTR(CONCAT('0000',TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(TASK_DIFNO,9,12))),0) +1)),-4)
        INTO C_TASK_DIFO
        FROM TASK_DIF  
        WHERE SUBSTR(TASK_DIFNO,1,8) = TO_CHAR(SYSDATE,'YYYYMMDD');
        
        INSERT INTO TASK_DIF(TASK_DIFNO,FROMTABLE,TASKID,TYPE,DIF_USERID,DIF_DATE,STATUS,DIF_AREA,DIF_LOC,DIF_BOXNO,DIF_CODE,DIF_QTY)
        VALUES(C_TASK_DIFO,C_FROMTABLE,C_TASKID,C_TYPE,C_EDITWHO,sysdate,'0',C_PUTAWAYZONE,C_TOLOC,C_BOXNO,C_DIF_CODE,C_DIF_QTY);
        COMMIT;
        
    END;     
    END IF;       
    
END;
/

prompt
prompt Creating procedure NSP_INSERT_PACK_CASE
prompt =======================================
prompt
CREATE OR REPLACE PROCEDURE NSP_INSERT_PACK_CASE(FROMTABLE      IN VARCHAR2,
                                                 L_FROMTYPE       IN VARCHAR2,
                                                 L_PICKDETAILKEY  IN VARCHAR2,
                                                 L_DOC_CASEID     IN VARCHAR2,
                                                 L_DOC_CASELINENO IN VARCHAR2,
                                                 V_RETRUN       OUT VARCHAR2) IS
  
  L_CODE VARCHAR2(20);

BEGIN
        
 
IF L_FROMTYPE='0' THEN
    BEGIN
        --若为RF拣货，更新箱号到pickdetail，为插入打包数据做准备
        /* Formatted on 2011/12/12 22:31 (Formatter Plus v4.8.8) */
        UPDATE pickdetail
           SET (boxno, pick_date, pick_user,pickno) =
                  (SELECT MAX (boxno), MAX (NVL (pick_date, SYSDATE)),
                          MAX (NVL (pick_user, 'WH1')),max(pickno)
                     FROM taskdetail
                    WHERE pickdetailkey = L_PICKDETAILKEY);
         --插入打包任务
         INSERT INTO PACK_CASE
          (BATCH_NO, FROMTABLE,FROMTYPE,PICKDETAILKEY,STORERKEY,BOXNO,BOXNOBAK,CASEID,CASELINENO,DOC_NUMBER,SEQ,SKU,PACKQTY,DISCOUNT,PICKNO,SOW_USER,SOW_DATE,
          TYPE,PRICE,MY,STATUS,CONSK,SHORTNAME,EXPORTNO,BARCODE,ROUTE,PUTAWAYZONE,DESCR,PACKLOC,STATION )
            SELECT '','PICKDETAIL',L_FROMTYPE,PICKDETAILKEY,STORERKEY,NVL(BOXNO,' '),NVL(BOXNO,' '),'', '',ORDERKEY,ORDERLINENUMBER,SKU,QTY,100,PICKNO,PICK_USER,PICK_DATE,
          (SELECT TYPE FROM ORDERS WHERE ORDERKEY=PK.ORDERKEY ),
           (SELECT PRICE FROM SKU WHERE SKU.SKU=PK.SKU AND SKU.STORERKEY=PK.STORERKEY),
           QTY*(SELECT PRICE FROM SKU WHERE SKU.SKU=PK.SKU AND SKU.STORERKEY=PK.STORERKEY),'0',
           (SELECT CONSIGNEEKEY FROM ORDERS WHERE ORDERKEY=PK.ORDERKEY),
           (SELECT C_COMPANY FROM ORDERS WHERE ORDERKEY=PK.ORDERKEY),
           (SELECT EXPORTNO FROM LOC WHERE LOC=(SELECT PACKLOC FROM STORER WHERE STORERKEY=(SELECT CONSIGNEEKEY FROM ORDERS WHERE ORDERKEY=PK.ORDERKEY)) ),
           (SELECT BARCODE FROM SKU WHERE SKU.SKU=PK.SKU AND SKU.STORERKEY=PK.STORERKEY),       
           (SELECT ROUTE FROM STORER WHERE STORERKEY=(SELECT CONSIGNEEKEY FROM ORDERS WHERE ORDERKEY=PK.ORDERKEY)),
           (SELECT PUTAWAYZONE FROM LOC WHERE LOC=PK.FROMLOC ),
           (SELECT nvl(DESCR,' ') FROM SKU WHERE SKU.SKU=PK.SKU AND SKU.STORERKEY=PK.STORERKEY),
           (SELECT PACKLOC FROM STORER WHERE STORERKEY=(SELECT CONSIGNEEKEY FROM ORDERS WHERE ORDERKEY=PK.ORDERKEY)),
           (SELECT STATION FROM STORER WHERE STORERKEY=(SELECT CONSIGNEEKEY FROM ORDERS WHERE ORDERKEY=PK.ORDERKEY))
        FROM PICKDETAIL PK
        WHERE  PICKDETAILKEY=L_PICKDETAILKEY;
    END;
END IF;

  /**
  当传入的为4，代表工作站拣货，传入的 pickdetailkey为拣货流水号pickno
  **/
  IF L_FROMTYPE = '4' THEN
  BEGIN
     INSERT INTO PACK_CASE
          (BATCH_NO, FROMTABLE,FROMTYPE,PICKDETAILKEY,STORERKEY,BOXNO,BOXNOBAK,CASEID,CASELINENO,DOC_NUMBER,SEQ,SKU,PACKQTY,DISCOUNT,PICKNO,SOW_USER,SOW_DATE,
          TYPE,PRICE,MY,STATUS,CONSK,SHORTNAME,EXPORTNO,BARCODE,ROUTE,PUTAWAYZONE,DESCR)
        SELECT '','PICKDETAIL',L_FROMTYPE,PICKDETAILKEY,STORERKEY,NVL(BOXNO,' '),NVL(BOXNO,' '),'', '',ORDERKEY,ORDERLINENUMBER,SKU,QTY,100,PICKNO,PICK_USER,PICK_DATE,
          (SELECT TYPE FROM ORDERS WHERE ORDERKEY=PK.ORDERKEY ),
           (SELECT PRICE FROM SKU WHERE SKU.SKU=PK.SKU AND SKU.STORERKEY=PK.STORERKEY),
           QTY*(SELECT PRICE FROM SKU WHERE SKU.SKU=PK.SKU AND SKU.STORERKEY=PK.STORERKEY),'0',
           (SELECT CONSIGNEEKEY FROM ORDERS WHERE ORDERKEY=PK.ORDERKEY),
           (SELECT C_COMPANY FROM ORDERS WHERE ORDERKEY=PK.ORDERKEY),
           (SELECT EXPORTNO FROM LOC WHERE LOC=(SELECT PACKLOC FROM STORER WHERE STORERKEY=(SELECT CONSIGNEEKEY FROM ORDERS WHERE ORDERKEY=PK.ORDERKEY)) ),
           (SELECT BARCODE FROM SKU WHERE SKU.SKU=PK.SKU AND SKU.STORERKEY=PK.STORERKEY),       
           (SELECT ROUTE FROM STORER WHERE STORERKEY=(SELECT CONSIGNEEKEY FROM ORDERS WHERE ORDERKEY=PK.ORDERKEY)),
           (SELECT PUTAWAYZONE FROM LOC WHERE LOC=PK.FROMLOC ),
           (SELECT nvl(DESCR,' ') FROM SKU WHERE SKU.SKU=PK.SKU AND SKU.STORERKEY=PK.STORERKEY)
        FROM PICKDETAIL PK
        WHERE  pickno=L_PICKDETAILKEY;
  END;
  END IF;
  IF L_FROMTYPE = '5' THEN
  BEGIN
    INSERT INTO PACK_CASE(BATCH_NO,PACKID,FROMTABLE,FROMTYPE,PICKDETAILKEY,STORERKEY,BOXNO,BOXNOBAK,CASEID,CASELINENO,
    TYPE,DOC_NUMBER,SEQ,SKU,PACKQTY,CONFIRM_QTY,PRICE,DISCOUNT,MY,STATUS,CONSK,SHORTNAME,EXPORTNO,BARCODE)
    SELECT BATCHNO,L_CODE,'BOXDETAIL',FROMTYPE,REGISTER,STORERKEY,BOXNO,BOXNO,CASEID,CASELINENO,
    TYPE,XSO_NUMBER,SEQ,SKU,PACKQTY,PACKQTY,PRICE,DISCOUNT,MY,STATUS,CONSK,SHORTNAME,EXPORTNO,XSO_USER
    FROM XSO_CASEDETAIL B
    WHERE B.CASEID = L_DOC_CASEID ;
  END;
  /*
  ELSE
  BEGIN
    INSERT INTO PACK_CASE(BATCH_NO,PACKID,FROMTABLE,FROMTYPE,PICKDETAILKEY,STORERKEY,BOXNO,BOXNOBAK,CASEID,CASELINENO,
    TYPE,DOC_NUMBER,SEQ,SKU,PACKQTY,CONFIRM_QTY,PRICE,DISCOUNT,MY,STATUS,CONSK,SHORTNAME,EXPORTNO,BARCODE)
    SELECT BATCHNO,L_CODE,'BOXDETAIL',FROMTYPE,REGISTER,STORERKEY,BOXNO,BOXNO,CASEID,CASELINENO,
    TYPE,XSO_NUMBER,SEQ,SKU,PACKQTY,PACKQTY,PRICE,DISCOUNT,MY,STATUS,CONSK,SHORTNAME,EXPORTNO,XSO_USER
    FROM XSO_CASEDETAIL B
    WHERE B.CASEID = L_DOC_CASEID AND B.CASELINENO = L_DOC_CASELINENO;
  END;
  */
  END IF;

  COMMIT;
  V_RETRUN := 'SUCCESS';
  RETURN;

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    V_RETRUN := 'FALSE';
    RETURN;
END;
/

prompt
prompt Creating procedure NSP_LOTXLOCXID
prompt =================================
prompt
create or replace procedure NSP_LotxLocxID(Name in out type, Name in out type
                                                )as
  v_ALLOCATEDQTY NUMBER;     ---配置量
  v_HOLDQTY NUMBER;          ---冻结量
  v_AVAILABLEQTY NUMBER;     ---可用量
  v_PICKEDQTY NUMBER;        ---已拣量
  v_QTY NUMBER;              ---数量      可用量=数量-配置量-已拣量-冻结量
begin
    select  sum(qty) as DOC_QTY,sum(QTYALLOCATED) as DOC_ALLOCATEDQTY,sum(QTYPICKED) as DOC_PICKEDQTY,
                     storerkey,whseid,sku,ADDDATE,ADDWHO,EDITDATE,EDITWHO
                                from  lotxlocxid GROUP BY STORERKEY,SKU

end NSP_LotxLocxID;
/

prompt
prompt Creating procedure NSP_PRE_RECEIVE
prompt ==================================
prompt
CREATE OR REPLACE PROCEDURE nsp_pre_receive
(
   v_xsogroupkey in nvarchar2,
   v_vendor in nvarchar2,
   v_altsku in nvarchar2,
   v_qty in nvarchar2,
   v_user in nvarchar2,
   v_storerkey in nvarchar2
)

as
vnum number :=0;
vnum1 number :=0;
i number :=0;
begin

 SELECT nvl(count(1),0) into vnum
  FROM podetail, sku
 WHERE sku.sku = podetail.sku
   AND podetail.storerkey = sku.storerkey
   AND sku.barcode = v_altsku
   AND SKU.STORERKEY=v_storerkey
   AND podetail.pokey IN (SELECT pokey FROM xsogroupdetail  WHERE xsogroupkey = v_xsogroupkey );
   
   select nvl(max(to_number(Linenumber)),0) into i from pre_receive where xsogroupkey=v_xsogroupkey;
   if(i=0)then
       begin 
          i:=1;
       end;
   elsif(i>0)then
       begin 
         i:=i+1;
       end;
    else
      begin 
        i:=1;
      end;
   end if;
 insert into pre_receive(xsogroupkey,vendor,altsku,qty,rec_user,rec_date,Linenumber,storerkey) values(v_xsogroupkey,v_vendor,v_altsku,v_qty,v_user,sysdate,i,v_storerkey);
 i:=i+1;
 if(vnum>0)then
    begin
        declare cursor vCursor is  select sku.sku,
            sku.barcode,
            podetail.pokey
            from podetail,sku
            where sku.sku=podetail.sku
            and podetail.storerkey=sku.storerkey
            and sku.barcode=v_altsku
            AND SKU.STORERKEY=v_storerkey
            and podetail.pokey in (select pokey from xsogroupdetail where xsogroupkey=v_xsogroupkey);
            vsku nvarchar2(20);
            valtsku nvarchar2(30);
            vpokey nvarchar2(20);
             begin
                open vCursor;
                fetch vCursor into vsku,valtsku,vpokey;
                while vCursor%found
                loop
                    begin                       
                       insert into pre_receive(xsogroupkey,vendor,sku,altsku,qty,rec_user,rec_date,pokey,Linenumber,storerkey) values(v_xsogroupkey,v_vendor,vsku,valtsku,v_qty,v_user,sysdate,vpokey,i,v_storerkey);
                        i:=i+1;
                    end;
                fetch vCursor into vsku,valtsku,vpokey;
                end loop;
                close vCursor;
            end;
     end ;
 end if;

if(vnum=0)then
       begin
           select nvl(count(1),0)  into vnum1 from sku where barcode=v_altsku and storerkey=v_storerkey;
           if(vnum1>0) then
              declare cursor vCursor1 is  select sku,
              barcode from sku where barcode=v_altsku and storerkey=v_storerkey;
            vsku1 nvarchar2(20);
            valtsku1 nvarchar2(30);
             begin
                open vCursor1;
                fetch vCursor1 into vsku1,valtsku1;
                while vCursor1%found
                loop
                    begin                     
                       insert into pre_receive(xsogroupkey,vendor,sku,altsku,qty,rec_user,rec_date,Linenumber,storerkey) values(v_xsogroupkey,v_vendor,vsku1,valtsku1,v_qty,v_user,sysdate,i,v_storerkey);
                        i:=i+1;   
                    end;

                fetch vCursor1 into vsku1,valtsku1;
                end loop;
                close vCursor1;
            end;
           end if;
      end;
   End if;
 end;
/

prompt
prompt Creating procedure NSP_SKUXLOC
prompt ==============================
prompt
create or replace procedure NSP_SKUXLOC
as 
   batchno          number;      --批次号，每次执行递增
   
   --待亏库
 
begin
  --计算获得批次号
  select nvl(max(batchno),0)+1 into batchno  from LIPS_JOBS_STOCK;
  --待亏库
  INSERT INTO LIPS_JOBS_STOCK (DOC_STORERKEY,DOC_SKU,DOC_QTY,DOC_ALLOCATEDQTY, DOC_PICKEDQTY,
                             DOC_HOLDQTY,DOC_AVAILABLEQTY,DOC_WH,DOC_LOC,Batchno)
                         (select t1.*,'待亏库',batchno from (SELECT   A.storerkey,A.sku,SUM(A.QTY) AS QTY, sum(A.QTYALLOCATED) as QTYALLOCATED,
               sum(A.QTYPICKED) as QTYPICKED ,SUM(A.QTYHOLD) as QTYHOLD,
               sum(QTY-QTYALLOCATED-QTYPICKED-QTYHOLD) AS qtyavailable,A.WHSEID
FROM 
 ( select sum(qty) as QTY, sum(QTYALLOCATED) as QTYALLOCATED,sum(QTYPICKED) as QTYPICKED ,storerkey,sku,0 AS QTYHOLD,WHSEID      
        --into k_qty,k_qtyallocated, k_qtypicked  
        from lotxlocxid llx
        where (loc in(select nvl(qc_loc1,'0') from putawayzone ) or loc='QC99' )
        GROUP BY STORERKEY,SKU,WHSEID
        UNION 
        select 0 as QTY, 0 as QTYALLOCATED,0 as QTYPICKED ,storerkey,sku,SUM(QTY) QTYHOLD,WHSEID
        --into k_qty,k_qtyallocated, k_qtypicked  
        from lotxlocxid llx
        where (loc in(select nvl(qc_loc1,'0') from putawayzone ) or loc='QC99' )AND STATUS='HOLD'
        GROUP BY STORERKEY,SKU,WHSEID)  A
GROUP BY storerkey,sku,WHSEID
                          ) t1) ;
 --待盈库                        
INSERT INTO LIPS_JOBS_STOCK (DOC_STORERKEY,DOC_SKU,DOC_QTY,DOC_ALLOCATEDQTY, DOC_PICKEDQTY,
                             DOC_HOLDQTY,DOC_AVAILABLEQTY,DOC_WH,DOC_LOC,batchno)
                         (select t.*,'待盈库',batchno from (SELECT   A.storerkey,A.sku,SUM(A.QTY) AS QTY, sum(A.QTYALLOCATED) as QTYALLOCATED,
               sum(A.QTYPICKED) as QTYPICKED ,SUM(A.QTYHOLD) as QTYHOLD,
               sum(QTY-QTYALLOCATED-QTYPICKED-QTYHOLD) AS qtyavailable,A.WHSEID
FROM 
 ( select sum(qty) as QTY, sum(QTYALLOCATED) as QTYALLOCATED,sum(QTYPICKED) as QTYPICKED ,storerkey,sku,0 AS QTYHOLD,WHSEID      
        --into k_qty,k_qtyallocated, k_qtypicked  
        from lotxlocxid llx
        where loc in(select nvl(qc_loc2,'0') from putawayzone)
        GROUP BY STORERKEY,SKU,WHSEID
        UNION 
        select 0 as QTY, 0 as QTYALLOCATED,0 as QTYPICKED ,storerkey,sku,SUM(QTY) QTYHOLD,WHSEID
        --into k_qty,k_qtyallocated, k_qtypicked  
        from lotxlocxid llx
        where loc in(select nvl(qc_loc2,'0') from putawayzone)AND STATUS='HOLD'
        GROUP BY STORERKEY,SKU,WHSEID)  A
GROUP BY storerkey,sku,WHSEID
                          )t) ;
                         
--正常库
INSERT INTO LIPS_JOBS_STOCK (DOC_STORERKEY,DOC_SKU,DOC_QTY,DOC_ALLOCATEDQTY, DOC_PICKEDQTY,
                             DOC_HOLDQTY,DOC_AVAILABLEQTY,DOC_WH,DOC_LOC,Batchno)
                         (select t2.*,'正常库',batchno from (SELECT   A.storerkey,A.sku,SUM(A.QTY) AS QTY, sum(A.QTYALLOCATED) as QTYALLOCATED,
               sum(A.QTYPICKED) as QTYPICKED ,SUM(A.QTYHOLD) as QTYHOLD,
               sum(QTY-QTYALLOCATED-QTYPICKED-QTYHOLD) AS qtyavailable,A.WHSEID
FROM 
 ( select sum(qty) as QTY, sum(QTYALLOCATED) as QTYALLOCATED,sum(QTYPICKED) as QTYPICKED ,storerkey,sku,0 AS QTYHOLD,WHSEID      
        --into k_qty,k_qtyallocated, k_qtypicked  
        from lotxlocxid llx
        where (loc not in(select nvl(qc_loc1,'0') from putawayzone ) and loc !='QC99') and loc not in(select nvl(qc_loc2,'0') from putawayzone)
        GROUP BY STORERKEY,SKU,WHSEID
        UNION 
        select 0 as QTY, 0 as QTYALLOCATED,0 as QTYPICKED ,storerkey,sku,SUM(QTY) QTYHOLD,WHSEID
        --into k_qty,k_qtyallocated, k_qtypicked  
        from lotxlocxid llx
        where (loc not in(select nvl(qc_loc1,'0') from putawayzone ) and loc !='QC99' ) and loc not in(select nvl(qc_loc2,'0') from putawayzone) AND STATUS='HOLD'
        GROUP BY STORERKEY,SKU,WHSEID)  A
GROUP BY storerkey,sku,WHSEID
                          ) t2) ;
end ;
/

prompt
prompt Creating procedure NSP_TASKDETAIL_PA
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE nsp_taskdetail_pa
(
   v_receiptkey in varchar2,
   v_caseid in nvarchar2,
   v_userid in nvarchar2,  
   v_qty in number,
   v_storerkey in nvarchar2,
   v_sku in varchar2,
   v_toloc in varchar2
)
/***
  *当收货时的货位为STAGE时，生成上架任务
  *若同一商品同一箱号时，数量会增加
  *若同一商品不同箱号时，则新增一条上架任务
  *addwho:tianfanfan
  *adddate:2011/11/17
***/
as
vnum number :=0;
v_toLogicalLocation nvarchar2(20);
v_fromLogicalLocation nvarchar2(20);
v_taskdetailkey nvarchar2(20);
vtcount number :=0;
begin   
    update box set status='1' where boxno=v_caseid;     
    declare cursor vCursor is SELECT SUM (qty) qty, storerkey, sku, lot, toid, uom, toloc
                              FROM itrn
                              WHERE receiptkey = v_receiptkey
                              and storerkey=v_storerkey
                              and sku=v_sku
                              and (toLoc='STAGE' or toLoc='stage')
                              AND (   trantype = 'DP'
                                  OR (trantype = 'AJ' AND sourcetype = 'ntrAdjustmentDetailUnreceive'
                                     )
                                 )
                              GROUP BY storerkey, sku, lot, toid, toloc, uom;
    vqty number;
    vstorerkey nvarchar2(20);
    vsku nvarchar2(20);
    vlot nvarchar2(20);
    vtoid nvarchar2(20);
    vuom nvarchar2(10);
    vloc nvarchar2(20);
     begin
        open vCursor;
        fetch vCursor into vqty,vstorerkey,vsku,vlot,vtoid,vuom,vloc;
        while vCursor%found
        loop
            begin
               SELECT count(1) into vtcount from Taskdetail WHERE LOT = vlot AND FROMID = vtoid AND STORERKEY = vstorerkey AND SKU = vsku AND STATUS = '0' AND TaskType = 'PA' and boxno=v_caseid;
               if(vtcount>0) then
                   begin
                        UPDATE TaskDetail SET QTY = QTY + v_qty, UOMQTY = UOMQTY + v_qty, SOURCEKEY = v_receiptkey,editwho=v_userid,editdate=sysdate WHERE LOT = vlot AND FROMID = vtoid AND STORERKEY = vstorerkey AND SKU = vsku AND TaskType = 'PA' AND STATUS = '0'
                        AND TASKDETAILKEY IN
                        (SELECT MAX(TASKDETAILKEY) TASKDETAILKEY
                         FROM TaskDetail WHERE LOT = vlot AND FROMID = vtoid AND STORERKEY = vstorerkey AND SKU = vsku
                        AND TaskType = 'PA' AND STATUS = '0' and boxno=v_caseid ) and boxno=v_caseid;
                   end;
                 else
                   begin
                     NSP_GETKEY('TASKDETAIL',10,V_TASKDETAILKEY); 
                     select nvl(LogicalLocation,'') into v_fromLogicalLocation from LOC where LOC=vloc;
                     select nvl(LogicalLocation,'UNKNOWN') into v_toLogicalLocation from LOC where LOC=v_toloc;
                     INSERT INTO TASKDETAIL ( TaskDetailkey, TaskType, Storerkey, Sku, Lot, FromLoc, FromId, ToLoc, ToId, UOM, UOMQTY, QTY, logicalfromloc, logicaltoloc, Sourcekey, Sourcetype, boxno,AddDate, AddWho, EditDate, EditWho)
                     VALUES ( v_taskdetailkey, 'PA', vstorerkey, vsku, vlot, vloc, vtoid,v_toloc,vtoid , '6', v_qty, v_qty, v_fromLogicalLocation, v_toLogicalLocation, v_receiptkey, ' ', v_caseid,sysdate,v_userid,sysdate,v_userid );
                             
                   end;
                end if;

            end;
        fetch vCursor into vqty,vstorerkey,vsku,vlot,vtoid,vuom,vloc;
        end loop;
        close vCursor;
    end;
 end;
/

prompt
prompt Creating procedure NSP_WCS_BCW
prompt ==============================
prompt
create or replace procedure NSP_WCS_BCW(v_BOXNO  in varchar2,
                                        n_WEIGHT in number,
                                        v_retrun out varchar2,
                                        v_result out varchar2
                                        
                                        ) is
  L_code         number(10, 4):=0.3;
  L_bookweight   number(10, 4);
  L_boxweight    number(10, 4);
  this_boxweight number(10, 4);
  pre_Dif_wgt    number(10, 4);
  pre_Dif_times  integer;
  pre_id         integer;
  this_Dif_wgt   number(10, 4);
  this_Dif_times integer;
  v_consk        varchar2(30);
  v_storerkey    varchar2(30);
  v_shortname    varchar2(30);
  v_my           number(10, 4);
  v_net_weight   number(10, 4);
  v_act_weight   number(10, 4);
  v_caseid       varchar2(10);
  v_batch_no     varchar2(20);
  v_qty          number(10, 4);
  LL_COUNT       number :=0;
  ls_batchno     varchar2(20);
  --add 向caseid插入成功后将 box的stauts 改为0  调用存储过程准备out参数
  NSP_CHECKBOXNO_message varchar(30);
  NSP_CHECKBOXNO_return  varchar(10);
  
begin
  v_result := 'false';
  --箱总量
  
  select nvl(WEIGHT,0), nvl(Dif_wgt,0), nvl(Dif_times,0)
    into L_BOXWEIGHT, pre_Dif_wgt, pre_Dif_times
    from box
   where boxno = v_BOXNO;

  --图书重量
  select nvl(sum(nvl(a.packqty,0) * nvl(b.stdnetwgt,0)),0)
    into L_bookweight
    from PACK_CASE a, SKU b
   where a.storerkey = b.storerkey
     and a.sku = b.sku
     and a.BOXNO = v_BOXNO and a.status='0' ;

   -- 百分比（参数）此参数需要在配置表中自定义，到时要同时插入两个配置表
  /*select to_number(code)
    into L_code
    from codelkup
   where listname = '重量差异';
*/
  --判断规则：ABS（重量 – 箱重量 – 图书重量）/重量 > 百分比（参数） 校验重量通过
  --从WCS_BCW取得id
   select nvl(max(id), 0) into pre_id from WCS_BCW;
   pre_id := pre_id + 1;

  if ABS(n_WEIGHT - L_BOXWEIGHT - L_bookweight) / n_WEIGHT < L_code then
    v_result:='true';
    select trim(to_char(nvl(max(a.caseid), 0) + 1, '0000000000'))
      into v_caseid
      from caseid a;
    /**morris 20111211  delete 
    select to_char(sysdate, 'yymmdd') ||
           trim(to_char(nvl(max(substr(a.batchno, 6, 4)), 0) + 1, '0000'))
      into v_batch_no
      from caseid a;
      ****/
      --修改pack_case
      declare
        cursor c is
          select a.packid
            from pack_case a
           where a.boxno = v_BOXNO
             and a.status = '0';
        v_packid varchar2(10); --系统箱号
      --计算每条打包数据的理论重量
      begin
        open c; --打开游标
        fetch c into v_packid;
        while (c%found) loop
    
          update pack_case p
             set p.net_weight = p.packqty *
                                (select s.stdnetwgt
                                   from sku s, pack_case p
                                  where s.storerkey = p.storerkey
                                    and s.sku = p.sku
                                    and p.packid = v_packid),
                                    p.act_weight= n_WEIGHT
           where p.packid = v_packid;
    
          fetch c into v_packid;
        end loop;
        close c;
      end;
  
       --取门店号
  
       select min(consk), min(storerkey), min(shortname), sum(my), sum(nvl(net_weight,0)), n_WEIGHT,sum(a.PACKQTY)
          into v_consk,v_storerkey, v_shortname,v_my,v_net_weight,v_act_weight,v_qty
          from PACK_CASE a
         where a.BOXNO = v_BOXNO and a.status='0';
        --获取包件批次号 morris 20111210 add forjxxh start
        --当包件号存在时，取已经存在的且未打印的包件批次号
        SELECT COUNT(1) INTO LL_COUNT
          FROM caseid
         WHERE status = '-1' AND consk IN (SELECT consk
                                             FROM storer
                                            WHERE packloc =
                                                           (SELECT packloc
                                                              FROM storer
                                                             WHERE storerkey = v_consk));
        IF LL_COUNT>0 THEN
        	SELECT MAX(NVL(BATCHNO,'')) INTO LS_BATCHNO
          FROM caseid
         WHERE status = '-1' AND consk IN (SELECT consk
                                             FROM storer
                                            WHERE packloc =
                                                           (SELECT packloc
                                                              FROM storer
                                                             WHERE storerkey = v_consk));
        	IF LS_BATCHNO<> '' THEN
        		v_batch_no :=LS_BATCHNO;
            ELSE
                 NSP_GETKEY('CAES_BATCH',16,v_batch_no);
        	END IF;
        ELSE
            NSP_GETKEY('CAES_BATCH',16,v_batch_no);    
        END IF;
        --获取包件批次号 morris 20111210 add forjxxh end 
 
  
        --更新包件主表
        insert into caseid (batchno, caseid,caseid_bak,doc_storerkey,wh,consk,shortname,status,loc,qty,amt,net,weight,netweight,volume,BOX_WGT)
        values
          (v_batch_no,v_caseid, v_caseid,v_storerkey,1,v_consk, v_shortname,'0',1,v_qty,v_my,v_my,v_act_weight,v_net_weight,1,L_BOXWEIGHT);
  
        --更新包件明细表
        insert into casedetail
          (fromtable,
           fromtype,
           caseid,
           caseid_bak,
           linenumber,
           packid,
           pickdetailkey,
           storerkey,
           type,
           doc_number,
           sku,
           qty,
           seq,
           price,
           discount,
           amt,
           net,
           netweight,
           adddate,
           addwho)
          select 'pack_case',
                 '0',
                 v_caseid,
                 v_caseid,
                lpad(rownum,5,'0'),--不足5位前面补0
                 packid,
                 pickdetailkey,
                 storerkey,
                 '0',
                 doc_number,
                 sku,
                 PACKQTY,
                 seq,
                 price,
                 discount,
                 MY,
                 MY*DISCOUNT,
                 NET_WEIGHT,
                 sysdate,
                 'SYS'
            from PACK_CASE a
           where a.BOXNO = v_BOXNO  and a.status='0' ;
         --不需复核：直接打印发货单，包括箱标签
         --morris 20111205 modify 插入打印数据
         INSERT INTO AUTO_PRINT(BOXNO,BOXWEIGHT,NET_WEIGHT,ACT_WEIGHT,CUSTOMER,PRINT_FLAG,CASEID,REPORT,COMPUTER_NAME,PRINTER_NAME,PACKLOC)
            SELECT V_BOXNO,L_BOXWEIGHT,L_BOOKWEIGHT,N_WEIGHT,V_CONSK,'N',V_CASEID,REPORT,COMPUTER_NAME,PRINTER_NAME,PACKLOC
            FROM PRINTSET
            WHERE PACKLOC =(SELECT PACKLOC FROM STORER WHERE STORERKEY=V_CONSK);
         /*
    select nvl(max(id), 0) into pre_id from WCS_BCW;
    pre_id := pre_id + 1;
    insert into AUTO_PRINT
      (BATCHNUO,
       ID,
       BOXNO,
       BOXWEIGHT,
       NET_WEIGHT,
       ACT_WEIGHT,
       shop,
       caseid)
    values
      (v_BOXNO,
       pre_id,
       v_BOXNO,
       L_BOXWEIGHT,
       L_bookweight,
       n_WEIGHT,
       v_consk,
       v_caseid);
       */
      --向caseid插入成功后将 pack_case.status='9'
     update pack_case p set p.status='9' where p.boxno=v_BOXNO;
     --向caseid插入成功后将 box的stauts 改为0
     nsp_checkboxno(v_BOXNO, '2', NSP_CHECKBOXNO_message,NSP_CHECKBOXNO_return);
     
     
     --表示称重成功flag=1
       insert into WCS_BCW
    (BATCHNO, ID, BOXNO, BOXWEIGHT, NET_WEIGHT, ACT_WEIGHT,flag)
    values
    (v_BOXNO, pre_id, v_BOXNO, L_BOXWEIGHT, L_bookweight, n_WEIGHT,'1');
    
     else 
      --表示称重不符合条件 flag=0 
      insert into WCS_BCW
    (BATCHNO, ID, BOXNO, BOXWEIGHT, NET_WEIGHT, ACT_WEIGHT,flag)
  values
    (v_BOXNO, pre_id, v_BOXNO, L_BOXWEIGHT, L_bookweight, n_WEIGHT,'0');
  end if;
 
 
  
 

  --箱体差异算法：箱重量  = 重量- 图书重量
--  this_boxweight := (n_WEIGHT - L_bookweight);
 -- if this_boxweight - L_BOXWEIGHT = 0 then
   -- this_Dif_wgt := L_BOXWEIGHT + L_bookweight - n_WEIGHT;
 -- else
 -- ?	IF 周转箱差异重量值=0 理论值（物流箱+书）-实际值=误差值  else 本次误差值+原有的误差值）/2
  this_boxweight := (L_BOXWEIGHT+L_bookweight-n_WEIGHT);
  if  L_BOXWEIGHT <> 0 then
        if(pre_Dif_wgt=0) then
         this_Dif_wgt := (this_boxweight  + pre_Dif_wgt);
         else 
            this_Dif_wgt := (this_boxweight + pre_Dif_wgt) / 2;
         end if;
  end if;
  this_Dif_times := pre_Dif_times + 1;
  --输入重量！＝箱重量+图书重量
  if(n_WEIGHT-L_BOXWEIGHT-L_bookweight!=0) then
  update box
     set Dif_wgt = this_Dif_wgt, Dif_times = this_Dif_times
   where boxno = v_BOXNO;
  end if;

  
  commit;
  v_retrun := 'success';
  return;

exception
  when others then
    rollback;
    v_retrun := 'false';
    v_result := 'false';
    return;
end;
/

prompt
prompt Creating procedure NSP_XSO_CASEDETAIL
prompt =====================================
prompt
create or replace procedure NSP_XSO_CASEDETAIL(v_fromtype   in varchar2, --Wms主配时（PICK/SOW)
                                             v_boxno      in varchar2, --周转箱号
                                             v_caseid     in varchar2, --系统箱号    
                                             v_caselineno in varchar2, --系统箱号明细                                               
                                             v_number     in varchar2, --任务单号
                                             v_nubmerseq  in varchar2, --任务单明细                                             
                                             v_packqty    in integer ---确认数量                                             
                                             ) as
  v_count NUMBER;
  v_wesqty NUMBER;
  v_aqty NUMBER;
  v_status NUMBER;
  v_status9 NUMBER;

begin

  savepoint point1;
  --新增主配记录信息
  insert into xso_casedetail
    (FROMTYPE,
     BATCHNO,
     REGISTER,
     STORERKEY,
     WH,
     BOXNO,
     CASEID,
     CASELINENO,
     TYPE,
     XSO_NUMBER,
     SEQ,
     SKU,
     DESCR,
     PACKQTY,
     PRICE,
     DISCOUNT,
     MY,
     STATUS,
     DONE,
     CONSK,
     EXPORTNO,
     LOC,
     SHORTNAME,
     CAT,
     CATNAME,
     SUSR1,
     SUSR2,
     SUSR3,
     SUSR4,
     SUSR5,
     XSO_DATE,
     XSO_USER)
    select v_fromtype,
           j.batchno,
           j.doc_register,
           j.doc_storerkey,
           j.doc_wh,
           v_boxno,
           v_caseid,
           v_caselineno,
           j.doc_type,
           v_number,
           v_nubmerseq,
           jd.doc_sku,
           jd.doc_descr,
           v_packqty,
          -- jd.doc_price,
          decode(jd.doc_price,0,nvl(s.price,0),jd.doc_price) doc_price,
           jd.doc_discount,
          -- v_packqty*jd.doc_price*jd.doc_discount/100,
          decode(jd.doc_price,0,nvl(s.price,0),jd.doc_price)*v_packqty*jd.doc_discount/100,
           j.doc_status,
           j.doc_done,
           jd.doc_consk,
           jd.doc_exportno,
           jd.doc_loc,
           jd.doc_shortname,
           jd.doc_cat,
           jd.doc_catname,
           jd.doc_susr1,
           jd.doc_susr2,
           jd.doc_susr3,
           jd.doc_susr4,
           jd.doc_susr5,
           jd.adddate,
           jd.addwho
      from JOBS_XSO j, JOBSCONTEXT_XSO jd,sku s
     where j.doc_number = jd.doc_number
       and jd.doc_number = v_number
       and jd.doc_seq = v_nubmerseq
       and jd.doc_sku=s.sku
       and j.doc_storerkey=s.storerkey
       ;
     --确认数量等于期望数量 则将JOBSCONTEXT_XSO.status=9 表示拣货完成 否则JOBSCONTEXT_XSO.status=5表示拣货中
    -- 修改JOBSCONTEXT_XSO表中DOC_AQTY等于确认的数量
    select  jd.doc_wesqty ,jd.doc_aqty  into v_wesqty, v_aqty   from  JOBSCONTEXT_XSO jd
     WHERE jd.doc_number = v_number
     and jd.doc_seq = v_nubmerseq;
     dbms_output.put_line('key='||v_wesqty|| 'qty='||v_aqty);
     if(v_wesqty-v_aqty-v_packqty=0) then
     UPDATE JOBSCONTEXT_XSO jd
      SET  jd.status='9',jd.doc_aqty = jd.doc_aqty+v_packqty
      WHERE jd.doc_number = v_number
     and jd.doc_seq = v_nubmerseq;
     else
        UPDATE JOBSCONTEXT_XSO jd
      SET  jd.status='5',jd.doc_aqty = jd.doc_aqty+v_packqty
      WHERE jd.doc_number = v_number
     and jd.doc_seq = v_nubmerseq;
     end if;
     
     select count(1) into v_count from  box   where boxno=v_boxno and status='0';
     if v_count=1 then
     update box set status='1' where boxno=v_boxno; --将周转箱状态改为使用中
     end if;
     --如果jobscontext_xso中的status全部为9 则将jobs_xso中的status修改为9
     --计算明细中status=9的数量  
  select count(1)
    into v_status9
    from jobs_xso j, jobscontext_xso jd
   where j.doc_number = jd.doc_number
     and j.doc_number = v_number
     and jd.status = '9';
     --计算明细中的数量 
  select count(1)
    into v_status
    from jobs_xso j, jobscontext_xso jd
   where j.doc_number = jd.doc_number
     and j.doc_number = v_number;
  if v_status9 = v_status then
    UPDATE JOBS_XSO j SET j.status = '9' WHERE j.doc_number = v_number;
  end if;
   
  --修改JOBSCONTEXT_XSO表中DOC_AQTY等于确认的数量
  /*UPDATE JOBSCONTEXT_XSO jd
     SET jd.doc_aqty = jd.doc_aqty+v_packqty
   WHERE jd.doc_number = v_number
     and jd.doc_seq = v_nubmerseq;*/
  --修改 BOX表中STATUS 值=‘1’ 表示使用中
 -- UPDATE BOX SET STATUS = '1' WHERE BOXNO = v_boxno;
  /*select jd.doc_eqty - jd.doc_aqty
    into v_count
    from JOBSCONTEXT_XSO jd
   where jd.doc_number = v_number
     and jd.doc_seq = v_nubmerseq;
  IF v_count > 0 then
    insert into aaa (age) values (v_count);
    
  
  end if;*/

  commit;
   EXCEPTION
  WHEN OTHERS THEN
    

     rollback to savepoint point1;
  

end;
/

prompt
prompt Creating procedure NSP_XSO_GBBL
prompt ===============================
prompt
CREATE OR REPLACE PROCEDURE NSP_XSO_GBBL(X_DOC_NUMBER IN VARCHAR2,X_DOC_TYPE IN NUMBER)
/******************************************************************************************
********************************够包剥离参数及计算逻辑说明 morris 20111216 add for jxxh
**ERP下发主配量：     doc_eqty    JOBSCONTEXT_XSO（门店+商品）            
**主配够包剥离量：    doc_cqty            
**主配线主配量：         doc_wesqty            
**主配完成量：          doc_aqty    JOBSCONTEXT_XSO        
**入重型料架区量：    doc_zqty            
**入重型料架区参数1： case_qty    先去sku表查，sku表中如果没有，去Storer        
**入请配区参数2：     each_qty    先去sku表查，sku表中如果没有，去Storer        
**够包剥离参数3：     gbbl_qty    SELECT * FROM CODELKUP WHERE LISTNAME LIKE 'XSOGBBL' and code='0'		
**请配区库存量：		 stock_qty	skuXLOC,LOTXLOCXID中的QTY(一个储位的货物的QTY的总和）
*******************************************************************************************************************************************************
**类型|    去向    条件                        |                                     doc_eqty    doc_cqty                      | doc_wesqty                                   doc_zqty
**----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**非WH|    主配    整单够包量>=gbbl_qty*包入数 |                                     doc_eqty    floor（doc_eqty/包入数）*包入数|doc_eqty - floor（doc_eqty/包入数）*包入数    0         
**    |            整单够包量<gbbl_qty*包入数  |                                     doc_eqty    0                              |doc_eqty                                      0
**------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**WH  |    入库   doc_eqty<case_qty*包入数     |                                     doc_eqty    0                              |doc_eqty                                      0
**                doc_eqty>=case_qty*包入数    |  stock_qty>=each_qty*包入数         doc_eqty    0                              |doc_eqty - (doc_zqty)                         floor（doc_eqty/包入数）*包入数
**------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**                doc_eqty>=case_qty*包入数    |  stock_qty<each_qty*包入数
**                                             |   且doc_eqty-（each_qty*包入数+
**                                             |   mod（doc_eqty,包入数）
**                                             |   < case_qty*包入数                 doc_eqty    0                              |doc_eqty                                      0
**----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
**                doc_eqty>=case_qty*包入数    |  stock_qty<each_qty*包入数
**                                             |   且doc_eqty-（each_qty*包入数+ 
**                                             |   mod(doc_eqty,包入数）
**                                             |   >=case_qty*包入数                 doc_eqty    0                              |each_qty*包入数+（doc_eqty-doc_eqty/包入数）  doc_eqty - (doc_wesqty)
**************************************************************************************************************************************************************************/
AS  
    X_ROW                   NUMBER:=0;
    X_ROW_1                 NUMBER:=0;
    X_ROW_2                 NUMBER:=0;
    X_STORERKEY_ROW         NUMBER:=0;
    X_DOC_CONSK_COUNT       NUMBER:=0;
    X_DOC_AREA_QTY          NUMBER:=0;
    X_DOC_SEQ               VARCHAR2(5);
    X_DOC_CONSK             VARCHAR2(15);
    X_DOC_STORERKEY         VARCHAR2(15);
    X_DOC_SKU               VARCHAR2(20);
    X_DOC_EQTY              NUMBER:=0;
    X_DOC_CASE_QTY          NUMBER:=0;
    X_DOC_CQTY              NUMBER:=0;
    X_DOC_CASEQTY           NUMBER:=0;
    X_DOC_WESQTY            NUMBER:=0;
    X_DOC_ZCASEQTY          NUMBER:=0;
    X_DOC_ZBOLIQTY          NUMBER:=0;
    X_CASEQTY               NUMBER:=0;
    X_RECEIPTKEY            VARCHAR2(10);
    X_KEYCOUNT              NUMBER:=0;
    X_RECEIPTLINENUMBER     VARCHAR(5);
    X_RECEIPTLINENUMBER_VAR NUMBER:=0;
    X_PACKKEY               VARCHAR2(50);
    X_CASE_QTY              NUMBER:=0;
    X_EACH_QTY              NUMBER:=0;
    X_QPQTY                 NUMBER:=0;
    X_SYQTY                 NUMBER:=0;
    X_INVQTY                NUMBER:=0;
    X_TYPE                  VARCHAR2(2);
    X_QTYEXPECTED           NUMBER:=0;
    X_DOC_PACKKEY           VARCHAR2(10);
    X_DOC_ZQTY              NUMBER:=0;
    C_ROW_1                 NUMBER:=0;
    C_ROW_2                 NUMBER:=0;
    
BEGIN
    SELECT DOC_STORERKEY INTO X_DOC_STORERKEY FROM JOBS_XSO WHERE DOC_NUMBER=X_DOC_NUMBER;--查询出货主
    SELECT COUNT(1) INTO X_ROW FROM JOBSCONTEXT_XSO WHERE DOC_NUMBER=X_DOC_NUMBER;--查询出当前主配单号行数
    SELECT COUNT(1) INTO X_ROW_2 FROM RECEIPT WHERE EXTERNRECEIPTKEY=X_DOC_NUMBER;--查询出当前主配单对应的收货单数
    X_TYPE :='0';
    IF X_DOC_TYPE=1 THEN
        BEGIN
            X_TYPE :='2';
        END;
    END IF;
    
    IF X_ROW_2>=1 THEN--判断当前主配单号是否有已经有生产的收货单，若有，则返回
    BEGIN
        RETURN;
    END;
    END IF;
    
    IF(X_ROW>0)THEN--判断当前主配单号是否存在，若不存在则返回
    BEGIN
        --定义游标，循环得到主配单明细对应的行项目--start
        DECLARE CURSOR CURSOR_JOBSCONTEXT_XSO IS SELECT DOC_SEQ,DOC_CONSK,DOC_SKU,DOC_EQTY,nvl(DOC_CASE_QTY,0),DECODE(NVL(DOC_PACKKEY,' '),' ','XXX',DOC_PACKKEY) FROM JOBSCONTEXT_XSO WHERE DOC_NUMBER=X_DOC_NUMBER AND DOC_CONSK<>'WH';
            BEGIN
                OPEN CURSOR_JOBSCONTEXT_XSO;
                FETCH CURSOR_JOBSCONTEXT_XSO INTO X_DOC_SEQ,X_DOC_CONSK,X_DOC_SKU,X_DOC_EQTY,X_DOC_CASE_QTY,X_DOC_PACKKEY;
                WHILE CURSOR_JOBSCONTEXT_XSO%FOUND
                --更新主配情况下的wesqty和cqty
                LOOP
                    BEGIN                       
                          IF(X_DOC_CASE_QTY=0)THEN--判断包入数是否为0，若为0，则到商品包装主档里找对应的包入数 全部查询不到 默认值1 --start
                          BEGIN
                            IF(X_DOC_PACKKEY='XXX' OR X_DOC_PACKKEY IS NULL) THEN
                            BEGIN
                                SELECT DECODE(CASECNT,0,10,CASECNT) ,PACKKEY INTO X_DOC_CASE_QTY,X_DOC_PACKKEY FROM PACK WHERE PACKKEY =(SELECT PACKKEY FROM SKU WHERE STORERKEY=X_DOC_STORERKEY AND SKU=X_DOC_SKU) ;
                            END;
                            ELSE
                            BEGIN
                                SELECT DECODE(CASECNT,0,10,CASECNT) INTO X_DOC_CASE_QTY FROM PACK WHERE PACK.PACKKEY=X_DOC_PACKKEY;
                            END;
                            END IF;
                          END;
                          END IF;
                          --更新包入数到主配明细表 morris 20111216 add
                          UPDATE JOBSCONTEXT_XSO SET DOC_CASE_QTY=X_DOC_CASE_QTY,DOC_PACKKEY=X_DOC_PACKKEY WHERE DOC_NUMBER=X_DOC_NUMBER AND DOC_SEQ=X_DOC_SEQ AND DOC_SKU=X_DOC_SKU;
                            
                          --计算得到 主配期望数量、够包总数量，并更新到对应的明细行中
                          SELECT MOD(DOC_EQTY,DOC_CASE_QTY),TRUNC(DOC_EQTY/DOC_CASE_QTY)*X_DOC_CASE_QTY 
                          INTO X_DOC_WESQTY,X_DOC_CQTY 
                          FROM JOBSCONTEXT_XSO 
                          WHERE DOC_NUMBER=X_DOC_NUMBER 
                          AND DOC_SEQ=X_DOC_SEQ 
                          AND DOC_SKU=X_DOC_SKU;
                              
                          IF X_DOC_CONSK<>'WH' THEN
                          BEGIN
                            UPDATE JOBSCONTEXT_XSO SET DOC_WESQTY=X_DOC_WESQTY,DOC_CQTY=X_DOC_CQTY WHERE DOC_NUMBER=X_DOC_NUMBER AND DOC_SEQ=X_DOC_SEQ AND DOC_SKU=X_DOC_SKU;
                          END;
                          END IF; 
                          
                                                                                       
                    END;
                FETCH CURSOR_JOBSCONTEXT_XSO INTO X_DOC_SEQ,X_DOC_CONSK,X_DOC_SKU,X_DOC_EQTY,X_DOC_CASE_QTY,X_DOC_PACKKEY;
                END LOOP;
                CLOSE CURSOR_JOBSCONTEXT_XSO;
                --**主配第二种情况**doc_eqty<gbbl_qty*包入数   
                SELECT SUM(floor(DOC_EQTY/DOC_CASE_QTY)) INTO X_DOC_CASEQTY FROM JOBSCONTEXT_XSO WHERE DOC_NUMBER=X_DOC_NUMBER AND DOC_CONSK<>'WH';--计算够包总包数
                SELECT nvl(DESCRIPTION,0) INTO X_CASEQTY FROM CODELKUP WHERE LISTNAME='XSOGBBL';--查询购包剥离参数
                                    
                IF (X_DOC_CASEQTY<X_CASEQTY AND X_DOC_CONSK<>'WH') THEN--判断够包总包数是否大于够包剥离参数，若小于，则update主配期望数量=期望数量
                BEGIN
                    
                    --UPDATE JOBSCONTEXT_XSO SET DOC_CQTY=0,DOC_WESQTY=DOC_EQTY,DOC_ZQTY=0 WHERE DOC_NUMBER=X_DOC_NUMBER;
                    UPDATE JOBSCONTEXT_XSO SET DOC_CQTY=0,DOC_WESQTY=DOC_EQTY,DOC_ZQTY=0 WHERE DOC_NUMBER=X_DOC_NUMBER;
                    
                END;
                END IF;
                
                SELECT COUNT(DISTINCT DOC_CONSK) INTO X_DOC_CONSK_COUNT FROM JOBSCONTEXT_XSO WHERE DOC_CONSK<>'WH' AND DOC_NUMBER=X_DOC_NUMBER;--计算门店数
                    
                UPDATE JOBS_XSO SET DOC_CONSK_QTY=X_DOC_CONSK_COUNT WHERE DOC_NUMBER=X_DOC_NUMBER;--update单头门店数
                    
            END;--定义游标，循环得到主配单明细对应的行项目--end
            
        SELECT COUNT(1) INTO X_ROW_1 FROM JOBSCONTEXT_XSO WHERE DOC_NUMBER=X_DOC_NUMBER AND DOC_CONSK='WH';--查询要入库的明细行数
        IF(X_ROW_1>0)THEN--判断是否有入库的，若有则继续
        BEGIN
            SELECT COUNT(1) INTO X_ROW_2 FROM RECEIPT WHERE EXTERNRECEIPTKEY=X_DOC_NUMBER;
                
            IF (X_ROW_2<1) THEN
            BEGIN               
                --获取receiptkey
                SELECT KEYCOUNT INTO X_KEYCOUNT FROM NCOUNTER WHERE KEYNAME='RECEIPT';
                X_KEYCOUNT:=X_KEYCOUNT+1;
                UPDATE NCOUNTER SET KEYCOUNT=X_KEYCOUNT WHERE KEYNAME='RECEIPT';
                  
                X_RECEIPTKEY:=SUBSTR(CONCAT('000000000',TRIM(TO_CHAR(X_KEYCOUNT))),-10);
  
                --插入收货单单头
                INSERT INTO RECEIPT (RECEIPTKEY,EXTERNRECEIPTKEY,TYPE,STORERKEY,RECEIPTDATE)  
                SELECT X_RECEIPTKEY,DOC_NUMBER,X_TYPE,DOC_STORERKEY,SYSDATE   
                FROM JOBS_XSO   
                WHERE DOC_NUMBER = X_DOC_NUMBER;
            END;    
            END IF;
            
            
            --定义游标，循环获取有要入库的明细行项目（DOC_CONSK='WH'）--start
            DECLARE CURSOR CURSOR_JOBSCONTEXT_XSO_RECEIPT IS SELECT DOC_SEQ,DOC_CONSK,DOC_SKU,DOC_EQTY,DOC_CASE_QTY,DOC_CQTY,DOC_WESQTY,DECODE(NVL(DOC_PACKKEY,' '),' ','XXX',DOC_PACKKEY) FROM JOBSCONTEXT_XSO WHERE DOC_NUMBER=X_DOC_NUMBER AND DOC_CONSK='WH';
                BEGIN
                    OPEN CURSOR_JOBSCONTEXT_XSO_RECEIPT;
                    FETCH CURSOR_JOBSCONTEXT_XSO_RECEIPT INTO X_DOC_SEQ,X_DOC_CONSK,X_DOC_SKU,X_DOC_EQTY,X_DOC_CASE_QTY,X_DOC_CQTY,X_DOC_WESQTY,X_DOC_PACKKEY;
                    WHILE CURSOR_JOBSCONTEXT_XSO_RECEIPT%FOUND
                    LOOP
                        BEGIN  
                        IF(X_DOC_CASE_QTY=0)THEN--判断包入数是否为0，若为0，则到商品包装主档里找对应的包入数 全部查询不到 默认值1 --start
                          BEGIN
                            IF(X_DOC_PACKKEY='XXX' OR X_DOC_PACKKEY IS NULL) THEN
                            BEGIN
                                SELECT DECODE(CASECNT,0,10,CASECNT),PACKKEY INTO X_DOC_CASE_QTY,X_DOC_PACKKEY FROM PACK WHERE PACKKEY =(SELECT PACKKEY FROM SKU WHERE STORERKEY=X_DOC_STORERKEY AND SKU=X_DOC_SKU) ;
                            END;
                            ELSE
                            BEGIN
                                SELECT DECODE(CASECNT,0,10,CASECNT) INTO X_DOC_CASE_QTY FROM PACK WHERE PACK.PACKKEY=X_DOC_PACKKEY;
                            END;
                            END IF;
                          END;
                         END IF;
                         --更新包入数到主配明细表 morris 20111216 add
                         UPDATE JOBSCONTEXT_XSO SET DOC_CASE_QTY=X_DOC_CASE_QTY,DOC_PACKKEY=X_DOC_PACKKEY WHERE DOC_NUMBER=X_DOC_NUMBER AND DOC_SEQ=X_DOC_SEQ AND DOC_SKU=X_DOC_SKU;
                         
                            --查询出入库参数1(X_CASE_QTY),参数2（X_EACH_QTY）,此两参数单位为：包
                            SELECT SKU.CASE_QTY,SKU.EACH_QTY 
                            INTO X_CASE_QTY,X_EACH_QTY 
                            FROM SKU 
                            WHERE SKU=X_DOC_SKU 
                            AND STORERKEY=X_DOC_STORERKEY;
                            
                            IF (X_CASE_QTY=0 OR X_EACH_QTY=0) OR (X_CASE_QTY IS NULL OR X_EACH_QTY IS NULL)THEN
                            BEGIN
                                SELECT STORER.CASE_QTY,STORER.EACH_QTY 
                                INTO X_CASE_QTY,X_EACH_QTY 
                                FROM STORER 
                                WHERE STORERKEY=X_DOC_STORERKEY;
                            END;
                            END IF;
                                
                            --查询出当前商品对应的请配区库存(X_INVQTY)
                            SELECT SUM(QTY) INTO X_INVQTY 
                            FROM SKUXLOC,LOC 
                            WHERE SKUXLOC.LOC=LOC.LOC 
                            AND SKUXLOC.SKU=X_DOC_SKU 
                            AND (LOC.LOCATIONHANDLING='0' OR LOC.LOCATIONHANDLING='1' OR LOC.LOCATIONHANDLING='9') 
                            AND LOC.LOCATIONFLAG='NONE' 
                            AND SKUXLOC.LOC NOT IN('QC','QC99','STAGE','DAMAGE','PICKTO','LOST','RETURN','UNKNOWN','DOCK','IDZ')
                            AND SKUXLOC.STORERKEY=X_DOC_STORERKEY;
                                
                            IF X_INVQTY IS NULL THEN
                            BEGIN
                                X_INVQTY:=0;
                            END;
                            END IF;
                            --**入库第一种情况 *doc_eqty<case_qty* 包入数   doc_wesqty = doc_eqty  doc_cqty=0  doc_zqty=0                      
                            IF (X_DOC_EQTY<X_CASE_QTY*X_DOC_CASE_QTY) THEN--判断期望量，是否小于参数1的数量，小于：主配量=期望量
                            BEGIN
                                X_DOC_WESQTY:=X_DOC_EQTY;
                                UPDATE JOBSCONTEXT_XSO SET DOC_CQTY=0,DOC_WESQTY=X_DOC_WESQTY,DOC_ZQTY=0 WHERE DOC_NUMBER=X_DOC_NUMBER AND DOC_SEQ=X_DOC_SEQ;
                                
                                IF X_DOC_WESQTY>0 THEN--期望数量为入库量，判断入库量是否大于0 
                                BEGIN
                                    --产生明细行号
                                    SELECT MAX(TO_CHAR(TO_NUMBER(RECEIPTLINENUMBER)+1))INTO X_RECEIPTLINENUMBER_VAR FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY;    
                                    IF (X_RECEIPTLINENUMBER_VAR IS NULL) OR (X_RECEIPTLINENUMBER_VAR ='') THEN
                                    BEGIN
                                        X_RECEIPTLINENUMBER_VAR:=1;
                                    END;
                                    END IF;
                                    X_RECEIPTLINENUMBER:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(X_RECEIPTLINENUMBER_VAR))),-5);
                                    --MORRIS 20111217 DELETE 
                                    --SELECT PACKKEY INTO X_PACKKEY FROM SKU WHERE SKU=X_DOC_SKU and storerkey=X_DOC_STORERKEY;
                            
                                    --插入收货单明细表
                                    INSERT INTO RECEIPTDETAIL(RECEIPTKEY,EXTERNRECEIPTKEY,RECEIPTLINENUMBER,EXTERNLINENO,STORERKEY,SKU,QTYEXPECTED,TOLOC,PACKKEY,UOM,SUSR1,LOTTABLE02)
                                    VALUES(X_RECEIPTKEY,X_DOC_NUMBER,X_RECEIPTLINENUMBER,X_DOC_SEQ,X_DOC_STORERKEY,X_DOC_SKU,X_DOC_WESQTY,'QC',X_DOC_PACKKEY,'EA','0',X_DOC_PACKKEY);
                                            
                                END;
                                END IF;
                                    
                                /*morris 20111216 delete 
                                IF X_DOC_ZQTY>0 THEN--期望数量为入库量，判断入库量是否大于0
                                BEGIN
                                    --产生明细行号
                                    SELECT MAX(TO_CHAR(TO_NUMBER(RECEIPTLINENUMBER)+1))INTO X_RECEIPTLINENUMBER_VAR FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY;    
                                    IF (X_RECEIPTLINENUMBER_VAR IS NULL) OR (X_RECEIPTLINENUMBER_VAR ='') THEN
                                    BEGIN
                                        X_RECEIPTLINENUMBER_VAR:=1;
                                    END;
                                    END IF;
                                    X_RECEIPTLINENUMBER:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(X_RECEIPTLINENUMBER_VAR))),-5);
                                
                                    SELECT PACKKEY INTO X_PACKKEY FROM SKU WHERE SKU=X_DOC_SKU and storerkey=X_DOC_STORERKEY;
                            
                                    --插入收货单明细表
                                    INSERT INTO RECEIPTDETAIL(RECEIPTKEY,EXTERNRECEIPTKEY,RECEIPTLINENUMBER,EXTERNLINENO,STORERKEY,SKU,QTYEXPECTED,TOLOC,PACKKEY,UOM,SUSR1,LOTTABLE02)
                                    VALUES(X_RECEIPTKEY,X_DOC_NUMBER,X_RECEIPTLINENUMBER,X_DOC_SEQ,X_DOC_STORERKEY,X_DOC_SKU,X_DOC_ZQTY,'QC',X_PACKKEY,'EA','1',X_PACKKEY);
                                            
                                END;
                                END IF;
                                */
                            END;
                            ELSE--判断期望量，是否大于参数1的数量
                            -- **入库第二种情况**stock_qty>=each_qty*包入数 doc_wesqty = doc_eqty - (doc_zqty)   doc_cqty=0  doc_zqty=floor（doc_eqty/包入数）*包入数 
                            BEGIN
                                IF (X_INVQTY>=X_EACH_QTY*X_DOC_CASE_QTY) THEN--请配区现有库存量大于等于参数2的数量
                                BEGIN
                                    
                                    X_DOC_ZQTY:=floor(X_DOC_EQTY/X_DOC_CASE_QTY)*X_DOC_CASE_QTY;--计算得到整包数量
                                    X_DOC_WESQTY:=X_DOC_EQTY-(floor(X_DOC_EQTY/X_DOC_CASE_QTY)*X_DOC_CASE_QTY);--计算得到零散量
                                    
                                    UPDATE JOBSCONTEXT_XSO SET DOC_CQTY=0,DOC_WESQTY=X_DOC_WESQTY,DOC_ZQTY=X_DOC_ZQTY WHERE DOC_NUMBER=X_DOC_NUMBER AND DOC_SEQ=X_DOC_SEQ;
                                    
                                    IF X_DOC_WESQTY>0 THEN--期望数量为入库量，判断入库量是否大于0
                                    BEGIN
                                        --产生明细行号
                                        SELECT MAX(TO_CHAR(TO_NUMBER(RECEIPTLINENUMBER)+1))INTO X_RECEIPTLINENUMBER_VAR FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY;    
                                        IF (X_RECEIPTLINENUMBER_VAR IS NULL) OR (X_RECEIPTLINENUMBER_VAR ='') THEN
                                        BEGIN
                                            X_RECEIPTLINENUMBER_VAR:=1;
                                        END;
                                        END IF;
                                        X_RECEIPTLINENUMBER:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(X_RECEIPTLINENUMBER_VAR))),-5);
                                        --MORRIS DELETE 20111217 
                                        --SELECT PACKKEY INTO X_PACKKEY FROM SKU WHERE SKU=X_DOC_SKU and storerkey=X_DOC_STORERKEY;
                            
                                        --插入收货单明细表
                                        INSERT INTO RECEIPTDETAIL(RECEIPTKEY,EXTERNRECEIPTKEY,RECEIPTLINENUMBER,EXTERNLINENO,STORERKEY,SKU,QTYEXPECTED,TOLOC,PACKKEY,UOM,SUSR1,LOTTABLE02)
                                        VALUES(X_RECEIPTKEY,X_DOC_NUMBER,X_RECEIPTLINENUMBER,X_DOC_SEQ,X_DOC_STORERKEY,X_DOC_SKU,X_DOC_WESQTY,'QC',X_DOC_PACKKEY,'EA','0',X_DOC_PACKKEY);
                                            
                                    END;
                                    END IF;
                                    
                                    IF X_DOC_ZQTY>0 THEN--期望数量为入库量，判断入库量是否大于0
                                    BEGIN
                                        --产生明细行号
                                        SELECT MAX(TO_CHAR(TO_NUMBER(RECEIPTLINENUMBER)+1))INTO X_RECEIPTLINENUMBER_VAR FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY;    
                                        IF (X_RECEIPTLINENUMBER_VAR IS NULL) OR (X_RECEIPTLINENUMBER_VAR ='') THEN
                                        BEGIN
                                            X_RECEIPTLINENUMBER_VAR:=1;
                                        END;
                                        END IF;
                                        X_RECEIPTLINENUMBER:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(X_RECEIPTLINENUMBER_VAR))),-5);
                                        --MORRIS 20111217 DELETE 
                                        --SELECT PACKKEY INTO X_PACKKEY FROM SKU WHERE SKU=X_DOC_SKU and storerkey=X_DOC_STORERKEY;
                            
                                        --插入收货单明细表
                                        INSERT INTO RECEIPTDETAIL(RECEIPTKEY,EXTERNRECEIPTKEY,RECEIPTLINENUMBER,EXTERNLINENO,STORERKEY,SKU,QTYEXPECTED,TOLOC,PACKKEY,UOM,SUSR1,LOTTABLE02)
                                        VALUES(X_RECEIPTKEY,X_DOC_NUMBER,X_RECEIPTLINENUMBER,X_DOC_SEQ,X_DOC_STORERKEY,X_DOC_SKU,X_DOC_ZQTY,'QC',X_DOC_PACKKEY,'EA','1',X_DOC_PACKKEY);
                                            
                                    END;
                                    END IF;
                                                                        
                                END;
                                END IF;
                                --**入库第三重情况**stock_qty<each_qty*包入数且doc_eqty-（each_qty*包入数+（doc_eqty-doc_eqty/包入数））< case_qty*包入数
                                IF (X_INVQTY<X_EACH_QTY*X_DOC_CASE_QTY) AND (X_DOC_EQTY-(X_EACH_QTY*X_DOC_CASE_QTY+MOD(X_DOC_EQTY,X_DOC_CASE_QTY))< X_CASE_QTY*X_DOC_CASE_QTY) THEN--请配区现有库存量小于等于参数2的数量
                                BEGIN    
                                
                                    X_DOC_WESQTY:=X_DOC_EQTY;
                                                                    
                                    UPDATE JOBSCONTEXT_XSO SET DOC_CQTY=0,DOC_WESQTY=X_DOC_WESQTY,DOC_ZQTY=0 WHERE DOC_NUMBER=X_DOC_NUMBER AND DOC_SEQ=X_DOC_SEQ;
                                    
                                    
                                    
                                    IF X_DOC_WESQTY>0 THEN--期望数量为入库量，判断入库量是否大于0
                                    BEGIN
                                        --产生明细行号
                                        SELECT MAX(TO_CHAR(TO_NUMBER(RECEIPTLINENUMBER)+1))INTO X_RECEIPTLINENUMBER_VAR FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY;    
                                        IF (X_RECEIPTLINENUMBER_VAR IS NULL) OR (X_RECEIPTLINENUMBER_VAR ='') THEN
                                        BEGIN
                                            X_RECEIPTLINENUMBER_VAR:=1;
                                        END;
                                        END IF;
                                        X_RECEIPTLINENUMBER:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(X_RECEIPTLINENUMBER_VAR))),-5);
                                        --MORRIS 20111217 DELTE 
                                        --SELECT PACKKEY INTO X_PACKKEY FROM SKU WHERE SKU=X_DOC_SKU and storerkey=X_DOC_STORERKEY;
                            
                                        --插入收货单明细表
                                        INSERT INTO RECEIPTDETAIL(RECEIPTKEY,EXTERNRECEIPTKEY,RECEIPTLINENUMBER,EXTERNLINENO,STORERKEY,SKU,QTYEXPECTED,TOLOC,PACKKEY,UOM,SUSR1,LOTTABLE02)
                                        VALUES(X_RECEIPTKEY,X_DOC_NUMBER,X_RECEIPTLINENUMBER,X_DOC_SEQ,X_DOC_STORERKEY,X_DOC_SKU,X_DOC_WESQTY,'QC',X_DOC_PACKKEY,'EA','0',X_DOC_PACKKEY);
                                            
                                    END;
                                    END IF;
                                    
                                    /***morris 20111216 delte  for
                                    IF X_DOC_ZQTY>0 THEN--期望数量为入库量，判断入库量是否大于0
                                    BEGIN
                                        --产生明细行号
                                        SELECT MAX(TO_CHAR(TO_NUMBER(RECEIPTLINENUMBER)+1))INTO X_RECEIPTLINENUMBER_VAR FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY;    
                                        IF (X_RECEIPTLINENUMBER_VAR IS NULL) OR (X_RECEIPTLINENUMBER_VAR ='') THEN
                                        BEGIN
                                            X_RECEIPTLINENUMBER_VAR:=1;
                                        END;
                                        END IF;
                                        X_RECEIPTLINENUMBER:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(X_RECEIPTLINENUMBER_VAR))),-5);
                                
                                        SELECT PACKKEY INTO X_PACKKEY FROM SKU WHERE SKU=X_DOC_SKU and storerkey=X_DOC_STORERKEY;
                            
                                        --插入收货单明细表
                                        INSERT INTO RECEIPTDETAIL(RECEIPTKEY,EXTERNRECEIPTKEY,RECEIPTLINENUMBER,EXTERNLINENO,STORERKEY,SKU,QTYEXPECTED,TOLOC,PACKKEY,UOM,SUSR1,LOTTABLE02)
                                        VALUES(X_RECEIPTKEY,X_DOC_NUMBER,X_RECEIPTLINENUMBER,X_DOC_SEQ,X_DOC_STORERKEY,X_DOC_SKU,X_DOC_ZQTY,'QC',X_PACKKEY,'EA','1',X_PACKKEY);
                                            
                                    END;
                                    END IF;
                                    ****/
                                END;
                                END IF;
                                --****stock_qty<each_qty*包入数且doc_eqty-（each_qty*包入数+（doc_eqty-doc_eqty/包入数））>=case_qty*包入数 
                                --****wesqty=each_qty*包入数+（doc_eqty-doc_eqty/包入数）  zqty=doc_eqty - (doc_wesqty
                                IF (X_INVQTY<X_EACH_QTY*X_DOC_CASE_QTY) AND (X_DOC_EQTY-(X_EACH_QTY*X_DOC_CASE_QTY+MOD(X_DOC_EQTY,X_DOC_CASE_QTY))>= X_CASE_QTY*X_DOC_CASE_QTY) THEN--请配区现有库存量大于等于参数2的数量
                                BEGIN  
                                    X_DOC_WESQTY:=(X_EACH_QTY*X_DOC_CASE_QTY+MOD(X_DOC_EQTY,X_DOC_CASE_QTY));
                                    X_DOC_ZQTY:=X_DOC_EQTY-(X_EACH_QTY*X_DOC_CASE_QTY+MOD(X_DOC_EQTY,X_DOC_CASE_QTY));
                                    
                                    UPDATE JOBSCONTEXT_XSO SET DOC_CQTY=0,
                                                                DOC_WESQTY=X_DOC_WESQTY,
                                                                DOC_ZQTY=X_DOC_ZQTY
                                    WHERE DOC_NUMBER=X_DOC_NUMBER 
                                    AND DOC_SEQ=X_DOC_SEQ;
                                    
                                    IF X_DOC_WESQTY>0 THEN--期望数量为入库量，判断入库量是否大于0
                                    BEGIN
                                        --产生明细行号
                                        SELECT MAX(TO_CHAR(TO_NUMBER(RECEIPTLINENUMBER)+1))INTO X_RECEIPTLINENUMBER_VAR FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY;    
                                        IF (X_RECEIPTLINENUMBER_VAR IS NULL) OR (X_RECEIPTLINENUMBER_VAR ='') THEN
                                        BEGIN
                                            X_RECEIPTLINENUMBER_VAR:=1;
                                        END;
                                        END IF;
                                        X_RECEIPTLINENUMBER:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(X_RECEIPTLINENUMBER_VAR))),-5);
                                        --MORRIS 20111217 DELETE 
                                        --SELECT PACKKEY INTO X_PACKKEY FROM SKU WHERE SKU=X_DOC_SKU and storerkey=X_DOC_STORERKEY;
                            
                                        --插入收货单明细表
                                        INSERT INTO RECEIPTDETAIL(RECEIPTKEY,EXTERNRECEIPTKEY,RECEIPTLINENUMBER,EXTERNLINENO,STORERKEY,SKU,QTYEXPECTED,TOLOC,PACKKEY,UOM,SUSR1,LOTTABLE02)
                                        VALUES(X_RECEIPTKEY,X_DOC_NUMBER,X_RECEIPTLINENUMBER,X_DOC_SEQ,X_DOC_STORERKEY,X_DOC_SKU,X_DOC_WESQTY,'QC',X_DOC_PACKKEY,'EA','0',X_DOC_PACKKEY);
                                            
                                    END;
                                    END IF;
                                    
                                    IF X_DOC_ZQTY>0 THEN--期望数量为入库量，判断入库量是否大于0
                                    BEGIN
                                        --产生明细行号
                                        SELECT MAX(TO_CHAR(TO_NUMBER(RECEIPTLINENUMBER)+1))INTO X_RECEIPTLINENUMBER_VAR FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY;    
                                        IF (X_RECEIPTLINENUMBER_VAR IS NULL) OR (X_RECEIPTLINENUMBER_VAR ='') THEN
                                        BEGIN
                                            X_RECEIPTLINENUMBER_VAR:=1;
                                        END;
                                        END IF;
                                        X_RECEIPTLINENUMBER:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(X_RECEIPTLINENUMBER_VAR))),-5);
                                        --MORRIS 20111217 DELETE 
                                        --SELECT PACKKEY INTO X_PACKKEY FROM SKU WHERE SKU=X_DOC_SKU and storerkey=X_DOC_STORERKEY;
                            
                                        --插入收货单明细表
                                        INSERT INTO RECEIPTDETAIL(RECEIPTKEY,EXTERNRECEIPTKEY,RECEIPTLINENUMBER,EXTERNLINENO,STORERKEY,SKU,QTYEXPECTED,TOLOC,PACKKEY,UOM,SUSR1,LOTTABLE02)
                                        VALUES(X_RECEIPTKEY,X_DOC_NUMBER,X_RECEIPTLINENUMBER,X_DOC_SEQ,X_DOC_STORERKEY,X_DOC_SKU,X_DOC_ZQTY,'QC',X_DOC_PACKKEY,'EA','1',X_DOC_PACKKEY);
                                            
                                    END;
                                    END IF;
                                    
                                END;
                                END IF;
                                
                            END;
                            END IF;
                            
                        END;
                    FETCH CURSOR_JOBSCONTEXT_XSO_RECEIPT INTO X_DOC_SEQ,X_DOC_CONSK,X_DOC_SKU,X_DOC_EQTY,X_DOC_CASE_QTY,X_DOC_CQTY,X_DOC_WESQTY,X_DOC_PACKKEY;
                    END LOOP;
                    CLOSE CURSOR_JOBSCONTEXT_XSO_RECEIPT;
                END;--定义游标，循环获取有要入库的明细行项目（DOC_CONSK='WH'）--end
            
            SELECT COUNT(1) INTO C_ROW_1 FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY AND SUSR1='0';
            SELECT COUNT(1) INTO C_ROW_2 FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY AND SUSR1='1';
            IF (C_ROW_1=0 AND C_ROW_2>0) THEN
            BEGIN
                UPDATE JOBS_XSO SET DOC_AREA_QTY=1 WHERE DOC_NUMBER=X_DOC_NUMBER;
            END;
            END IF;
            
                    
            --计算收货单明细总预期收获量，并update到收货单头档                
            SELECT SUM(QTYEXPECTED) INTO X_QTYEXPECTED FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY;
            UPDATE RECEIPT SET OPENQTY=X_QTYEXPECTED WHERE RECEIPTKEY=X_RECEIPTKEY;
            
            
            
        END;
        END IF;
            
        --更新主配单头档状态‘1’
        UPDATE JOBS_XSO SET STATUS='1' WHERE DOC_NUMBER=X_DOC_NUMBER;
            
                
    END;
    
    --COMMIT;
    
    END IF;
END;
/

prompt
prompt Creating procedure NSP_XSO_GBBL_2
prompt =================================
prompt
CREATE OR REPLACE PROCEDURE NSP_XSO_GBBL_2(X_DOC_NUMBER IN VARCHAR2,X_DOC_TYPE IN NUMBER)
AS  
    X_ROW                   NUMBER:=0;
    X_ROW_1                 NUMBER:=0;
    X_ROW_2                 NUMBER:=0;
    X_STORERKEY_ROW         NUMBER:=0;
    X_DOC_CONSK_COUNT       NUMBER:=0;
    X_DOC_AREA_QTY          NUMBER:=0;
    X_DOC_SEQ               VARCHAR2(5);
    X_DOC_CONSK             VARCHAR2(15);
    X_DOC_STORERKEY         VARCHAR2(15);
    X_DOC_SKU               VARCHAR2(20);
    X_DOC_EQTY              NUMBER:=0;
    X_DOC_CASE_QTY          NUMBER:=0;
    X_DOC_CQTY              NUMBER:=0;
    X_DOC_CASEQTY           NUMBER:=0;
    X_DOC_WESQTY            NUMBER:=0;
    X_DOC_ZCASEQTY          NUMBER:=0;
    X_DOC_ZBOLIQTY          NUMBER:=0;
    X_CASEQTY               NUMBER:=0;
    X_RECEIPTKEY            VARCHAR2(10);
    X_KEYCOUNT              NUMBER:=0;
    X_RECEIPTLINENUMBER     VARCHAR(5);
    X_RECEIPTLINENUMBER_VAR NUMBER:=0;
    X_PACKKEY               VARCHAR2(50);
    X_CASE_QTY              NUMBER:=0;
    X_EACH_QTY              NUMBER:=0;
    X_QPQTY                 NUMBER:=0;
    X_SYQTY                 NUMBER:=0;
    X_INVQTY                NUMBER:=0;
    X_QTYEXPECTED           NUMBER:=0;
    X_QTYRECEIVED           NUMBER:=0;
    X_TYPE                  VARCHAR2(2);
    
BEGIN
    SELECT DOC_STORERKEY INTO X_DOC_STORERKEY FROM JOBS_XSO WHERE DOC_NUMBER=X_DOC_NUMBER;
    SELECT COUNT(1) INTO X_ROW FROM JOBSCONTEXT_XSO WHERE DOC_NUMBER=X_DOC_NUMBER;
    
    IF(X_ROW>0)THEN
        BEGIN
            
            SELECT COUNT(1) INTO X_ROW_1 FROM JOBSCONTEXT_XSO WHERE DOC_NUMBER=X_DOC_NUMBER AND DOC_CONSK='WH';
            IF(X_ROW_1>0)THEN
                
                SELECT RECEIPTKEY INTO X_RECEIPTKEY FROM RECEIPT WHERE EXTERNRECEIPTKEY=X_DOC_NUMBER;
                
                IF (X_RECEIPTKEY IS NULL OR X_RECEIPTKEY='') THEN
                
                    IF(X_DOC_TYPE=3 OR X_DOC_TYPE=5) THEN
                        X_TYPE:='2';
                    ELSE
                        X_TYPE:='1';
                    END IF;
            
                    SELECT KEYCOUNT INTO X_KEYCOUNT FROM NCOUNTER WHERE KEYNAME='RECEIPT';
                    X_KEYCOUNT:=X_KEYCOUNT+1;
                    UPDATE NCOUNTER SET KEYCOUNT=X_KEYCOUNT WHERE KEYNAME='RECEIPT';
                    --COMMIT;
                  
                    X_RECEIPTKEY:=SUBSTR(CONCAT('000000000',TRIM(TO_CHAR(X_KEYCOUNT))),-10);
  
                    INSERT INTO RECEIPT (RECEIPTKEY,EXTERNRECEIPTKEY,TYPE,STORERKEY,RECEIPTDATE)  
                    SELECT X_RECEIPTKEY,DOC_NUMBER,'0',DOC_STORERKEY,SYSDATE   
                    FROM JOBS_XSO   
                    WHERE DOC_NUMBER = X_DOC_NUMBER;
                    --COMMIT;
                
                END IF;
            
                DECLARE CURSOR CURSOR_JOBSCONTEXT_XSO_RECEIPT IS SELECT DOC_SEQ,DOC_CONSK,DOC_SKU,DOC_EQTY,DOC_CASE_QTY,DOC_CQTY,DOC_WESQTY FROM JOBSCONTEXT_XSO WHERE DOC_NUMBER=X_DOC_NUMBER AND DOC_CONSK='WH';
                    BEGIN
                        OPEN CURSOR_JOBSCONTEXT_XSO_RECEIPT;
                        FETCH CURSOR_JOBSCONTEXT_XSO_RECEIPT INTO X_DOC_SEQ,X_DOC_CONSK,X_DOC_SKU,X_DOC_EQTY,X_DOC_CASE_QTY,X_DOC_CQTY,X_DOC_WESQTY;
                        WHILE CURSOR_JOBSCONTEXT_XSO_RECEIPT%FOUND
                        LOOP
                            BEGIN   
                                SELECT SKU.CASE_QTY,SKU.EACH_QTY INTO X_CASE_QTY,X_EACH_QTY FROM SKU WHERE SKU=X_DOC_SKU and storerkey=X_DOC_STORERKEY;
                                SELECT SUM(QTY) INTO X_INVQTY FROM SKUXLOC,LOC WHERE SKUXLOC.LOC=LOC.LOC AND SKUXLOC.SKU=X_DOC_SKU AND LOC.LOCATIONHANDLING='9' AND LOC.LOCATIONFLAG='NONE' AND SKUXLOC.LOC NOT IN('QC','STAGE','DAMAGE','PICKTO','LOST','RETURN','UMKNOWN','DOCK','IDZ');
                                
                                IF X_INVQTY IS NULL THEN
                                    X_INVQTY:=0;
                                END IF;
                                
                                
                                
                                IF (X_INVQTY<X_EACH_QTY*X_DOC_CASE_QTY) THEN--计算1开始
                                
                                    X_QPQTY:=(X_EACH_QTY*X_DOC_CASE_QTY)+X_DOC_WESQTY;
                                
                                    IF(X_DOC_EQTY-X_QPQTY)>X_CASE_QTY*X_DOC_CASE_QTY THEN
                                    BEGIN
                                        IF X_DOC_CQTY>0 THEN
                                        BEGIN
                                            SELECT MAX(TO_CHAR(TO_NUMBER(RECEIPTLINENUMBER)+1))INTO X_RECEIPTLINENUMBER_VAR FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY;    
                                            IF (X_RECEIPTLINENUMBER_VAR IS NULL) OR (X_RECEIPTLINENUMBER_VAR ='') THEN
                                                X_RECEIPTLINENUMBER_VAR:=1;
                                            END IF;
                                            X_RECEIPTLINENUMBER:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(X_RECEIPTLINENUMBER_VAR))),-5);
                                
                                            SELECT PACKKEY INTO X_PACKKEY FROM SKU WHERE SKU=X_DOC_SKU and storerkey=X_DOC_STORERKEY;
                            
                                            INSERT INTO RECEIPTDETAIL(RECEIPTKEY,EXTERNRECEIPTKEY,RECEIPTLINENUMBER,EXTERNLINENO,STORERKEY,SKU,QTYEXPECTED,TOLOC,PACKKEY,UOM,SUSR1,LOTTABLE02)
                                            VALUES(X_RECEIPTKEY,X_DOC_NUMBER,X_RECEIPTLINENUMBER,X_DOC_SEQ,X_DOC_STORERKEY,X_DOC_SKU,X_DOC_CQTY,'QC',X_PACKKEY,'EA','1',X_PACKKEY);
                                            --COMMIT;
                                        END;
                                        END IF;
                                    END;    
                                    END IF;--计算1结束
                                ELSE--计算2开始
                                
                                    X_QPQTY:=0;
                                    
                                    IF(X_DOC_EQTY-X_QPQTY)>X_CASE_QTY*X_DOC_CASE_QTY THEN
                                    BEGIN
                                        IF X_DOC_CQTY>0 THEN
                                        BEGIN
                                            SELECT MAX(TO_CHAR(TO_NUMBER(RECEIPTLINENUMBER)+1))INTO X_RECEIPTLINENUMBER_VAR FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY;    
                                            IF (X_RECEIPTLINENUMBER_VAR IS NULL) OR (X_RECEIPTLINENUMBER_VAR ='') THEN
                                                X_RECEIPTLINENUMBER_VAR:=1;
                                            END IF;
                                            X_RECEIPTLINENUMBER:=SUBSTR(CONCAT('00000',TRIM(TO_CHAR(X_RECEIPTLINENUMBER_VAR))),-5);
                                
                                            SELECT PACKKEY INTO X_PACKKEY FROM SKU WHERE SKU=X_DOC_SKU and storerkey=X_DOC_STORERKEY;
                            
                                            INSERT INTO RECEIPTDETAIL(RECEIPTKEY,EXTERNRECEIPTKEY,RECEIPTLINENUMBER,EXTERNLINENO,STORERKEY,SKU,QTYEXPECTED,TOLOC,PACKKEY,UOM,SUSR1,LOTTABLE02)
                                            VALUES(X_RECEIPTKEY,X_DOC_NUMBER,X_RECEIPTLINENUMBER,X_DOC_SEQ,X_DOC_STORERKEY,X_DOC_SKU,X_DOC_CQTY,'QC',X_PACKKEY,'EA','1',X_PACKKEY);
                                            --COMMIT;
                                        END;
                                        END IF;
                                    END;    
                                    END IF;
                                
                                END IF;--计算2结束

                            
                            END;
                        FETCH CURSOR_JOBSCONTEXT_XSO_RECEIPT INTO X_DOC_SEQ,X_DOC_CONSK,X_DOC_SKU,X_DOC_EQTY,X_DOC_CASE_QTY,X_DOC_CQTY,X_DOC_WESQTY;
                        END LOOP;
                        CLOSE CURSOR_JOBSCONTEXT_XSO_RECEIPT;
                    END;
                    
                SELECT SUM(QTYEXPECTED) INTO X_QTYEXPECTED FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY;
                UPDATE RECEIPT SET OPENQTY=X_QTYEXPECTED WHERE RECEIPTKEY=X_RECEIPTKEY;
                --COMMIT;
            
                SELECT SUM(QTYRECEIVED) INTO X_QTYRECEIVED FROM RECEIPTDETAIL WHERE RECEIPTKEY=X_RECEIPTKEY;
                IF (X_QTYRECEIVED>0) THEN
                    UPDATE RECEIPT SET STATUS='5' WHERE RECEIPTKEY=X_RECEIPTKEY;
                    --COMMIT;
                END IF;
                
                COMMIT;
            END IF;
            
            
                
        END;
    END IF;
END;
/

prompt
prompt Creating trigger JXR_SERIALKEY_SEQ
prompt ==================================
prompt
CREATE OR REPLACE TRIGGER JXR_SERIALKEY_SEQ BEFORE INSERT ON JOBS_XSO_REJ FOR EACH ROW
DECLARE
  BEGIN
    IF :NEW.SERIALKEY IS NULL THEN
      SELECT WH1.JXR_SERIALKEY.NEXTVAL
      INTO   :NEW.SerialKey
      FROM   dual;
        END IF;
  END;
/

prompt
prompt Creating trigger TR_ACCES_1
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_ACCES_1 BEFORE INSERT ON WH1.ACCESSORIAL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ACC_1_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ACCES_2
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_ACCES_2 BEFORE INSERT ON WH1.ACCESSORIALDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ACC_2_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ACCUM_3
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_ACCUM_3 BEFORE INSERT ON WH1.ACCUMULATEDCHARGES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ACC_3_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ADDDE_4
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_ADDDE_4 BEFORE INSERT ON WH1.ADDDEPOSIT_LOCK FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ADD_4_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ADJUS_5
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_ADJUS_5 BEFORE INSERT ON WH1.ADJUSTMENT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ADJ_5_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ADJUS_6
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_ADJUS_6 BEFORE INSERT ON WH1.ADJUSTMENTDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ADJ_6_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ADJUS_7
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_ADJUS_7 BEFORE INSERT ON WH1.ADJUSTMENTDETAIL_UDF FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ADJ_7_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ADJUS_8
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_ADJUS_8 BEFORE INSERT ON WH1.ADJUSTMENT_UDF FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ADJ_8_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ALERT_9
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_ALERT_9 BEFORE INSERT ON WH1.ALERT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ALE_9_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ALLOC_10
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_ALLOC_10 BEFORE INSERT ON WH1.ALLOCATESTRATEGY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ALL_10_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ALLOC_11
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_ALLOC_11 BEFORE INSERT ON WH1.ALLOCATESTRATEGYDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ALL_11_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ALTSK_12
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_ALTSK_12 BEFORE INSERT ON WH1.ALTSKU FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ALT_12_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_APPOR_13
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_APPOR_13 BEFORE INSERT ON WH1.APPORTIONSTRATEGY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.APP_13_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_APPT__14
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_APPT__14 BEFORE INSERT ON WH1.APPT_ACTIVITY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.APP_14_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_APPT__15
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_APPT__15 BEFORE INSERT ON WH1.APPT_ASN FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.APP_15_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_APPT__16
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_APPT__16 BEFORE INSERT ON WH1.APPT_CO FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.APP_16_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_APPT__17
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_APPT__17 BEFORE INSERT ON WH1.APPT_COMMENT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.APP_17_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_APPT__18
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_APPT__18 BEFORE INSERT ON WH1.APPT_DOOR FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.APP_18_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_APPT__19
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_APPT__19 BEFORE INSERT ON WH1.APPT_DOOR_HISTORY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.APP_19_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_APPT__20
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_APPT__20 BEFORE INSERT ON WH1.APPT_EQPT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.APP_20_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_APPT__21
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_APPT__21 BEFORE INSERT ON WH1.APPT_HEADER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.APP_21_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_APPT__22
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_APPT__22 BEFORE INSERT ON WH1.APPT_HISTORY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.APP_22_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_APPT__23
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_APPT__23 BEFORE INSERT ON WH1.APPT_PO FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.APP_23_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_APPT__24
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_APPT__24 BEFORE INSERT ON WH1.APPT_SKU FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.APP_24_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ARCHI_25
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_ARCHI_25 BEFORE INSERT ON WH1.ARCHIVECASCADE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ARC_25_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ARCHI_26
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_ARCHI_26 BEFORE INSERT ON WH1.ARCHIVELOG FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ARC_26_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ARCHI_27
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_ARCHI_27 BEFORE INSERT ON WH1.ARCHIVEPARAMETERS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ARC_27_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ARCHI_28
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_ARCHI_28 BEFORE INSERT ON WH1.ARCHIVEPARMS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ARC_28_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ARCHI_29
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_ARCHI_29 BEFORE INSERT ON WH1.ARCHIVEPROCESS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ARC_29_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ARCHI_30
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_ARCHI_30 BEFORE INSERT ON WH1.ARCHIVETABLE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ARC_30_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ARCHI_31
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_ARCHI_31 BEFORE INSERT ON WH1.ARCHIVETABLEKEY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ARC_31_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ARCHI_32
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_ARCHI_32 BEFORE INSERT ON WH1.ARCHIVETABPARMS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ARC_32_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_AREAD_33
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_AREAD_33 BEFORE INSERT ON WH1.AREADETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ARE_33_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ARE_312
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_ARE_312 BEFORE INSERT ON WH1.AREA FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ARE_312_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_AUTO_PRINT_ID
prompt =================================
prompt
CREATE OR REPLACE TRIGGER tr_auto_print_id BEFORE INSERT ON auto_print FOR EACH ROW
DECLARE
    BEGIN
        IF :NEW.id IS NULL THEN
            SELECT seq_auto_print.NEXTVAL
            INTO   :NEW.id
            FROM   dual;
            END IF;
    END;
/

prompt
prompt Creating trigger TR_BARCO_34
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BARCO_34 BEFORE INSERT ON WH1.BARCODECONFIG FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BAR_34_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BARCO_35
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BARCO_35 BEFORE INSERT ON WH1.BARCODECONFIGDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BAR_35_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BATCH_36
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BATCH_36 BEFORE INSERT ON WH1.BATCHSELECTION FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BAT_36_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BATCH_37
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BATCH_37 BEFORE INSERT ON WH1.BATCH_REPLEN_WORK FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BAT_37_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BILLI_38
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BILLI_38 BEFORE INSERT ON WH1.BILLING_DETAIL_CUT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BIL_38_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BILLO_39
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BILLO_39 BEFORE INSERT ON WH1.BILLOFMATERIAL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BIL_39_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BILL__40
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BILL__40 BEFORE INSERT ON WH1.BILL_ACCUMULATEDCHARGES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BIL_40_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BILL__41
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BILL__41 BEFORE INSERT ON WH1.BILL_INVENTORYCUT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BIL_41_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BILL__42
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BILL__42 BEFORE INSERT ON WH1.BILL_LISTBETWEEN FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BIL_42_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BILL__43
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BILL__43 BEFORE INSERT ON WH1.BILL_LISTNOBEFORE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BIL_43_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BILL__44
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BILL__44 BEFORE INSERT ON WH1.BILL_MINDATES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BIL_44_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BILL__45
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BILL__45 BEFORE INSERT ON WH1.BILL_RSDATES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BIL_45_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BILL__46
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BILL__46 BEFORE INSERT ON WH1.BILL_RSLOTS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BIL_46_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BILL__47
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BILL__47 BEFORE INSERT ON WH1.BILL_STOCKMOVEDATE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BIL_47_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BILL__48
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BILL__48 BEFORE INSERT ON WH1.BILL_STOCKMOVEMENT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BIL_48_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BILL__49
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BILL__49 BEFORE INSERT ON WH1.BILL_STOCKMOVEMENT_DETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BIL_49_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BILL__50
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BILL__50 BEFORE INSERT ON WH1.BILL_SUMMARYCUT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BIL_50_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BOMDE_51
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BOMDE_51 BEFORE INSERT ON WH1.BOMDET FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BOM_51_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BOMDE_52
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BOMDE_52 BEFORE INSERT ON WH1.BOMDETDEFN FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BOM_52_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BOMHD_53
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BOMHD_53 BEFORE INSERT ON WH1.BOMHDR FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BOM_53_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BOMHD_54
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_BOMHD_54 BEFORE INSERT ON WH1.BOMHDRDEFN FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.BOM_54_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_BOX_001
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_box_001 BEFORE INSERT ON box FOR EACH ROW
DECLARE
    BEGIN
        IF :NEW.SERIALKEY IS NULL THEN
            SELECT WH1.box_001_SEQ.NEXTVAL
            INTO   :NEW.SerialKey
            FROM   dual;
            END IF;
    END;
/

prompt
prompt Creating trigger TR_CALEN_55
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CALEN_55 BEFORE INSERT ON WH1.CALENDAR FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CAL_55_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CALEN_56
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CALEN_56 BEFORE INSERT ON WH1.CALENDARDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CAL_56_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CARTO_57
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CARTO_57 BEFORE INSERT ON WH1.CARTONIZATION FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CAR_57_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CASEM_58
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CASEM_58 BEFORE INSERT ON WH1.CASEMANIFEST FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CAS_58_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CCADJR_307
prompt ==============================
prompt
CREATE OR REPLACE TRIGGER tr_CCADJR_307 BEFORE INSERT ON WH1.CCADJRULES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CCA_307_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CCDET_60
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CCDET_60 BEFORE INSERT ON WH1.CCDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CCD_60_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CCGEN_61
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CCGEN_61 BEFORE INSERT ON WH1.CCGEN FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CCG_61_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CCLST_62
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CCLST_62 BEFORE INSERT ON WH1.CCLST FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CCL_62_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CCRELE_308
prompt ==============================
prompt
CREATE OR REPLACE TRIGGER tr_CCRELE_308 BEFORE INSERT ON WH1.CCRELEASEHISTORY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CCR_308_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CCSET_63
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CCSET_63 BEFORE INSERT ON WH1.CCSETUP FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CCS_63_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CC_59
prompt =========================
prompt
CREATE OR REPLACE TRIGGER tr_CC_59 BEFORE INSERT ON WH1.CC FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CC_59_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CHART_64
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CHART_64 BEFORE INSERT ON WH1.CHARTOFACCOUNTS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CHA_64_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CHERR_65
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CHERR_65 BEFORE INSERT ON WH1.CHERRYPICKREPLEN_LOCK FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CHE_65_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CLASSTOZONE_001
prompt ===================================
prompt
CREATE OR REPLACE TRIGGER tr_CLASSTOZONE_001 BEFORE INSERT ON CLASSTOZONE FOR EACH ROW
DECLARE
    BEGIN
        IF :NEW.SERIALKEY IS NULL THEN
            SELECT WH1.CLASSTOZONE_001_SEQ.NEXTVAL
            INTO   :NEW.SerialKey
            FROM   dual;
            END IF;
    END;
/

prompt
prompt Creating trigger TR_CLPDE_66
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CLPDE_66 BEFORE INSERT ON WH1.CLPDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CLP_66_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CLPOR_67
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CLPOR_67 BEFORE INSERT ON WH1.CLPORDER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CLP_67_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CODEL_70
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CODEL_70 BEFORE INSERT ON WH1.CODELIST FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.COD_70_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CODEL_71
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CODEL_71 BEFORE INSERT ON WH1.CODELKUP FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.COD_71_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_COD_69
prompt ==========================
prompt
CREATE OR REPLACE TRIGGER tr_COD_69 BEFORE INSERT ON WH1.COD FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.COD_69_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CONDI_72
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CONDI_72 BEFORE INSERT ON WH1.CONDITIONALVALIDATION FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CON_72_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CONDI_73
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CONDI_73 BEFORE INSERT ON WH1.CONDITIONALVALIDATIONDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CON_73_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CONSO_74
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CONSO_74 BEFORE INSERT ON WH1.CONSOLIDATIONINFO FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CON_74_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CONTA_75
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CONTA_75 BEFORE INSERT ON WH1.CONTAINER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CON_75_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CONTA_76
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CONTA_76 BEFORE INSERT ON WH1.CONTAINERBILLING FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CON_76_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CONTA_77
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_CONTA_77 BEFORE INSERT ON WH1.CONTAINERDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CON_77_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_CO_68
prompt =========================
prompt
CREATE OR REPLACE TRIGGER tr_CO_68 BEFORE INSERT ON WH1.CO FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.CO_68_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DC_78
prompt =========================
prompt
CREATE OR REPLACE TRIGGER tr_DC_78 BEFORE INSERT ON WH1.DC FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DC_78_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DC_LO_79
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_DC_LO_79 BEFORE INSERT ON WH1.DC_LOC FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DC__79_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DEMAN_80
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_DEMAN_80 BEFORE INSERT ON WH1.DEMANDALLOCATION FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DEM_80_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DOCKP_81
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_DOCKP_81 BEFORE INSERT ON WH1.DOCKPO FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DOC_81_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DOCK__82
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_DOCK__82 BEFORE INSERT ON WH1.DOCK_PTWY_RULES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DOC_82_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DOCK__83
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_DOCK__83 BEFORE INSERT ON WH1.DOCK_STORER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DOC_83_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DOOR_84
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_DOOR_84 BEFORE INSERT ON WH1.DOOR FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DOO_84_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DOOR__85
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_DOOR__85 BEFORE INSERT ON WH1.DOOR_ASGN_RULES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DOO_85_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DOOR__86
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_DOOR__86 BEFORE INSERT ON WH1.DOOR_ASOC_RULES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DOO_86_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DOOR__87
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_DOOR__87 BEFORE INSERT ON WH1.DOOR_LOADTYPE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DOO_87_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DOOR__88
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_DOOR__88 BEFORE INSERT ON WH1.DOOR_RESTRICTIONS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DOO_88_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DOOR__89
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_DOOR__89 BEFORE INSERT ON WH1.DOOR_STAGINGPOINT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DOO_89_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DROPI_90
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_DROPI_90 BEFORE INSERT ON WH1.DROPID FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DRO_90_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_DROPI_91
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_DROPI_91 BEFORE INSERT ON WH1.DROPIDDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.DRO_91_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_EDI_A_93
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_EDI_A_93 BEFORE INSERT ON WH1.EDI_APPT_DATA FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.EDI_93_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_EQPT__94
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_EQPT__94 BEFORE INSERT ON WH1.EQPT_CATEGORY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.EQP_94_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_EQPT__95
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_EQPT__95 BEFORE INSERT ON WH1.EQPT_CLASS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.EQP_95_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_EQUIP_96
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_EQUIP_96 BEFORE INSERT ON WH1.EQUIPMENTPROFILE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.EQU_96_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ERRLO_97
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_ERRLO_97 BEFORE INSERT ON WH1.ERRLOG FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ERR_97_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_EXELI_98
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_EXELI_98 BEFORE INSERT ON WH1.EXELINK FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.EXE_98_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_FACIL_99
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_FACIL_99 BEFORE INSERT ON WH1.FACILITYNEST FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.FAC_99_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_FORTE_100
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_FORTE_100 BEFORE INSERT ON WH1.FORTEUPDATE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.FOR_100_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_FXRAT_101
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_FXRAT_101 BEFORE INSERT ON WH1.FXRATE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.FXR_101_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_GATE__102
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_GATE__102 BEFORE INSERT ON WH1.GATE_EXCP_RULES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.GAT_102_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_GLDIS_103
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_GLDIS_103 BEFORE INSERT ON WH1.GLDISTRIBUTION FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.GLD_103_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_GLDIS_104
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_GLDIS_104 BEFORE INSERT ON WH1.GLDISTRIBUTIONDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.GLD_104_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_GLOBA_105
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_GLOBA_105 BEFORE INSERT ON WH1.GLOBALPREFS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.GLO_105_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_GLOC_106
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_GLOC_106 BEFORE INSERT ON WH1.GLOC FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.GLO_106_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_GLOC__107
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_GLOC__107 BEFORE INSERT ON WH1.GLOC_RESTRICTIONS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.GLO_107_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_GRAPH_108
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_GRAPH_108 BEFORE INSERT ON WH1.GRAPHASSIGNMENT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.GRA_108_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_HAZMA_109
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_HAZMA_109 BEFORE INSERT ON WH1.HAZMATCODES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.HAZ_109_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_HAZMA_110
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_HAZMA_110 BEFORE INSERT ON WH1.HAZMATXMSDS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.HAZ_110_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_HAZMA_111
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_HAZMA_111 BEFORE INSERT ON WH1.HAZMATXPLACARDS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.HAZ_111_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_HELP_112
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_HELP_112 BEFORE INSERT ON WH1.HELP FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.HEL_112_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_HIERR_113
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_HIERR_113 BEFORE INSERT ON WH1.HIERROR FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.HIE_113_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_HOUSE_114
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_HOUSE_114 BEFORE INSERT ON WH1.HOUSEAIRWAYBILL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.HOU_114_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_HOUSE_115
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_HOUSE_115 BEFORE INSERT ON WH1.HOUSEAIRWAYBILLDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.HOU_115_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_IAC_311
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_IAC_311 BEFORE INSERT ON WH1.INDIRECTACTIVITY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.IAC_311_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_IDSTA_117
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_IDSTA_117 BEFORE INSERT ON WH1.IDSTACK FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.IDS_117_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ID_116
prompt ==========================
prompt
CREATE OR REPLACE TRIGGER tr_ID_116 BEFORE INSERT ON WH1.ID FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ID_116_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_IMP_PUTAWAYZONE_252
prompt =======================================
prompt
CREATE OR REPLACE TRIGGER tr_IMP_PUTAWAYZONE_252 BEFORE INSERT ON IMP_PUTAWAYZONE FOR EACH ROW
DECLARE
    BEGIN
        IF :NEW.SERIALKEY IS NULL THEN
            SELECT WH1.IMP_PUTAWAYZONE_252_SEQ.NEXTVAL
            INTO   :NEW.SerialKey
            FROM   dual;
            END IF;
    END;
/

prompt
prompt Creating trigger TR_INTRA_118
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_INTRA_118 BEFORE INSERT ON WH1.INTRANSIT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.INT_118_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_INTRA_119
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_INTRA_119 BEFORE INSERT ON WH1.INTRANSITDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.INT_119_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_INVENPUR_305
prompt ================================
prompt
CREATE OR REPLACE TRIGGER tr_INVENPUR_305 BEFORE INSERT ON WH1.InvenPurgeDate FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.INV_305_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_INVEN_120
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_INVEN_120 BEFORE INSERT ON WH1.INVENTORYHOLD FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.INV_120_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_IPSUPP_306
prompt ==============================
prompt
CREATE OR REPLACE TRIGGER tr_IPSUPP_306 BEFORE INSERT ON WH1.IPSUPPLIER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.IPS_306_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ITRNH_122
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_ITRNH_122 BEFORE INSERT ON WH1.ITRNHDR FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ITR_122_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ITRN_121
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_ITRN_121 BEFORE INSERT ON WH1.ITRN FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ITR_121_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LABEL_123
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LABEL_123 BEFORE INSERT ON WH1.LABELCONFIG FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LAB_123_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LABEL_124
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LABEL_124 BEFORE INSERT ON WH1.LABELLIST FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LAB_124_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LABEL_125
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LABEL_125 BEFORE INSERT ON WH1.LABELPRINTER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LAB_125_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LANE_126
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_LANE_126 BEFORE INSERT ON WH1.LANE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LAN_126_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LCD_777
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_LCD_777 BEFORE INSERT ON WH1.LABELCONTAINERDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LCD_777_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOADH_127
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOADH_127 BEFORE INSERT ON WH1.LOADHDR FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOA_127_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOADO_128
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOADO_128 BEFORE INSERT ON WH1.LOADORDERDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOA_128_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOADP_129
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOADP_129 BEFORE INSERT ON WH1.LOADPLANNING FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOA_129_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOADS_130
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOADS_130 BEFORE INSERT ON WH1.LOADSCHEDULE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOA_130_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOADS_131
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOADS_131 BEFORE INSERT ON WH1.LOADSCHEDULEDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOA_131_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOADS_132
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOADS_132 BEFORE INSERT ON WH1.LOADSTOP FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOA_132_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOADS_133
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOADS_133 BEFORE INSERT ON WH1.LOADSTOPSEAL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOA_133_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOADU_134
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOADU_134 BEFORE INSERT ON WH1.LOADUNITDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOA_134_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOAD__135
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOAD__135 BEFORE INSERT ON WH1.LOAD_TYPE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOA_135_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOC_136
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_LOC_136 BEFORE INSERT ON WH1.LOC FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOC_136_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOTAT_138
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOTAT_138 BEFORE INSERT ON WH1.LOTATTRIBUTE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOT_138_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOTNE_139
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOTNE_139 BEFORE INSERT ON WH1.LOTNEWBILLTHRUDATE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOT_139_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOTTA_140
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOTTA_140 BEFORE INSERT ON WH1.LOTTABLEVALIDATION FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOT_140_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOTTA_141
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOTTA_141 BEFORE INSERT ON WH1.LOTTABLEVALIDATIONDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOT_141_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOTXB_142
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOTXB_142 BEFORE INSERT ON WH1.LOTXBILLDATE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOT_142_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOTXI_143
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOTXI_143 BEFORE INSERT ON WH1.LOTXIDDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOT_143_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOTXI_144
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOTXI_144 BEFORE INSERT ON WH1.LOTXIDHEADER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOT_144_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOTXL_145
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LOTXL_145 BEFORE INSERT ON WH1.LOTXLOCXID FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOT_145_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LOT_137
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_LOT_137 BEFORE INSERT ON WH1.LOT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LOT_137_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_LPNDE_146
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_LPNDE_146 BEFORE INSERT ON WH1.LPNDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.LPN_146_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_MASTE_147
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_MASTE_147 BEFORE INSERT ON WH1.MASTERAIRWAYBILL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.MAS_147_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_MASTE_148
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_MASTE_148 BEFORE INSERT ON WH1.MASTERAIRWAYBILLDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.MAS_148_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_MASTE_149
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_MASTE_149 BEFORE INSERT ON WH1.MASTER_DETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.MAS_149_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_MASTE_150
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_MASTE_150 BEFORE INSERT ON WH1.MASTER_SCHED FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.MAS_150_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_MBOLD_152
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_MBOLD_152 BEFORE INSERT ON WH1.MBOLDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.MBO_152_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_MBOL_151
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_MBOL_151 BEFORE INSERT ON WH1.MBOL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.MBO_151_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_NCOUN_153
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_NCOUN_153 BEFORE INSERT ON WH1.NCOUNTER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.NCO_153_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_NSQLC_154
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_NSQLC_154 BEFORE INSERT ON WH1.NSQLCONFIG FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.NSQ_154_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OPERA_155
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OPERA_155 BEFORE INSERT ON WH1.OPERATIONCLASS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OPE_155_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OPPAL_156
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OPPAL_156 BEFORE INSERT ON WH1.OPPALLOCATIONMGT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OPP_156_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OPPOR_157
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OPPOR_157 BEFORE INSERT ON WH1.OPPORDERSTRATEGY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OPP_157_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OPSSK_158
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OPSSK_158 BEFORE INSERT ON WH1.OPSSKUDET FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OPS_158_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OPSSK_159
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OPSSK_159 BEFORE INSERT ON WH1.OPSSKUDETDEFN FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OPS_159_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OPTSK_160
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OPTSK_160 BEFORE INSERT ON WH1.OPTSKUXLOC FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OPT_160_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OPXSH_161
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OPXSH_161 BEFORE INSERT ON WH1.OPXSHIPORD FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OPX_161_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OPXSK_162
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OPXSK_162 BEFORE INSERT ON WH1.OPXSKUXLOC FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OPX_162_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OP_CA_163
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OP_CA_163 BEFORE INSERT ON WH1.OP_CARTONLINES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OP__163_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OP_CA_164
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OP_CA_164 BEFORE INSERT ON WH1.OP_CARTONLINESWORK FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OP__164_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OP_CA_165
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OP_CA_165 BEFORE INSERT ON WH1.OP_CARTONWORK FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OP__165_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OP_LO_166
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OP_LO_166 BEFORE INSERT ON WH1.OP_LOC FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OP__166_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OP_OR_167
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OP_OR_167 BEFORE INSERT ON WH1.OP_ORDERDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OP__167_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_OP_PI_168
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_OP_PI_168 BEFORE INSERT ON WH1.OP_PICKLOCS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.OP__168_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ORDER_169
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_ORDER_169 BEFORE INSERT ON WH1.ORDERDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ORD_169_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ORDER_170
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_ORDER_170 BEFORE INSERT ON WH1.ORDERDETAILXVAS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ORD_170_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ORDER_171
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_ORDER_171 BEFORE INSERT ON WH1.ORDERDETAIL_UDF FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ORD_171_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ORDER_172
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_ORDER_172 BEFORE INSERT ON WH1.ORDERS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ORD_172_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ORDER_173
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_ORDER_173 BEFORE INSERT ON WH1.ORDERSELECTION FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ORD_173_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ORDER_174
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_ORDER_174 BEFORE INSERT ON WH1.ORDERSTATUSHISTORY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ORD_174_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ORDER_175
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_ORDER_175 BEFORE INSERT ON WH1.ORDERSTATUSSETUP FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ORD_175_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ORDER_176
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_ORDER_176 BEFORE INSERT ON WH1.ORDERS_UDF FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ORD_176_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PACK_177
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_PACK_177 BEFORE INSERT ON WH1.PACK FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PAC_177_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PACK_CASE_PACKID
prompt ====================================
prompt
CREATE OR REPLACE TRIGGER tr_PACK_CASE_PACKID BEFORE INSERT ON PACK_CASE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.PACKID IS NULL THEN
			SELECT WH1.SEQ_PACKID.NEXTVAL
			INTO   :NEW.PACKID
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PALLE_178
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PALLE_178 BEFORE INSERT ON WH1.PALLET FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PAL_178_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PALLE_179
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PALLE_179 BEFORE INSERT ON WH1.PALLETDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PAL_179_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PALOC_180
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PALOC_180 BEFORE INSERT ON WH1.PALOCSEARCH FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PAL_180_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PATRA_181
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PATRA_181 BEFORE INSERT ON WH1.PATRACELOG FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PAT_181_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PAZON_182
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PAZON_182 BEFORE INSERT ON WH1.PAZONEEQUIPMENTEXCLUDEDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PAZ_182_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PBSRP_183
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PBSRP_183 BEFORE INSERT ON WH1.PBSRPT_CATEGORY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PBS_183_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PBSRP_184
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PBSRP_184 BEFORE INSERT ON WH1.PBSRPT_PARMS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PBS_184_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PBSRP_185
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PBSRP_185 BEFORE INSERT ON WH1.PBSRPT_REPORTS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PBS_185_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PBSRP_186
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PBSRP_186 BEFORE INSERT ON WH1.PBSRPT_SETS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PBS_186_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PBSRP_187
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PBSRP_187 BEFORE INSERT ON WH1.PBSRPT_SET_REPORTS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PBS_187_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHYSI_188
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHYSI_188 BEFORE INSERT ON WH1.PHYSICAL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_188_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHYSI_189
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHYSI_189 BEFORE INSERT ON WH1.PHYSICALPARAMETERS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_189_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHY_A_190
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHY_A_190 BEFORE INSERT ON WH1.PHY_A2B_ID FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_190_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHY_A_191
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHY_A_191 BEFORE INSERT ON WH1.PHY_A2B_LOT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_191_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHY_A_192
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHY_A_192 BEFORE INSERT ON WH1.PHY_A2B_SKU FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_192_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHY_A_193
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHY_A_193 BEFORE INSERT ON WH1.PHY_A2B_TAG FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_193_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHY_I_194
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHY_I_194 BEFORE INSERT ON WH1.PHY_INV2A_ID FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_194_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHY_I_195
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHY_I_195 BEFORE INSERT ON WH1.PHY_INV2A_LOT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_195_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHY_I_196
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHY_I_196 BEFORE INSERT ON WH1.PHY_INV2A_SKU FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_196_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHY_M_197
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHY_M_197 BEFORE INSERT ON WH1.PHY_MISSING_TAG_A FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_197_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHY_M_198
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHY_M_198 BEFORE INSERT ON WH1.PHY_MISSING_TAG_B FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_198_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHY_O_199
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHY_O_199 BEFORE INSERT ON WH1.PHY_OUTOFRANGE_TAG_A FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_199_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHY_O_200
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHY_O_200 BEFORE INSERT ON WH1.PHY_OUTOFRANGE_TAG_B FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_200_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHY_P_201
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHY_P_201 BEFORE INSERT ON WH1.PHY_POSTED FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_201_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PHY_P_202
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PHY_P_202 BEFORE INSERT ON WH1.PHY_POST_DETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PHY_202_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PICKC_203
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PICKC_203 BEFORE INSERT ON WH1.PICKCODE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PIC_203_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PICKD_204
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PICKD_204 BEFORE INSERT ON WH1.PICKDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PIC_204_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PICKH_205
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PICKH_205 BEFORE INSERT ON WH1.PICKHEADER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PIC_205_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PODET_208
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PODET_208 BEFORE INSERT ON WH1.PODETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.POD_208_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PODET_209
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PODET_209 BEFORE INSERT ON WH1.PODETAILSTATUSHISTORY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.POD_209_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PODET_210
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PODET_210 BEFORE INSERT ON WH1.PODETAIL_UDF FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.POD_210_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_POD_207
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_POD_207 BEFORE INSERT ON WH1.POD FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.POD_207_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_POLL__211
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_POLL__211 BEFORE INSERT ON WH1.POLL_ALLOCATE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.POL_211_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_POLL__212
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_POLL__212 BEFORE INSERT ON WH1.POLL_PICK FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.POL_212_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_POLL__213
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_POLL__213 BEFORE INSERT ON WH1.POLL_PRINT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.POL_213_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_POLL__214
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_POLL__214 BEFORE INSERT ON WH1.POLL_SHIP FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.POL_214_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_POLL__215
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_POLL__215 BEFORE INSERT ON WH1.POLL_UPDATE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.POL_215_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_POSTA_216
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_POSTA_216 BEFORE INSERT ON WH1.POSTATUSHISTORY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.POS_216_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PO_206
prompt ==========================
prompt
CREATE OR REPLACE TRIGGER tr_PO_206 BEFORE INSERT ON WH1.PO FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PO_206_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PO_UD_217
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PO_UD_217 BEFORE INSERT ON WH1.PO_UDF FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PO__217_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PREAL_218
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PREAL_218 BEFORE INSERT ON WH1.PREALLOCATEPICKDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PRE_218_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PREAL_219
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PREAL_219 BEFORE INSERT ON WH1.PREALLOCATESTRATEGY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PRE_219_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PREAL_220
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PREAL_220 BEFORE INSERT ON WH1.PREALLOCATESTRATEGYDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PRE_220_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PRE_RECEIVE_001
prompt ===================================
prompt
CREATE OR REPLACE TRIGGER tr_PRE_RECEIVE_001 BEFORE INSERT ON PRE_RECEIVE FOR EACH ROW
DECLARE
    BEGIN
        IF :NEW.SERIALKEY IS NULL THEN
            SELECT WH1.PRE_RECEIVE_001_SEQ.NEXTVAL
            INTO   :NEW.SerialKey
            FROM   dual;
            END IF;
    END;
/

prompt
prompt Creating trigger TR_PTRAC_221
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PTRAC_221 BEFORE INSERT ON WH1.PTRACEDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PTR_221_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PTRAC_222
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PTRAC_222 BEFORE INSERT ON WH1.PTRACEHEAD FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PTR_222_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PUTAW_223
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PUTAW_223 BEFORE INSERT ON WH1.PUTAWAYSTRATEGY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PUT_223_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PUTAW_224
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PUTAW_224 BEFORE INSERT ON WH1.PUTAWAYSTRATEGYDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PUT_224_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_PUTAW_225
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_PUTAW_225 BEFORE INSERT ON WH1.PUTAWAYZONE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.PUT_225_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_RECEI_226
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_RECEI_226 BEFORE INSERT ON WH1.RECEIPT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.REC_226_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_RECEI_227
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_RECEI_227 BEFORE INSERT ON WH1.RECEIPTDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.REC_227_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_RECEI_228
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_RECEI_228 BEFORE INSERT ON WH1.RECEIPTDETAILSTATUSHISTORY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.REC_228_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_RECEI_229
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_RECEI_229 BEFORE INSERT ON WH1.RECEIPTDETAIL_UDF FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.REC_229_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_RECEI_230
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_RECEI_230 BEFORE INSERT ON WH1.RECEIPTSTATUSHISTORY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.REC_230_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_RECEI_231
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_RECEI_231 BEFORE INSERT ON WH1.RECEIPTVALIDATION FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.REC_231_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_RECEI_232
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_RECEI_232 BEFORE INSERT ON WH1.RECEIPT_UDF FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.REC_232_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_REPLE_233
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_REPLE_233 BEFORE INSERT ON WH1.REPLENISHMENT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.REP_233_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_REPLE_234
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_REPLE_234 BEFORE INSERT ON WH1.REPLENISHMENT_LOCK FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.REP_234_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_RESTR_235
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_RESTR_235 BEFORE INSERT ON WH1.RESTRICTIONS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.RES_235_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_RFDB__236
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_RFDB__236 BEFORE INSERT ON WH1.RFDB_LOG FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.RFD_236_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_RFLOG_237
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_RFLOG_237 BEFORE INSERT ON WH1.RFLOGINS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.RFL_237_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ROUTE_238
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_ROUTE_238 BEFORE INSERT ON WH1.ROUTEOPS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ROU_238_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_ROUTE_239
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_ROUTE_239 BEFORE INSERT ON WH1.ROUTEOPSDEFN FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.ROU_239_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_RR_TE_240
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_RR_TE_240 BEFORE INSERT ON WH1.RR_TEMP FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.RR__240_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_SCHED_241
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_SCHED_241 BEFORE INSERT ON WH1.SCHEDULE_RULES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.SCH_241_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_SEAL__242
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_SEAL__242 BEFORE INSERT ON WH1.SEAL_INFO FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.SEA_242_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_SECTI_243
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_SECTI_243 BEFORE INSERT ON WH1.SECTION FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.SEC_243_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_SERVI_244
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_SERVI_244 BEFORE INSERT ON WH1.SERVICES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.SER_244_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_SKUXL_246
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_SKUXL_246 BEFORE INSERT ON WH1.SKUXLOC FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.SKU_246_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_SKU_245
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_SKU_245 BEFORE INSERT ON WH1.SKU FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.SKU_245_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_SKU_U_247
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_SKU_U_247 BEFORE INSERT ON WH1.SKU_UDF FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.SKU_247_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_SORTA_248
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_SORTA_248 BEFORE INSERT ON WH1.SORTATIONSTATION FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.SOR_248_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_SORTA_249
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_SORTA_249 BEFORE INSERT ON WH1.SORTATIONSTATIONDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.SOR_249_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_STAGI_250
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_STAGI_250 BEFORE INSERT ON WH1.STAGING_POINT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.STA_250_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_STAND_251
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_STAND_251 BEFORE INSERT ON WH1.STANDING_APPT FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.STA_251_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_STORE_252
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_STORE_252 BEFORE INSERT ON WH1.STORER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.STO_252_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_STORE_253
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_STORE_253 BEFORE INSERT ON WH1.STORERBILLING FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.STO_253_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_STORE_254
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_STORE_254 BEFORE INSERT ON WH1.STORERLABELS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.STO_254_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_STORE_255
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_STORE_255 BEFORE INSERT ON WH1.STORER_UDF FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.STO_255_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_STRAT_256
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_STRAT_256 BEFORE INSERT ON WH1.STRATEGY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.STR_256_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_SUBST_257
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_SUBST_257 BEFORE INSERT ON WH1.SUBSTITUTESKU FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.SUB_257_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_SYSTE_258
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_SYSTE_258 BEFORE INSERT ON WH1.SYSTEM_RULES FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.SYS_258_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TARIF_259
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TARIF_259 BEFORE INSERT ON WH1.TARIFF FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TAR_259_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TARIF_260
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TARIF_260 BEFORE INSERT ON WH1.TARIFFDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TAR_260_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TARIF_261
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TARIF_261 BEFORE INSERT ON WH1.TARIFFXSTORERXSKU FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TAR_261_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TASKD_262
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TASKD_262 BEFORE INSERT ON WH1.TASKDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TAS_262_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TASKM_263
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TASKM_263 BEFORE INSERT ON WH1.TASKMANAGERREASON FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TAS_263_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TASKM_264
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TASKM_264 BEFORE INSERT ON WH1.TASKMANAGERSKIPTASKS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TAS_264_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TASKM_265
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TASKM_265 BEFORE INSERT ON WH1.TASKMANAGERUSER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TAS_265_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TASKM_266
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TASKM_266 BEFORE INSERT ON WH1.TASKMANAGERUSERDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TAS_266_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TAXGR_267
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TAXGR_267 BEFORE INSERT ON WH1.TAXGROUP FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TAX_267_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TAXGR_268
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TAXGR_268 BEFORE INSERT ON WH1.TAXGROUPDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TAX_268_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TAXRA_269
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TAXRA_269 BEFORE INSERT ON WH1.TAXRATE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TAX_269_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TEMP__270
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TEMP__270 BEFORE INSERT ON WH1.TEMP_REPORTS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TEM_270_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TRANS_271
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TRANS_271 BEFORE INSERT ON WH1.TRANSASN FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TRA_271_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TRANS_272
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TRANS_272 BEFORE INSERT ON WH1.TRANSASND FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TRA_272_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TRANS_273
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TRANS_273 BEFORE INSERT ON WH1.TRANSDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TRA_273_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TRANS_274
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TRANS_274 BEFORE INSERT ON WH1.TRANSFER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TRA_274_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TRANS_275
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TRANS_275 BEFORE INSERT ON WH1.TRANSFERDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TRA_275_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TRANS_276
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TRANS_276 BEFORE INSERT ON WH1.TRANSFERDETAIL_UDF FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TRA_276_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TRANS_277
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TRANS_277 BEFORE INSERT ON WH1.TRANSFER_UDF FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TRA_277_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TRANS_278
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TRANS_278 BEFORE INSERT ON WH1.TRANSMITLOG FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TRA_278_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TRANS_279
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TRANS_279 BEFORE INSERT ON WH1.TRANSMITLOGSTATUS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TRA_279_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TRANS_280
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TRANS_280 BEFORE INSERT ON WH1.TRANSSHIP FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TRA_280_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TRIDE_281
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TRIDE_281 BEFORE INSERT ON WH1.TRIDENTSCHEDULER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TRI_281_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TTMST_282
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TTMST_282 BEFORE INSERT ON WH1.TTMSTRATEGY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TTM_282_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_TTMST_283
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_TTMST_283 BEFORE INSERT ON WH1.TTMSTRATEGYDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.TTM_283_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_UAT_310
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_UAT_310 BEFORE INSERT ON WH1.USERATTENDANCE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.UAT_310_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_USA_309
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER tr_USA_309 BEFORE INSERT ON WH1.USERACTIVITY FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.USA_309_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WAVED_285
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_WAVED_285 BEFORE INSERT ON WH1.WAVEDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WAV_285_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WAVE_284
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_WAVE_284 BEFORE INSERT ON WH1.WAVE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WAV_284_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WAVE_304
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_WAVE_304 BEFORE INSERT ON WH1.WAVEINPROCESS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WAV_304_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WCS_TASK_245
prompt ================================
prompt
CREATE OR REPLACE TRIGGER tr_WCS_TASK_245 BEFORE INSERT ON WH1.WCS_TASK FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.TASKNO IS NULL THEN
			SELECT WH1.SEQ_TASKNO.NEXTVAL
			INTO   :NEW.TASKNO
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WCTAS_286
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_WCTAS_286 BEFORE INSERT ON WH1.WCTASK FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WCT_286_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WHSE_287
prompt ============================
prompt
CREATE OR REPLACE TRIGGER tr_WHSE_287 BEFORE INSERT ON WH1.WHSE FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WHS_287_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WOGRO_288
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_WOGRO_288 BEFORE INSERT ON WH1.WOGROUP FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WOG_288_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WOPRO_289
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_WOPRO_289 BEFORE INSERT ON WH1.WOPROPERTYDEFN FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WOP_289_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WORKC_290
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_WORKC_290 BEFORE INSERT ON WH1.WORKCENTERDEFN FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WOR_290_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WORKO_291
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_WORKO_291 BEFORE INSERT ON WH1.WORKORDER FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WOR_291_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WORKO_292
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_WORKO_292 BEFORE INSERT ON WH1.WORKORDERDEFN FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WOR_292_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WPBAT_293
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_WPBAT_293 BEFORE INSERT ON WH1.WPBATCH FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WPB_293_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WPBAT_294
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_WPBAT_294 BEFORE INSERT ON WH1.WPBATCHDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WPB_294_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WPORD_295
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_WPORD_295 BEFORE INSERT ON WH1.WPORDERDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WPO_295_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WPORD_296
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_WPORD_296 BEFORE INSERT ON WH1.WPORDERDETAILXVAS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WPO_296_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WPORD_297
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_WPORD_297 BEFORE INSERT ON WH1.WPORDERS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WPO_297_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_WPPIC_298
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_WPPIC_298 BEFORE INSERT ON WH1.WPPICKDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.WPP_298_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_XDOCK_299
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_XDOCK_299 BEFORE INSERT ON WH1.XDOCK FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.XDO_299_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_XDOCK_300
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_XDOCK_300 BEFORE INSERT ON WH1.XDOCKDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.XDO_300_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_XORDE_301
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_XORDE_301 BEFORE INSERT ON WH1.XORDERDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.XOR_301_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_XORDE_302
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_XORDE_302 BEFORE INSERT ON WH1.XORDERS FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.XOR_302_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/

prompt
prompt Creating trigger TR_XPICK_303
prompt =============================
prompt
CREATE OR REPLACE TRIGGER tr_XPICK_303 BEFORE INSERT ON WH1.XPICKDETAIL FOR EACH ROW
DECLARE
	BEGIN
		IF :NEW.SERIALKEY IS NULL THEN
			SELECT WH1.XPI_303_SEQ.NEXTVAL
			INTO   :NEW.SerialKey
			FROM   dual;
    		END IF;
	END;
/


spool off
