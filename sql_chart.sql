---Charts Requirement
Select *from pizza_sales_tb;

---daily trend for total orders-create a bar chart that displays daily trend of total order over 
---specific period of time.This will help to indentify patterns in order volumes 

SELECT TO_CHAR(order_date, 'Day') AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales_tb
GROUP BY TO_CHAR(order_date, 'Day');

---Monthly Trends for total orders= create a line chart that illustrates the hourly trends of total orders throughout the day.
---The chart will allow us to identify peak hoursor periods of high order activity.

SELECT TO_CHAR(order_date, 'Month') AS Month_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales_tb
GROUP BY TO_CHAR(order_date, 'Month');

---Percentage of Sales by Pizza Category=create a pie chart that shows the distribution of sales across different pizza category.
---This chart provides insights about popularity of different variety of pizza and its contribution to overall sales.
Select pizza_category, cast(sum(total_price)*100/(select sum(total_price)from pizza_sales_tb)as decimal(10,2)) as sales_percent
from pizza_sales_tb
group by pizza_category;

---Derive the percentage sales for January month
Select pizza_category,sum(total_price)as Total_Sales,sum(total_price)*100/(select sum(total_price)from pizza_sales_tb) as sales_percent
from pizza_sales_tb
where EXTRACT(MONTH FROM order_date) = 1
group by pizza_category;

---Derive the percentage sales for first quarter
Select pizza_category,sum(total_price)as Total_Sales,sum(total_price)*100/(select sum(total_price)from pizza_sales_tb) as sales_percent
from pizza_sales_tb
where EXTRACT(QUARTER FROM order_date) = 1
group by pizza_category;

---Percentage of Sales by Pizza Size=Generate a pie chart that represents the percentage of sales attributed to different pizza sizes.
---This chart will help us to understand customer preferrences for pizza sizes and their impact on sales.
Select pizza_size,sum(total_price)as Total_sales,cast(sum(total_price)*100/(select sum(total_price)from pizza_sales_tb)as decimal(10,2)) as sales_percent
from pizza_sales_tb
---where EXTRACT(MONTH FROM order_date) = 1
group by pizza_size;

---Top 5 best sellers by revenue=Total quantity,Total orders
---Create a bar chart highlighting the top 5 best sellers pizzas based on the revenue,Total quantity and total orders.

SELECT pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales_tb
GROUP BY pizza_name
ORDER BY total_revenue asc
LIMIT 5;

--Total Quantity
SELECT pizza_name, SUM(quantity) AS total_Quantity
FROM pizza_sales_tb
GROUP BY pizza_name
ORDER BY total_Quantity asc
LIMIT 5;

--Total Orders
SELECT pizza_name, SUM(distinct order_id) AS total_orders
FROM pizza_sales_tb
GROUP BY pizza_name
ORDER BY total_orders asc
LIMIT 5;

































