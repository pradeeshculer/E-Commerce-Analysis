	with sales as
    (
    select t1.orderNumber, t2.customerNumber, productCode, quantityOrdered, priceEach, quantityOrdered*priceEach as Sales_Value, creditLimit
    from orderdetails t1
    inner join orders t2
    on t1.orderNumber = t2.orderNumber
    inner join customers t3
    on t2.customerNumber = t3.customerNumber
    )
    
    select orderNumber, customerNumber, 
    case when creditLimit < 75000 then 'a: Less than 75k'
    when creditLimit between 75000 and 100000 then 'b: Between 75k and 100k'
    when creditLimit between 100000 and 150000 then 'c: Between 100k and 150k'
    when creditLimit > 150000 then 'd: Greater than 150k'
    else 'Other'
    end as creditLimit_grp,
    sum(Sales_Value) as Sales_Value
    from sales
    group by orderNumber, customerNumber, creditLimit_grp