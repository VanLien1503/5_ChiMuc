use classicmodels;

select *
from customers
where customerNumber=175;

explain select *
from customers
where customerNumber=175;
/*
 thêm chỉ mục cho bảng
 customers như sau:
 */
 alter table customers
 add index  idx_customerNumber(customerNumber);
explain select *
from customers
where customerNumber=175;

/*
 Add index theo cặp
 contactFirstName và contactLastName.
 */

 alter table customers add INDEX idx_full_name(contactFirstName,contactLastName);
explain select *
from customers
where contactFirstName='jean' or contactFirstName = 'king';

/*
 xóa chỉ mục:
 */

 alter table customers drop index idx_full_name;

