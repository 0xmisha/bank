INSERT INTO account_history (id_account, old_amount, new_amount, balance_update_date, id_reason)
VALUES (
    $receiver,
    @recipientBalance - $amount,
    @recipientBalance,
    NOW(),
    2
);