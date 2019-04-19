SELECT c.Name as 'Customer Name', c.City, c.State, 
  s.Name as 'State Name'
  from customer c
  inner join state s
          on c.State = s.code;