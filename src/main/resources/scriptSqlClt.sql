create table CLT.TB_INSURANCE_COMPANY
(
    ID NUMBER(12) not null
        constraint PK_INSURANCE_COMPANY
            primary key,
    NATIONAL_ID VARCHAR(11 char) not null
        constraint UC01_INSURANCE_COMPANY
            unique,
    COMPANY_NAME VARCHAR(150 char),
    STATUS_CODE NUMBER(1) not null,
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null
)
/

comment on table CLT.TB_INSURANCE_COMPANY is 'شرکت بیمه گر'
/

comment on column CLT.TB_INSURANCE_COMPANY.ID is 'شناسه'
/

comment on column CLT.TB_INSURANCE_COMPANY.NATIONAL_ID is 'شناسه ملی'
/

comment on column CLT.TB_INSURANCE_COMPANY.COMPANY_NAME is 'نام شرکت'
/

comment on column CLT.TB_INSURANCE_COMPANY.STATUS_CODE is 'کد وضعیت
فعال = 1
غیر فعال = 2'
/

comment on column CLT.TB_INSURANCE_COMPANY.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_INSURANCE_COMPANY.LAST_CHANGE_USER_ID is 'شناسه آخرین کاربر تغییر دهنده'
/

create table CLT.TB_USER_CONTROL_TYPE
(
    ID NUMBER(12) not null
        constraint PK_USER_CONTROL_TYPE
            primary key,
    CODE NUMBER(4) not null
        constraint UC01_USER_CONTROL_TYPE
            unique,
    TITLE VARCHAR(300 char) not null,
    STATUS_CODE NUMBER(1) not null,
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null
)
/

comment on table CLT.TB_USER_CONTROL_TYPE is 'انواع کنترل های کاربری'
/

comment on column CLT.TB_USER_CONTROL_TYPE.ID is 'شناسه'
/

comment on column CLT.TB_USER_CONTROL_TYPE.CODE is 'کد'
/

comment on column CLT.TB_USER_CONTROL_TYPE.TITLE is 'عنوان'
/

comment on column CLT.TB_USER_CONTROL_TYPE.STATUS_CODE is 'کد وضعیت
فعال = 1
غیر فعال = 2'
/

comment on column CLT.TB_USER_CONTROL_TYPE.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_USER_CONTROL_TYPE.LAST_CHANGE_USER_ID is 'شناسه آخرین کاربر تغییر دهنده'
/

create table CLT.TB_MINISTRY
(
    ID NUMBER(12) not null
        constraint PK_MINISTRY
            primary key,
    MINISTRY_CODE NUMBER(3) not null
        constraint UC01_MINISTRY
            unique,
    MINISTRY_NAME VARCHAR(150 char) not null,
    STATUS_CODE NUMBER(1) not null,
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null
)
/

comment on table CLT.TB_MINISTRY is 'وزارتخانه'
/

comment on column CLT.TB_MINISTRY.ID is 'شناسه'
/

comment on column CLT.TB_MINISTRY.MINISTRY_CODE is 'کد وزارتخانه'
/

comment on column CLT.TB_MINISTRY.MINISTRY_NAME is 'نام وزارتخانه'
/

comment on column CLT.TB_MINISTRY.STATUS_CODE is 'کد وضعیت
فعال = 1
غیر فعال = 2'
/

comment on column CLT.TB_MINISTRY.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_MINISTRY.LAST_CHANGE_USER_ID is 'شناسه آخرین کاربر تغییر دهنده'
/

create table CLT.TB_DOCUMENT_GROUP
(
    CODE NUMBER(2) not null
        constraint PK_DOCUMENT_GROUP
            primary key,
    TITLE VARCHAR(100 char) not null
)
/

comment on table CLT.TB_DOCUMENT_GROUP is 'گروه مستند'
/

comment on column CLT.TB_DOCUMENT_GROUP.CODE is 'کد گروه مستند'
/

comment on column CLT.TB_DOCUMENT_GROUP.TITLE is 'عنوان گروه مستند'
/

create table CLT.TB_DOCUMENT_TYPE
(
    ID NUMBER(12) not null
        constraint PK_DOCUMENT_TYPE
            primary key,
    CODE NUMBER(3) not null
        constraint UC01_DOCUMENT_TYPE
            unique,
    TITLE VARCHAR(300 char) not null,
    DOCUMENT_GROUP_CODE NUMBER(2) not null
        constraint FK_DOCUMENT_TYPE_DGC
            references CLT.TB_DOCUMENT_GROUP,
    STATUS_CODE NUMBER(1) not null,
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null
)
/

comment on table CLT.TB_DOCUMENT_TYPE is 'انواع مستند'
/

comment on column CLT.TB_DOCUMENT_TYPE.ID is 'شناسه'
/

comment on column CLT.TB_DOCUMENT_TYPE.CODE is 'کد نوع مستند'
/

comment on column CLT.TB_DOCUMENT_TYPE.TITLE is 'عنوان نوع مستند'
/

comment on column CLT.TB_DOCUMENT_TYPE.DOCUMENT_GROUP_CODE is 'کد گروه مستند'
/

comment on column CLT.TB_DOCUMENT_TYPE.STATUS_CODE is 'کد وضعیت
فعال = 1
غیر فعال = 2'
/

comment on column CLT.TB_DOCUMENT_TYPE.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_DOCUMENT_TYPE.LAST_CHANGE_USER_ID is 'شناسه آخرین کاربر تغییر دهنده'
/

create index CLT.IDX_DOCUMENT_TYPE_DOCUM
    on CLT.TB_DOCUMENT_TYPE (DOCUMENT_GROUP_CODE)
/

create table CLT.TB_NOTARY_PUBLIC
(
    ID NUMBER(12) not null
        constraint PK_NOTARY_PUBLIC
            primary key,
    COUNTY_ID NUMBER(12) not null,
    OFFICE_NO NUMBER(4) not null,
    OFFICE_NAME VARCHAR(100 char) not null,
    TELL VARCHAR(50 char) not null,
    ADDRESS VARCHAR(200 char) not null,
    MERGED_IN_NOTARY_PUBLIC_ID NUMBER(12)
        constraint FK_NOTARY_PUBLIC_MINPI
            references CLT.TB_NOTARY_PUBLIC,
    STATUS_CODE NUMBER(1) not null,
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null,
    constraint UC01_NOTARY_PUBLIC
        unique (COUNTY_ID, OFFICE_NO)
)
/

comment on table CLT.TB_NOTARY_PUBLIC is 'دفترخانه اسناد رسمی'
/

comment on column CLT.TB_NOTARY_PUBLIC.ID is 'شناسه'
/

comment on column CLT.TB_NOTARY_PUBLIC.COUNTY_ID is 'شناسه شهرستان'
/

comment on column CLT.TB_NOTARY_PUBLIC.OFFICE_NO is 'شماره دفترخانه'
/

comment on column CLT.TB_NOTARY_PUBLIC.OFFICE_NAME is 'نام دفترخانه'
/

comment on column CLT.TB_NOTARY_PUBLIC.TELL is 'تلفن'
/

comment on column CLT.TB_NOTARY_PUBLIC.ADDRESS is 'نشانی'
/

comment on column CLT.TB_NOTARY_PUBLIC.MERGED_IN_NOTARY_PUBLIC_ID is 'شناسه دفترخانه ادغامی'
/

comment on column CLT.TB_NOTARY_PUBLIC.STATUS_CODE is 'کد وضعیت
فعال = 1
غیر فعال = 2
3= ادغام شده'
/

comment on column CLT.TB_NOTARY_PUBLIC.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_NOTARY_PUBLIC.LAST_CHANGE_USER_ID is 'شناسه آخرین کاربر تغییر دهنده'
/

create index CLT.IDXFK_NOTARY_PUBLIC_MINPI
    on CLT.TB_NOTARY_PUBLIC (MERGED_IN_NOTARY_PUBLIC_ID)
/

create index CLT.IDX_NOTARY_PUBLIC_ON
    on CLT.TB_NOTARY_PUBLIC (OFFICE_NO)
/

create index CLT.IDX_NOTARY_PUBLIC_CI
    on CLT.TB_NOTARY_PUBLIC (COUNTY_ID)
/

create table CLT.TB_CURRENCY_CLASSIFICATION
(
    CODE NUMBER(2) not null
        constraint PK_CURRENCY_CLASSIFICATION
            primary key,
    TITLE VARCHAR(10) not null
)
/

comment on table CLT.TB_CURRENCY_CLASSIFICATION is 'دسته بندی ارز '
/

comment on column CLT.TB_CURRENCY_CLASSIFICATION.CODE is 'کد دسته بندی ارز'
/

comment on column CLT.TB_CURRENCY_CLASSIFICATION.TITLE is 'عنوان دسته بندی ارز'
/

create table CLT.TB_COLLATERAL_CLASSIFICATION
(
    CODE NUMBER(2) not null
        constraint PK_COLLATERAL_CLASSIFICATION
            primary key,
    TITLE VARCHAR(20 char) not null
)
/

comment on table CLT.TB_COLLATERAL_CLASSIFICATION is 'دسته بندی وثیقه'
/

comment on column CLT.TB_COLLATERAL_CLASSIFICATION.CODE is 'کد دسته بندی وثیقه'
/

comment on column CLT.TB_COLLATERAL_CLASSIFICATION.TITLE is 'عنوان دسته بندی وثیقه'
/

create table CLT.TB_COLLATERAL_GROUP
(
    CODE NUMBER(2) not null
        constraint PK_COLLATERAL_GROUP
            primary key,
    TITLE VARCHAR(20 char) not null
)
/

comment on table CLT.TB_COLLATERAL_GROUP is 'گروه وثیقه'
/

comment on column CLT.TB_COLLATERAL_GROUP.CODE is 'کد گروه وثیقه'
/

comment on column CLT.TB_COLLATERAL_GROUP.TITLE is 'عنوان گروه وثیقه'
/

create table CLT.TB_COLLATERAL_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_COLLATERAL_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null,
    COLLATERAL_GROUP_CODE NUMBER(2) not null
        constraint FK_COLLATERAL_TYPE_CGC
            references CLT.TB_COLLATERAL_GROUP
)
/

comment on table CLT.TB_COLLATERAL_TYPE is 'نوع وثیقه'
/

comment on column CLT.TB_COLLATERAL_TYPE.CODE is 'کد نوع وثیقه'
/

comment on column CLT.TB_COLLATERAL_TYPE.TITLE is 'عنوان نوع وثیقه'
/

comment on column CLT.TB_COLLATERAL_TYPE.COLLATERAL_GROUP_CODE is 'کد گروه وثیقه'
/

create index CLT.IDXFK_COLLATERAL_TYPE_CGC
    on CLT.TB_COLLATERAL_TYPE (COLLATERAL_GROUP_CODE)
/

create table CLT.TB_COLLATERAL_SUB_TYPE
(
    CODE NUMBER(4) not null
        constraint PK_COLLATERAL_SUB_TYPE
            primary key,
    TITLE VARCHAR(100 char) not null,
    COLLATERAL_TYPE_CODE NUMBER(2) not null
        constraint FK_COLLATERAL_SUB_TYPE_CTC
            references CLT.TB_COLLATERAL_TYPE,
    COLLATERAL_CLASSIFICATION_CODE NUMBER(2) not null
        constraint FK_COLLATERAL_SUB_TYPE_CCC
            references CLT.TB_COLLATERAL_CLASSIFICATION
)
/

comment on table CLT.TB_COLLATERAL_SUB_TYPE is 'زیر نوع وثیقه'
/

comment on column CLT.TB_COLLATERAL_SUB_TYPE.CODE is 'کد زیر نوع وثیقه'
/

comment on column CLT.TB_COLLATERAL_SUB_TYPE.TITLE is 'عنوان زیر نوع وثیقه'
/

comment on column CLT.TB_COLLATERAL_SUB_TYPE.COLLATERAL_TYPE_CODE is 'کد نوع وثیقه'
/

comment on column CLT.TB_COLLATERAL_SUB_TYPE.COLLATERAL_CLASSIFICATION_CODE is 'کد دسته بندی وثیقه'
/

create index CLT.IDXFK_COLLATERAL_SUB_TYPE_CTC
    on CLT.TB_COLLATERAL_SUB_TYPE (COLLATERAL_TYPE_CODE)
/

create index CLT.IDXFK_COLLATERAL_SUB_TYPE_CCC
    on CLT.TB_COLLATERAL_SUB_TYPE (COLLATERAL_CLASSIFICATION_CODE)
/

create table CLT.TB_COLLATERAL_PRODUCT
(
    ID NUMBER(12) not null
        constraint PK_COLLATERAL_PRODUCT
            primary key,
    CODE NUMBER(6) not null
        constraint UC01_COLLATERAL_PRODUCT
            unique,
    TITLE VARCHAR(150 char) not null,
    CENTRAL_BANK_CODE NUMBER(2),
    TJB_CODE NUMBER(2),
    COLLATERAL_SUB_TYPE_CODE NUMBER(4) not null
        constraint FK_COLLATERAL_PRODUCT_CSTC
            references CLT.TB_COLLATERAL_SUB_TYPE,
    CURRENCY_CLASSIFICATION_CODE NUMBER(2) not null
        constraint FK_COLLATERAL_PRODUCT_CCC
            references CLT.TB_CURRENCY_CLASSIFICATION,
    STATUS_CODE NUMBER(1) not null,
    INTERNAL_SAMAT_CODE VARCHAR(2 char)
)
/

comment on table CLT.TB_COLLATERAL_PRODUCT is 'محصول وثیقه'
/

comment on column CLT.TB_COLLATERAL_PRODUCT.ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_COLLATERAL_PRODUCT.CODE is 'کد محصول وثیقه'
/

comment on column CLT.TB_COLLATERAL_PRODUCT.TITLE is 'عنوان محصول وثیقه'
/

comment on column CLT.TB_COLLATERAL_PRODUCT.CENTRAL_BANK_CODE is 'کد بانک مرکزی'
/

comment on column CLT.TB_COLLATERAL_PRODUCT.TJB_CODE is 'کد بانک 2'
/

comment on column CLT.TB_COLLATERAL_PRODUCT.COLLATERAL_SUB_TYPE_CODE is 'کد زیر نوع وثیقه'
/

