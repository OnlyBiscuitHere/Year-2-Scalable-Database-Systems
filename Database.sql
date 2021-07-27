DROP DATABASE IF EXISTS lcsdb; -- Checking if any existing database namme
CREATE DATABASE IF NOT EXISTS lcsdb; -- Creation of database
SET NAMES 'utf8';
USE lcsdb; -- enable use of database
-- Creation of database
CREATE TABLE IF NOT EXISTS Customer(
CustomerEmail VARCHAR(50),
CustomerFirstname VARCHAR(20),
CustomerLastname VARCHAR(20),
CustomerHouseNoName VARCHAR(50),
CustomerPostcode VARCHAR(10) UNIQUE,
CustomerCity VARCHAR(25)
); 
ALTER TABLE Customer ADD PRIMARY KEY (CustomerEmail); -- Adding the primary key to the table
CREATE TABLE IF NOT EXISTS Staff(
StaffEmail VARCHAR(50),
StaffFirstname VARCHAR(20),
StaffLastname VARCHAR(20),
PRIMARY KEY (StaffEmail)
);  
CREATE TABLE Services(
ServiceName VARCHAR(60),
ServiceDescription VARCHAR(100),
ServicePrice VARCHAR(7),
PRIMARY KEY (ServiceName)
); 
CREATE TABLE Orders(
OrderID INT NOT NULL,
CustomerEmail VARCHAR(30) NOT NULL,
OrderDate VARCHAR(50),
StaffEmail VARCHAR(50),
PRIMARY KEY (OrderID),
FOREIGN KEY (CustomerEmail) REFERENCES Customer(CustomerEmail), -- Declaration of the foreign keys
FOREIGN KEY (StaffEmail) REFERENCES Staff(StaffEmail)
);
ALTER TABLE Orders MODIFY COLUMN Orderdate date; -- Modifying the orderdate to a more suitable variable
CREATE TABLE OrderDetails(
OrderID INT NOT NULL,
CustomerEmail VARCHAR(50),
OrderDate DATE,
StaffEmail VARCHAR(50),
ServiceName VARCHAR(30),
ServiceOrderedPrice VARCHAR(7),
Quantity INT,
Discount VARCHAR(4),
PRIMARY KEY(OrderID),
FOREIGN KEY(StaffEmail) REFERENCES Staff(StaffEmail),
FOREIGN KEY(CustomerEmail) REFERENCES customer(CustomerEmail),
FOREIGN KEY(ServiceName) REFERENCES Services(ServiceName)
); 
INSERT INTO Customer (CustomerEmail, CustomerFirstname, CustomerLastname, customerHouseNoName, customerPostCode, customerCity) -- Inserting data into the table
values ('xleandr@stackparts.com', 'Nicole', 'Bushman', '63 Boar Lane', 'GU28 1ZE', 'SELHAM'),
('93wekuuyyk@groupbuff.com', 'Aaron', 'Martin', '45  Seafield Street', 'LL23 7UG','LLANYCIL'),
('ovotugyavus@fakemailgenerator.net', 'Morgan', 'Thomson', '115  Chapel Lane', 'NG5 5AT', 'ARNOLD'),
('mla3kzz426@powerencry.com', 'Charles','Newton','126  Henley Road','BH20 4DN','BOVINGTON CAMP'),
('gcqazl3xwda@meantinc.com', 'Mohammad','Vaughan','103  Traill Street','KW3 0ZW','ROSTER'),
('b334qbtfil8@powerencry.com','Nathan', 'Hayes','12  East Street','LE15 3PX','MANTON'),
('3hr3ap61dim@classesmail.com','Lola','Higgins','42  New Dover Rd','NE5 7EG','WALLBOTTLE'),
('arvvziubnxe@fakemailgenerator.net','Luca','Hartley','101  Oxford Rd','NR20 0QG','WORTHING'),
('eiibe05jvy4@powerencry.com', 'Kieran','Harvey','147  Huntly Street','KA15 0FX','BARRMILL'),
('744lht4pddr@classesmail.com','Lilly','Hardy','60  Fordham Rd','EN11 6UL','HAILEY'),
('9ka9hsbsmpl@classesmail.com','Joel','Holt','90  Withers Close','GU6 3HP','ALFOLD'),
('2ok0jsqcfc8@fakemailgenerator.net','Gabriel', 'Hancock','86  Jedburgh Road','WD2 3WX','LETCHMORE HEATH'),
('vicux490vwc@meantinc.com','Muhammed','Morley','37  Bishopthorpe Road','IV51 3TD','PENIFILE'),
('wmqi4dc563@groupbuff.com','Niamh','French','100  Newgate Street','WA4 2QS','KECKWICK'),
('ist35jvkl5@groupbuff.com','Bethany','Wright','98  Bath Rd','SA62 7AH','WOLFSDALE');

