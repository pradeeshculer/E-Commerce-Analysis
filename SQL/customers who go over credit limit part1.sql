with cte_sales as 
(
select orderDate, t1.orderNumber, t1.customerNumber, customerName, productCode, creditLimit, 
quantityOrdered*priceEach as Sales_Value
from orders t1
inner join orderdetails t2
on t1.orderNumber = t2.orderNumber
inner join customers t3
on t1.customerNumber = t3.customerNumber
),

running_total_sales_cte as
(
select orderDate, orderNumber, customerNumber, customerName, creditLimit, sum(Sales_Value) as Sales_Value
from cte_sales
group by orderDate, orderNumber, customerNumber, customerName, creditLimit
)

select *,
sum(Sales_Value) over (partition by customerNumber order by orderDate) as running_total_sales
from running_total_sales_cte