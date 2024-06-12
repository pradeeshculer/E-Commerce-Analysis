select orderNumber, orderDate, customerNumber, sum(Sales_value) as sales_value
from
(
select t1.orderNumber, orderDate, customerNumber, quantityOrdered*priceEach as sales_value
from orders t1
inner join orderdetails t2
on t1.orderNumber = t2.orderNumber
)main
group by orderNumber, orderDate, customerNumber;