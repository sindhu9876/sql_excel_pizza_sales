SELECT * FROM pizza_sales;
--TOTAL REVENUE
SELECT ROUND(SUM(total_price),2) AS Total_Revenue FROM pizza_sales;

--AVERAGE 
SELECT * FROM pizza_sales;
SELECT ROUND(SUM(total_price)/COUNT(DISTINCT order_id), 2) AS Avg_Order_Value FROM pizza_sales;

--TOTAL PIZZAS SOLD
SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales;

--TOTAL ORDERS PLACED
SELECT COUNT(DISTINCT(order_id)) AS Total_Orders_Placed FROM pizza_sales;

--AVERAGE PIZZAS PER ORDER: 
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/ 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order 
FROM pizza_sales;