comment on column CLT.TB_COLLATERAL_PRODUCT.CURRENCY_CLASSIFICATION_CODE is 'کد دسته بندی ارز'
/

comment on column CLT.TB_COLLATERAL_PRODUCT.STATUS_CODE is 'وضعیت محصول وثیقه
1- فعال
2- غیر فعال'
/

comment on column CLT.TB_COLLATERAL_PRODUCT.INTERNAL_SAMAT_CODE is 'کد سمات داخلی'
/

create index CLT.IDXFK_COLLATERAL_PRODUCT_CSTC
    on CLT.TB_COLLATERAL_PRODUCT (COLLATERAL_SUB_TYPE_CODE)
/

create index CLT.IDXFK_COLLATERAL_PRODUCT_CCC
    on CLT.TB_COLLATERAL_PRODUCT (CURRENCY_CLASSIFICATION_CODE)
/

create table CLT.TB_COMMITMENT_TYPE
(
    CODE NUMBER(1) not null
        constraint PK_COMMITMENT_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null
)
/

comment on table CLT.TB_COMMITMENT_TYPE is 'نوع تعهد'
/

comment on column CLT.TB_COMMITMENT_TYPE.CODE is 'کد'
/

comment on column CLT.TB_COMMITMENT_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_COVERAGE_TYPE
(
    CODE NUMBER(1) not null
        constraint PK_COVERAGE_TYPE
            primary key,
    TITLE VARCHAR(20 char) not null
)
/

comment on table CLT.TB_COVERAGE_TYPE is 'انواع پوشش وثیقه'
/

comment on column CLT.TB_COVERAGE_TYPE.CODE is 'کد نوع پوشش'
/

comment on column CLT.TB_COVERAGE_TYPE.TITLE is 'عنوان پوشش وثیقه'
/

create table CLT.TB_OPERATION_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_OPERATION_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null
)
/

comment on table CLT.TB_OPERATION_TYPE is 'انواع عملیات'
/

comment on column CLT.TB_OPERATION_TYPE.CODE is 'کد عملیات'
/

comment on column CLT.TB_OPERATION_TYPE.TITLE is 'عنوان عملیات'
/

create table CLT.TB_ACCOUNT_BLOCKING_TYPE
(
    CODE NUMBER(1) not null
        constraint PK_ACCOUNT_BLOCKING_TYPE
            primary key,
    TITLE VARCHAR(150 char) not null
)
/

comment on table CLT.TB_ACCOUNT_BLOCKING_TYPE is 'نوع مسدودی حساب واریز سود'
/

comment on column CLT.TB_ACCOUNT_BLOCKING_TYPE.CODE is 'کد'
/

comment on column CLT.TB_ACCOUNT_BLOCKING_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_COLLATERAL_STATUS
(
    CODE NUMBER(2) not null
        constraint PK_COLLATERAL_STATUS
            primary key,
    TITLE VARCHAR(30 char) not null,
    PRIORITY NUMBER(2)
)
/

comment on table CLT.TB_COLLATERAL_STATUS is 'وضعیت وثیقه'
/

comment on column CLT.TB_COLLATERAL_STATUS.CODE is 'کد'
/

comment on column CLT.TB_COLLATERAL_STATUS.TITLE is 'عنوان'
/

comment on column CLT.TB_COLLATERAL_STATUS.PRIORITY is 'اولویت'
/

create table CLT.TB_COMMITTED_ROLE
(
    CODE NUMBER(2) not null
        constraint PK_COMMITTED_ROLE
            primary key,
    TITLE VARCHAR(20 char) not null
)
/

comment on table CLT.TB_COMMITTED_ROLE is 'نقش متعهد'
/

comment on column CLT.TB_COMMITTED_ROLE.CODE is 'کد نقش متعهد'
/

comment on column CLT.TB_COMMITTED_ROLE.TITLE is 'عنوان نقش متعهد'
/

create table CLT.TB_INSURABILITY_TYPE
(
    CODE NUMBER(1) not null
        constraint PK_INSURABILITY_TYPE
            primary key,
    TITLE VARCHAR(20 char) not null
)
/

comment on table CLT.TB_INSURABILITY_TYPE is 'انواع بیمه پذیری'
/

comment on column CLT.TB_INSURABILITY_TYPE.CODE is 'کد انواع بیمه پذیری'
/

comment on column CLT.TB_INSURABILITY_TYPE.TITLE is 'عنوان انواع بیمه پذیری'
/

create table CLT.TB_IDENTIFIER_NO_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_IDENTIFIER_NO_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null,
    PARTY_TYPE_CODE NUMBER(1),
    NATIONALITY_TYPE_CODE NUMBER(1)
)
/

comment on table CLT.TB_IDENTIFIER_NO_TYPE is 'انواع شماره شناسایی'
/

comment on column CLT.TB_IDENTIFIER_NO_TYPE.CODE is 'کد'
/

comment on column CLT.TB_IDENTIFIER_NO_TYPE.TITLE is 'عنوان'
/

comment on column CLT.TB_IDENTIFIER_NO_TYPE.PARTY_TYPE_CODE is 'کد نوع شخصیت:
1=حقیقی
2=حقوقی'
/

comment on column CLT.TB_IDENTIFIER_NO_TYPE.NATIONALITY_TYPE_CODE is 'کد نوع تبعه
ایرانی=1
خارجی=2'
/

create table CLT.TB_PROMISSORY_AMOUNT_TYPE
(
    ID NUMBER(12) not null
        constraint PK_PROMISSORY_AMOUNT_TYPE
            primary key,
    CODE NUMBER(2) not null,
    TITLE VARCHAR(20 char) not null,
    AMOUNT NUMBER(21,2),
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null
)
/

comment on table CLT.TB_PROMISSORY_AMOUNT_TYPE is 'انواع مبلغ سفته'
/

comment on column CLT.TB_PROMISSORY_AMOUNT_TYPE.ID is 'شناسه'
/

comment on column CLT.TB_PROMISSORY_AMOUNT_TYPE.CODE is 'کد'
/

comment on column CLT.TB_PROMISSORY_AMOUNT_TYPE.TITLE is 'عنوان'
/

comment on column CLT.TB_PROMISSORY_AMOUNT_TYPE.AMOUNT is 'مبلغ'
/

comment on column CLT.TB_PROMISSORY_AMOUNT_TYPE.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_PROMISSORY_AMOUNT_TYPE.LAST_CHANGE_USER_ID is 'شناسه آخرین کاربر تغییر دهنده'
/

create table CLT.TB_OPERATION_INFO
(
    ID NUMBER(12) not null
        constraint PK_OPERATION_INFO
            primary key,
    OPERATION_TYPE_CODE NUMBER(2) not null
        constraint FK_OPERATION_INFO_OTC
            references CLT.TB_OPERATION_TYPE,
    ENACTMENT_NO VARCHAR(20 char),
    ENACTMENT_USE_TYPE_CODE NUMBER(2),
    REQUESTING_SYSTEM_CODE NUMBER(3) not null,
    ORGAN_ID NUMBER(12) not null,
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null,
    CONTRACT_NO VARCHAR(36 char),
    REFERENCE_NO VARCHAR(36 char),
    TRACKING_NO VARCHAR(36 char)
)
/

comment on table CLT.TB_OPERATION_INFO is 'اطلاعات عملیات'
/

comment on column CLT.TB_OPERATION_INFO.ID is 'شناسه'
/

comment on column CLT.TB_OPERATION_INFO.OPERATION_TYPE_CODE is 'کد نوع عملیات'
/

comment on column CLT.TB_OPERATION_INFO.ENACTMENT_NO is 'شماره مصوبه'
/

comment on column CLT.TB_OPERATION_INFO.ENACTMENT_USE_TYPE_CODE is 'کد نحوه استفاده مصوبه'
/

comment on column CLT.TB_OPERATION_INFO.REQUESTING_SYSTEM_CODE is 'کد سیستم درخواست دهنده'
/

comment on column CLT.TB_OPERATION_INFO.ORGAN_ID is 'شناسه واحد سازمانی عامل'
/

comment on column CLT.TB_OPERATION_INFO.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_OPERATION_INFO.LAST_CHANGE_USER_ID is 'شناسه آخرین کاربر تغییر دهنده'
/

comment on column CLT.TB_OPERATION_INFO.REFERENCE_NO is 'شماره مرجع'
/

comment on column CLT.TB_OPERATION_INFO.TRACKING_NO is 'شماره رهگیری'
/

create index CLT.IDX_OPERATION_INFO_OPERA
    on CLT.TB_OPERATION_INFO (OPERATION_TYPE_CODE)
/

create table CLT.TB_PRODUCT_PROPERTY
(
    ID NUMBER(12) not null
        constraint PK_PRODUCT_PROPERTY
            primary key,
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint FK_PRODUCT_PROPERTY_PPI
            references CLT.TB_COLLATERAL_PRODUCT,
    COVERAGE_RATE NUMBER(5,2) not null,
    RISK_RATE NUMBER(5,2) not null,
    COLLATERALIZE_RATE NUMBER(5,2) not null,
    INSURABILITY NUMBER(1) not null,
    REUSABILITY NUMBER(1) not null,
    EVALUABILITY NUMBER(1) not null,
    CREATE_DATE DATE not null,
    CREATOR_ID NUMBER(12) not null,
    START_DATE DATE not null,
    END_DATE DATE,
    SEND_TO_CENTRAL_BANK NUMBER(1) not null,
    PARTIAL_RELEASE NUMBER(1) not null,
    PRIORITY NUMBER(3) not null
)
/

comment on table CLT.TB_PRODUCT_PROPERTY is 'ویژگی های محصول وثیقه'
/

comment on column CLT.TB_PRODUCT_PROPERTY.ID is 'شناسه ویژگی های محصول وثیقه'
/

comment on column CLT.TB_PRODUCT_PROPERTY.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_PRODUCT_PROPERTY.COVERAGE_RATE is 'ضریب پوشش'
/

comment on column CLT.TB_PRODUCT_PROPERTY.RISK_RATE is 'ضریب ریسک'
/

comment on column CLT.TB_PRODUCT_PROPERTY.COLLATERALIZE_RATE is 'ضریب توثیق'
/

comment on column CLT.TB_PRODUCT_PROPERTY.INSURABILITY is 'بیمه پذیری'
/

comment on column CLT.TB_PRODUCT_PROPERTY.REUSABILITY is 'استفاده مجدد'
/

comment on column CLT.TB_PRODUCT_PROPERTY.EVALUABILITY is 'ارزیابی'
/

comment on column CLT.TB_PRODUCT_PROPERTY.CREATE_DATE is 'زمان ایجاد'
/

comment on column CLT.TB_PRODUCT_PROPERTY.CREATOR_ID is 'شناسه کاربر ایجاد کننده'
/

comment on column CLT.TB_PRODUCT_PROPERTY.START_DATE is 'تاریخ شروع'
/

comment on column CLT.TB_PRODUCT_PROPERTY.END_DATE is 'تاریخ پایان'
/

comment on column CLT.TB_PRODUCT_PROPERTY.SEND_TO_CENTRAL_BANK is 'ارسال به بانک مرکزی'
/

comment on column CLT.TB_PRODUCT_PROPERTY.PARTIAL_RELEASE is 'آزادسازی بخشی'
/

comment on column CLT.TB_PRODUCT_PROPERTY.PRIORITY is 'اولویت نقدشوندگی'
/

create index CLT.IDX_PRODUCT_PROPERTY_COLLA
    on CLT.TB_PRODUCT_PROPERTY (COLLATERAL_PRODUCT_ID)
/

create table CLT.TB_ALLOWED_COVERAGE_TYPE
(
    ID NUMBER(12) not null
        constraint PK_ALLOWED_COVERAGE_TYPE
            primary key,
    PRODUCT_PROPERTY_ID NUMBER(12) not null
        constraint FK_ALLOWED_COVERAGE_TYPE_PPI
            references CLT.TB_PRODUCT_PROPERTY,
    COVERAGE_TYPE_CODE NUMBER(2) not null
        constraint FK_ALLOWED_COVERAGE_TYPE_CTC
            references CLT.TB_COVERAGE_TYPE,
    constraint UC01_ALLOWED_COVERAGE_TYPE
        unique (PRODUCT_PROPERTY_ID, COVERAGE_TYPE_CODE)
)
/

comment on table CLT.TB_ALLOWED_COVERAGE_TYPE is 'انواع پوشش مجاز وثیقه'
/

comment on column CLT.TB_ALLOWED_COVERAGE_TYPE.ID is 'شناسه نوع پوشش مجاز'
/

comment on column CLT.TB_ALLOWED_COVERAGE_TYPE.PRODUCT_PROPERTY_ID is 'شناسه ویژگی محصول'
/

comment on column CLT.TB_ALLOWED_COVERAGE_TYPE.COVERAGE_TYPE_CODE is 'کد نوع پوشش'
/

create table CLT.TB_COLLATERAL
(
    ID NUMBER(12) not null
        constraint PK_COLLATERAL
            primary key,
    COLLATERAL_NO NUMBER(16) not null
        constraint UC01_COLLATERAL
            unique,
    PRODUCT_PROPERTY_ID NUMBER(12) not null
        constraint FK_COLLATERAL_PPI
            references CLT.TB_PRODUCT_PROPERTY,
    REGISTER_ORGAN_ID NUMBER(12) not null,
    OWNER_ORGAN_ID NUMBER(12) not null,
    IS_EVALUABLE NUMBER(1),
    IS_INSURABLE NUMBER(1),
    INSURABILITY_TYPE_CODE NUMBER(2)
        constraint FK_COLLATERAL_ITC
            references CLT.TB_INSURABILITY_TYPE,
    COVERAGE_RATE NUMBER(5,2),
    COLLATERALIZE_RATE NUMBER(5,2),
    HAS_PARTIAL_RELEASE NUMBER(1)
)
/

comment on table CLT.TB_COLLATERAL is 'وثیقه'
/

comment on column CLT.TB_COLLATERAL.ID is 'شناسه'
/

comment on column CLT.TB_COLLATERAL.COLLATERAL_NO is 'شماره وثیقه'
/

comment on column CLT.TB_COLLATERAL.PRODUCT_PROPERTY_ID is 'شناسه ویژگی محصول وثیقه'
/

