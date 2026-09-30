USE retail_analysis;

1. OVERALL BUSINESS PERFORMANCE

SELECT
    COUNT(*) AS Total_Transactions,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Overall_Profit_Margin,
    ROUND(AVG(Inventory_Days), 2) AS Avg_Inventory_Days
FROM retail_data;

2. PROFITABILITY BY CATEGORY

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin
FROM retail_data
GROUP BY Category
ORDER BY Total_Profit DESC;

3. PROFITABILITY BY SUB-CATEGORY

SELECT
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin
FROM retail_data
GROUP BY Category, Sub_Category
ORDER BY Total_Profit DESC;

4. REGIONAL PERFORMANCE

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin
FROM retail_data
GROUP BY Region
ORDER BY Total_Profit DESC;

5. STATE PERFORMANCE

SELECT
    State,
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin
FROM retail_data
GROUP BY State, Region
ORDER BY Total_Profit DESC;

6. SEASONAL PERFORMANCE

SELECT
    Season,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin
FROM retail_data
GROUP BY Season
ORDER BY Total_Profit DESC;

6.1. Category performance across seasons

SELECT
    Season,
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM retail_data
GROUP BY Season, Category
ORDER BY Season, Total_Profit DESC;

7. MONTHLY PERFORMANCE

SELECT
    Year,
    Month,
    Month_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin
FROM retail_data
GROUP BY Year, Month, Month_Name
ORDER BY Year, Month;

8. INVENTORY ANALYSIS

SELECT
    Category,
    ROUND(AVG(Inventory_Days), 2) AS Avg_Inventory_Days,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_data
GROUP BY Category
ORDER BY Avg_Inventory_Days DESC;

9. SLOW-MOVING PRODUCTS

SELECT
    Product,
    Category,
    Sub_Category,
    ROUND(AVG(Inventory_Days), 2) AS Avg_Inventory_Days,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_data
GROUP BY Product, Category, Sub_Category
ORDER BY Avg_Inventory_Days DESC
LIMIT 20;

10. INVENTORY DAYS VS PROFIT

SELECT
    Product,
    Category,
    Sub_Category,
    ROUND(AVG(Inventory_Days), 2) AS Avg_Inventory_Days,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin
FROM retail_data
GROUP BY Product, Category, Sub_Category
ORDER BY Avg_Inventory_Days DESC;

11. FINAL BUSINESS SUMMARY

SELECT
    COUNT(*) AS Total_Transactions,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Overall_Profit_Margin,
    ROUND(AVG(Inventory_Days), 2) AS Avg_Inventory_Days
FROM retail_data;