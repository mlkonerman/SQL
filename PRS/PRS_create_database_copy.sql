-- create and select the database
DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;

-- create the User table
CREATE TABLE User (
  ID			INT           PRIMARY KEY  											AUTO_INCREMENT,
  UserName      VARCHAR(20)   NOT NULL     											UNIQUE,
  Password		VARCHAR(10)   NOT NULL,
  FirstName		VARCHAR(20)   NOT NULL,
  LastName		VARCHAR(20)	  NOT NULL,
  PhoneNumber	VARCHAR(12)	  NOT NULL,
  Email			VARCHAR(75)	  NOT NULL,
  IsReviewer	TinyInt(1)	  DEFAULT 1 											NOT NULL,
  IsAdmin		TinyInt(1)	  DEFAULT 1 											NOT NULL,
  IsActive 		TinyInt(1) 	  DEFAULT 1 											NOT NULL,
  DateCreated 	DATETIME 	  DEFAULT current_timestamp 							NOT NULL,
  DateUpdated 	DATETIME 	  DEFAULT current_timestamp on update current_timestamp	NOT NULL,
  UpdatedByUser INT   	  	  default 1 											NOT NULL
  );

-- create the Vendor table
CREATE TABLE Vendor (
  ID			INT           PRIMARY KEY  											AUTO_INCREMENT,
  Code      	VARCHAR(10)   NOT NULL     											UNIQUE,
  Name			VARCHAR(255)  NOT NULL,
  Address		VARCHAR(255)  NOT NULL,
  City			VARCHAR(255)  NOT NULL,
  State			VARCHAR(2)	  NOT NULL,
  Zip			VARCHAR(5)	  NOT NULL,
  PhoneNumber	VARCHAR(12)   NOT NULL,
  Email			VARCHAR(100)  NOT NULL,		
  IsPreApproved	TinyInt(1)    NOT NULL,
  IsActive 		TinyInt(1) 	  DEFAULT 1 											NOT NULL,
  DateCreated 	DATETIME 	  DEFAULT current_timestamp 							NOT NULL,
  DateUpdated 	DATETIME 	  DEFAULT current_timestamp on update current_timestamp	NOT NULL,
  UpdatedByUser INT   	  	  DEFAULT 1 											NOT NULL
  );

-- create the PurchaseRequest table
CREATE TABLE PurchaseRequest (
  ID					INT           PRIMARY KEY  											AUTO_INCREMENT,
  UserID      			INT		      NOT NULL,
  Description			VARCHAR(100)  NOT NULL,
  Justification			VARCHAR(255)  NOT NULL,
  DateNeeded			DATE		  NOT NULL,
  DeliveryMode			VARCHAR(25)	  NOT NULL,
  Status				VARCHAR(20)	  NOT NULL,
  Total					DECIMAL(10,2) NOT NULL,
  SubmittedDate			DATETIME  	  NOT NULL,		
  ReasonForRejection	VARCHAR(100),
  IsActive 				TinyInt(1) 	  DEFAULT 1 											NOT NULL,
  DateCreated 			DATETIME 	  DEFAULT current_timestamp 							NOT NULL,
  DateUpdated 			DATETIME 	  DEFAULT current_timestamp on update current_timestamp	NOT NULL,
  UpdatedByUser 		INT   	  	  default 1 											NOT NULL,
  FOREIGN KEY (UserID)  REFERENCES User (ID)
  );
  
  -- create the Product table
CREATE TABLE Product (
  ID					INT           PRIMARY KEY  											AUTO_INCREMENT,
  VendorID     			INT		      NOT NULL,
  PartNumber			VARCHAR(50)   NOT NULL,
  Name					VARCHAR(150)  NOT NULL,
  Price					DECIMAL(10,2) NOT NULL,
  Unit					VARCHAR(50),
  PhotoPath				VARCHAR(75),
  IsActive 				TinyInt(1) 	  DEFAULT 1 											NOT NULL,
  DateCreated 			DATETIME 	  DEFAULT current_timestamp 							NOT NULL,
  DateUpdated 			DATETIME 	  DEFAULT current_timestamp on update current_timestamp	NOT NULL,
  UpdatedByUser 		INT   	  	  default 1 											NOT NULL,
  FOREIGN KEY (VendorID)REFERENCES 	  Vendor (ID)
  );

  -- create the PurchaseRequest table
