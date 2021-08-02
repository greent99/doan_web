-- CREATE DATABASE IF NOT EXISTS elearning;
create database elearning;
USE elearning;

DROP TABLE IF EXISTS roles CASCADE;
CREATE TABLE roles (
    id INT AUTO_INCREMENT,
    code VARCHAR(15) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    CONSTRAINT roles_pk PRIMARY KEY (id)
);

INSERT INTO roles (code, name, description) VALUES
('ADMIN', 'Admin role of website.', ''),
('STUDENT', 'Student role of website.', ''),
('TEACHER', 'Teacher role of website.', '');

DROP TABLE IF EXISTS statuses CASCADE;
CREATE TABLE statuses (
	id INT AUTO_INCREMENT,
	code VARCHAR(15) NOT NULL,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    CONSTRAINT statuses_pk PRIMARY KEY (id)
);

INSERT INTO statuses (code, name, description) VALUES
('AVAILABLE', 'Available status.', ''),
('UNAVAILABLE', 'Unavailable status', ''),
('APPROVED', 'Approved status.', ''),
('REJECTED', 'Rejected status.', ''),
('DONE', 'Is done status', ''),
('PREPARING', 'Is preparing status.', ''),
('COMPLETE', 'Complete status.', ''),
('INCOMPLETE', 'Incomplete status', ''),
('REMOVED', 'Removed status.', '');

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
	id INT AUTO_INCREMENT,
	roleid INT DEFAULT 2,
    rolecode VARCHAR(15) DEFAULT 'STUDENT',
    statusid INT DEFAULT 1,
    statuscode VARCHAR(15) DEFAULT 'AVAILABLE',
    fullname VARCHAR(255),
    gender VARCHAR(6) NOT NULL,
    address VARCHAR(100),
    phone VARCHAR(20),
    purchasedcount INT DEFAULT 0,
    totalmoneyspend BIGINT DEFAULT 0,
    uploadedcount INT DEFAULT 0,
    totalmoneyearn BIGINT DEFAULT 0,
    imgpath VARCHAR(100),
    teachingdescription TEXT,
    joinedat DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_pk PRIMARY KEY (id),
    CONSTRAINT users_roles_fk FOREIGN KEY (roleid) REFERENCES roles (id),
    CONSTRAINT users_statuses_fk FOREIGN KEY (statusid) REFERENCES statuses (id)
);

DROP TABLE IF EXISTS accounts CASCADE;
CREATE TABLE accounts (
	id INT AUTO_INCREMENT,
	userid INT NOT NULL,
    email VARCHAR(255) UNIQUE,
	username VARCHAR(50) UNIQUE NOT NULL,
	hash VARCHAR(1000) NOT NULL,
	salt VARCHAR(100) NOT NULL,
	createdat DATETIME DEFAULT CURRENT_TIMESTAMP,
	statusid INT DEFAULT 1,
    statuscode VARCHAR(15) DEFAULT 'AVAILABLE',
    CONSTRAINT accounts_pk PRIMARY KEY (id),
    CONSTRAINT accounts_users_fk FOREIGN KEY (userid) REFERENCES users (id),
    CONSTRAINT accounts_statuses_fk FOREIGN KEY (statusid) REFERENCES statuses (id)
);

DROP TABLE IF EXISTS categories CASCADE;
CREATE TABLE categories (
	id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT,
	imgpath VARCHAR(100),
    CONSTRAINT categories_pk PRIMARY KEY (id)
);

DROP TABLE IF EXISTS fields CASCADE;
CREATE TABLE fields (
	id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    categoryid INT NOT NULL,
	imgpath VARCHAR(100),
    CONSTRAINT fields_pk PRIMARY KEY (id),
    CONSTRAINT fields_categories_fk FOREIGN KEY (categoryid) REFERENCES categories (id)
);