comment on column CLT.TB_COLLATERAL.REGISTER_ORGAN_ID is 'شناسه واحد سازمانی ثبت کننده'
/

comment on column CLT.TB_COLLATERAL.OWNER_ORGAN_ID is 'شناسه واحد سازمانی مالک وثیقه'
/

comment on column CLT.TB_COLLATERAL.IS_EVALUABLE is 'ارزیابی پذیر
بله = 1
خیر = 2'
/

comment on column CLT.TB_COLLATERAL.IS_INSURABLE is 'بیمه پذیر
بله = 1
خیر = 2'
/

comment on column CLT.TB_COLLATERAL.INSURABILITY_TYPE_CODE is 'کد انواع بیمه پذیری'
/

comment on column CLT.TB_COLLATERAL.COVERAGE_RATE is 'ضریب پوشش'
/

comment on column CLT.TB_COLLATERAL.COLLATERALIZE_RATE is 'ضریب توثیق'
/

comment on column CLT.TB_COLLATERAL.HAS_PARTIAL_RELEASE is 'آزادسازی بخشی دارد؟
1- بلی
2- خیر'
/

create index CLT.IDX_COLLATERAL_PRODU
    on CLT.TB_COLLATERAL (PRODUCT_PROPERTY_ID)
/

create index CLT.IDX_COLLATERAL_INSUR
    on CLT.TB_COLLATERAL (INSURABILITY_TYPE_CODE)
/

create table CLT.TB_CLT_COMMITTED
(
    ID NUMBER(12) not null
        constraint PK_CLT_COMMITTED
            primary key,
    COLLATERAL_ID NUMBER(12)
        constraint FK_CLT_COMMITTED_CI
            references CLT.TB_COLLATERAL,
    COMMITTED_ROLE_CODE NUMBER(2) not null
        constraint FK_CLT_COMMITTED_CRC
            references CLT.TB_COMMITTED_ROLE,
    CUSTOMER_NO VARCHAR(10 char) not null,
    DATE_FROM DATE not null,
    DATE_TO DATE,
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null,
    FULL_NAME VARCHAR(150 char) not null
)
/

comment on table CLT.TB_CLT_COMMITTED is 'متعهدین وثیقه'
/

comment on column CLT.TB_CLT_COMMITTED.ID is 'شناسه'
/

comment on column CLT.TB_CLT_COMMITTED.COLLATERAL_ID is 'شناسه وثیقه'
/

comment on column CLT.TB_CLT_COMMITTED.COMMITTED_ROLE_CODE is 'کد نقش متعهد'
/

comment on column CLT.TB_CLT_COMMITTED.CUSTOMER_NO is 'شماره مشتری'
/

comment on column CLT.TB_CLT_COMMITTED.DATE_FROM is 'تاریخ از'
/

comment on column CLT.TB_CLT_COMMITTED.DATE_TO is 'تاریخ تا'
/

comment on column CLT.TB_CLT_COMMITTED.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_CLT_COMMITTED.LAST_CHANGE_USER_ID is 'شناسه آخرین کاربر تغییر دهنده'
/

comment on column CLT.TB_CLT_COMMITTED.FULL_NAME is 'نام مشتری'
/

create index CLT.IDX_CLT_COMMITTED_COLLA
    on CLT.TB_CLT_COMMITTED (COLLATERAL_ID)
/

create index CLT.IDX_CLT_COMMITTED_COMMI
    on CLT.TB_CLT_COMMITTED (COMMITTED_ROLE_CODE)
/

create table CLT.TB_COLLATERAL_OPERATION
(
    ID NUMBER(12) not null
        constraint PK_COLLATERAL_OPERATION
            primary key,
    OPERATION_INFO_ID NUMBER(12) not null
        constraint FK_COLLATERAL_OPERATION_OII
            references CLT.TB_OPERATION_INFO,
    COLLATERAL_ID NUMBER(12) not null
        constraint FK_COLLATERAL_OPERATION_CI
            references CLT.TB_COLLATERAL,
    COLLATERAL_AMOUNT NUMBER(21,2),
    COLLATERAL_DUE_DATE DATE,
    IS_INPUT_COLLATERAL NUMBER(1),
    ALLOCATED_AMOUNT NUMBER(21,2),
    COVERAGE_TYPE_CODE NUMBER(2) not null
        constraint FK_COLLATERAL_OPERATION_CTC
            references CLT.TB_COVERAGE_TYPE
)
/

comment on table CLT.TB_COLLATERAL_OPERATION is 'عملیات هر وثیقه'
/

comment on column CLT.TB_COLLATERAL_OPERATION.ID is 'شناسه'
/

comment on column CLT.TB_COLLATERAL_OPERATION.OPERATION_INFO_ID is 'شناسه اطلاعات عملیات'
/

comment on column CLT.TB_COLLATERAL_OPERATION.COLLATERAL_ID is 'شناسه وثیقه'
/

comment on column CLT.TB_COLLATERAL_OPERATION.COLLATERAL_AMOUNT is 'مبلغ وثیقه'
/

comment on column CLT.TB_COLLATERAL_OPERATION.COLLATERAL_DUE_DATE is 'تاریخ سررسید'
/

comment on column CLT.TB_COLLATERAL_OPERATION.IS_INPUT_COLLATERAL is 'وثیقه ورودی
1=بلی
2=خیر
(برای تعویض وثایق)'
/

comment on column CLT.TB_COLLATERAL_OPERATION.ALLOCATED_AMOUNT is 'مبلغ تخصیص یافته'
/

comment on column CLT.TB_COLLATERAL_OPERATION.COVERAGE_TYPE_CODE is 'کد نوع پوشش'
/

create index CLT.IDX_COLLATERAL_OPERATIO_COLLA
    on CLT.TB_COLLATERAL_OPERATION (COLLATERAL_ID)
/

create index CLT.IDX_COLLATERAL_OPERATIO_OPERA
    on CLT.TB_COLLATERAL_OPERATION (OPERATION_INFO_ID)
/

create index CLT.IDXFK_COLLATERAL_OPERATION_CTC
    on CLT.TB_COLLATERAL_OPERATION (COVERAGE_TYPE_CODE)
/

create table CLT.TB_COLLATERAL_STATUS_CH
(
    ID NUMBER(12) not null
        constraint PK_COLLATERAL_STATUS_CH
            primary key,
    COLLATERAL_ID NUMBER(12) not null
        constraint FK_COLLATERAL_STATUS_CH_CI
            references CLT.TB_COLLATERAL,
    COLLATERAL_STATUS_CODE NUMBER(2) not null
        constraint FK_COLLATERAL_STATUS_CH_CSC
            references CLT.TB_COLLATERAL_STATUS,
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null,
    OPERATION_INFO_ID NUMBER(12) not null
        constraint FK_COLLATERAL_STATUS_CH_OII
            references CLT.TB_OPERATION_INFO,
    STATUS_CODE NUMBER(1) not null
)
/

comment on table CLT.TB_COLLATERAL_STATUS_CH is 'تغییر وضعیت وثیقه'
/

comment on column CLT.TB_COLLATERAL_STATUS_CH.ID is 'شناسه'
/

comment on column CLT.TB_COLLATERAL_STATUS_CH.COLLATERAL_ID is 'شناسه وثیقه'
/

comment on column CLT.TB_COLLATERAL_STATUS_CH.COLLATERAL_STATUS_CODE is 'کد وضعیت وثیقه'
/

comment on column CLT.TB_COLLATERAL_STATUS_CH.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_COLLATERAL_STATUS_CH.LAST_CHANGE_USER_ID is 'شناسه کاربری آخرین تغییر دهنده'
/

comment on column CLT.TB_COLLATERAL_STATUS_CH.OPERATION_INFO_ID is 'شناسه اطلاعات عملیات'
/

comment on column CLT.TB_COLLATERAL_STATUS_CH.STATUS_CODE is 'کد وضعیت:
1- فعال
2- غیر فعال'
/

create index CLT.IDX_COLLATERAL_STATUS_C_COLLA
    on CLT.TB_COLLATERAL_STATUS_CH (COLLATERAL_ID)
/

create index CLT.IDXFK_COLLATERAL_STATUS_CH_OII
    on CLT.TB_COLLATERAL_STATUS_CH (OPERATION_INFO_ID)
/

create index CLT.IDXFK_COLLATERAL_STATUS_CH_CSC
    on CLT.TB_COLLATERAL_STATUS_CH (COLLATERAL_STATUS_CODE)
/

create table CLT.TB_PROMISSORY_NOTE
(
    ID NUMBER(12) not null
        constraint PK_PROMISSORY_NOTE
            primary key,
    COLLATERAL_ID NUMBER(12) not null
        constraint FK_PROMISSORY_NOTE_CI
            references CLT.TB_COLLATERAL,
    SERIES VARCHAR(10 char),
    FROM_SERIAL NUMBER(16) not null,
    TO_SERIAL NUMBER(16) not null,
    PROMISSORY_AMOUNT_TYPE_ID NUMBER(12) not null
        constraint FK_PROMISSORY_NOTE_PATI
            references CLT.TB_PROMISSORY_AMOUNT_TYPE,
    SHEET_COMMITTED_AMOUNT NUMBER(21,2) not null,
    ISSUE_DATE DATE not null
)
/

comment on table CLT.TB_PROMISSORY_NOTE is 'سفته کاغذی ریالی'
/

comment on column CLT.TB_PROMISSORY_NOTE.ID is 'شناسه'
/

comment on column CLT.TB_PROMISSORY_NOTE.COLLATERAL_ID is 'شناسه وثیقه'
/

comment on column CLT.TB_PROMISSORY_NOTE.SERIES is 'سری'
/

comment on column CLT.TB_PROMISSORY_NOTE.FROM_SERIAL is 'از سریال'
/

comment on column CLT.TB_PROMISSORY_NOTE.TO_SERIAL is 'تا سریال'
/

comment on column CLT.TB_PROMISSORY_NOTE.PROMISSORY_AMOUNT_TYPE_ID is 'شناسه نوع مبلغ سفته'
/

comment on column CLT.TB_PROMISSORY_NOTE.SHEET_COMMITTED_AMOUNT is 'مبلغ تعهد شده هر برگ'
/

comment on column CLT.TB_PROMISSORY_NOTE.ISSUE_DATE is 'تاریخ صدور'
/

create index CLT.IDX_PROMISSORY_NOTE_COLLA
    on CLT.TB_PROMISSORY_NOTE (COLLATERAL_ID)
/

create index CLT.IDX_PROMISSORY_NOTE_PROMI
    on CLT.TB_PROMISSORY_NOTE (PROMISSORY_AMOUNT_TYPE_ID)
/

create table CLT.TB_DEPOSIT
(
    COLLATERAL_ID NUMBER(12) not null
        constraint PK_DEPOSIT
            primary key
        constraint FK_DEPOSIT_CI
            references CLT.TB_COLLATERAL,
    COMMITMENT_TYPE_CODE NUMBER(1) not null
        constraint FK_DEPOSIT_CTC
            references CLT.TB_COMMITMENT_TYPE,
    ISSUER_BANK_ID NUMBER(12) not null,
    ISSUER_BRANCH_ID NUMBER(12) not null,
    ACCOUNT_NO VARCHAR(13 char) not null,
    SERIAL_NO VARCHAR(36 char),
    ISSUE_DATE DATE not null,
    DEPOSIT_AMOUNT NUMBER(21,2) not null,
    INTEREST_RATE NUMBER(5,2) not null,
    EXTENDABLITY NUMBER(1) not null,
    RENEWAL_INTEREST_RATE NUMBER(5,2),
    ACCOUNT_BLOCKING_TYPE_CODE NUMBER(1)
        constraint FK_DEPOSIT_ABTC
            references CLT.TB_ACCOUNT_BLOCKING_TYPE,
    BLOCKING_AMOUNT NUMBER(21,2),
    MONTH_BLOCKING_COUNT NUMBER(4),
    INTEREST_PAYMENT_DATE DATE,
    UNBLOCKING_INSTALLMENTS_COUNT NUMBER(4),
    ISSUER_CURRENCY_UNIT_ID NUMBER(12),
    CURRENCY_ID NUMBER(12),
    EXCHANGE_RATE NUMBER(21,2)
)
/

comment on table CLT.TB_DEPOSIT is 'سپرده'
/

comment on column CLT.TB_DEPOSIT.COLLATERAL_ID is 'شناسه وثیقه'
/

comment on column CLT.TB_DEPOSIT.COMMITMENT_TYPE_CODE is 'کد نوع تعهد'
/

comment on column CLT.TB_DEPOSIT.ISSUER_BANK_ID is 'شناسه بانک صادر کننده'
/

comment on column CLT.TB_DEPOSIT.ISSUER_BRANCH_ID is 'شناسه شعبه صادر کننده'
/

comment on column CLT.TB_DEPOSIT.ACCOUNT_NO is 'شماره حساب(وثیقه)'
/

comment on column CLT.TB_DEPOSIT.SERIAL_NO is 'شماره سریال'
/

comment on column CLT.TB_DEPOSIT.ISSUE_DATE is 'تاریخ صدور'
/

comment on column CLT.TB_DEPOSIT.DEPOSIT_AMOUNT is 'مبلغ سپرده'
/

comment on column CLT.TB_DEPOSIT.INTEREST_RATE is 'نرخ سود سپرده'
/

comment on column CLT.TB_DEPOSIT.EXTENDABLITY is 'قابلیت تمدید پذیری
دارد = 1
ندارد = 2'
/

comment on column CLT.TB_DEPOSIT.RENEWAL_INTEREST_RATE is 'نرخ سود تمدید'
/

comment on column CLT.TB_DEPOSIT.ACCOUNT_BLOCKING_TYPE_CODE is 'کد نوع مسدودی حساب'
/

comment on column CLT.TB_DEPOSIT.BLOCKING_AMOUNT is 'مبلغ مسدودی'
/

comment on column CLT.TB_DEPOSIT.MONTH_BLOCKING_COUNT is 'تعداد ماه مسدودی'
/

comment on column CLT.TB_DEPOSIT.INTEREST_PAYMENT_DATE is 'تاریخ واریز سود'
/

