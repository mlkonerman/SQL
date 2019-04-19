-- WRONG way to do a join
SELECT account_holder, txn_type, amount
  FROM accounts, transactions 
  where accounts.ID = transactions.account_id;
  
-- RIGHT way to do an inner join
SELECT account_holder, txn_type, amount
  from accounts a
     inner join 
		transactions t
          on a.ID = t.account_ID;

-- left outer join
SELECT account_holder, txn_type, amount
  from accounts a
      left outer join 
      transactions t
      on a.id = t.account_ID;