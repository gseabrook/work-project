drop sequence if exists hibernate_sequence;

drop table if exists bank CASCADE;
drop table if exists customer CASCADE;
drop table if exists customer_bank_accounts CASCADE;
drop table if exists customer_bank_account CASCADE;
drop table if exists mandate CASCADE;
drop table if exists merchant CASCADE;
drop table if exists merchant_merchant_bank_accounts CASCADE;
drop table if exists merchant_bank_account CASCADE;
drop table if exists user_verification_token CASCADE;

create sequence hibernate_sequence;

create table bank (id SERIAL UNIQUE, code varchar(255), name varchar(255), display_name varchar(255), primary key (id));
create table customer (id SERIAL UNIQUE, email_address varchar(255), id_type integer, id_value varchar(255), name varchar(255), phone_number varchar(255), principal_uid varchar(255), primary key (id));
create table customer_bank_accounts (customer_id integer not null, bank_accounts_id integer not null);
create table customer_bank_account (id SERIAL UNIQUE, account_number varchar(255), bank_id integer, customer_id integer, primary key (id));
create table mandate (id SERIAL UNIQUE, amount decimal(19,2) not null, frequency integer, reference_number varchar(255), registration_date timestamp, customer_id integer not null, merchant_id integer not null, customer_bank_account_id integer, status_id integer not null, node_id varchar(255), primary key (id));
create table mandate_status (id SERIAL UNIQUE, code varchar(255), description varchar(255), primary key (id));
create table merchant (id SERIAL UNIQUE, company_name varchar(255), company_registration_number varchar(255), primary key (id));
create table merchant_merchant_bank_accounts (merchant_id integer not null, merchant_bank_accounts_id integer not null);
create table merchant_bank_account (id SERIAL UNIQUE, account_number varchar(255), seller_id varchar(255), bank_id integer, primary key (id));
create table user_verification_token (id SERIAL UNIQUE, token varchar(255) not null, principal_uid varchar(255) not null, expiry_date timestamp, primary key(id));

alter table customer_bank_accounts add constraint UK_hdpy2oggcb1tuwmdussu8o8qx unique (bank_accounts_id);
alter table merchant_merchant_bank_accounts add constraint UK_rm1vhggt5oe0lu14fab81ct2p unique (merchant_bank_accounts_id);
alter table customer_bank_accounts add constraint FKa09est9bm4biqvangg118eu24 foreign key (bank_accounts_id) references customer_bank_account;
alter table customer_bank_accounts add constraint FKpx3uqijuo0c0dymtpmprlrfnq foreign key (customer_id) references customer;
alter table customer_bank_account add constraint FKlwciy5lxq5eq5qqhvrsr5kwd4 foreign key (bank_id) references bank;
alter table customer_bank_account add constraint alwkndlawjdad foreign key (customer_id) references customer;
alter table mandate add constraint FKrblr9jysrw4jmgs8it3s1rjq3 foreign key (customer_id) references customer;
alter table mandate add constraint FK4x77j3hw2seixa474xtcvp55i foreign key (merchant_id) references merchant;
alter table mandate add constraint pfosepfkapowdka foreign key (customer_bank_account_id) references customer_bank_account;
alter table mandate add constraint jgladlaofmlkfal foreign key (status_id) references mandate_status;
alter table merchant_merchant_bank_accounts add constraint FKknck2yatj3xa6gq14w4015lh2 foreign key (merchant_bank_accounts_id) references merchant_bank_account;
alter table merchant_merchant_bank_accounts add constraint FKcl09v4n3qydtvw2axotoxek3x foreign key (merchant_id) references merchant;
alter table merchant_bank_account add constraint FKfux74odfqqlavtf9qdvrou85a foreign key (bank_id) references bank;

-- Ebikko