INSERT INTO Staff(staffEmail, staffFirstName, staffLastName)
values('d0izwsth50e@fakemailgenerator.net','Zak','Grant'),
('czs39qddb8g@meantinc.com','Maisie','Smart'),
('o6knlqbcnnh@powerencry.com','Jasmine','Lees'),
('h2vk3d43o8c@powerencry.com','Morgan','Kay'),
('7nu0y3wjwcc@powerencry.com','Josh','Abbott');

INSERT INTO Services (serviceName, serviceDescription, servicePrice)
values ('Laptop Screen Replacement', 'Replacing the screen of a laptop', '£120'),
('Drive Replacement', 'Replacing the drive', '£20'),
('Liquid Damage Repair', 'Repairing liquid damage', '£80'),
('Fan Replacement', 'Replacing fans', '£20'),
('OS Installation', 'Installing operating system', '£30'),
('Design & Implementation Support','Support for design and implementation ', 'TBD'),
('Setup','Initial setup', '£95'),
('Troubleshooting','Troubleshooting any problems', '£20/hr'),
('Internet Safety','Training ', '£35'),
('Hard-Drive Backup','Backup hard drive ', '£35-£75'),
('Software Installation','Software Installation', '£20'),
(' ' , 'Removal of viruses', '£50'),
('Hard-drive Capacity upgrade', 'Capacity of Hard-Drive upgrade', '£20'); 

UPDATE Services SET serviceName = 'Virus Removal' where serviceDescription = 'Removal of viruses';

INSERT INTO OrderDetails(orderID,customerEmail,orderdate,staffEmail,serviceName, serviceOrderedprice, discount,quantity)
values('0010000000','arvvziubnxe@fakemailgenerator.net','2019-12-25','d0izwsth50e@fakemailgenerator.net','Laptop Screen Replacement','£120','None', '1'),
('0020000000','744lht4pddr@classesmail.com','2017-02-10','czs39qddb8g@meantinc.com','Troubleshooting','TBD','10%','1'),
('0030000000','xleandr@stackparts.com','2018-06-29','o6knlqbcnnh@powerencry.com','Hard-drive Capacity upgrade','£20','10%','3'),
('0040000000','gcqazl3xwda@meantinc.com', '2013-07-11','h2vk3d43o8c@powerencry.com','Internet Safety','£35','None','1'),
('0050000000','vicux490vwc@meantinc.com','2014-09-25','7nu0y3wjwcc@powerencry.com','Software Installation','£20', '5%','2'),
('0060000000','2ok0jsqcfc8@fakemailgenerator.net','2018-01-21','d0izwsth50e@fakemailgenerator.net','Setup','£95','5%','2'),
('0070000000','ovotugyavus@fakemailgenerator.net','2018-11-09','o6knlqbcnnh@powerencry.com','Fan Replacement','£20','None','1'),
('0080000000','3hr3ap61dim@classesmail.com','2012-11-09','h2vk3d43o8c@powerencry.com','Troubleshooting','TBD','10%','1'),
('0090000000','ist35jvkl5@groupbuff.com', '2015-03-31','7nu0y3wjwcc@powerencry.com','Liquid Damage Repair','£80','10%','1');
-- Queries made into procedures for database security
DELIMITER $$
CREATE PROCEDURE Query1()
BEGIN
	SELECT * FROM Customer INNER JOIN OrderDetails ON Customer.CustomerEmail = OrderDetails.CustomerEmail; -- Use of inner join to create the procedures
END $$
DELIMITER ;
CALL Query1();

DELIMITER $$
CREATE PROCEDURE Query2()
BEGIN
	SELECT * FROM Staff LEFT JOIN OrderDetails ON Staff.StaffEmail = OrderDetails.StaffEmail;
END $$
DELIMITER ; 
CALL Query2();

DELIMITER $$
CREATE PROCEDURE Query3()
BEGIN
	SELECT * FROM OrderDetails RIGHT JOIN Customer ON OrderDetails.CustomerEmail = Customer.CustomerEmail;
END $$
DELIMITER ;
CALL Query3();

SHOW TABLES IN lcsdb; 

CREATE TABLE newCustomer LIKE customer;
CREATE TABLE newServices LIKE Services;
CREATE TABLE newStaff LIKE Staff;
CREATE TABLE newOrders LIKE Orders;
CREATE TABLE newOrderDeatils LIKE OrderDetails;