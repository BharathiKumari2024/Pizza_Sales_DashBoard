---KPI Requirement
Select *from pizza_sales_tb;

---Total Revenue=Sum of total prize of all the pizza orders
Select SUM(total_price)as Total_Revenue
from pizza_sales_tb;

---Average Order value= average amount spent per order-calculated by dividing total revenue by total number of order.
 Select SUM(total_price)/count(distinct order_id) as avg_order_val
 from pizza_sales_tb;
 
 ---Total Pizza Sold=Sum of quantities of all the pizza sold
Select SUM(quantity) as Total_Pizza_Sold
from pizza_sales_tb;

---Total Order placed=total number of orders
Select Count(distinct order_id)as total_orders
from pizza_sales_tb;

---Average Pizza per order=the average number of pizza sold per order,
---calculated by dividing total number of pizza sold by the total number of pizza
Select cast(cast(sum(quantity)as decimal(10,2))/cast(count(distinct order_id)as decimal(10,2))as decimal(10,2)) as avg_pizza_per_order
from pizza_sales_tb;



