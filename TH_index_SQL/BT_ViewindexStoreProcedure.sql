create database demo;
use demo;
create table products(
    id int,
    product_Code int,
    product_name nvarchar(50),
    product_price double,
    product_Amount int,
    product_description nvarchar(255),
    product_status boolean
);
insert into products value (
    1,1,'java',20000.00,100,'oop',true
    );
insert into products value (2,2,'php',30000.00,50,'css',true);
insert into products value (3,3,'javascript',45000.00,150,'toan tu',true);
insert into products value (4,4,'C#',35000.00,250,'Abstracs',true);

/*
 Tạo Unique Index trên bảng Products
 (sử dụng cột productCode để tạo chỉ mục)
 */
 alter table products add index idx_name(product_Code);
explain select *
from products
where product_Code =5;

/*
 Tạo Composite Index trên bảng Products
 (sử dụng 2 cột productName và productPrice)
 */
alter table products add  index  composite(product_name,product_price);
explain select *
from products
where product_name;

/*
 Tạo view lấy về các thông tin:
 productCode, productName,
 productPrice,productStatus
 từ bảng products.
 */

create view view_name as
select product_Code,product_name,product_price,product_status
from products;

select *
from view_name;

/*
 Tiến hành  them 1 dong
 */
 insert into view_name values
(11,'java_core',50000.00,true);
/*
 Xoa 1 ban ghi co name = java
 */
 delete from view_name
where product_name = 'java';

/*
 Capj nhat 1 ban ghi co name  = java_core
 */
 update view_name
set product_Code =1
where product_name ='java_core';

/*
 Xoa 1 view
 */
drop view view_name;

/*
 Tạo store procedure
 lấy tất cả thông tin
 của tất cả các sản phẩm trong
 bảng product
 */
 select *
from products;
delimiter //
create procedure procedure_name()
begin
    select *
    from products;
end //
delimiter ;
call procedure_name();

/*
 Tạo store procedure
 thêm một sản phẩm mới
 */
delimiter //
create procedure procedure_name_new(
in id int,
 in product_code int,
in product_name nvarchar(50),
in product_price double,
in product_Amount int,
in product_description nvarchar(50),
in product_status boolean)
begin
    insert into products values (id,product_Code,product_name,product_price,product_Amount,product_description,product_status);
end //
delimiter ;
call procedure_name_new(5,5,'java_1',46000.00,300,'abc',true);
call procedure_name_new(5,5,'java_3',46000.00,300,'abc',false);
call procedure_name_new(5,5,'java_2',56000.00,300,'abc',false);
select *
from products;


/*
 Tạo store procedure sửa thông tin sản phẩm theo id
 */

delimiter //
create procedure edit_product(
    in in_id int,
    in in_product_code int,
    in in_product_name nvarchar(50),
    in in_product_price double,
    in in_product_Amount int,
    in in_product_description nvarchar(50),
    in in_product_status boolean)
begin
    update products
        set
            product_Code=in_product_code,
            product_name=in_product_name,
            product_price=in_product_price,
            product_Amount = in_product_Amount,
            product_description = in_product_description,
            product_status = in_product_status
    where id=in_id;

end //
delimiter ;
call edit_product(5,10,'java_10',5000000.00,100,'xyz',true);
select *
from products;

# Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_products(
    in in_id int)
begin
    delete from products
        where id=in_id;
end //
call delete_products(5);
select *
from products;
