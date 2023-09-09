SELECT * FROM pizza_sales_2015.pizza_sales;
-- Total Revenue 
select sum(total_price) as Total_Revenue from pizza_sales ;

-- Average Order values
select sum(total_price) / count(distinct order_id) as Average_Order from pizza_sales ; 

-- Total Pizza Sold
select sum(quantity) as Total_Pizza_Sold from pizza_sales;

-- Total Order 
select count(distinct order_id) as Total_Order from pizza_sales; 

-- Average Pizza Sold
select sum(quantity) /  count(distinct order_id) Avg_Pizza_sold from pizza_sales;

-- Charts
-- Daily Trend of order
SELECT 
dayofweek(order_date) as Order_day,
    COUNT(DISTINCT order_id) AS total_order
FROM
    pizza_sales
GROUP BY Order_day;

-- Monthly Trend of total order
select monthname( order_date) as month_name, count(distinct order_id) as total_orders from
pizza_sales
group by order_date;


-- Percentage of sale pby pizza category
select pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue, sum(total_price) *100 / (select sum(total_price) from pizza_sales) as PCT
from pizza_sales
group by pizza_category;

-- Percentage of sale pby pizza size
SELECT 
    pizza_size,
    CAST(SUM(total_price) AS DECIMAL (10 , 2 )) AS total_revenue,
    SUM(total_price) * 100 / (SELECT 
            SUM(total_price)
        FROM
            pizza_sales ) AS PCT
FROM
    pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- Pizza with highest sales

select  pizza_name, sum(total_price) as total_Sales from pizza_sales
group by pizza_name
order by total_sales desc
limit 5;

-- Pizza with lowest sales
select  pizza_name, sum(total_price) as total_Sales from pizza_sales
group by pizza_name
order by total_sales ASC
limit 5;

-- Top Pizza by quantity
select  pizza_name, sum(quantity) as total_Quantity  from pizza_sales
group by pizza_name
order by total_Quantity ASC
limit 5;

-- Top Pizza by Order
select  pizza_name, count(distinct order_id) as total_Order  from pizza_sales
group by pizza_name
order by total_Order DESC
limit 5;

-- Bottom Pizza by Order
select  pizza_name, count(distinct order_id) as total_Order  from pizza_sales
group by pizza_name
order by total_Order ASC
limit 5;