CREATE TABLE property (
    uid varchar(32) NOT NULL,
    name varchar(100) NOT NULL,
    property_type integer NOT NULL,
    length integer NOT NULL,
    decimals integer NOT NULL,
    refnodetypeid varchar(32),
    refmultivalue integer,
    acl_uid varchar(32),
    semantics integer,
    maskre varchar(255),
    min_date_value timestamp,
    max_date_value timestamp,
    min_int_value integer,
    max_int_value integer,
    min_decimal_value decimal(31,5),
    max_decimal_value decimal(31,5),
    groups_only integer,
    non_groups_only integer,
    must_be_member_of varchar(32),
    must_be_container integer,
    lookupset_uid varchar(32),
    using_lookupset integer DEFAULT 0 NOT NULL,
    allow_non_matching_values integer DEFAULT 0 NOT NULL,
    apply_to_principal integer DEFAULT 0 NOT NULL
);

CREATE TABLE principal (
    uid character(32) NOT NULL,
    name character varying(255) NOT NULL,
    extid character varying(50),
    username character varying(50),
    password character varying(255),
    isgroup integer DEFAULT 0 NOT NULL,
    acl_uid character(32),
    security_level_uid character(32),
    isinternal integer DEFAULT 0 NOT NULL,
    issuspended integer DEFAULT 0 NOT NULL,
    gender integer DEFAULT 3 NOT NULL,
    email character varying(255),
    profile_uid character(32),
    canlogin integer DEFAULT 0 NOT NULL,
    active_from timestamp ,
    active_to timestamp ,
    date_registered timestamp ,
    barcode character varying(50),
    external_barcode character varying(50),
    ptype integer DEFAULT 0 NOT NULL,
    date_last_modified_of_password timestamp ,
    loginmessage text,
    address text,
    ic_passport_no character varying(32),
    date_of_birth timestamp ,
    nationality character varying(50),
    business_occupation character varying(255),
    phone_number character varying(20),
    mobile_phone character varying(20),
    af7c0ba6be8a452194d3e040048463d6 character varying(100),
    jc2300d55f3547e3a495f6332e259604 character varying(100)
);

ALTER TABLE principal ADD CONSTRAINT principal_pkey PRIMARY KEY (uid);
CREATE UNIQUE INDEX principal_barcode ON principal (barcode);
CREATE UNIQUE INDEX principal_ext_barcode ON principal (external_barcode);
CREATE UNIQUE INDEX principal_extid_idx ON principal (extid);
CREATE UNIQUE INDEX principal_uname_idx ON principal (username);


