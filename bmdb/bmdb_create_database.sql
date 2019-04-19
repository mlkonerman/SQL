-- create and select the database
DROP DATABASE IF EXISTS bmdb;
CREATE DATABASE bmdb;
USE bmdb;

-- create the Actor table
CREATE TABLE Actor (
  ID				INT            PRIMARY KEY  AUTO_INCREMENT,
  FirstName         VARCHAR(25)    NOT NULL,
  LastName	    	VARCHAR(25)    NOT NULL,
  Gender			VARCHAR(25)    NOT NULL,
  BirthDate			DATE		   NOT NULL
);

-- create Movie table
CREATE TABLE Movie (
  ID			INT					PRIMARY KEY  AUTO_INCREMENT,
  Title			VARCHAR(100)		NOT NULL,
  Rating		VARCHAR(5)			NOT NULL,
  Year			INT					NOT NULL,
  Director		VARCHAR(25)		NOT NULL
);

-- create Genre table
CREATE TABLE Genre (
  ID			INT				PRIMARY KEY  AUTO_INCREMENT,
  Name			VARCHAR(25)		NOT NULL
);

-- create Credit table
CREATE TABLE Credit (
  ID			INT				PRIMARY KEY  AUTO_INCREMENT,
  MovieID		INT,
  ActorID		INT,
  Role			VARCHAR(25),
  FOREIGN KEY (MovieID) REFERENCES Movie (ID),
  FOREIGN KEY (ActorID) REFERENCES Actor (ID),
  CONSTRAINT act_mov unique (ActorID, MovieID)
  );

-- create MovieGenre table
CREATE TABLE MovieGenre (
  ID			INT				PRIMARY KEY  AUTO_INCREMENT,
  MovieID		INT,
  GenreID		INT,
  FOREIGN KEY (MovieID) REFERENCES Movie (ID),
  FOREIGN KEY (GenreID) REFERENCES Genre (ID)
);

-- insert some rows into the Actor table
INSERT INTO Actor VALUES
(1, 'Geena', 'Davis', 'Female', '1956-01-21'),
(2, 'Lori', 'Petty', 'Female', '1963-10-14'),
(3, 'Tom', 'Hanks', 'Male', '1956-07-09'),
(4, 'Rosie', 'O''Donnell', 'Female', '1962-03-21'),
(5, 'Leonardo', 'DiCaprio', 'Male', '1974-11-11'),
(6, 'Jennifer', 'Lawrence', 'Female', '1990-08-15'),
(7, 'Bradley', 'Cooper', 'Male', '1975-01-05'),
(8, 'Meg', 'Ryan', 'Female', '1961-11-19'),
(9, 'Greg', 'Kinnear', 'Male', '1963-06-17'),
(10, 'Lindsay', 'Lohan', 'Female', '1986-07-02'),
(11, 'Tina', 'Fey', 'Female', '1970-05-18'),
(12, 'Rachel', 'McAdams', 'Female', '1978-11-17'),
(13, 'Amy', 'Schumer', 'Female', '1981-06-01'),
(14, 'Bill', 'Hader', 'Male', '1978-06-07'),
(15, 'Liv', 'Tyler', 'Female', '1977-07-01'),
(16, 'Steve', 'Zahn', 'Male', '1967-11-13'),
(17, 'Tom', 'Cruise', 'Male', '1962-07-03'),
(18, 'Demi', 'Moore', 'Female', '1962-11-11'),
(19, 'Kate', 'Hudson', 'Female', '1979-04-19'),
(20, 'Matthew', 'McConaughey', 'Male', '1969-11-04'),
(21, 'Kristen', 'Wiig', 'Female', '1973-08-22'),
(22, 'Maya', 'Rudolph', 'Female', '1972-09-27');

-- insert some rows into the Movie table
INSERT INTO Movie VALUES
(1, 'A League of Their Own', 'PG', '1992', 'Penny Marshall'),
(2, 'Titanic', 'PG-13', '1997', 'James Cameron'),
(3, 'Silver Linings Playbook', 'R', '2012', 'David O. Russell'),
(4, 'You''ve Got Mail', 'PG', '1998', 'Nora Ephron'),
(5, 'Mean Girls', 'PG-13', '2004', 'Mark Waters'),
(6, 'Trainwreck', 'R', '2015', 'Judd Apatow'),
(7, 'That Thing You Do!', 'PG', '1996', 'Tom Hanks'),
(8, 'A Few Good Men', 'R', '1992', 'Rob Reiner'),
(9, 'How to Lose a Guy in 10 Days', 'PG-13', '2003', 'Donald Petrie'),
(10, 'Bridesmaids', 'R', '2011', 'Paul Feig');

-- insert some rows into the Genre table
INSERT INTO Genre VALUES
(1, 'Adventure'),
(2, 'Comedy'),
(3, 'Crime'),
(4, 'Drama'),
(5, 'Fantasy'),
(6, 'Historical'),
(7, 'Historical fiction'),
(8, 'Horror'),
(9, 'Magical realism'),
(10, 'Mystery'),
(11, 'Paranoid Fiction'),
(12, 'Philosophical'),
(13, 'Political'),
(14, 'Romance'),
(15, 'Saga'),
(16, 'Satire'),
(17, 'Science fiction'),
(18, 'Social'),
(19, 'Speculative'),
(20, 'Thriller'),
(21, 'Urban'),
(22, 'Western');

-- insert some rows into the Credit table
INSERT INTO Credit VALUES
(1, 1, 1, 'Dottie Hinson'),
(2, 1, 2, 'Kit Keller'),
(3, 1, 3, 'Jimmy Dugan'),
(4, 1, 4, 'Doris Murphy'),
(5, 2, 5, 'Jack Dawson'),
(6, 3, 6, 'Tiffany Maxwell'),
(7, 3, 7, 'Pat Solitano'),
(8, 4, 3, 'Joe Fox'),
(9, 4, 8, 'Kathleen Kelly'),
(10, 4, 9, 'Frank Navasky'),
(11, 5, 10, 'Cady Heron'),
(12, 5, 11, 'Ms. Norbury'),
(13, 5, 12, 'Regina George'),
(14, 6, 13, 'Amy'),
(15, 6, 14, 'Aaron'),
(16, 7, 3, 'Mr. White'),
(17, 7, 15, 'Faye Dolan'),
(18, 7, 16, 'Lenny'),
(19, 8, 17, 'Lt. Daniel Kaffee'),
(20, 8, 18, 'JoAnne Galloway'),
(21, 9, 19, 'Andie Anderson'),
(22, 9, 20, 'Ben Berry'),
(23, 10, 21, 'Annie'),
(24, 10, 22, 'Lillian');

-- insert some rows into the MovieGenre table
INSERT INTO MovieGenre VALUES
(1, 1, 2),
(2, 1, 7),
(3, 2, 4),
(4, 2, 7),
(5, 3, 2),
(6, 3, 4),
(7, 3, 14),
(8, 4, 2),
(9, 4, 14),
(10, 5, 2),
(11, 5, 16),
(12, 6, 2),
(13, 6, 14),
(14, 7, 2),
(15, 7, 14),
(16, 8, 3),
(17, 8, 4),
(18, 9, 2),
(19, 9, 14),
(20, 10, 2),
(21, 10, 16);

-- create a user and grant privileges to that user
CREATE USER bmdb_user@localhost IDENTIFIED BY 'pizzathurdsay';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;