comment on column CLT.TB_DEPOSIT.UNBLOCKING_INSTALLMENTS_COUNT is 'تعداد اقساط جهت رفع مسدودی'
/

comment on column CLT.TB_DEPOSIT.ISSUER_CURRENCY_UNIT_ID is 'شناسه واحد ارزی صادر کننده'
/

comment on column CLT.TB_DEPOSIT.CURRENCY_ID is 'شناسه ارز'
/

comment on column CLT.TB_DEPOSIT.EXCHANGE_RATE is 'نرخ ارز'
/

create index CLT.IDX_DEPOSIT_COMMI
    on CLT.TB_DEPOSIT (COMMITMENT_TYPE_CODE)
/

create index CLT.IDX_DEPOSIT_ACCOU
    on CLT.TB_DEPOSIT (ACCOUNT_BLOCKING_TYPE_CODE)
/

create table CLT.TB_ALLOWED_INSURABILITY_TYPE
(
    ID NUMBER(12) not null
        constraint PK_ALLOWED_INSURABILITY_TYPE
            primary key,
    PRODUCT_PROPERTY_ID NUMBER(12) not null
        constraint FK_ALLOWED_INSURABILITY_TYPE_PPI
            references CLT.TB_PRODUCT_PROPERTY,
    INSURABILITY_TYPE_CODE NUMBER(2) not null
        constraint FK_ALLOWED_INSURABILITY_TYPE_ITC
            references CLT.TB_INSURABILITY_TYPE,
    constraint UC01_TB_ALLOWED_INSURABILITY_TYPE
        unique (PRODUCT_PROPERTY_ID, INSURABILITY_TYPE_CODE)
)
/

comment on table CLT.TB_ALLOWED_INSURABILITY_TYPE is 'انواع بیمه پذیری مجاز محصول وثیقه'
/

comment on column CLT.TB_ALLOWED_INSURABILITY_TYPE.ID is 'شناسه انواع بیمه پذیری مجاز'
/

comment on column CLT.TB_ALLOWED_INSURABILITY_TYPE.PRODUCT_PROPERTY_ID is 'شناسه ویژکی محصول وثیقه'
/

comment on column CLT.TB_ALLOWED_INSURABILITY_TYPE.INSURABILITY_TYPE_CODE is 'کد نوع بیمه پذیری'
/

create index CLT.IDXFK_ALLOWED_INSURABILITY_TYPE_PPI
    on CLT.TB_ALLOWED_INSURABILITY_TYPE (PRODUCT_PROPERTY_ID)
/

create index CLT.IDXFK_ALLOWED_INSURABILITY_TYPE_ITC
    on CLT.TB_ALLOWED_INSURABILITY_TYPE (INSURABILITY_TYPE_CODE)
/

create table CLT.TB_ALLOWED_ROLE
(
    ID NUMBER(12) not null
        constraint PK_ALLOWED_ROLE
            primary key,
    PRODUCT_PROPERTY_ID NUMBER(12) not null
        constraint FK_ALLOWED_ROLE_PPI
            references CLT.TB_PRODUCT_PROPERTY,
    COMMITTED_ROLE_CODE NUMBER(2) not null
        constraint FK_ALLOWED_ROLE_CRC
            references CLT.TB_COMMITTED_ROLE,
    constraint UC01_TB_ALLOWED_ROLE
        unique (PRODUCT_PROPERTY_ID, COMMITTED_ROLE_CODE)
)
/

comment on table CLT.TB_ALLOWED_ROLE is 'نقش های مجاز محصول وثیقه'
/

comment on column CLT.TB_ALLOWED_ROLE.ID is 'شناسه'
/

comment on column CLT.TB_ALLOWED_ROLE.PRODUCT_PROPERTY_ID is 'شناسه ویژگی وثایق'
/

comment on column CLT.TB_ALLOWED_ROLE.COMMITTED_ROLE_CODE is 'کد نقش متعهد'
/

create index CLT.IDXFK_ALLOWED_ROLE_PPI
    on CLT.TB_ALLOWED_ROLE (PRODUCT_PROPERTY_ID)
/

create index CLT.IDXFK_ALLOWED_ROLE_CRC
    on CLT.TB_ALLOWED_ROLE (COMMITTED_ROLE_CODE)
/

create table CLT.TB_INSURANCE_ISSUE_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_INSURANCE_ISSUE_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null
)
/

comment on table CLT.TB_INSURANCE_ISSUE_TYPE is 'انواع موضوع بیمه'
/

comment on column CLT.TB_INSURANCE_ISSUE_TYPE.CODE is 'کد نوع موضوع بیمه'
/

comment on column CLT.TB_INSURANCE_ISSUE_TYPE.TITLE is 'عنوان نوع موضوع بیمه'
/

create table CLT.TB_ASSET_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_ASSET_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null
)
/

comment on table CLT.TB_ASSET_TYPE is 'انواع دارایی'
/

comment on column CLT.TB_ASSET_TYPE.CODE is 'کد نوع دارایی'
/

comment on column CLT.TB_ASSET_TYPE.TITLE is 'عنوان نوع دارایی'
/

create table CLT.TB_INSURANCE_POLICY
(
    ID NUMBER(12) not null
        constraint PK_INSURANCE_POLICY
            primary key,
    INSURANCE_NO VARCHAR(36 char) not null,
    CENTRAL_INSURANCE_UNIQUE_CODE VARCHAR(15 char) not null
        constraint UC01_INSURANCE_POLICY
            unique,
    INSURANCE_COMPANY_ID NUMBER(12) not null
        constraint FK_INSURANCE_POLICY_ICI
            references CLT.TB_INSURANCE_COMPANY,
    AGENCY_NO VARCHAR(20 char),
    START_DATE DATE not null,
    DUE_DATE DATE not null,
    INSURANCE_AMOUNT NUMBER(21,2) not null,
    STATUS_CODE NUMBER(1) not null,
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null
)
/

comment on table CLT.TB_INSURANCE_POLICY is 'بیمه نامه'
/

comment on column CLT.TB_INSURANCE_POLICY.ID is 'شناسه'
/

comment on column CLT.TB_INSURANCE_POLICY.INSURANCE_NO is 'شماره بیمه نامه'
/

comment on column CLT.TB_INSURANCE_POLICY.CENTRAL_INSURANCE_UNIQUE_CODE is 'کد یکتای بیمه مرکزی'
/

comment on column CLT.TB_INSURANCE_POLICY.INSURANCE_COMPANY_ID is 'شناسه شرکت بیمه گر'
/

comment on column CLT.TB_INSURANCE_POLICY.AGENCY_NO is 'شماره نمایندگی'
/

comment on column CLT.TB_INSURANCE_POLICY.START_DATE is 'تاریخ شروع بیمه نامه'
/

comment on column CLT.TB_INSURANCE_POLICY.DUE_DATE is 'تاریخ سر رسید بیمه نامه'
/

comment on column CLT.TB_INSURANCE_POLICY.INSURANCE_AMOUNT is 'مبلغ بیمه نامه'
/

comment on column CLT.TB_INSURANCE_POLICY.STATUS_CODE is 'کد وضعیت
فعال = 1
غیر فعال = 2'
/

comment on column CLT.TB_INSURANCE_POLICY.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_INSURANCE_POLICY.LAST_CHANGE_USER_ID is 'شناسه آخرین کاربر تغییر دهنده'
/

create index CLT.IDXFK_INSURANCE_POLICY_ICI
    on CLT.TB_INSURANCE_POLICY (INSURANCE_COMPANY_ID)
/

create table CLT.TB_INSURANCE_POLICY_ASSET
(
    ID NUMBER(12) not null
        constraint PK_INSURANCE_POLICY_ASSET
            primary key,
    INSURANCE_POLICY_ID NUMBER(12) not null
        constraint FK_INSURANCE_POLICY_ASSET_IPI
            references CLT.TB_INSURANCE_POLICY,
    ASSET_TYPE_CODE NUMBER(2) not null
        constraint FK_INSURANCE_POLICY_ASSET_ATC
            references CLT.TB_ASSET_TYPE,
    ASSET_ID NUMBER(12) not null,
    INSURANCE_ISSUE_TYPE_CODE NUMBER(2) not null
        constraint FK_INSURANCE_POLICY_ASSET_IITC
            references CLT.TB_INSURANCE_ISSUE_TYPE,
    AMOUNT NUMBER(21,2) not null,
    STATUS_CODE NUMBER(1) not null,
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null
)
/

comment on table CLT.TB_INSURANCE_POLICY_ASSET is 'دارایی بیمه نامه'
/

comment on column CLT.TB_INSURANCE_POLICY_ASSET.ID is 'شناسه'
/

comment on column CLT.TB_INSURANCE_POLICY_ASSET.INSURANCE_POLICY_ID is 'شناسه بیمه نامه'
/

comment on column CLT.TB_INSURANCE_POLICY_ASSET.ASSET_TYPE_CODE is 'کد نوع دارایی'
/

comment on column CLT.TB_INSURANCE_POLICY_ASSET.ASSET_ID is 'شناسه دارایی'
/

comment on column CLT.TB_INSURANCE_POLICY_ASSET.INSURANCE_ISSUE_TYPE_CODE is 'کد نوع موضوع بیمه'
/

comment on column CLT.TB_INSURANCE_POLICY_ASSET.AMOUNT is 'مبلغ'
/

comment on column CLT.TB_INSURANCE_POLICY_ASSET.STATUS_CODE is 'کد وضعیت
فعال = 1
غیر فعال = 2'
/

comment on column CLT.TB_INSURANCE_POLICY_ASSET.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_INSURANCE_POLICY_ASSET.LAST_CHANGE_USER_ID is 'شناسه آخرین کاربر تغییر دهنده'
/

create index CLT.IDXFK_INSURANCE_POLICY_ASSET_IITC
    on CLT.TB_INSURANCE_POLICY_ASSET (INSURANCE_ISSUE_TYPE_CODE)
/

create index CLT.IDXFK_INSURANCE_POLICY_ASSET_ATC
    on CLT.TB_INSURANCE_POLICY_ASSET (ASSET_TYPE_CODE)
/

create index CLT.IDXFK_INSURANCE_POLICY_ASSET_IPI
    on CLT.TB_INSURANCE_POLICY_ASSET (INSURANCE_POLICY_ID)
/

create table CLT.TB_BUILDING_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_BUILDING_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null
)
/

comment on table CLT.TB_BUILDING_TYPE is 'نوع ساختمان'
/

comment on column CLT.TB_BUILDING_TYPE.CODE is 'کد'
/

comment on column CLT.TB_BUILDING_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_REAL_ESTATE_SITUATION
(
    CODE NUMBER(1) not null
        constraint PK_REAL_ESTATE_SITUATION
            primary key,
    TITLE VARCHAR(30 char) not null
)
/

comment on table CLT.TB_REAL_ESTATE_SITUATION is 'وضعیت تصرف ملک'
/

comment on column CLT.TB_REAL_ESTATE_SITUATION.CODE is 'کد'
/

comment on column CLT.TB_REAL_ESTATE_SITUATION.TITLE is 'عنوان'
/

create table CLT.TB_REAL_ESTATE_USE_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_NONRESIDENTIAL_USE_TYPE
            primary key,
    TITLE VARCHAR(100 char) not null
)
/

comment on table CLT.TB_REAL_ESTATE_USE_TYPE is 'انواع کاربری ملک'
/

comment on column CLT.TB_REAL_ESTATE_USE_TYPE.CODE is 'کد'
/

comment on column CLT.TB_REAL_ESTATE_USE_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_FARM_TYPE
(
    CODE NUMBER(1) not null
        constraint PK_FARM_TYPE
            primary key,
    TITLE VARCHAR(30 char) not null
)
/

comment on table CLT.TB_FARM_TYPE is 'انواع زراعی'
/

comment on column CLT.TB_FARM_TYPE.CODE is 'کد'
/

comment on column CLT.TB_FARM_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_ENDOWMENT_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_ENDOWMENT_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null
)
/

comment on table CLT.TB_ENDOWMENT_TYPE is 'انواع اوقافی'
/

comment on column CLT.TB_ENDOWMENT_TYPE.CODE is 'کد'
/

comment on column CLT.TB_ENDOWMENT_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_URBAN_DIVISION_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_URBAN_DIVISION_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null
)
/

comment on table CLT.TB_URBAN_DIVISION_TYPE is 'انواع تقسیم بندی شهری'
/

comment on column CLT.TB_URBAN_DIVISION_TYPE.CODE is 'کد'
/

comment on column CLT.TB_URBAN_DIVISION_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_REAL_ESTATE
(
    ID NUMBER(12) not null
        constraint PK_REAL_ESTATE
            primary key,
    REGISTER_PART NUMBER(5) not null,
    REGISTER_PLAQUE VARCHAR(30 char) not null,
    REGISTER_NO VARCHAR(30 char) not null,
    REAL_ESTATE_USE_TYPE_CODE NUMBER(2)
        constraint FK_REAL_ESTATE_REUTC
            references CLT.TB_REAL_ESTATE_USE_TYPE,
    URBAN_DIVISION_TYPE_CODE NUMBER(2) not null
        constraint FK_REAL_ESTATE_UDTC
            references CLT.TB_URBAN_DIVISION_TYPE,
    ENDOWMENT_TYPE_CODE NUMBER(2) not null
        constraint FK_REAL_ESTATE_ETC
            references CLT.TB_ENDOWMENT_TYPE,
    REAL_ESTATE_SITUATION_CODE NUMBER(1) not null
        constraint FK_REAL_ESTATE_RESC
            references CLT.TB_REAL_ESTATE_SITUATION,
    HAS_FACILITIES NUMBER(1) not null,
    HAS_BUILDING NUMBER(1),
    BUILDING_TYPE_CODE NUMBER(2)
        constraint FK_REAL_ESTATE_BTC
            references CLT.TB_BUILDING_TYPE,
    HAS_BUSINESS_RIGHT NUMBER(1),
    HAS_ROOT_RIGHT NUMBER(1),
    NAME VARCHAR(100 char),
    BRAND VARCHAR(100 char),
    EXECUTER_FULL_NAME VARCHAR(150 char),
    FARM_TYPE_CODE NUMBER(1)
        constraint FK_REAL_ESTATE_FTC
            references CLT.TB_FARM_TYPE,
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null,
    EXECUTER_CUSTOMER_NO VARCHAR(10 char)
)
/

