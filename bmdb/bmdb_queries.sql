-- list all movies in order of title
Select * from Movie
	order by Title;

-- list all actors in order of last name
SELECT * from Actor
	order by LastName;

-- Insert new movie
INSERT into Movie VALUES
	(11, 'A Star is Born', 'R', '2018', 'Bradley Cooper');

-- Delete newly added movie
DELETE from movie
	where ID = 11;

-- List actors' movie credits
SELECT a.FirstName, a.LastName, m.Title, c.Role
	from Actor a
    inner join Credit c
		on c.ActorID = a.ID
	inner join Movie m
		on c.MovieID = m.ID
	order by LastName;

-- List movies' cast members
SELECT m.Title, a.FirstName, a.LastName, c.Role
	from Actor a
    inner join Credit c
		on c.ActorID = a.ID
	inner join Movie m
		on c.MovieID = m.ID
	order by Title;

-- List all comedies in database
SELECT g.Name, m.Title, m.Year, m.Director
	from Movie m
    inner join MovieGenre mg
		on mg.MovieID = m.ID
    inner join Genre g
		on mg.GenreID = g.ID
	where Name = 'Comedy';

-- List all comedies in database
SELECT g.Name, m.Title, m.Year, m.Director
	from Movie m
    inner join MovieGenre mg
		on mg.MovieID = m.ID
    inner join Genre g
		on mg.GenreID = g.ID
	where Name = 'Comedy';

-- List all romantic movies in database
SELECT g.Name, m.Title, m.Year, m.Director
	from Movie m
    inner join MovieGenre mg
		on mg.MovieID = m.ID
    inner join Genre g
		on mg.GenreID = g.ID
	where Name = 'Romance';

-- List all romantic movies in database
SELECT g.Name, m.Title, m.Year, m.Director
	from Movie m
    inner join MovieGenre mg
		on mg.MovieID = m.ID
    inner join Genre g
		on mg.GenreID = g.ID
	where GenreID = 14;

-- List all romantic comedies in database
-- I think I understand why this doesn't work, but is it possible to return this info with our model?
SELECT g.Name, m.Title, m.Year, m.Director
	from Movie m
    inner join MovieGenre mg
		on mg.MovieID = m.ID
    inner join Genre g
		on mg.GenreID = g.ID
	where GenreID = 14 AND GenreID = 2;

-- List all romantic comedies in database
-- I think I understand why this doesn't work, but is it possible to return this info with our model?
SELECT g.Name, m.Title, m.Year, m.Director
	from Movie m
    inner join MovieGenre mg
		on mg.MovieID = m.ID
    inner join Genre g
		on mg.GenreID = g.ID
	where Name = 'Romance' and Name = 'Comedy';

-- List movies that came out after college graduation year
SELECT * from movie
	where Year > 2011;