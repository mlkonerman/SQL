SELECT * from Student 
	where state = 'NY';
INSERT into Student VALUES
(6, 'Phoebe', 'Buffay', '300 Broadway St', 'New York', 'NY', '34567', '1970-08-09',
'555-333-9999', 'pheebs@yahoo.com', '5553335555');
SELECT * from Student order by LastName;
INSERT into Student VALUES
(7, 'Phoebe', 'Buffay', '300 Broadway St', 'New York', 'NY', '34567', '1970-08-09',
'555-333-9999', 'pheebs@yahoo.com', '5553335555');
DELETE from Student
	where ID = 7;
-- add join statement