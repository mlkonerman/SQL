
SELECT * from customer
where name like '%A%.';
--or name like 'D%'
SELECT * from customer
  where name like '%A%'
    and state = 'NJ';
-- Use a regular expression to return
-- all records with names starting
-- with a vowel
SELECT * from customer
  where name REGEXP "^[aeioud].*";
SELECT * from customer;
-- insert stmt
insert into customer 
  values (14, 'Gibson Guitars', 'Memphis', 'TN', 456789000, 1);
insert into customer (Name, City, State, Sales, Active)
  values ('Ibanez', 'Bensalem', 'PA', 56677887, 1),
		 ('Ibanez', 'Bensalem', 'PA', 56677887, 1);
-- update statement
UPDATE customer 
   SET name = 'Pearl',
       city = 'Test',
       state = 'TE'
	where ID = 16;
-- select * from customer before deleting
DELETE FROM customer
    where ID = 17;
insert into customer (Name, City, State, Sales, Active)
  values ('Central Perk', 'New York', 'NY', 76677887, 1);