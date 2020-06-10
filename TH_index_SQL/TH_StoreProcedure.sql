use classicmodels;
/*
 Stored Procedure được định nghĩa
 như một tập các khai báo sql
 được lưu trữ ngay trong cơ sở dữ liệu (database)
 và sau đó, được triệu gọi bởi một program, một trigger
 hay thậm chí là một stored procedure khác.
 */

 /*
  - Stored procedure làm tăng khả năng thực thi của ứng dụng.
  -
  DELIMITER //

CREATE PROCEDURE findAllCustomers()

BEGIN

  SELECT * FROM customers;

END //

DELIMITER ;
  */


/*
Chuyền Tham Số Loại IN
*/
delimiter //
create procedure getCusById
    (in cusNum int (11))
    begin
    select *
    from customers
    where customerNumber = cusNum;
    end //
delimiter ;
/*
 Gọi store procedure
 */
 call getCusById(175);
/*
 Tham Số Loại OUT
 */
 delimiter //
 create procedure GetCustomersCountByCity(
 in in_city varchar(50),
 out total int
 )
 begin
     select COUNT(customerNumber)
         into total
     from customers
         where city = in_city;
 end //
 delimiter ;
 call GetCustomersCountByCity('lyon',@total);
select @total;

/*
 loại in/out
 */
 delimiter //
CREATE PROCEDURE SetCounter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;


SET @counter = 1;

CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; -- 8