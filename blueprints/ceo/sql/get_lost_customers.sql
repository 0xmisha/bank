select close_date, count(*) as customers from client
where close_date IS NOT NULL
group by close_date