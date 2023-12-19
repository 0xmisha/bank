SELECT request_topic FROM reports_requests
UNION
SELECT topic FROM reports_lost_customers
UNION
SELECT topic FROM reports_new_customers;