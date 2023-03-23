create table insurance_issue_type
(
    code  number(2) primary key,
    title nvarchar2(50) not null
);
comment on table insurance_issue_type is 'انواع  موضوع بیمه نامه';
comment on column insurance_issue_type.code is 'کد نوع موضوع  بیمه نامه';
comment on column insurance_issue_type.title is 'عنوان نوع  موضوع بیمه نامه';
----------------------------------------------------------------------------------------------
create table insurance_company
(
    id               number(12) primary key,
    national_id      varchar2(11)   not null unique,
    company_name     nvarchar2(150) not null,
    status_code      number(1)      not null,
    last_change_date date           not null
);
comment on table insurance_company is 'شرکت بیمه گر';
comment on column insurance_company.id is 'شناسه شرکت بیمه گر';
comment on column insurance_company.national_id is 'شناسه ملی شرکت بیمه گر';
comment on column insurance_company.company_name is 'نام شرکت بیمه گر';
comment on column insurance_company.status_code is 'وضعیت شرکت بیمه گر';
comment on column insurance_company.last_change_date is 'زمان آخرین تغییر شرکت بیمه گر';
-----------------------------------------------------------------------------------------------------
create table asset_type
(
    code  number(2)     not null primary key,
    title nvarchar2(50) not null
);
comment on table asset_type is 'انواع  دارایی';
comment on column asset_type.code is 'کد نوع دارایی';
comment on column asset_type.title is 'عنوان نوع  دارایی';
---------------------------------------------------------------------------------------------------------
create table expert_type
(
    code  number(2) primary key not null,
    title nvarchar2(30)         not null
);
comment on table expert_type is 'انواع  کارشناس';
comment on column expert_type.code is 'کد نوع کارشناس';
comment on column expert_type.title is 'عنوان نوع  کارشناس';
--------------------------------------------------------------------------------------------
create table evaluation
(
    id                   number(12)     not null primary key,
    evaluation_sheet_no  varchar2(36)   not null,
    expert_type_code     number(2)      not null,
    expert_identifier_no varchar2(15)   not null,
    expert_full_name     nvarchar2(150) not null,
    evaluation_date      date           not null,
    status_code          number(1)      not null,
    last_change_date     date           not null,
    constraint expert_type_cde_fk foreign key (expert_type_code)
        references expert_type (code)
);

comment on table evaluation is 'ارزیابی';
comment on column evaluation.id is 'شناسه ارزیابی';
comment on column evaluation.evaluation_sheet_no is 'شماره  ارزیابی';
comment on column evaluation.expert_type_code is 'کد نوع کارشناسی';
comment on column evaluation.expert_identifier_no is 'کد/شناسه ملی کارشناس';
comment on column evaluation.expert_full_name is 'نام کارشناس';
comment on column evaluation.evaluation_date is 'تاریخ ارزیابی';
comment on column evaluation.status_code is 'وضعیت ارزیابی';
comment on column evaluation.last_change_date is 'زمان آخرین تغییر ارزیابی';
--------------------------------------------------------------------------------
create table evaluation_asset
(
    id               number(12)    not null primary key,
    evaluation_id    number(12)    not null,
    asset_type_code  number(2)     not null,
    asset_id         number(12)    not null,
    amount           number(21, 2) not null,
    status_code      number(1)     not null,
    last_change_date date          not null,
    constraint evaluation_id_fk foreign key (evaluation_id)
        references evaluation (id),
    constraint evaluation_asset_type_code_fk foreign key (asset_type_code)
        references asset_type (code)
);
comment on table evaluation_asset is ' دارایی ارزیابی';
comment on column evaluation_asset.id is 'شناسه دارایی ارزیابی';
comment on column evaluation_asset.evaluation_id is 'شناسه ارزیابی';
comment on column evaluation_asset.asset_type_code is 'کد نوع دارایی';
comment on column evaluation_asset.asset_id is 'شناسه دارایی';
comment on column evaluation_asset.amount is 'مبلغ ارزیابی';
comment on column evaluation_asset.status_code is 'وضعیت  دارایی ارزیابی';
comment on column evaluation_asset.last_change_date is 'زمان آخرین تغییر دارایی ارزیابی';
-------------------------------------------------------------------------------------------------------
create table insurance_policy
(
    id                            number(12)    not null primary key,
    insurance_no                  varchar2(36)  not null,
    central_insurance_unique_code varchar2(15)  not null unique,
    insurance_company_id          number(12)    not null,
    agency_no                     varchar2(20)  not null,
    start_date                    date          not null,
    due_date                      date          not null,
    insurance_amount              number(21, 2) not null,
    status_code                   number(1)     not null,
    last_change_date              date          not null,
    constraint insurance_company_id_fk foreign key (insurance_company_id)
        references insurance_company (id)
);
comment on table insurance_policy is 'بیمه نامه';
comment on column insurance_policy.id is 'شناسه بیمه نامه';
comment on column insurance_policy.insurance_no is 'شماره  بیمه نامه';
comment on column insurance_policy.central_insurance_unique_code is 'کد یکتای بیمه مرکزی';
comment on column insurance_policy.insurance_company_id is 'شناسه شرکت بیمه گر';
comment on column insurance_policy.agency_no is 'شماره نمایندگی';
comment on column insurance_policy.start_date is 'تاریخ شروع بیمه نامه';
comment on column insurance_policy.due_date is 'تاریخ سررسید';
comment on column insurance_policy.insurance_amount is 'مبلغ بیمه نامه';
comment on column insurance_policy.status_code is 'وضعیت بیمه نامه';
comment on column insurance_policy.last_change_date is 'زمان آخرین تغییر بیمه نامه';
-------------------------------------------------------------------------------------------------
create table insurance_policy_asset
(
    id                        number(12)    not null primary key,
    insurance_policy_id       number(12)    not null,
    asset_type_code           number(2)     not null,
    asset_id                  number(12)    not null,
    insurance_issue_type_code number(2)     not null,
    amount                    number(21, 2) not null,
    status_code               number(1)     not null,
    last_change_date          date          not null,
    constraint insurance_policy_id_fk foreign key (insurance_policy_id)
        references insurance_policy (id),
    constraint insurance_policy_asset_type_code_fk foreign key (asset_type_code)
        references asset_type (code)
);
comment on table insurance_policy_asset is ' دارایی بیمه نامه';
comment on column insurance_policy_asset.id is 'شناسه دارایی بیمه نامه';
comment on column insurance_policy_asset.insurance_policy_id is 'شناسه  بیمه نامه';
comment on column insurance_policy_asset.asset_type_code is 'کد نوع دارایی';
comment on column insurance_policy_asset.asset_id is 'شناسه دارایی';
comment on column insurance_policy_asset.insurance_issue_type_code is 'کد نوع موضوع بیمه';
comment on column insurance_policy_asset.amount is 'مبلغ دارایی بیمه نامه';
comment on column insurance_policy_asset.status_code is 'وضعیت  دارایی بیمه نامه';
comment on column insurance_policy_asset.last_change_date is 'زمان آخرین تغییر دارایی بیمه نامه';
------------------------------------------------------------------------------------------
create sequence seq_insurance_company minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
create sequence seq_insurance_policy minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
create sequence seq_insurance_policy_asset minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
create sequence seq_evaluation minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
create sequence seq_evaluation_asset minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
-----------------------------------------------------------------------------------------------------------------

