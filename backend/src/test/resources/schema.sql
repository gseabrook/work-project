drop sequence if exists hibernate_sequence;

drop table if exists bank;
drop table if exists customer;
drop table if exists customer_bank_accounts;
drop table if exists customer_bank_account;
drop table if exists mandate;
drop table if exists merchant;
drop table if exists merchant_merchant_bank_accounts;
drop table if exists merchant_bank_account;

create sequence hibernate_sequence;

create table bank (id SERIAL UNIQUE, code varchar(255), name varchar(255), primary key (id));
create table customer (id SERIAL UNIQUE, email_address varchar(255), id_type integer, id_value varchar(255), name varchar(255), phone_number varchar(255), primary key (id));
create table customer_bank_accounts (customer_id integer not null, bank_accounts_id integer not null);
create table customer_bank_account (id SERIAL UNIQUE, account_number varchar(255), bank_id integer, primary key (id));
create table mandate (id SERIAL UNIQUE, amount decimal(19,2) not null, frequency integer, reference_number varchar(255), registration_date timestamp, customer_id integer not null, merchant_id integer not null, primary key (id));
create table merchant (id SERIAL UNIQUE, company_name varchar(255), company_registration_number varchar(255), primary key (id));
create table merchant_merchant_bank_accounts (merchant_id integer not null, merchant_bank_accounts_id integer not null);
create table merchant_bank_account (id SERIAL UNIQUE, account_number varchar(255), seller_id varchar(255), bank_id integer, primary key (id));

alter table customer_bank_accounts add constraint UK_hdpy2oggcb1tuwmdussu8o8qx unique (bank_accounts_id);
alter table merchant_merchant_bank_accounts add constraint UK_rm1vhggt5oe0lu14fab81ct2p unique (merchant_bank_accounts_id);
alter table customer_bank_accounts add constraint FKa09est9bm4biqvangg118eu24 foreign key (bank_accounts_id) references customer_bank_account;
alter table customer_bank_accounts add constraint FKpx3uqijuo0c0dymtpmprlrfnq foreign key (customer_id) references customer;
alter table customer_bank_account add constraint FKlwciy5lxq5eq5qqhvrsr5kwd4 foreign key (bank_id) references bank;
alter table mandate add constraint FKrblr9jysrw4jmgs8it3s1rjq3 foreign key (customer_id) references customer;
alter table mandate add constraint FK4x77j3hw2seixa474xtcvp55i foreign key (merchant_id) references merchant;
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