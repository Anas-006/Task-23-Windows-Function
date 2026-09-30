select StockCode,
sum(Quantity)as Total_Quantity,
Row_number() over(order by sum(Quantity)desc)as Row_num
from onlineretail
group by StockCode
order by Row_Num;

select StockCode,
sum(Quantity)as Total_Quantity,
rank() over(order by sum(Quantity)desc)as Product_Rank
from onlineretail
group by StockCode
order by Product_Rank;

Select InvoiceDate, Quantity,
lag(Quantity)over(Order by InvoiceDate)as Previous_Quantity
from onlineretail;

select CustomerID, Invoice, InvoiceDate,
row_number()over(partition by CustomerID order by InvoiceDate) Order_num
from onlineretail
where CustomerId is not null;

select CustomerID, Country,sum(Quantity*UnitPrice)as Total_sales,
rank()over(partition by country order by sum(Quantity*UnitPrice)desc)as Sales_Rank
from onlineretail
where CustomerID is not null
group by Country, CustomerID;

select CustomerID, Country,sum(Quantity*UnitPrice)as Total_sales,
dense_rank()over(partition by country order by sum(Quantity*UnitPrice)desc)as Sales_Rank
from onlineretail
where CustomerID is not null
group by Country, CustomerID;

select CustomerID, InvoiceDate, Quantity,
lag(Quantity)over(partition by CustomerID order by InvoiceDate) as Previous_Quantity
from onlineretail
where CustomerID is not null;

select CustomerID, InvoiceDate, Quantity*UnitPrice as Sales,
lag(Quantity*UnitPrice) over(partition by CustomerID order by InvoiceDate)as previous_sales
from onlineretail
where CustomerID is not null;

select CustomerID, InvoiceDate, Quantity*UnitPrice as Sales,
lag(Quantity*UnitPrice) over(partition by CustomerID order by InvoiceDate)as previous_sales,
(Quantity*UnitPrice)-lag(Quantity*UnitPrice) over(partition by CustomerID order by InvoiceDate)as Sale_Diff
from onlineretail
where CustomerID is not null;

WITH CustomerSales AS (
    SELECT
        Country,
        CustomerID,
        SUM(Quantity * UnitPrice) AS Total_Sales
    FROM onlineretail
    WHERE CustomerID IS NOT NULL
    GROUP BY Country, CustomerID
),
RankedCustomers AS (
    SELECT
        Country,
        CustomerID,
        Total_Sales,
        ROW_NUMBER() OVER (
            PARTITION BY Country
            ORDER BY Total_Sales DESC
        ) AS Row_Num
    FROM CustomerSales
)
SELECT *
FROM RankedCustomers
WHERE Row_Num <= 3;

WITH CustomerSales AS (
    SELECT
        Country,
        CustomerID,
        SUM(Quantity * UnitPrice) AS Total_Sales
    FROM onlineretail
    WHERE CustomerID IS NOT NULL
    GROUP BY Country, CustomerID
),
RankedCustomers AS (
    SELECT
        Country,
        CustomerID,
        Total_Sales,
        Rank() OVER (
            PARTITION BY Country
            ORDER BY Total_Sales DESC
        ) AS Row_Num
    FROM CustomerSales
)
SELECT *
FROM RankedCustomers
WHERE Row_Num <= 3;

SELECT
    CustomerID,
    InvoiceDate,
    Quantity * UnitPrice AS Sales,
    LAG(Quantity * UnitPrice) OVER (
        PARTITION BY CustomerID
        ORDER BY InvoiceDate
    ) AS Previous_Sales,
    CASE
        WHEN LAG(Quantity * UnitPrice) OVER (
            PARTITION BY CustomerID
            ORDER BY InvoiceDate
        ) IS NULL THEN 'First Purchase'
        WHEN Quantity * UnitPrice >
             LAG(Quantity * UnitPrice) OVER (
                 PARTITION BY CustomerID
                 ORDER BY InvoiceDate
             ) THEN 'Increased'
        WHEN Quantity * UnitPrice <
             LAG(Quantity * UnitPrice) OVER (
                 PARTITION BY CustomerID
                 ORDER BY InvoiceDate
             ) THEN 'Decreased'
        ELSE 'No Change'
    END AS Sales_Trend
FROM onlineretail
WHERE CustomerID IS NOT NULL;