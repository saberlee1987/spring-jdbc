create table cities
(
    id          int(12)     not null primary key auto_increment,
    name        varchar(200) not null,
    status_code int(1)      not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp null default null,
    deleted_at  timestamp null default null
);

create table users
(
    id          int(12)     not null primary key auto_increment,
    name        varchar(200) not null,
    username    varchar(200) not null unique ,
    password    varchar(200)  not null,
    city_id     int(12)     not null ,
    status_code int(1)      not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp null default null,
    deleted_at  timestamp null default null,
    constraint user_city_id foreign key (city_id)
        references cities (id)
);
create table groups
(
    id          int(12)     not null primary key auto_increment,
    name        varchar(200) not null,
    status_code int(1)      not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp null default null,
    deleted_at  timestamp null default null
);

create table permissions
(
    id          int(12)     not null primary key auto_increment,
    name        varchar(200) not null,
    status_code int(1)      not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp null default null,
    deleted_at  timestamp null default null
);
create table group_user
(
    id         int(12) not null primary key auto_increment,
    user_id    int(12) not null ,
    group_id   int(12) not null ,
    created_at timestamp default current_timestamp,
    constraint group_user_user_fk foreign key (user_id)
        references users (id),
    constraint group_user_group_fk foreign key (group_id)
        references groups (id)
);

create table group_permission
(
    id            int(12) not null primary key auto_increment,
    permission_id int(12) not null ,
    group_id      int(12) not null ,
    created_at    timestamp default current_timestamp,
    constraint group_permission_permission_fk foreign key (permission_id)
        references permissions (id),
    constraint group_permission_group_fk foreign key (group_id)
        references groups (id)
);

create table orders
(
    id          int(12) not null primary key auto_increment,
    user_id     int        not null ,
    status_code int(1)  not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp null default null,
    deleted_at  timestamp null default null,
    constraint order_user_user_fk foreign key (user_id)
        references users (id)
);

create table products
(
    id          int(12)     not null primary key auto_increment,
    name        varchar(200) not null,
    status_code int(1)      not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp null default null,
    deleted_at  timestamp null default null
);

create table order_detail
(
    id         int(12) not null  primary key  auto_increment,
    order_id   int(12) not null ,
    product_id int(12) not null ,
    created_at timestamp default current_timestamp,
    updated_at timestamp null default null,
    deleted_at timestamp null default null,
    constraint order_detail_order_fk foreign key (order_id)
        references orders (id),
    constraint order_detail_product_fk foreign key (product_id)
        references products (id)
);