DROP TABLE IF EXISTS courses CASCADE;
CREATE TABLE courses (
	id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    author INT NOT NULL,
    uploaddate DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastupdatedat DATETIME,
    description TEXT,
    viewscount INT DEFAULT 0,
    lessonscount INT DEFAULT 0,
    getscount INT DEFAULT 0,
    ratingscount INT DEFAULT 0,
    rating DECIMAL(2,2) DEFAULT 0.00,
    statusid INT DEFAULT 2,
    statuscode VARCHAR(15) DEFAULT 'UNAVAILABLE',
    approvedby INT,
    price BIGINT,
    imgpath VARCHAR(100),
    CONSTRAINT courses_pk PRIMARY KEY (id),
    CONSTRAINT courses_users_fk FOREIGN KEY (author) REFERENCES users (id),
    CONSTRAINT courses_users_fk2 FOREIGN KEY (approvedby) REFERENCES users (id),
    CONSTRAINT courses_statuses_fk FOREIGN KEY (statusid) REFERENCES statuses (id)
);

DROP TABLE IF EXISTS lessons CASCADE;
CREATE TABLE lessons (
	id INT AUTO_INCREMENT,
	courseid INT NOT NULL,
	description TEXT,
	videourl VARCHAR(100),
	CONSTRAINT lessons_pk PRIMARY KEY (id),
    CONSTRAINT lessons_courses_fk FOREIGN KEY (courseid) REFERENCES courses (id)
);

DROP TABLE IF EXISTS field_course CASCADE;
CREATE TABLE field_course (
	fieldid INT NOT NULL,
	courseid INT NOT NULL,
	CONSTRAINT field_course_pk PRIMARY KEY (fieldid, courseid),
    CONSTRAINT field_course_courses_fk FOREIGN KEY (courseid) REFERENCES courses (id),
    CONSTRAINT field_course_fields_fk FOREIGN KEY (fieldid) REFERENCES fields (id)
);

DROP TABLE IF EXISTS user_course CASCADE;
CREATE TABLE user_course (
	userid INT NOT NULL,
	courseid INT NOT NULL,
	purchasedat DATETIME DEFAULT CURRENT_TIMESTAMP,
	amount BIGINT,
	isinwatchlist BOOL DEFAULT FALSE,
	process DECIMAL(3,2) DEFAULT 0.00,
	CONSTRAINT user_course_pk PRIMARY KEY (userid, courseid),
    CONSTRAINT user_course_courses_fk FOREIGN KEY (courseid) REFERENCES courses (id),
    CONSTRAINT user_course_users_fk FOREIGN KEY (userid) REFERENCES users (id)
);

DROP TABLE IF EXISTS ratings CASCADE;
CREATE TABLE ratings (
	userid INT NOT NULL,
	courseid INT NOT NULL,
	createddat DATETIME DEFAULT CURRENT_TIMESTAMP,
	point INT CHECK (point <= 5),
	comment TEXT,
	CONSTRAINT ratings_pk PRIMARY KEY (userid, courseid),
    CONSTRAINT ratings_courses_fk FOREIGN KEY (courseid) REFERENCES courses (id),
    CONSTRAINT ratings_users_fk FOREIGN KEY (userid) REFERENCES users (id)
);

DROP TABLE IF EXISTS discounts CASCADE;
CREATE TABLE discounts (
	id INT AUTO_INCREMENT,
	name VARCHAR(50),
	startdate DATETIME,
	enddate DATETIME,
	description TEXT,
	percent INT CHECK (percent <= 100),
	CONSTRAINT discounts_pk PRIMARY KEY (id)
);

DROP TABLE IF EXISTS course_discount CASCADE;
CREATE TABLE course_discount (
	discountid INT NOT NULL,
	courseid INT NOT NULL,
	priceafterdiscount BIGINT,
	CONSTRAINT course_discount_pk PRIMARY KEY (discountid, courseid),
    CONSTRAINT course_discount_courses_fk FOREIGN KEY (courseid) REFERENCES courses (id),
    CONSTRAINT course_discount_discounts_fk FOREIGN KEY (discountid) REFERENCES discounts (id)
);

