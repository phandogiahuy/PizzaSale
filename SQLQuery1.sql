select * from pizza_sales_excel_file


--Total revenue

select sum(total_price) as TOTAL_REVENUE from pizza_sales_excel_file
--average
select sum(total_price)/COUNT(DISTINCT order_id) as AVG_COST from pizza_sales_excel_file

--Total Pizza sold

select sum(quantity) as Total_Pizza_Sold from pizza_sales_excel_file

--total Order

select count(distinct order_id) as total_order from pizza_sales_excel_file

--THe duplicated number of order
select order_id, count(order_id) as number_duplicate_order from pizza_sales_excel_file
group by order_id
having count(order_id) > 1
order by order_id asc


-- Total Order per day

select DATENAME(dw, order_date) as order_time, count(distinct order_id) as total_order_per_Day from pizza_sales_excel_file
group by DATENAME(dw, order_date)

--Total Order per month
select DATENAME(MONTH, order_date) as order_time, count(distinct order_id) as total_order_per_Month from pizza_sales_excel_file
group by DATENAME(MONTH, order_date)

--the proportion of revevue of category in database
select pizza_category , sum(total_price) *100 / (select sum(total_price) from pizza_sales_excel_file) as revenue_category , sum(total_price) as total_sale
from pizza_sales_excel_file
group by pizza_category

--the proportion of revevue of category in database in january
select pizza_category , cast(sum(total_price) as decimal(10,2))*100 / (select cast(sum(total_price) as decimal(10,2)) from pizza_sales_excel_file where MONTH(order_date)=1) as revenue_category , sum(total_price) as total_sale
from pizza_sales_excel_file
where MONTH(order_date)=1
group by pizza_category

--the proportion of revevue of category in database in january
select pizza_size , cast(sum(total_price) as decimal(10,2))*100 / (select cast(sum(total_price) as decimal(10,2)) from pizza_sales_excel_file where MONTH(order_date)=1) as revenue_category , sum(total_price) as total_sale
from pizza_sales_excel_file
where MONTH(order_date)=1
group by pizza_size

--top 5 pizza by quantity
select top 5 pizza_name,sum(quantity) as total_sale from pizza_sales_excel_file
group by pizza_name
order by sum(quantity)

--top 5 pizza by order
select top 5 pizza_name,count( distinct order_id) as total_order from pizza_sales_excel_file
group by pizza_name
order by count( distinct order_id)

--top 5 pizza by price
select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales_excel_file
group by pizza_name
order by sum(total_price) 