create table cities
(
    id          number(12)     not null primary key,
    name        nvarchar2(200) not null,
    status_code number(1)      not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp default null,
    deleted_at  timestamp default null
);

create table users
(
    id          number(12)     not null primary key,
    name        nvarchar2(200) not null,
    username    nvarchar2(200) not null unique ,
    password    varchar2(200)  not null,
    city_id     number(12)     not null ,
    status_code number(1)      not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp default null,
    deleted_at  timestamp default null,
    constraint user_city_id foreign key (city_id)
        references cities (id)
);
create table groups
(
    id          number(12)     not null primary key,
    name        nvarchar2(200) not null,
    status_code number(1)      not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp default null,
    deleted_at  timestamp default null
);

create table permissions
(
    id          number(12)     not null primary key,
    name        nvarchar2(200) not null,
    status_code number(1)      not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp default null,
    deleted_at  timestamp default null
);
create table group_user
(
    id         number(12) not null primary key,
    user_id    number(12) not null ,
    group_id   number(12) not null ,
    created_at timestamp default current_timestamp,
    constraint group_user_user_fk foreign key (user_id)
        references users (id),
    constraint group_user_group_fk foreign key (group_id)
        references groups (id)
);

create table group_permission
(
    id            number(12) not null primary key,
    permission_id number(12) not null ,
    group_id      number(12) not null ,
    created_at    timestamp default current_timestamp,
    constraint group_user_permission_fk foreign key (permission_id)
        references permissions (id),
    constraint group_user_group_fk foreign key (group_id)
        references groups (id)
);

create table orders
(
    id          number(12) not null primary key,
    user_id     int        not null ,
    status_code number(1)  not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp default null,
    deleted_at  timestamp default null,
    constraint order_user_user_fk foreign key (user_id)
        references users (id)
);

create table products
(
    id          number(12)     not null primary key,
    name        nvarchar2(200) not null,
    status_code number(1)      not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp default null,
    deleted_at  timestamp default null
);

create table order_detail
(
    id         number(12) not null primary key,
    order_id   number(12) not null ,
    product_id number(12) not null ,
    created_at timestamp default current_timestamp,
    updated_at timestamp default null,
    deleted_at timestamp default null,
    constraint order_detail_order_fk foreign key (order_id)
        references orders (id),
    constraint order_detail_product_fk foreign key (product_id)
        references products (id)
);

create sequence seq_order minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
create sequence seq_product minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
create sequence seq_order_detail minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
create sequence seq_city minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
create sequence seq_user minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
create sequence seq_group minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
create sequence seq_permission minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
create sequence seq_group_user minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
create sequence seq_group_permission minvalue 1 maxvalue 999999999999 start with 1 increment by 1;
