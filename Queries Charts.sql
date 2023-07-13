SELECT * FROM pizza_sales;

-- DAILY TREND FOR TOTAL ORDERS
SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

-- HOURLY TREND FOR TOTAL ORDERS
SELECT DATEPART(HOUR, order_time) AS Order_Hours, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);

-- PERCENTAGE OF SALES BY PIZZA CATEGORY
SELECT pizza_category, ROUND(SUM(total_price),2) AS Total_Sales, ROUND(SUM(total_price)*100/
(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1),2) AS PCT
FROM pizza_sales 
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;

-- PERCENTAGE OF SALES BY PIZZA SIZE
SELECT pizza_size, ROUND(SUM(total_price),2) AS Total_Sales, ROUND(SUM(total_price)*100/
(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER, order_date) = 1),2) AS PCT
FROM pizza_sales 
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC;

-- TOP 5 BEST SELLERS BY TOTAL PIZZAS SOLD
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC;

-- BOTTOM 5 WORST SELLERS BY TOTAL PIZZAS SOLD
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC;


