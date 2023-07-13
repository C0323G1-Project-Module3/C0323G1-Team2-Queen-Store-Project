create database queen_store_database;
use queen_store_database;
CREATE TABLE `product_type` (
    `product_type_id` INT PRIMARY KEY AUTO_INCREMENT,
    `product_type_name` VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE `product` (	
    `product_id` INT PRIMARY KEY AUTO_INCREMENT,
    `product_name` VARCHAR(255) NOT NULL,
    `product_price` DOUBLE NOT NULL,
    `product_description` VARCHAR(255),
    `product_type_id` INT NOT NULL,
    `product_inventory` BIGINT NOT NULL,
    `product_img_path` text,
    FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`product_type_id`)
);
CREATE TABLE `type_of_customer` (
	`type_of_customer_id` INT AUTO_INCREMENT PRIMARY KEY,
    `type_of_customer_name` VARCHAR(255) not null unique
    );
create table `role`(
	`role_id` INT AUTO_INCREMENT PRIMARY KEY,
	`role_name` varchar(255) not null unique
	);
CREATE TABLE `account` (
	`account_user_name` VARCHAR(255) PRIMARY KEY,
    `account_password` VARCHAR(55) not null,
    `role_id` int not null,
	FOREIGN KEY (`role_id`) REFERENCES role (`role_id`)
    );
CREATE TABLE `user` (
	`user_id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_name` VARCHAR(255) NOT NULL,
    `user_dob` DATE NOT NULL,
    `user_gender` BIT(1) NOT NULL,
    `user_id_card` VARCHAR(20) NOT NULL,
    `user_phone_number` VARCHAR(20) NOT NULL,
    `user_mail` VARCHAR(55) NOT NULL,
    `user_address` VARCHAR(255) NOT NULL,
    `type_of_customer_id` INT,
    `account_user_name` VARCHAR(255) NOT NULL UNIQUE,
    FOREIGN KEY (`type_of_customer_id`) REFERENCES `type_of_customer`(`type_of_customer_id`),
    FOREIGN KEY (`account_user_name`) REFERENCES account(`account_user_name`)
    );
create table `voucher`(
`voucher_id` int primary key auto_increment,
`voucher_name` varchar(55) not null unique,
`voucher_rate` float not null unique
);
create table `order`(
`order_id` int primary key auto_increment,
`order_date` datetime not null,
`user_id` int not null,
`voucher_id` int,
foreign key (`user_id`) references user(`user_id`),
foreign key (`voucher_id`) references `voucher`(`voucher_id`)
);
create table `order_detail`(
`order_detail_id` int primary key auto_increment,
`order_id` int not null,
`product_id` int not null,
`order_detail_price` double not null,
`product_quantity` int not null,
foreign key (`order_id`) references `order`(`order_id`),
foreign key (`product_id`) references `product`(`product_id`)
);