comment on table CLT.TB_REAL_ESTATE is 'ملک'
/

comment on column CLT.TB_REAL_ESTATE.ID is 'شناسه'
/

comment on column CLT.TB_REAL_ESTATE.REGISTER_PART is 'بخش ثبتی'
/

comment on column CLT.TB_REAL_ESTATE.REGISTER_PLAQUE is 'پلاک ثبتی'
/

comment on column CLT.TB_REAL_ESTATE.REGISTER_NO is 'شماره ثبت'
/

comment on column CLT.TB_REAL_ESTATE.REAL_ESTATE_USE_TYPE_CODE is 'کد نوع کاربرد ملک'
/

comment on column CLT.TB_REAL_ESTATE.URBAN_DIVISION_TYPE_CODE is 'کد انواع تقسیم بندی شهری'
/

comment on column CLT.TB_REAL_ESTATE.ENDOWMENT_TYPE_CODE is 'کد انواع اوقافی'
/

comment on column CLT.TB_REAL_ESTATE.REAL_ESTATE_SITUATION_CODE is 'کد وضعیت تصرف ملک'
/

comment on column CLT.TB_REAL_ESTATE.HAS_FACILITIES is 'تأسیسات دارد؟
1 = بله
2= خیر'
/

comment on column CLT.TB_REAL_ESTATE.HAS_BUILDING is 'اعیانی دارد؟
1 = بله
2= خیر'
/

comment on column CLT.TB_REAL_ESTATE.BUILDING_TYPE_CODE is 'کد نوع ساختمان'
/

comment on column CLT.TB_REAL_ESTATE.HAS_BUSINESS_RIGHT is 'سرقفلی متعلق به مالک است؟
1 = بله
2= خیر'
/

comment on column CLT.TB_REAL_ESTATE.HAS_ROOT_RIGHT is 'نسق متعلق به مالک است؟
1 = بله
2= خیر'
/

comment on column CLT.TB_REAL_ESTATE.NAME is 'نام'
/

comment on column CLT.TB_REAL_ESTATE.BRAND is 'نام تجاری'
/

comment on column CLT.TB_REAL_ESTATE.EXECUTER_FULL_NAME is 'نام مجری طرح'
/

comment on column CLT.TB_REAL_ESTATE.FARM_TYPE_CODE is 'کد نوع زراعی'
/

comment on column CLT.TB_REAL_ESTATE.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_REAL_ESTATE.LAST_CHANGE_USER_ID is 'شناسه آخرین کاربر تغییر دهنده'
/

create index CLT.IXFK_TB_REAL_ESTATE_FTC
    on CLT.TB_REAL_ESTATE (FARM_TYPE_CODE)
/

create index CLT.IXFK_TB_REAL_ESTATE_RESC
    on CLT.TB_REAL_ESTATE (REAL_ESTATE_SITUATION_CODE)
/

create index CLT.IXFK_TB_REAL_ESTATE_BTC
    on CLT.TB_REAL_ESTATE (BUILDING_TYPE_CODE)
/


create index CLT.IXFK_TB_REAL_ESTATE_UDTC
    on CLT.TB_REAL_ESTATE (URBAN_DIVISION_TYPE_CODE)
/

create index CLT.IXFK_TB_REAL_ESTATE_ETC
    on CLT.TB_REAL_ESTATE (ENDOWMENT_TYPE_CODE)
/

create table CLT.TB_REAL_ESTATE_OWNER
(
    ID NUMBER(12) not null
        constraint PK_REAL_ESTATE_OWNER
            primary key,
    REAL_ESTATE_ID NUMBER(12) not null
        constraint FK_REAL_ESTATE_OWNER_REI
            references CLT.TB_REAL_ESTATE,
    CUSTOMER_NO VARCHAR(10 char) not null,
    FULL_NAME VARCHAR(150 char) not null,
    OWNERSHIP_PERCENT NUMBER(5,2) not null,
    DATE_FROM DATE not null,
    DATE_TO DATE,
    constraint UC01_REAL_ESTATE_OWNER
        unique (REAL_ESTATE_ID, CUSTOMER_NO)
)
/

comment on table CLT.TB_REAL_ESTATE_OWNER is 'مالک ملک'
/

comment on column CLT.TB_REAL_ESTATE_OWNER.ID is 'شناسه'
/

comment on column CLT.TB_REAL_ESTATE_OWNER.REAL_ESTATE_ID is 'شناسه ملک'
/

comment on column CLT.TB_REAL_ESTATE_OWNER.CUSTOMER_NO is 'شماره مشتری مالک'
/

comment on column CLT.TB_REAL_ESTATE_OWNER.FULL_NAME is 'نام مالک'
/

comment on column CLT.TB_REAL_ESTATE_OWNER.OWNERSHIP_PERCENT is 'درصد مالکیت'
/

comment on column CLT.TB_REAL_ESTATE_OWNER.DATE_FROM is 'از تاریخ'
/

comment on column CLT.TB_REAL_ESTATE_OWNER.DATE_TO is 'تا تاریخ'
/

create index CLT.IXFK_REAL_ESTATE_OWNER_REI
    on CLT.TB_REAL_ESTATE_OWNER (REAL_ESTATE_ID)
/

create table CLT.TB_MORTGAGE_DOC
(
    COLLATERAL_ID NUMBER(12) not null
        constraint PK_MORTGAGE_DOC
            primary key
        constraint FK_MORTGAGE_DOC_CI
            references CLT.TB_COLLATERAL,
    DOC_NO VARCHAR(36 char) not null,
    ISSUE_DATE DATE not null,
    NOTARY_PUBLIC_ID NUMBER(12) not null
        constraint FK_MORTGAGE_DOC_NPI
            references CLT.TB_NOTARY_PUBLIC
)
/

comment on table CLT.TB_MORTGAGE_DOC is 'سند رهنی'
/

comment on column CLT.TB_MORTGAGE_DOC.COLLATERAL_ID is 'شناسه وثیقه'
/

comment on column CLT.TB_MORTGAGE_DOC.DOC_NO is 'شماره سند رهنی'
/

comment on column CLT.TB_MORTGAGE_DOC.ISSUE_DATE is 'تاریخ صدور'
/

comment on column CLT.TB_MORTGAGE_DOC.NOTARY_PUBLIC_ID is 'شناسه دفترخانه اسناد رسمی'
/

create index CLT.IDXFK_MORTGAGE_DOC_NPI
    on CLT.TB_MORTGAGE_DOC (NOTARY_PUBLIC_ID)
/

create table CLT.TB_MORTGAGE_DOC_REAL_ESTATE
(
    ID NUMBER(12) not null
        constraint PK_MORTGAGE_DOC_REAL_ESTATE
            primary key,
    MORTGAGE_DOC_ID NUMBER(12) not null
        constraint FK_MORTGAGE_DOC_REAL_ESTATE_MDI
            references CLT.TB_MORTGAGE_DOC,
    REAL_ESTATE_ID NUMBER(12) not null
        constraint FK_MORTGAGE_DOC_REAL_ESTATE_RSI
            references CLT.TB_REAL_ESTATE,
    MORTGAGE_AMOUNT NUMBER(21,2) not null,
    OTHERS_MORTGAGE_AMOUNT NUMBER(21,2) not null,
    constraint UC01_MORTGAGE_DOC_REAL_ESTATE
        unique (MORTGAGE_DOC_ID, REAL_ESTATE_ID)
)
/

comment on table CLT.TB_MORTGAGE_DOC_REAL_ESTATE is 'املاک سند رهنی'
/

comment on column CLT.TB_MORTGAGE_DOC_REAL_ESTATE.ID is 'شناسه'
/

comment on column CLT.TB_MORTGAGE_DOC_REAL_ESTATE.MORTGAGE_DOC_ID is 'شناسه سند ترهین'
/

comment on column CLT.TB_MORTGAGE_DOC_REAL_ESTATE.REAL_ESTATE_ID is 'شناسه ملک'
/

comment on column CLT.TB_MORTGAGE_DOC_REAL_ESTATE.MORTGAGE_AMOUNT is 'مبلغ رهن'
/

comment on column CLT.TB_MORTGAGE_DOC_REAL_ESTATE.OTHERS_MORTGAGE_AMOUNT is 'مبلغ در رهن سایرین'
/

create index CLT.IDXFK_MORTGAGE_DOC_REAL_ESTATE_MDI
    on CLT.TB_MORTGAGE_DOC_REAL_ESTATE (MORTGAGE_DOC_ID)
/

create index CLT.IDXFK_MORTGAGE_DOC_REAL_ESTATE_RSI
    on CLT.TB_MORTGAGE_DOC_REAL_ESTATE (REAL_ESTATE_ID)
/

create table CLT.TB_REAL_ESTATE_LOCATION_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_REAL_ESTATE_LOCATION_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null,
    URBAN_DIVISION_TYPE_CODE NUMBER(2) not null
        constraint FK_REAL_ESTATE_LOCATION_TYPE_UDTC
            references CLT.TB_URBAN_DIVISION_TYPE
)
/

comment on table CLT.TB_REAL_ESTATE_LOCATION_TYPE is 'محل وقوع ملک'
/

comment on column CLT.TB_REAL_ESTATE_LOCATION_TYPE.CODE is 'کد'
/

comment on column CLT.TB_REAL_ESTATE_LOCATION_TYPE.TITLE is 'عنوان'
/

comment on column CLT.TB_REAL_ESTATE_LOCATION_TYPE.URBAN_DIVISION_TYPE_CODE is 'کد نوع تقسیم بندی شهری'
/

create table CLT.TB_REAL_ESTATE_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_TB_REAL_ESTATE_ATTRIB
            primary key
        constraint FK_REAL_ESTATE_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    REAL_ESTATE_USE_TYPE_CODE NUMBER(2) not null
        constraint FK_REAL_ESTATE_ATTRIB_REUTC
            references CLT.TB_REAL_ESTATE_USE_TYPE,
    REAL_ESTATE_LOCATION_TYPE_CODE NUMBER(2)
        constraint FK_REAL_ESTATE_ATTRIB_RELTC
            references CLT.TB_REAL_ESTATE_LOCATION_TYPE,
    URBAN_DIVISION_TYPE_CODE NUMBER(2)
        constraint FK_REAL_ESTATE_ATTRIB_UDTC
            references CLT.TB_URBAN_DIVISION_TYPE
)
/

comment on table CLT.TB_REAL_ESTATE_ATTRIB is 'صفات ملک'
/

comment on column CLT.TB_REAL_ESTATE_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_REAL_ESTATE_ATTRIB.REAL_ESTATE_USE_TYPE_CODE is 'کد نوع کاربری ملک'
/

comment on column CLT.TB_REAL_ESTATE_ATTRIB.REAL_ESTATE_LOCATION_TYPE_CODE is 'کد محل وقوع ملک'
/

comment on column CLT.TB_REAL_ESTATE_ATTRIB.URBAN_DIVISION_TYPE_CODE is 'کد انواع تقسیم بندی شهری'
/

create table CLT.TB_DEPOSIT_ACCOUNT_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_DEPOSIT_ACCOUNT_TYPE
            primary key,
    TITLE VARCHAR(150 char) not null
)
/

comment on table CLT.TB_DEPOSIT_ACCOUNT_TYPE is 'نوع حساب سپرده'
/

comment on column CLT.TB_DEPOSIT_ACCOUNT_TYPE.CODE is 'کد'
/

comment on column CLT.TB_DEPOSIT_ACCOUNT_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_DEPOSIT_ACCOUNT_GROUP
(
    CODE VARCHAR(6 char) not null
        constraint PK_DEPOSIT_ACCOUNT_GROUP
            primary key,
    DEPOSIT_ACCOUNT_TYPE_CODE NUMBER(2) not null
        constraint FK_DEPOSIT_ACCOUNT_GROUP_DATC
            references CLT.TB_DEPOSIT_ACCOUNT_TYPE,
    TITLE VARCHAR(150 char)
)
/

comment on table CLT.TB_DEPOSIT_ACCOUNT_GROUP is 'گروه حساب سپرده'
/

comment on column CLT.TB_DEPOSIT_ACCOUNT_GROUP.CODE is 'کد'
/

comment on column CLT.TB_DEPOSIT_ACCOUNT_GROUP.DEPOSIT_ACCOUNT_TYPE_CODE is 'نوع حساب سپرده'
/

comment on column CLT.TB_DEPOSIT_ACCOUNT_GROUP.TITLE is 'عنوان'
/

create table CLT.TB_EXPERT_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_EXPERT_TYPE
            primary key,
    TITLE VARCHAR(30 char) not null
)
/

comment on table CLT.TB_EXPERT_TYPE is 'نوع کارشناس'
/

comment on column CLT.TB_EXPERT_TYPE.CODE is 'کد نوع کارشناس'
/

comment on column CLT.TB_EXPERT_TYPE.TITLE is 'عنوان نوع کارشناس'
/

create table CLT.TB_EVALUATION
(
    ID NUMBER(12) not null
        constraint PK_EVALUATION
            primary key,
    EVALUATION_SHEET_NO VARCHAR(36 char) not null,
    EXPERT_TYPE_CODE NUMBER(2) not null
        constraint FK_EVALUATION_ETC
            references CLT.TB_EXPERT_TYPE,
    EXPERT_IDENTIFIER_NO VARCHAR(15 char) not null,
    EXPERT_FULL_NAME VARCHAR(150 char) not null,
    EVALUATION_DATE DATE not null,
    STATUS_CODE NUMBER(1) not null,
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null
)
/

comment on table CLT.TB_EVALUATION is 'ارزیابی'
/

comment on column CLT.TB_EVALUATION.ID is 'شناسه'
/

comment on column CLT.TB_EVALUATION.EVALUATION_SHEET_NO is 'شماره برگه ارزیابی'
/

comment on column CLT.TB_EVALUATION.EXPERT_TYPE_CODE is 'کد نوع کارشناس'
/

comment on column CLT.TB_EVALUATION.EXPERT_IDENTIFIER_NO is 'کد/ شناسه ملی کارشناس'
/

comment on column CLT.TB_EVALUATION.EXPERT_FULL_NAME is 'نام کارشناس'
/

