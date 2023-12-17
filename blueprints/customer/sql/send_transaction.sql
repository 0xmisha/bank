UPDATE account SET balance = balance - $amount WHERE id_account = $sender;
UPDATE account SET balance = balance + $amount WHERE id_account = $receiver;
INSERT INTO transactions_history (amount, transfer_date, account_from, account_to)
VALUES ($amount, NOW(), $sender, $receiver);
SELECT @senderBalance := balance FROM account WHERE id_account = $sender;
INSERT INTO account_history (id_account, old_amount, new_amount, balance_update_date, id_reason)
VALUES (
    $sender,
    @senderBalance,
    @senderBalance - $amount,
    NOW(),
    2
);
SELECT @recipientBalance := balance FROM account WHERE id_account = $receiver;
INSERT INTO account_history (id_account, old_amount, new_amount, balance_update_date, id_reason)
VALUES (
    $receiver,
    @recipientBalance - $amount,
    @recipientBalance,
    NOW(),
    2
);