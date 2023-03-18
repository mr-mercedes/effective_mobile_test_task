--USERS
DROP SEQUENCE IF EXISTS user_seq;
create sequence user_seq start with 1 increment by 1;

DROP TABLE IF EXISTS CASCADE;
create table users
(
    id        bigint  not null,
    archive   boolean not null,
    email     varchar(255),
    name      varchar(255),
    password  varchar(255),
    role      varchar(255),
    bucket_id bigint,
    primary key (id)
);
--BUCKETS
DROP SEQUENCE IF EXISTS bucket_seq;
create sequence buckets_seq start with 1 increment by 1;

DROP TABLE IF EXISTS bucets CASCADE;
create table buckets
(
    id      bigint not null,
    user_id bigint,
    primary key (id)
);
--LINK BETWEEN BUCKETS AND USERS
alter table IF EXISTS buckets add constraint buckets_fk_users foreign key (user_id) references users;

alter table IF EXISTS users add constraint users_fk_buckets foreign key (bucket_id) references buckets;

--CATEGORY
DROP SEQUENCE IF EXISTS category_seq;
create sequence category_seq start with 1 increment by 1;

DROP TABLE IF EXISTS catecories CASCADE;
create table categories
(
    id    bigint not null,
    title varchar(255),
    primary key (id)
);
--PRODUCT
DROP SEQUENCE IF EXISTS product_seq;
create sequence product_seq start with 1 increment by 1;

DROP TABLE IF EXISTS products CASCADE;
create table products
(
    id    bigint not null,
    price numeric(38, 2),
    title varchar(255),
    primary key (id)
);

--CATEGORY AND PRODUCTS
DROP TABLE IF EXISTS products_categories CASCADE;
create table products_categories
(
    product_id  bigint not null,
    category_id bigint not null
);

alter table IF EXISTS products_categories add constraint products_catecories_fk_category foreign key (category_id) references categories;

alter table IF EXISTS products_categories add constraint products_catecories_fk_products foreign key (product_id) references products;

--PRODUCTS IN BUCKET
DROP TABLE IF EXISTS buckets_products CASCADE;
create table buckets_products
(
    bucket_id  bigint not null,
    product_id bigint not null
);
alter table IF EXISTS buckets_products add constraint buckets_products_fk_products foreign key (product_id) references products;

alter table IF EXISTS buckets_products add constraint buckets_products_fk_buckets foreign key (bucket_id) references buckets;

--ORDERS
DROP SEQUENCE IF EXISTS order_seq;
create sequence order_seq start with 1 increment by 1;

DROP TABLE IF EXISTS orders CASCADE;
create table orders
(
    id      bigint not null,
    address varchar(255),
    created timestamp(6),
    status  varchar(255),
    sum     numeric(38, 2),
    updated timestamp(6),
    user_id bigint,
    primary key (id)
);

alter table IF EXISTS orders add constraint orders_fk_users foreign key (user_id) references users;

--ORDER DETAILS
DROP SEQUENCE IF EXISTS order_detales_seq;
create sequence order_details_seq start with 1 increment by 1;

DROP TABLE IF EXISTS order_detales CASCADE;
create table orders_details
(
    id         bigint not null,
    amount     numeric(38, 2),
    price      numeric(38, 2),
    order_id   bigint,
    product_id bigint,
    details_id bigint not null,
    primary key (id)
);

alter table IF EXISTS orders_details add constraint orders_details_details_id unique (details_id);

alter table IF EXISTS orders_details add constraint orders_details_fk_orders foreign key (order_id) references orders;

alter table IF EXISTS orders_details add constraint orders_details_fk_products foreign key (product_id) references products;

alter table IF EXISTS orders_details add constraint orders_details_fk_details_id foreign key (details_id) references orders_details;


