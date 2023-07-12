-- DELIMITER

-- NHAT
DELIMITER //
create procedure display_info_of_user(account_user_name VARCHAR(255))
	begin
		select 	a.account_user_name,
				a.role_id,
				u.user_name,
				u.user_dob,
				u.user_gender,
				u.user_id_card,
				u.user_phone_number,
				u.user_mail,
				u.user_address,
				t_o_c.type_of_customer_name
		from `account` a
		left join `user` u on u.account_user_name = a.account_user_name
		left join `type_of_customer` t_o_c on t_o_c.type_of_customer_id = u.type_of_customer_id
		where a.account_user_name = account_user_name;
	end //
DELIMITER ;


DELIMITER //
create procedure find_by_user_name(user_name varchar(255))
	begin
    SELECT a.account_user_name,a.account_password,r.role_name 
	FROM `account` a
	join `role` r on r.role_id = a.role_id
    where a.account_user_name = user_name;
	end //
DELIMITER ;

DELIMITER //
create procedure select_all_account()
	begin
    SELECT a.account_user_name,a.account_password,r.role_name 
	FROM account a
	join role r on r.role_id = a.role_id;
	end //
DELIMITER ;

-- QUYEN
-- CN2: Thêm mới sản phẩm
DELIMITER //
CREATE PROCEDURE insert_product (
 IN product_name VARCHAR(255),
 IN product_price DOUBLE,
 IN product_description VARCHAR(255),
 IN type_name VARCHAR(255),
 IN product_inventory BIGINT,
 IN product_img_path TEXT(65535) )
BEGIN
DECLARE id INT;
SELECT product_type_id into id
FROM product_type
WHERE product_type_name = type_name;
if id is not null then
INSERT INTO product ( product_name, product_price, product_description, product_type_id, product_inventory, product_img_path )
VALUES ( product_name, product_price, product_description, id, product_inventory, product_img_path );
else
signal sqlstate '45000' set message_text = 'Product type is not found';
end if;
END //
DELIMITER ;

-- CN3: Cập nhật thông tin sản phẩm
DELIMITER //
create procedure update_product(
IN pr_name VARCHAR(255),
IN pr_price DOUBLE,
IN pr_description VARCHAR(300),
IN pr_type varchar(255),
IN pr_inventory BIGINT,
IN pr_img_path varchar(255),
IN pr_id int)
BEGIN
declare id int;
select product_type_id into id
from product_type
where product_type_name = pr_type;
update product p
join product_type pt on p.product_type_id = pt.product_type_id
SET
p.product_name = pr_name,
p.product_price = pr_price,
p.product_description = pr_description,
p.product_type_id = id,
p.product_inventory = pr_inventory,
product_img_path = pr_img_path
where product_id = pr_id;
END //
 DELIMITER ;

-- CN: Tìm kiếm sp theo khoảng giá
DELIMITER //
create procedure select_by_price (IN min double, in max double)
BEGIN
SELECT product_id, product_name, product_price, product_description, product_type_name, product_inventory,product_img_path
FROM product p JOIN  product_type pt ON p.product_type_id = pt.product_type_id
where p.product_price < max and p.product_price >= min;
END //
DELIMITER ;

-- Tan
delimiter //
create procedure paging(limited int , offseted int)
begin
SELECT * FROM product p
left join product_type pt on pt.product_type_id = p.product_type_id
LIMIT limited OFFSET offseted;
end //
delimiter ;

delimiter //
	create procedure getCustomerOrder()
    begin
		select	o.order_id, p.product_name,od.order_detail_price,od.product_quantity,o.order_date,v.voucher_rate,u.user_name,u.user_phone_number,u.user_address
        from `order` o
        join user u on u.user_id = o.user_id
        left join voucher v on v.voucher_id = o.voucher_id
        join order_detail od on o.order_id = od.order_id
        join product p on p.product_id = od.product_id;
    end //
delimiter ;

delimiter //
create procedure delete_order(id int)
begin
delete from order_detail od
where order_id = id;
delete from `order`
where order_id = id;
end // 
delimiter ;

delimiter //

create procedure add_order_and_return_id(
    in date_now date,
    in users_id int,
    in vouchered_id int,
    out new_id int
)
begin
    insert into `order`(order_date, user_id, voucher_id)
    values (date_now, users_id, vouchered_id);

    set new_id = LAST_INSERT_ID();
end //

delimiter ;


delimiter //

create procedure delete_account(user_name VARCHAR(255))
begin
   SET FOREIGN_KEY_CHECKS = 0;
   
   delete from `account`
   where account_user_name = user_name;
   
   SET FOREIGN_KEY_CHECKS = 1;
end //

delimiter ;

call delete_account('quyen@gmail.com');


delimiter //
  create procedure delete_user(id int)
begin
set foreign_key_checks = 0;
delete from user
where user_id = id;
set foreign_key_checks = 1;
end //
delimiter ;