comment on column CLT.TB_EVALUATION.EVALUATION_DATE is 'تاریخ ارزیابی'
/

comment on column CLT.TB_EVALUATION.STATUS_CODE is 'کد وضعیت
فعال = 1
غیر فعال = 2'
/

comment on column CLT.TB_EVALUATION.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_EVALUATION.LAST_CHANGE_USER_ID is 'شناسه آخرین کاربر تغییر دهنده'
/

create index CLT.IDXFK_EVALUATION_ETC
    on CLT.TB_EVALUATION (EXPERT_TYPE_CODE)
/

create table CLT.TB_EVALUATION_ASSET
(
    ID NUMBER(12) not null
        constraint PK_EVALUATION_ASSET
            primary key,
    EVALUATION_ID NUMBER(12) not null
        constraint FK_EVALUATION_ASSET_EI
            references CLT.TB_EVALUATION,
    ASSET_TYPE_CODE NUMBER(2) not null
        constraint FK_EVALUATION_ASSET_ATC
            references CLT.TB_ASSET_TYPE,
    ASSET_ID NUMBER(12) not null,
    AMOUNT NUMBER(21,2) not null,
    STATUS_CODE NUMBER(1) not null,
    LAST_CHANGE_DATE DATE not null,
    LAST_CHANGE_USER_ID NUMBER(12) not null
)
/

comment on table CLT.TB_EVALUATION_ASSET is 'دارایی مورد ارزیابی'
/

comment on column CLT.TB_EVALUATION_ASSET.ID is 'شناسه'
/

comment on column CLT.TB_EVALUATION_ASSET.EVALUATION_ID is 'شناسه ارزیابی'
/

comment on column CLT.TB_EVALUATION_ASSET.ASSET_TYPE_CODE is 'کد نوع دارایی'
/

comment on column CLT.TB_EVALUATION_ASSET.ASSET_ID is ' شناسه دارایی'
/

comment on column CLT.TB_EVALUATION_ASSET.AMOUNT is 'مبلغ'
/

comment on column CLT.TB_EVALUATION_ASSET.STATUS_CODE is 'کد وضعیت
فعال = 1
غیر فعال = 2'
/

comment on column CLT.TB_EVALUATION_ASSET.LAST_CHANGE_DATE is 'زمان آخرین تغییر'
/

comment on column CLT.TB_EVALUATION_ASSET.LAST_CHANGE_USER_ID is 'شناسه آخرین کاربر تغییر دهنده'
/

create index CLT.IDXFK_EVALUATION_ASSET_EI
    on CLT.TB_EVALUATION_ASSET (EVALUATION_ID)
/

create index CLT.IDXFK_EVALUATION_ASSET_ATC
    on CLT.TB_EVALUATION_ASSET (ASSET_TYPE_CODE)
/

create table CLT.TB_SETUP
(
    CODE NUMBER(3) not null
        constraint PK_SETITNG
            primary key,
    TITLE VARCHAR(100 char) not null,
    SETUP_VALUE VARCHAR(150 char)
)
/

comment on table CLT.TB_SETUP is 'تنظیمات'
/

comment on column CLT.TB_SETUP.CODE is 'کد'
/

comment on column CLT.TB_SETUP.TITLE is ' عنوان'
/

comment on column CLT.TB_SETUP.SETUP_VALUE is 'مقدار تنظیمات'
/

create table CLT.TB_GUARANTEE
(
    COLLATERAL_ID NUMBER(12) not null
        constraint PK_GUARANTEE
            primary key
        constraint FK_GUARANTEE_CI
            references CLT.TB_COLLATERAL,
    GUARANTEE_NO VARCHAR(36 char) not null,
    SERIES VARCHAR(10 char) not null,
    SERIAL_NO VARCHAR(36 char) not null,
    COUNTRY_ID NUMBER(12) not null,
    ISSUER_BANK_ID NUMBER(12) not null,
    ISSUER_BRANCH_ID NUMBER(12) not null,
    CURRENCY_CODE NUMBER(3),
    EXCHANGE_RATE NUMBER(21,2)
)
/

comment on table CLT.TB_GUARANTEE is 'ضمانت نامه'
/

comment on column CLT.TB_GUARANTEE.COLLATERAL_ID is 'شناسه وثیقه'
/

comment on column CLT.TB_GUARANTEE.GUARANTEE_NO is 'شماره ضمانتنامه'
/

comment on column CLT.TB_GUARANTEE.SERIES is 'سری'
/

comment on column CLT.TB_GUARANTEE.SERIAL_NO is 'شماره سریال'
/

comment on column CLT.TB_GUARANTEE.COUNTRY_ID is 'شناسه کشور'
/

comment on column CLT.TB_GUARANTEE.ISSUER_BANK_ID is 'شناسه بانک صادر کننده'
/

comment on column CLT.TB_GUARANTEE.ISSUER_BRANCH_ID is 'شناسه شعبه صادر کننده'
/

comment on column CLT.TB_GUARANTEE.CURRENCY_CODE is 'کد ارز'
/

comment on column CLT.TB_GUARANTEE.EXCHANGE_RATE is 'نرخ ارز'
/

create table CLT.TB_LAND_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_LAND_TYPE
            primary key,
    TITLE VARCHAR(100 char) not null
)
/

comment on table CLT.TB_LAND_TYPE is 'انواع زمین'
/

comment on column CLT.TB_LAND_TYPE.CODE is 'کد'
/

comment on column CLT.TB_LAND_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_NAMING_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_NAMING_TYPE
            primary key,
    TITLE VARCHAR(10 char) not null
)
/

comment on table CLT.TB_NAMING_TYPE is 'نوع نامگذاری'
/

comment on column CLT.TB_NAMING_TYPE.CODE is 'کد'
/

comment on column CLT.TB_NAMING_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_PARTNERSHIP_PAPERS_PUBLISHER_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_PARTNERSHIP_PAPERS_PUBLISHER_TYPE
            primary key,
    TITLE VARCHAR(60 char) not null
)
/

comment on table CLT.TB_PARTNERSHIP_PAPERS_PUBLISHER_TYPE is 'انواع ناشر اوراق مشارکت'
/

comment on column CLT.TB_PARTNERSHIP_PAPERS_PUBLISHER_TYPE.CODE is 'کد'
/

comment on column CLT.TB_PARTNERSHIP_PAPERS_PUBLISHER_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_PARTNERSHIP_PAPERS_SPONSOR_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_PARTNERSHIP_PAPERS_SPONSOR_TYPE
            primary key,
    TITLE VARCHAR(60 char) not null
)
/

comment on table CLT.TB_PARTNERSHIP_PAPERS_SPONSOR_TYPE is 'انواع تضمین کننده اوراق مشارکت'
/

comment on column CLT.TB_PARTNERSHIP_PAPERS_SPONSOR_TYPE.CODE is 'کد'
/

comment on column CLT.TB_PARTNERSHIP_PAPERS_SPONSOR_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_REMITTANCES_SPONSOR_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_REMITTANCES_SPONSOR_TYPE
            primary key,
    TITLE VARCHAR(60 char) not null
)
/

comment on table CLT.TB_REMITTANCES_SPONSOR_TYPE is 'انواع تضمین کننده صکوک'
/

comment on column CLT.TB_REMITTANCES_SPONSOR_TYPE.CODE is 'کد'
/

comment on column CLT.TB_REMITTANCES_SPONSOR_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_REMITTANCES_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_REMITTANCES_ATTRIB
            primary key
        constraint FK_REMITTANCES_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    REMITTANCES_SPONSOR_TYPE_CODE NUMBER(2) not null
        constraint FK_REMITTANCES_ATTRIB_RSTC
            references CLT.TB_REMITTANCES_SPONSOR_TYPE
)
/

comment on table CLT.TB_REMITTANCES_ATTRIB is 'صفات صکوک'
/

comment on column CLT.TB_REMITTANCES_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_REMITTANCES_ATTRIB.REMITTANCES_SPONSOR_TYPE_CODE is 'کد نوع تضمین کننده'
/

create index CLT.IDXFK_REMITTANCES_ATTRIB_RSTC
    on CLT.TB_REMITTANCES_ATTRIB (REMITTANCES_SPONSOR_TYPE_CODE)
/

create table CLT.TB_CONTRACTORS_PAPERS_SPONSOR_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_CONTRACTORS_PAPERS_SPONSOR_TYPE
            primary key,
    TITLE VARCHAR(60 char) not null
)
/

comment on table CLT.TB_CONTRACTORS_PAPERS_SPONSOR_TYPE is 'انواع تضمین کننده اوراق پیمانکار'
/

comment on column CLT.TB_CONTRACTORS_PAPERS_SPONSOR_TYPE.CODE is 'کد'
/

comment on column CLT.TB_CONTRACTORS_PAPERS_SPONSOR_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_CONTRACTORS_PAPERS_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_CONTRACTORS_PAPERS_ATTRIB
            primary key
        constraint FK_CONTRACTORS_PAPERS_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    CONTRACTORS_PAPERS_SPONSOR_TYPE_CODE NUMBER(2) not null
        constraint FK_CONTRACTORS_PAPERS_ATTRIB_CPSTC
            references CLT.TB_CONTRACTORS_PAPERS_SPONSOR_TYPE
)
/

comment on table CLT.TB_CONTRACTORS_PAPERS_ATTRIB is 'صفات اوراق پیمانکاران'
/

comment on column CLT.TB_CONTRACTORS_PAPERS_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_CONTRACTORS_PAPERS_ATTRIB.CONTRACTORS_PAPERS_SPONSOR_TYPE_CODE is 'کد تضمین کننده اوراق پیمانکار'
/

create index CLT.IDXFK_CONTRACTORS_PAPERS_ATTRIB_CPSTC
    on CLT.TB_CONTRACTORS_PAPERS_ATTRIB (CONTRACTORS_PAPERS_SPONSOR_TYPE_CODE)
/

create table CLT.TB_INVESTMENT_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_INVESTMENT_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null
)
/

comment on table CLT.TB_INVESTMENT_TYPE is 'انواع سرمایه گذاری'
/

comment on column CLT.TB_INVESTMENT_TYPE.CODE is 'کد'
/

comment on column CLT.TB_INVESTMENT_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_DEPOSIT_CERTIFICATE_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_DEPOSIT_CERTIFICATE_TYPE
            primary key,
    TITLE VARCHAR(20 char) not null
)
/

comment on table CLT.TB_DEPOSIT_CERTIFICATE_TYPE is 'انواع گواهی سپرده سرمایه گذاری'
/

comment on column CLT.TB_DEPOSIT_CERTIFICATE_TYPE.CODE is 'کد'
/

comment on column CLT.TB_DEPOSIT_CERTIFICATE_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_DEPOSIT_CERTIFICATE_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_DEPOSIT_CERTIFICATE_ATTRIB
            primary key
        constraint FK_DEPOSIT_CERTIFICATE_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    INVESTMENT_TYPE_CODE NUMBER(2) not null
        constraint FK_DEPOSIT_CERTIFICATE_ATTRIB_ITC
            references CLT.TB_INVESTMENT_TYPE,
    DEPOSIT_CERTIFICATE_TYPE_CODE NUMBER(2) not null
        constraint FK_DEPOSIT_CERTIFICATE_ATTRIB_DCTC
            references CLT.TB_DEPOSIT_CERTIFICATE_TYPE
)
/

comment on table CLT.TB_DEPOSIT_CERTIFICATE_ATTRIB is 'صفات گواهی سپرده سرمایه گذاری'
/

comment on column CLT.TB_DEPOSIT_CERTIFICATE_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_DEPOSIT_CERTIFICATE_ATTRIB.INVESTMENT_TYPE_CODE is 'کد نوع سرمایه گذاری'
/

comment on column CLT.TB_DEPOSIT_CERTIFICATE_ATTRIB.DEPOSIT_CERTIFICATE_TYPE_CODE is 'کد نوع گواهی سپرده سرمایه گذاری'
/

create index CLT.IDXFK_DEPOSIT_CERTIFICATE_ATTRIB_DCTC
    on CLT.TB_DEPOSIT_CERTIFICATE_ATTRIB (DEPOSIT_CERTIFICATE_TYPE_CODE)
/

create index CLT.IDXFK_DEPOSIT_CERTIFICATE_ATTRIB_ITC
    on CLT.TB_DEPOSIT_CERTIFICATE_ATTRIB (INVESTMENT_TYPE_CODE)
/

create table CLT.TB_STOCK_MARKET_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_STOCK_MARKET_TYPE
            primary key,
    TITLE VARCHAR(20 char) not null
)
/

comment on table CLT.TB_STOCK_MARKET_TYPE is 'انواع بازار سهام'
/

comment on column CLT.TB_STOCK_MARKET_TYPE.CODE is 'کد'
/

comment on column CLT.TB_STOCK_MARKET_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_STOCK_MARKET_SUBTYPE
(
    CODE NUMBER(2) not null
        constraint PK_STOCK_MARKET_SUBTYPE
            primary key,
    TITLE VARCHAR(60 char) not null,
    STOCK_MARKET_TYPE_CODE NUMBER(2) not null
        constraint FK_STOCK_MARKET_SUBTYPE_SMTC
            references CLT.TB_STOCK_MARKET_TYPE
)
/

comment on table CLT.TB_STOCK_MARKET_SUBTYPE is 'زیرنوع بازار سهام'
/

comment on column CLT.TB_STOCK_MARKET_SUBTYPE.CODE is 'کد'
/

comment on column CLT.TB_STOCK_MARKET_SUBTYPE.TITLE is 'عنوان'
/

comment on column CLT.TB_STOCK_MARKET_SUBTYPE.STOCK_MARKET_TYPE_CODE is 'کد نوع بازار سهام'
/

create index CLT.IDXFK_STOCK_MARKET_SUBTYPE_SMTC
    on CLT.TB_STOCK_MARKET_SUBTYPE (STOCK_MARKET_TYPE_CODE)
/

create table CLT.TB_STOCK_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_STOCK_ATTRIB
            primary key
        constraint FK_STOCK_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    STOCK_MARKET_SUBTYPE_CODE NUMBER(2) not null
        constraint FK_STOCK_ATTRIB_SMSC
            references CLT.TB_STOCK_MARKET_SUBTYPE
)
/

