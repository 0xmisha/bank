SELECT SUM(a.balance) as total_balance
FROM account a
JOIN client c ON a.id_client = c.id_contract
WHERE c.id_contract = $customer_id;
