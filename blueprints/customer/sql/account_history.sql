SELECT a.id_account, th.id_transaction, th.amount, th.account_from, th.account_to, th.transfer_date
FROM client c
JOIN account a ON c.id_contract = a.id_client
JOIN transactions_history th ON a.id_account = th.account_from OR a.id_account = th.account_to
WHERE c.id_contract = $customer_id
ORDER BY th.transfer_date;
