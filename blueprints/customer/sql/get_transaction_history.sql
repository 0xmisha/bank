SELECT amount, transfer_date, account_from, account_to
FROM transactions_history
WHERE account_from = $account OR account_to = $account
ORDER BY transfer_date DESC;
