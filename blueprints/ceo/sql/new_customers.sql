SELECT COUNT(id_contract)
FROM client
WHERE open_date BETWEEN '$date_from' AND '$date_to';
