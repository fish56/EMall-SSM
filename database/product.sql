use e_mall_ssm;

DROP TABLE IF EXISTS product;
CREATE TABLE product (
    id int unsigned auto_increment COMMENT '商品id',

    shop_id int unsigned not null comment '发布商品的店家id',
    category_id int unsigned NOT NULL COMMENT '分类id,对应product_category表的主键',
    name varchar(100) NOT NULL COMMENT '商品名称',
    subtitle varchar(200) COMMENT '商品副标题',
    image_url varchar(500) COMMENT '产品主图,url相对地址',
    detail text COMMENT '商品详情',

    -- 可以自接以分为单位吗，之前太蠢了
    price decimal(20,2) unsigned default 0 NOT NULL COMMENT '价格,单位-元保留两位小数',
    stock int unsigned COMMENT '库存数量',
    status tinyint unsigned DEFAULT 1 COMMENT '商品状态.1-在售 2-下架 3-删除',

    create_time datetime not null default current_timestamp() comment '创建时间',
    update_time datetime not null default current_timestamp() comment '最后一次更新时间'
      on update current_timestamp(),
    PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

alter table product change price price int unsigned default 0
     not null comment '价格，单位为分';

insert into product(shop_id, price, category_id, name, detail, stock)
values (3, 22, 10002, '方便面', null, 33);

select * from product order by price asc ;

select *
from product
where true
and price >= 0
and price < 100
-- and update_time > '1999-10-10'
and update_time < '2222-1-1'
-- and shop_id = 3
order by price desc
limit 30
offset 3
;

select id, shop_id, price, category_id, name, detail, stock
from product
where true
  and id = 30
;

select count(id)
from product_remark
where product_id = 30
;

update product
set
price = 3000
where id < 37;

update product
set
image_url = 'static/img/nav/1.jpg'
where id = 32
;

update product
set
    image_url = 'static/img/nav/2.jpg'
where id = 35
;

update product
set
    image_url = 'static/img/nav/3.jpg'
where id = 37
;

update product
set
detail = '完美的方便面，保证你吃了一口还想吃！买不了吃亏，买不了上当！！'
where id = 30
;