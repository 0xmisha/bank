select request_status, count(*) as requests_count from requests
group by request_status