CREATE TABLE profile (
    uid character(32) NOT NULL,
    name character varying(50) NOT NULL,
    p1000 integer DEFAULT 0 NOT NULL,
    p1 integer DEFAULT 0 NOT NULL,
    p11 integer DEFAULT 0 NOT NULL,
    p21 integer DEFAULT 0 NOT NULL,
    p41 integer DEFAULT 0 NOT NULL,
    p42 integer DEFAULT 0 NOT NULL,
    p51 integer DEFAULT 0 NOT NULL,
    p52 integer DEFAULT 0 NOT NULL,
    p53 integer DEFAULT 0 NOT NULL,
    p54 integer DEFAULT 0 NOT NULL,
    p61 integer DEFAULT 0 NOT NULL,
    p71 integer DEFAULT 0 NOT NULL,
    p81 integer DEFAULT 0 NOT NULL,
    p91 integer DEFAULT 0 NOT NULL,
    p92 integer DEFAULT 0 NOT NULL,
    p93 integer DEFAULT 0 NOT NULL,
    p94 integer DEFAULT 0 NOT NULL,
    p95 integer DEFAULT 0 NOT NULL,
    p100 integer DEFAULT 0 NOT NULL,
    p101 integer DEFAULT 0 NOT NULL,
    p102 integer DEFAULT 0 NOT NULL,
    p103 integer DEFAULT 0 NOT NULL,
    p111 integer DEFAULT 0 NOT NULL,
    p112 integer DEFAULT 0 NOT NULL,
    p121 integer DEFAULT 0 NOT NULL,
    p122 integer DEFAULT 0 NOT NULL,
    p123 integer DEFAULT 0 NOT NULL,
    p2001 integer DEFAULT 0 NOT NULL,
    p2002 integer DEFAULT 0 NOT NULL,
    p2003 integer DEFAULT 0 NOT NULL,
    p2005 integer DEFAULT 0 NOT NULL,
    p2006 integer DEFAULT 0 NOT NULL,
    p2007 integer DEFAULT 0 NOT NULL,
    p2008 integer DEFAULT 0 NOT NULL,
    p2009 integer DEFAULT 0 NOT NULL,
    p2010 integer DEFAULT 0 NOT NULL,
    p2011 integer DEFAULT 0 NOT NULL,
    p2012 integer DEFAULT 0 NOT NULL,
    p2013 integer DEFAULT 0 NOT NULL,
    p2014 integer DEFAULT 0 NOT NULL,
    p2015 integer DEFAULT 0 NOT NULL,
    p2016 integer DEFAULT 0 NOT NULL,
    p2017 integer DEFAULT 0 NOT NULL,
    p2018 integer DEFAULT 0 NOT NULL,
    p2019 integer DEFAULT 0 NOT NULL,
    p2020 integer DEFAULT 0 NOT NULL,
    p2021 integer DEFAULT 0 NOT NULL,
    p2022 integer DEFAULT 0 NOT NULL,
    p2023 integer DEFAULT 0 NOT NULL,
    p2024 integer DEFAULT 0 NOT NULL,
    p2025 integer DEFAULT 0 NOT NULL,
    p2026 integer DEFAULT 0 NOT NULL,
    p2027 integer DEFAULT 0 NOT NULL,
    p2028 integer DEFAULT 0 NOT NULL,
    p2029 integer DEFAULT 0 NOT NULL,
    p3000 integer DEFAULT 0 NOT NULL,
    p4000 integer DEFAULT 0 NOT NULL,
    p5000 integer DEFAULT 0 NOT NULL,
    p6000 integer DEFAULT 0 NOT NULL,
    p6001 integer DEFAULT 0 NOT NULL,
    p7000 integer DEFAULT 0 NOT NULL,
    p8000 integer DEFAULT 0 NOT NULL,
    p8001 integer DEFAULT 0 NOT NULL,
    p9000 integer DEFAULT 0 NOT NULL,
    p10000 integer DEFAULT 0 NOT NULL,
    p11000 integer DEFAULT 0 NOT NULL,
    p12000 integer DEFAULT 0 NOT NULL,
    p13000 integer DEFAULT 0 NOT NULL,
    p14000 integer DEFAULT 0 NOT NULL,
    p15000 integer DEFAULT 0 NOT NULL,
    p16000 integer DEFAULT 0 NOT NULL,
    p17000 integer DEFAULT 0 NOT NULL,
    p18000 integer DEFAULT 0 NOT NULL,
    p19000 integer DEFAULT 0 NOT NULL,
    p20000 integer DEFAULT 0 NOT NULL,
    p21000 integer DEFAULT 0 NOT NULL,
    p22000 integer DEFAULT 0 NOT NULL,
    p23000 integer DEFAULT 0 NOT NULL,
    p25000 integer DEFAULT 0 NOT NULL,
    p26000 integer DEFAULT 0 NOT NULL,
    p27000 integer DEFAULT 0 NOT NULL,
    p28000 integer DEFAULT 0 NOT NULL,
    p29000 integer DEFAULT 0 NOT NULL,
    p30000 integer DEFAULT 0 NOT NULL,
    p31000 integer DEFAULT 0 NOT NULL,
    p40000 integer DEFAULT 0 NOT NULL,
    p41000 integer DEFAULT 0 NOT NULL,
    p42000 integer DEFAULT 0 NOT NULL,
    p43000 integer DEFAULT 0 NOT NULL
);

CREATE TABLE pasw_events (
    uid character(32) NOT NULL,
    principal_uid character(32),
    changed_by character(32),
    password character varying(255),
    date_modified timestamp
);


CREATE TABLE object_event (
    event_timestamp timestamp NOT NULL,
    event_type character varying(100) NOT NULL,
    object_uid character(32) NOT NULL,
    object_type integer NOT NULL,
    object_name character varying(255) NOT NULL,
    principal_uid character(32) NOT NULL,
    principal_name character varying(255) NOT NULL,
    details text NOT NULL,
    ipaddress character varying(45)
);