ALTER TABLE `elearning`.`accounts`
DROP FOREIGN KEY `accounts_statuses_fk`;
ALTER TABLE `elearning`.`accounts`
DROP COLUMN `statuscode`,
DROP COLUMN `statusid`,
ADD COLUMN `otp` CHAR(6) NULL AFTER `createdat`,
ADD COLUMN `otpexpired` DATETIME NULL AFTER `otp`,
CHANGE COLUMN `username` `email` VARCHAR(20) NOT NULL ,
DROP INDEX `accounts_statuses_fk` ;
;

ALTER TABLE `elearning`.`users`
DROP COLUMN `email`,
DROP INDEX `email` ;
;


ALTER TABLE `elearning`.`users`
CHANGE COLUMN `gender` `gender` VARCHAR(6) NULL DEFAULT 'MALE' ;

ALTER TABLE `elearning`.`accounts` modify column email nvarchar(100)
insert into statuses(code, name, description) values('PENDING', 'Pending status',null)
insert into statuses(code, name, description) values('ACTIVE', 'Active status',null)

ALTER TABLE `elearning`.`users`
DROP FOREIGN KEY `users_statuses_fk`,
DROP FOREIGN KEY `users_roles_fk`;
ALTER TABLE `elearning`.`users`
DROP COLUMN `imgpath`,
DROP COLUMN `lastname`,
DROP COLUMN `middlename`,
DROP COLUMN `statusid`,
DROP COLUMN `roleid`,
CHANGE COLUMN `rolecode` `role` VARCHAR(15) NULL DEFAULT 'STUDENT' ,
CHANGE COLUMN `statuscode` `status` VARCHAR(15) NULL DEFAULT 'AVAILABLE' ,
CHANGE COLUMN `firstname` `fullname` VARCHAR(100) NULL DEFAULT NULL ,
CHANGE COLUMN `address` `address` VARCHAR(500) NULL DEFAULT NULL ,
DROP INDEX `users_statuses_fk` ,
DROP INDEX `users_roles_fk` ;

ALTER TABLE `elearning`.`categories`
DROP COLUMN `imgpath`,
DROP COLUMN `description`;
;
ALTER TABLE `elearning`.`courses`
DROP FOREIGN KEY `courses_statuses_fk`;
ALTER TABLE `elearning`.`courses`
DROP COLUMN `imgpath`,
DROP COLUMN `statusid`,
DROP INDEX `courses_statuses_fk` ;
;
ALTER TABLE `elearning`.`fields`
DROP COLUMN `imgpath`;

ALTER TABLE `elearning`.`lessons`
CHANGE COLUMN `videourl` `videourl` TEXT NULL DEFAULT NULL ;

DROP TABLE `elearning`.`roles`;

DROP TABLE `elearning`.`roles`;

ALTER TABLE `elearning`.`discounts`
CHANGE COLUMN `name` `code` VARCHAR(50) NULL DEFAULT NULL ;

DROP TABLE `elearning`.`statuses`;

DROP TABLE `elearning`.`statuses`;

CREATE TABLE carts (
    id INT AUTO_INCREMENT,
    userid INT NOT NULL,
    discount INT NULL,
    ispaid TINYINT DEFAULT 0,
    paiddate DATETIME,
    method VARCHAR(50),
    amount BIGINT DEFAULT 0,
    discountamount BIGINT DEFAULT 0,
    total BIGINT DEFAULT 0,
    CONSTRAINT carts_pk PRIMARY KEY (id),
    CONSTRAINT carts_users_fk FOREIGN KEY (userid) REFERENCES users (id)
);

CREATE TABLE carts_courses (
    cartid INT NOT NULL,
    courseid INT NOT NULL,
    CONSTRAINT carts_courses_pk PRIMARY KEY (cartid, courseid),
    CONSTRAINT carts_courses_fk_carts FOREIGN KEY (cartid) REFERENCES carts (id),
    CONSTRAINT carts_courses_fk_courses FOREIGN KEY (courseid) REFERENCES courses (id)
);