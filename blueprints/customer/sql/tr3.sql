INSERT INTO transactions_history (amount, transfer_date, account_from, account_to)
VALUES ($amount, NOW(), $sender, $receiver);
