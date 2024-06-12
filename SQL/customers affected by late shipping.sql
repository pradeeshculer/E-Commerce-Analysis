with main_cte as 
(
select *, date_add(shippedDate, interval 3 day) as Latest_Shipped_Date
from orders
),

sales_query as
(
select *,
case when Latest_Shipped_Date > requiredDate then 1 else 0 end as Late_Flag
from main_cte
)

select *
from sales_query
where Late_Flag = 1