comment on table CLT.TB_STOCK_ATTRIB is 'صفات سهام'
/

comment on column CLT.TB_STOCK_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_STOCK_ATTRIB.STOCK_MARKET_SUBTYPE_CODE is 'کد زیرنوع بازار سهام'
/

create index CLT.IDXFK_STOCK_ATTRIB_SMSC
    on CLT.TB_STOCK_ATTRIB (STOCK_MARKET_SUBTYPE_CODE)
/

create table CLT.TB_GOVERNMENT_GUARANTEE_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_GOVERNMENT_GUARANTEE_TYPE
            primary key,
    TITLE VARCHAR(10 char) not null
)
/

comment on table CLT.TB_GOVERNMENT_GUARANTEE_TYPE is 'انواع تضمین نامه های دولت'
/

comment on column CLT.TB_GOVERNMENT_GUARANTEE_TYPE.CODE is 'کد'
/

comment on column CLT.TB_GOVERNMENT_GUARANTEE_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_GOVERNMENT_GUARANTEE_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_GOVERNMENT_GUARANTEE_ATTRIB
            primary key
        constraint FK_GOVERNMENT_GUARANTEE_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    GOVERNMENT_GUARANTEE_TYPE_CODE NUMBER(2) not null
        constraint FK_GOVERNMENT_GUARANTEE_ATTRIB_GGTC
            references CLT.TB_GOVERNMENT_GUARANTEE_TYPE
)
/

comment on table CLT.TB_GOVERNMENT_GUARANTEE_ATTRIB is 'صفات تضمن نامه های دولت'
/

comment on column CLT.TB_GOVERNMENT_GUARANTEE_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_GOVERNMENT_GUARANTEE_ATTRIB.GOVERNMENT_GUARANTEE_TYPE_CODE is 'کد نوع تضمین نامه دولت'
/

create index CLT.IDXFK_GOVERNMENT_GUARANTEE_ATTRIB_GGTC
    on CLT.TB_GOVERNMENT_GUARANTEE_ATTRIB (GOVERNMENT_GUARANTEE_TYPE_CODE)
/

create table CLT.TB_INVESTMENT_FUND_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_INVESTMENT_FUND_TYPE
            primary key,
    TITLE VARCHAR(60 char) not null
)
/

comment on table CLT.TB_INVESTMENT_FUND_TYPE is 'انواع صندوق های سرمایه گذاری'
/

comment on column CLT.TB_INVESTMENT_FUND_TYPE.CODE is 'کد'
/

comment on column CLT.TB_INVESTMENT_FUND_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_INVESTMENT_FUND_CERT_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_INVESTMENT_FUND_CERT_ATTRIB
            primary key
        constraint FK_INVESTMENT_FUND_CERT_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    INVESTMENT_FUND_TYPE_CODE NUMBER(2) not null
        constraint FK_INVESTMENT_FUND_CERT_ATTRIB_IFTC
            references CLT.TB_INVESTMENT_FUND_TYPE
)
/

comment on table CLT.TB_INVESTMENT_FUND_CERT_ATTRIB is 'گواهی واحدهای صندوق های سرمایه گذاری'
/

comment on column CLT.TB_INVESTMENT_FUND_CERT_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_INVESTMENT_FUND_CERT_ATTRIB.INVESTMENT_FUND_TYPE_CODE is 'کد نوع صندوق سرمایه گذاری'
/

create index CLT.IDXFK_INVESTMENT_FUND_CERT_ATTRIB_IFTC
    on CLT.TB_INVESTMENT_FUND_CERT_ATTRIB (INVESTMENT_FUND_TYPE_CODE)
/

create table CLT.TB_USUFRUCT_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_USUFRUCT_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null
)
/

comment on table CLT.TB_USUFRUCT_TYPE is 'نوع حق انتفاع'
/

comment on column CLT.TB_USUFRUCT_TYPE.CODE is 'کد'
/

comment on column CLT.TB_USUFRUCT_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_ITEM_PURCHASED_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_ITEM_PURCHASED_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null
)
/

comment on table CLT.TB_ITEM_PURCHASED_TYPE is 'انواع مورد خریداری شده'
/

comment on column CLT.TB_ITEM_PURCHASED_TYPE.CODE is 'کد'
/

comment on column CLT.TB_ITEM_PURCHASED_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_GUARANTEE_PURCHASE_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_TB_GUARANTEE_PURCHASE_ATTRIB
            primary key
        constraint FK_GUARANTEE_PURCHASE_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    ITEM_PURCHASED_TYPE_CODE NUMBER(2) not null
        constraint FK_GUARANTEE_PURCHASE_ATTRIB_IPTC
            references CLT.TB_ITEM_PURCHASED_TYPE,
    USUFRUCT_TYPE_CODE NUMBER(2) not null
        constraint FK_GUARANTEE_PURCHASE_ATTRIB_UTC
            references CLT.TB_USUFRUCT_TYPE
)
/

comment on table CLT.TB_GUARANTEE_PURCHASE_ATTRIB is 'صفات قرارداد خرید تضمین'
/

comment on column CLT.TB_GUARANTEE_PURCHASE_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_GUARANTEE_PURCHASE_ATTRIB.ITEM_PURCHASED_TYPE_CODE is 'کد نوع مورد خریداری شده'
/

comment on column CLT.TB_GUARANTEE_PURCHASE_ATTRIB.USUFRUCT_TYPE_CODE is 'کد نوع حق انتفاع'
/

create index CLT.IDXFK_GUARANTEE_PURCHASE_ATTRIB_IPTC
    on CLT.TB_GUARANTEE_PURCHASE_ATTRIB (ITEM_PURCHASED_TYPE_CODE)
/

create index CLT.IDXFK_GUARANTEE_PURCHASE_ATTRIB_UTC
    on CLT.TB_GUARANTEE_PURCHASE_ATTRIB (USUFRUCT_TYPE_CODE)
/

create table CLT.TB_GUARANTEE_FUND_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_GUARANTEE_FUND_TYPE
            primary key,
    TITLE VARCHAR(60 char) not null
)
/

comment on table CLT.TB_GUARANTEE_FUND_TYPE is 'انواع صندوق های ضمانت'
/

comment on column CLT.TB_GUARANTEE_FUND_TYPE.CODE is 'کد'
/

comment on column CLT.TB_GUARANTEE_FUND_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_GUARANTEE_FUND_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_GUARANTEE_FUND_ATTRIB
            primary key
        constraint FK_GUARANTEE_FUND_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    GUARANTEE_FUND_TYPE_CODE NUMBER(2) not null
        constraint FK_GUARANTEE_FUND_ATTRIB_GFTC
            references CLT.TB_GUARANTEE_FUND_TYPE
)
/

comment on table CLT.TB_GUARANTEE_FUND_ATTRIB is 'صفات صندوق های ضمانت'
/

comment on column CLT.TB_GUARANTEE_FUND_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_GUARANTEE_FUND_ATTRIB.GUARANTEE_FUND_TYPE_CODE is 'کد نوع صندوق ضمانت'
/

create index CLT.IDXFK_GUARANTEE_FUND_ATTRIB_GFTC
    on CLT.TB_GUARANTEE_FUND_ATTRIB (GUARANTEE_FUND_TYPE_CODE)
/

create table CLT.TB_PRECIOUS_METAL_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_PRECIOUS_METAL_TYPE
            primary key,
    TITLE VARCHAR(30 char) not null
)
/

comment on table CLT.TB_PRECIOUS_METAL_TYPE is 'انواع فلزات گرانبها'
/

comment on column CLT.TB_PRECIOUS_METAL_TYPE.CODE is 'کد'
/

comment on column CLT.TB_PRECIOUS_METAL_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_PRECIOUS_METAL_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_PRECIOUS_METAL_ATTRIB
            primary key
        constraint FK_PRECIOUS_METAL_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    PRECIOUS_METAL_TYPE_CODE NUMBER(2) not null
        constraint FK_PRECIOUS_METAL_ATTRIB_PMTC
            references CLT.TB_PRECIOUS_METAL_TYPE
)
/

comment on table CLT.TB_PRECIOUS_METAL_ATTRIB is 'صفات فلزات گرانبها'
/

comment on column CLT.TB_PRECIOUS_METAL_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_PRECIOUS_METAL_ATTRIB.PRECIOUS_METAL_TYPE_CODE is 'کد نوع فلزات گرانبها'
/

create index CLT.IDXFK_PRECIOUS_METAL_ATTRIB_PMTC
    on CLT.TB_PRECIOUS_METAL_ATTRIB (PRECIOUS_METAL_TYPE_CODE)
/

create table CLT.TB_VEHICLE_GROUP
(
    CODE NUMBER(2) not null
        constraint PK_VEHICLE_GROUP
            primary key,
    TITLE VARCHAR(30 char) not null
)
/

comment on table CLT.TB_VEHICLE_GROUP is 'گروه وسایط نقلیه'
/

comment on column CLT.TB_VEHICLE_GROUP.CODE is 'کد'
/

comment on column CLT.TB_VEHICLE_GROUP.TITLE is 'عنوان'
/

create table CLT.TB_VEHICLE_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_VEHICLE_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null,
    VEHICLE_GROUP_CODE NUMBER(2)
        constraint FK_VEHICLE_TYPE_VGC
            references CLT.TB_VEHICLE_GROUP
)
/

comment on table CLT.TB_VEHICLE_TYPE is 'انواع وسایط نقلیه'
/

comment on column CLT.TB_VEHICLE_TYPE.CODE is 'کد'
/

comment on column CLT.TB_VEHICLE_TYPE.TITLE is 'عنوان'
/

comment on column CLT.TB_VEHICLE_TYPE.VEHICLE_GROUP_CODE is 'کد گروه وسایط نقلیه'
/

create index CLT.IDXFK_VEHICLE_TYPE_VGC
    on CLT.TB_VEHICLE_TYPE (VEHICLE_GROUP_CODE)
/

create table CLT.TB_VEHICLE_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_VEHICLE_ATTRIB
            primary key
        constraint FK_VEHICLE_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    VEHICLE_TYPE_CODE NUMBER(2) not null
        constraint FK_VEHICLE_ATTRIB_VTC
            references CLT.TB_VEHICLE_TYPE
)
/

comment on table CLT.TB_VEHICLE_ATTRIB is 'صفات وسایط نقلیه'
/

comment on column CLT.TB_VEHICLE_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_VEHICLE_ATTRIB.VEHICLE_TYPE_CODE is 'کد نوع وسایط نقلیه'
/

create index CLT.IDXFK_VEHICLE_ATTRIB_VTC
    on CLT.TB_VEHICLE_ATTRIB (VEHICLE_TYPE_CODE)
/

create table CLT.TB_MACHINERY_GROUP
(
    CODE NUMBER(2) not null
        constraint PK_MACHINERY_GROUP
            primary key,
    TITLE VARCHAR(60 char) not null
)
/

comment on table CLT.TB_MACHINERY_GROUP is 'گروه ماشین آلات'
/

comment on column CLT.TB_MACHINERY_GROUP.CODE is 'کد'
/

comment on column CLT.TB_MACHINERY_GROUP.TITLE is 'عنوان'
/

create table CLT.TB_MACHINERY_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_MACHINERY_TYPE
            primary key,
    TITLE VARCHAR(100 char) not null,
    MACHINERY_GROUP_CODE NUMBER(2) not null
        constraint FK_MACHINERY_TYPE_MGC
            references CLT.TB_MACHINERY_GROUP
)
/

comment on table CLT.TB_MACHINERY_TYPE is 'انواع ماشین آلات'
/

comment on column CLT.TB_MACHINERY_TYPE.CODE is 'کد'
/

comment on column CLT.TB_MACHINERY_TYPE.TITLE is 'عنوان'
/

comment on column CLT.TB_MACHINERY_TYPE.MACHINERY_GROUP_CODE is 'کد گروه ماشین آلات'
/

create index CLT.IDXFK_MACHINERY_TYPE_MGC
    on CLT.TB_MACHINERY_TYPE (MACHINERY_GROUP_CODE)
/

create table CLT.TB_MACHINERY_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_MACHINERY_ATTRIB
            primary key
        constraint FK_MACHINERY_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    MACHINERY_TYPE_CODE NUMBER(2) not null
        constraint FK_MACHINERY_ATTRIB_MTC
            references CLT.TB_MACHINERY_TYPE
)
/

comment on table CLT.TB_MACHINERY_ATTRIB is 'صفات ماشین آلات'
/

comment on column CLT.TB_MACHINERY_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_MACHINERY_ATTRIB.MACHINERY_TYPE_CODE is 'کد انواع ماشین آلات'
/

create index CLT.IDXFK_MACHINERY_ATTRIB_MTC
    on CLT.TB_MACHINERY_ATTRIB (MACHINERY_TYPE_CODE)
/

create table CLT.TB_BANK_CATEGORY
(
    CODE NUMBER(2) not null
        constraint PK_BANK_CATEGORY
            primary key,
    TITLE VARCHAR(20 char) not null
)
/

comment on table CLT.TB_BANK_CATEGORY is 'دسته بندی بانک'
/

comment on column CLT.TB_BANK_CATEGORY.CODE is 'کد'
/

comment on column CLT.TB_BANK_CATEGORY.TITLE is 'عنوان'
/

create table CLT.TB_ISSUING_BANK_GROUP
(
    CODE NUMBER(2) not null
        constraint PK_ISSUING_BANK_GROUP
            primary key,
    TITLE VARCHAR(20 char) not null,
    BANK_CATEGORY_CODE NUMBER(2) not null
        constraint FK_ISSUING_BANK_GROUP_BCC
            references CLT.TB_BANK_CATEGORY
)
/

comment on table CLT.TB_ISSUING_BANK_GROUP is 'گروه بانک صادر کننده'
/

comment on column CLT.TB_ISSUING_BANK_GROUP.CODE is 'کد'
/

comment on column CLT.TB_ISSUING_BANK_GROUP.TITLE is 'عنوان'
/

comment on column CLT.TB_ISSUING_BANK_GROUP.BANK_CATEGORY_CODE is 'کد دسته بندی بانک'
/

create index CLT.IDXFK_ISSUING_BANK_GROUP_BCC
    on CLT.TB_ISSUING_BANK_GROUP (BANK_CATEGORY_CODE)
