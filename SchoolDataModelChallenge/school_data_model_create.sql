-- create and select the database
DROP DATABASE IF EXISTS sdb;
CREATE DATABASE sdb;
USE sdb;

-- create the Course table
CREATE TABLE Course (
  ID			INT            PRIMARY KEY  AUTO_INCREMENT,
  Number        INT            NOT NULL     UNIQUE,
  Subject	    NVARCHAR(25)   NOT NULL,
  Name			NVARCHAR(25)   NOT NULL
);

-- create Student table
CREATE TABLE Student (
  ID			INT					PRIMARY KEY  AUTO_INCREMENT,
  FirstName		NVARCHAR(25)		NOT NULL,
  LastName		NVARCHAR(25)		NOT NULL,
  StreetAddress	NVARCHAR(25)		NOT NULL,
  City			NVARCHAR(25)		NOT NULL,
  State			NVARCHAR(2)			NOT NULL,
  Zip			NVARCHAR(5)			NOT NULL,
  Birthdate		DATE				NOT NULL,
  PhoneNumber   NVARCHAR(12)		NOT NULL,
  Email			NVARCHAR(25)		NOT NULL,
  SSN			NVARCHAR(11)		NOT NULL
);

-- create Instructor table
CREATE TABLE Instructor (
  ID			INT				PRIMARY KEY  AUTO_INCREMENT,
  FirstName		NVARCHAR(25)	NOT NULL,
  LastName		NVARCHAR(25)	NOT NULL,
  CourseID		INT,
  FOREIGN KEY (CourseID) REFERENCES Course (ID)
);

-- create Enrollment table
CREATE TABLE Enrollment (
  ID			INT				PRIMARY KEY  AUTO_INCREMENT,
  StudentID		INT,
  CourseID		INT,
  Grade			DECIMAL(5,2),
  FOREIGN KEY (StudentID) REFERENCES Student (ID),
  FOREIGN KEY (CourseID) REFERENCES Course (ID)
);

-- insert some rows into the Course table
INSERT INTO Course VALUES
(1, '101', 'Science', 'Intro to Paleontology'),
(2, '201', 'Social Studies', 'American History 101'),
(3, '301', 'Arts', 'Intro to Acting');

-- insert some rows into the Student table
INSERT INTO Student VALUES
(1, 'Ross', 'Geller', '4444 Bedford St', 'New York', 'NY', '87654', '1970-03-08',
'555-666-7777', 'ross.geller@nyu.edu', '1112223333'),
(2, 'Rachel', 'Green', '4321 Bedford St Apt 2', 'New York', 'NY', '87654', '1971-05-05',
'555-444-3333', 'r.green@ralphlauren.com', '7772223333'),
(3, 'Joey', 'Tribbiani', '4321 Bedford St Apt 2', 'New York', 'NY', '87654', '1970-07-09',
'555-444-8888', 'joey@howyoudoin.com', '6661113333'),
(4, 'Chandler', 'Bing', '4321 Bedford St Apt 1', 'New York', 'NY', '87654', '1969-01-27',
'555-999-3333', 'bing_c@sterlingcooper.com', '4447775555'),
(5, 'Monica', 'Bing', '4321 Bedford St Apt 1', 'New York', 'NY', '87654', '1969-01-27',
'555-999-3333', 'm.bing@gmail.com', '4447772222');

-- insert some rows into the Instructor table
INSERT INTO Instructor VALUES
(1, 'Leslie', 'Knope', 1),
(2, 'Ilana', 'Wexler', 2),
(3, 'Abbi', 'Abrams', 3);

-- create a user and grant privileges to that user
CREATE USER sdb_user@localhost IDENTIFIED BY 'pizzathurdsay';
GRANT SELECT, INSERT, DELETE, UPDATE ON sdb.* TO sdb_user@localhost;