/*show table*/
select * from pizza_sales

/*Total revenue*/
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

/*Average order value*/
select sum(total_price) / count(distinct order_id) as Avg_Order_Value from pizza_sales

/*Total pizza sold*/
select sum(quantity) as Total_Pizza_Sold from pizza_sales

/* total orders*/
select count(distinct order_id) as Total_Orders from pizza_sales

/*average pizzas per order*/
select cast(cast(sum(quantity) as decimal(10,2) )/ 
 cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
 as Avg_Pizzas_Per_Order
 from pizza_sales

/*daily trend for total orders*/
 select DATENAME(DW , order_date) as Order_Day , count(distinct order_id) as Total_Orders
 from pizza_sales
 group by DATENAME(DW , order_date) 

 /*monthly trend for orders*/
 select DATENAME(month , order_date) as Month_Name , count(distinct order_id) as Total_Orders
 from pizza_sales
 group by DATENAME(month , order_date)
 order by Total_Orders DESC

 /*% of sales by pizza category*/
 select pizza_category , sum(total_price) as Total_Sales , sum(total_price) * 100 /(select sum(total_price)
 from pizza_sales  where month(order_date) = 1) as PCT
 from pizza_sales 
 where month(order_date) = 1
 group by pizza_category

 /*% of sales by pizza size*/
 select pizza_size , cast(sum(total_price) as decimal(10,2)) as Total_Sales , 
 cast(sum(total_price) * 100 /(select sum(total_price)
 from pizza_sales where datepart(quarter , order_date) =1) as decimal(10,2)) as PCT
 from pizza_sales 
 where datepart(quarter , order_date) =1
 group by pizza_size
 order by pizza_size

 /*
 SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size*/



/*total pizza sold by pizza category*/
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC



 /* top 5 with total revenue*/
select top 5 pizza_name , sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue DESC

/* bottom 5 with total revenue*/
select top 5 pizza_name , sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue ASC

/* top 5 with quantity*/
select top 5 pizza_name , sum(quantity) as Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity DESC

/* bottom 5 with quantity */
select top 5 pizza_name , sum(quantity) as Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity ASC

/* top 5 total orders with pizza name */
select top 5 pizza_name , count(distinct order_id)  as Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders DESC

/* bottom 5 total orders with pizza name*/
select top 5 pizza_name , count(distinct order_id)  as Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders ASC