/

create table CLT.TB_GUARANTEE_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_GUARANTEE_ATTRIB
            primary key
        constraint FK_GUARANTEE_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    ISSUING_BANK_GROUP_CODE NUMBER(2) not null
        constraint FK_GUARANTEE_ATTRIB_IBGC
            references CLT.TB_ISSUING_BANK_GROUP
)
/

comment on table CLT.TB_GUARANTEE_ATTRIB is 'صفات ضمانت نامه'
/

comment on column CLT.TB_GUARANTEE_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_GUARANTEE_ATTRIB.ISSUING_BANK_GROUP_CODE is 'کد گروه بانک صادر کننده'
/

create index CLT.IDXFK_GUARANTEE_ATTRIB_IBGC
    on CLT.TB_GUARANTEE_ATTRIB (ISSUING_BANK_GROUP_CODE)
/

create table CLT.TB_DEPOSIT_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_DEPOSIT_TYPE
            primary key,
    TITLE VARCHAR(20 char) not null
)
/

comment on table CLT.TB_DEPOSIT_TYPE is 'انواع سپرده'
/

comment on column CLT.TB_DEPOSIT_TYPE.CODE is 'کد'
/

comment on column CLT.TB_DEPOSIT_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_DEPOSIT_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_DEPOSIT_ATTRIB
            primary key
        constraint FK_DEPOSIT_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    DEPOSIT_TYPE_CODE NUMBER(2) not null
        constraint FK_DEPOSIT_ATTRIB_DTC
            references CLT.TB_DEPOSIT_TYPE,
    ISSUING_BANK_GROUP_CODE NUMBER(2) not null
        constraint FK_DEPOSIT_ATTRIB_IBGC
            references CLT.TB_ISSUING_BANK_GROUP
)
/

comment on table CLT.TB_DEPOSIT_ATTRIB is 'صفات سپرده'
/

comment on column CLT.TB_DEPOSIT_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_DEPOSIT_ATTRIB.DEPOSIT_TYPE_CODE is 'کد نوع سپرده'
/

comment on column CLT.TB_DEPOSIT_ATTRIB.ISSUING_BANK_GROUP_CODE is 'کد گروه بانک صادر کننده'
/

create index CLT.IDXFK_DEPOSIT_ATTRIB_DTC
    on CLT.TB_DEPOSIT_ATTRIB (DEPOSIT_TYPE_CODE)
/

create index CLT.IDXFK_DEPOSIT_ATTRIB_IBGC
    on CLT.TB_DEPOSIT_ATTRIB (ISSUING_BANK_GROUP_CODE)
/

create table CLT.TB_WAREHOUSE_GROUP
(
    CODE NUMBER(2) not null
        constraint PK_WAREHOUSE_GROUP
            primary key,
    TITLE VARCHAR(20 char) not null
)
/

comment on table CLT.TB_WAREHOUSE_GROUP is 'گروه انبار'
/

comment on column CLT.TB_WAREHOUSE_GROUP.CODE is 'کد'
/

comment on column CLT.TB_WAREHOUSE_GROUP.TITLE is 'عنوان'
/

create table CLT.TB_WAREHOUSE_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_WAREHOUSE_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null,
    WAREHOUSE_GROUP_CODE NUMBER(2)
        constraint FK_WAREHOUSE_TYPE_WGC
            references CLT.TB_WAREHOUSE_GROUP
)
/

comment on table CLT.TB_WAREHOUSE_TYPE is 'انواع انبار'
/

comment on column CLT.TB_WAREHOUSE_TYPE.CODE is 'کد'
/

comment on column CLT.TB_WAREHOUSE_TYPE.TITLE is 'عنوان'
/

comment on column CLT.TB_WAREHOUSE_TYPE.WAREHOUSE_GROUP_CODE is 'کد گروه انبار'
/

create index CLT.IDXFK_WAREHOUSE_TYPE_WGC
    on CLT.TB_WAREHOUSE_TYPE (WAREHOUSE_GROUP_CODE)
/

create table CLT.TB_INVENTORY_GROUP
(
    CODE NUMBER(2) not null
        constraint PK_INVENTORY_GROUP
            primary key,
    TITLE VARCHAR(20 char) not null
)
/

comment on table CLT.TB_INVENTORY_GROUP is 'گروه موجودی'
/

comment on column CLT.TB_INVENTORY_GROUP.CODE is 'کد'
/

comment on column CLT.TB_INVENTORY_GROUP.TITLE is 'عنوان'
/

create table CLT.TB_INVENTORY_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_INVENTORY_TYPE
            primary key,
    TITLE VARCHAR(50 char) not null,
    INVENTORY_GROUP_CODE NUMBER(2) not null
        constraint FK_INVENTORY_TYPE_CGC
            references CLT.TB_INVENTORY_GROUP
)
/

comment on table CLT.TB_INVENTORY_TYPE is 'انواع موجودی'
/

comment on column CLT.TB_INVENTORY_TYPE.CODE is 'کد'
/

comment on column CLT.TB_INVENTORY_TYPE.TITLE is 'عنوان'
/

comment on column CLT.TB_INVENTORY_TYPE.INVENTORY_GROUP_CODE is 'کد گروه موجودی'
/

create index CLT.IDXFK_INVENTORY_TYPE_IGC
    on CLT.TB_INVENTORY_TYPE (INVENTORY_GROUP_CODE)
/

create table CLT.TB_WAREHOUSE_STOCK_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_WAREHOUSE_STOCK_ATTRIB
            primary key
        constraint FK_WAREHOUSE_STOCK_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    INVENTORY_TYPE_CODE NUMBER(2) not null
        constraint FK_WAREHOUSE_STOCK_ATTRIB_ITC
            references CLT.TB_INVENTORY_TYPE,
    WAREHOUSE_TYPE_CODE NUMBER(2) not null
        constraint FK_WAREHOUSE_STOCK_ATTRIB_WTC
            references CLT.TB_WAREHOUSE_TYPE
)
/

comment on table CLT.TB_WAREHOUSE_STOCK_ATTRIB is 'صفات موجودی کالا و قبوض انبار'
/

comment on column CLT.TB_WAREHOUSE_STOCK_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_WAREHOUSE_STOCK_ATTRIB.INVENTORY_TYPE_CODE is 'کد انواع موجودی'
/

comment on column CLT.TB_WAREHOUSE_STOCK_ATTRIB.WAREHOUSE_TYPE_CODE is 'کد انواع انبار'
/

create index CLT.IDXFK_WAREHOUSE_STOCK_ATTRIB_WTC
    on CLT.TB_WAREHOUSE_STOCK_ATTRIB (WAREHOUSE_TYPE_CODE)
/

create index CLT.IDXFK_WAREHOUSE_STOCK_ATTRIB_ITC
    on CLT.TB_WAREHOUSE_STOCK_ATTRIB (INVENTORY_TYPE_CODE)
/

create table CLT.TB_LAND_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_LAND_ATTRIB
            primary key
        constraint FK_LAND_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    LAND_TYPE_CODE NUMBER(2) not null
        constraint FK_LAND_ATTRIB_LTC
            references CLT.TB_LAND_TYPE
)
/

comment on table CLT.TB_LAND_ATTRIB is 'صفات زمین'
/

comment on column CLT.TB_LAND_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_LAND_ATTRIB.LAND_TYPE_CODE is 'کد انواع زمین'
/

create index CLT.IDXFK_LAND_ATTRIB_LTC
    on CLT.TB_LAND_ATTRIB (LAND_TYPE_CODE)
/

create table CLT.TB_PARTNERSHIP_PAPERS_SALES_AGENT_TYPE
(
    CODE NUMBER(2) not null
        constraint PK_PARTNERSHIP_PAPERS_SALES_AGENT_TYPE
            primary key,
    TITLE VARCHAR(60 char) not null
)
/

comment on table CLT.TB_PARTNERSHIP_PAPERS_SALES_AGENT_TYPE is 'انواع عاملیت فروش اوراق مشارکت'
/

comment on column CLT.TB_PARTNERSHIP_PAPERS_SALES_AGENT_TYPE.CODE is 'کد'
/

comment on column CLT.TB_PARTNERSHIP_PAPERS_SALES_AGENT_TYPE.TITLE is 'عنوان'
/

create table CLT.TB_PARTNERSHIP_PAPERS_ATTRIB
(
    COLLATERAL_PRODUCT_ID NUMBER(12) not null
        constraint PK_PARTNERSHIP_PAPERS_ATTRIB
            primary key
        constraint FK_PARTNERSHIP_PAPERS_ATTRIB_CPI
            references CLT.TB_COLLATERAL_PRODUCT,
    NAMING_TYPE_CODE NUMBER(2) not null
        constraint FK_PARTNERSHIP_PAPERS_ATTRIB_NTC
            references CLT.TB_NAMING_TYPE,
    PARTNERSHIP_PAPERS_SPONSOR_TYPE_CODE NUMBER(2) not null
        constraint FK_PARTNERSHIP_PAPERS_ATTRIB_PPSTC
            references CLT.TB_PARTNERSHIP_PAPERS_SPONSOR_TYPE,
    PARTNERSHIP_PAPERS_PUBLISHER_TYPE_CODE NUMBER(2) not null
        constraint FK_PARTNERSHIP_PAPERS_ATTRIB_PPPTC
            references CLT.TB_PARTNERSHIP_PAPERS_PUBLISHER_TYPE,
    PARTNERSHIP_PAPERS_SALES_AGENT_TYPE_CODE NUMBER(2) not null
        constraint FK_PARTNERSHIP_PAPERS_ATTRIB_PPSATC
            references CLT.TB_PARTNERSHIP_PAPERS_SALES_AGENT_TYPE
)
/

comment on table CLT.TB_PARTNERSHIP_PAPERS_ATTRIB is 'صفات اوراق مشارکت'
/

comment on column CLT.TB_PARTNERSHIP_PAPERS_ATTRIB.COLLATERAL_PRODUCT_ID is 'شناسه محصول وثیقه'
/

comment on column CLT.TB_PARTNERSHIP_PAPERS_ATTRIB.NAMING_TYPE_CODE is 'کد نوع نامگذاری'
/

comment on column CLT.TB_PARTNERSHIP_PAPERS_ATTRIB.PARTNERSHIP_PAPERS_SPONSOR_TYPE_CODE is 'کد نوع تضمین کننده'
/

comment on column CLT.TB_PARTNERSHIP_PAPERS_ATTRIB.PARTNERSHIP_PAPERS_PUBLISHER_TYPE_CODE is 'کد نوع ناشر'
/

comment on column CLT.TB_PARTNERSHIP_PAPERS_ATTRIB.PARTNERSHIP_PAPERS_SALES_AGENT_TYPE_CODE is 'کد نوع عاملیت فروش'
/

create index CLT.IDXFK_PARTNERSHIP_PAPERS_ATTRIB_NTC
    on CLT.TB_PARTNERSHIP_PAPERS_ATTRIB (NAMING_TYPE_CODE)
/

create index CLT.IDXFK_PARTNERSHIP_PAPERS_ATTRIB_PPSTC
    on CLT.TB_PARTNERSHIP_PAPERS_ATTRIB (PARTNERSHIP_PAPERS_SPONSOR_TYPE_CODE)
/

create index CLT.IDXFK_PARTNERSHIP_PAPERS_ATTRIB_PPSATC
    on CLT.TB_PARTNERSHIP_PAPERS_ATTRIB (PARTNERSHIP_PAPERS_SALES_AGENT_TYPE_CODE)
/

create index CLT.IDXFK_PARTNERSHIP_PAPERS_ATTRIB_PPPTC
    on CLT.TB_PARTNERSHIP_PAPERS_ATTRIB (PARTNERSHIP_PAPERS_PUBLISHER_TYPE_CODE)
/

---------------------------------------------------------------------------------------------------------
create sequence CLT.SEQ_TB_INSURANCE_COMPANY
    start with 41
/

create sequence CLT.SEQ_TB_USER_CONTROL_TYPE
    start with 101
/

create sequence CLT.SEQ_TB_MINISTRY
    start with 141
/

create sequence CLT.SEQ_TB_DOCUMENT_TYPE
    start with 201
/

create sequence CLT.SEQ_TB_NOTARY_PUBLIC
    start with 261
/

create sequence CLT.SEQ_TB_COLLATERAL_PRODUCT
    start with 201
    minvalue 0
/

create sequence CLT.SEQ_TB_PROMISSORY_AMOUNT_TYPE
    start with 41
/

create sequence CLT.SEQ_TB_OPERATION_INFO
    start with 661
    minvalue 0
/

create sequence CLT.SEQ_TB_PRODUCT_PROPERTY
    start with 201
    minvalue 0
/

create sequence CLT.SEQ_TB_ALLOWED_COVERAGE_TYPE
    start with 281
    minvalue 0
/

create sequence CLT.SEQ_TB_COLLATERAL
    start with 521
    minvalue 0
/

create sequence CLT.SEQ_TB_CLT_COMMITTED
    start with 481
    minvalue 0
/

create sequence CLT.SEQ_TB_COLLATERAL_OPERATION
    start with 661
    minvalue 0
/

create sequence CLT.SEQ_TB_COLLATERAL_STATUS_CH
    start with 601
    minvalue 0
/

create sequence CLT.SEQ_TB_PROMISSORY_NOTE
    start with 181
    minvalue 0
/

create sequence CLT.SEQ_TB_ALLOWED_INSURABILITY_TYPE
    start with 141
    minvalue 0
/

create sequence CLT.SEQ_TB_ALLOWED_ROLE
    start with 201
    minvalue 0
/

create sequence CLT.SEQ_TB_INSURANCE_POLICY
    start with 161
/

create sequence CLT.SEQ_TB_INSURANCE_POLICY_ASSET
    start with 261
/

create sequence CLT.SEQ_TB_REAL_ESTATE
    start with 281
/

create sequence CLT.SEQ_TB_REAL_ESTATE_OWNER
    start with 81
/

create sequence CLT.SEQ_TB_MORTGAGE_DOC_REAL_ESTATE
    start with 81
    minvalue 0
/

create sequence CLT.SEQ_TB_EVALUATION
    start with 81
/

create sequence CLT.SEQ_TB_EVALUATION_ASSET
    start with 81
/