CREATE TABLE PurchaseRequestLineItem (
  ID					INT           PRIMARY KEY  											AUTO_INCREMENT,
  PurchaseRequestID 	INT		      NOT NULL,
  ProductID				INT			  NOT NULL,
  Quantity				INT			  NOT NULL,
  IsActive 				TinyInt(1) 	  DEFAULT 1 											NOT NULL,
  DateCreated 			DATETIME 	  DEFAULT current_timestamp 							NOT NULL,
  DateUpdated 			DATETIME 	  DEFAULT current_timestamp on update current_timestamp	NOT NULL,
  UpdatedByUser 		INT   	  	  DEFAULT 1 											NOT NULL,
  FOREIGN KEY (PurchaseRequestID) 	  REFERENCES PurchaseRequest (ID),
  FOREIGN KEY (ProductID) 			  REFERENCES Product (ID)
  );

-- insert users
INSERT INTO User (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin) VALUES 
(1,'SYSTEM','xxxxx','System','System','XXX-XXX-XXXX','system@test.com',1,1),
(2,'sblessing','login','Sean','Blessing','513-600-7096','sean@blessingtechnology.com',1,1),
(3,'mkonerman','cheerio','Maria','Konerman','513-212-5689','mlkonerman@gmail.com',1,1);

-- insert vendors
INSERT INTO Vendor (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email, isPreApproved) 
VALUES 
(1,'BB-1001','Best Buy','100 Best Buy Street','Louisville','KY','40207','502-111-9099','geeksquad@bestbuy.com',1),
(2,'AP-1001','Apple Inc','1 Infinite Loop','Cupertino','CA','95014','800-123-4567','genius@apple.com',1),
(3,'AM-1001','Amazon','410 Terry Ave. North','Seattle','WA','98109','206-266-1000','amazon@amazon.com',0),
(4,'ST-1001','Staples','9550 Mason Montgomery Rd','Mason','OH','45040','513-754-0235','support@orders.staples.com',0),
(5,'MC-1001','Micro Center','11755 Mosteller Rd','Sharonville','OH','45241','513-782-8500','support@microcenter.com',0),
(6,'WM-1001','Walmart','5303 Bowen Dr','Mason','OH','45040','513-583-9330','orders@walmart.com',0);

-- insert base products
INSERT INTO Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath) 
VALUES 
(1,1,'ME280LL','iPad Mini 2',296.99,NULL,NULL),
(2,2,'ME280LL','iPad Mini 2',299.99,NULL,NULL),
(3,3,'105810','Hammermill Paper, Premium Multi-Purpose Paper Poly Wrap',8.99,'1 Ream / 500 Sheets',NULL),
(4,4,'122374','HammerMill® Copy Plus Copy Paper, 8 1/2\" x 11\", Case',29.99,'1 Case, 10 Reams, 500 Sheets per ream',NULL),
(5,4,'784551','Logitech M325 Wireless Optical Mouse, Ambidextrous, Black ',14.99,NULL,NULL),
(6,4,'382955','Staples Mouse Pad, Black',2.99,NULL,NULL),
(7,4,'2122178','AOC 24-Inch Class LED Monitor',99.99,NULL,NULL),
(8,4,'2460649','Laptop HP Notebook 15-AY163NR',529.99,NULL,NULL),
(9,4,'2256788','Laptop Dell i3552-3240BLK 15.6\"',239.99,NULL,NULL),
(10,4,'IM12M9520','Laptop Acer Acer™ Aspire One Cloudbook 14\"',224.99,NULL,NULL),
(11,4,'940600','Canon imageCLASS Copier (D530)',99.99,NULL,NULL),
(12,5,'228148','Acer Aspire ATC-780A-UR12 Desktop Computer',399.99,NULL,'/images/AcerAspireDesktop.jpg'),
(13,5,'279364','Lenovo IdeaCentre All-In-One Desktop',349.99,NULL,'/images/LenovoIdeaCenter.jpg'),
(14,1,'279364','Lenovo IdeaCentre All-In-One Desktop',359.99,NULL,NULL),
(15,4,'486937','Solo Midtown Collection Paramount Laptop Briefcase, Black Polyester',53.29,NULL,'C:/Users/MaxTech/Pictures/PRS/ParamountLaptopBriefcase.jpg'),
(16,6,'ESS-6000','OFM Essentials Collection Executive Office Chair, Bonded Leather, in Black',55.69,NULL,NULL);

-- create a user and grant privileges to that user
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;