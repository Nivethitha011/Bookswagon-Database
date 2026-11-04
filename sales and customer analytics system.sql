SQL> SELECT COUNT(Order_ID) AS Total_Orders
  2  FROM BookswagonOrders;

TOTAL_ORDERS
------------
          15

SQL> SELECT SUM(Total_Amount) AS Total_Sales
  2  FROM BookswagonOrders;

TOTAL_SALES
-----------
   11411.00

SQL> SELECT AVG(Total_Amount) AS Average_Order_Amount
  2  FROM BookswagonOrders;

AVERAGE_ORDER_AMOUNT
--------------------
              760.73

SQL> SELECT MIN(Total_Amount) AS Minimum_Order
  2  FROM BookswagonOrders;

MINIMUM_ORDER
-------------
       299.00

SQL> SELECT MAX(Total_Amount) AS Maximum_Order
  2  FROM BookswagonOrders;

MAXIMUM_ORDER
-------------
      1499.00

SQL> SELECT COUNT(Order_ID) AS Total_Orders,
  2         SUM(Total_Amount) AS Total_Sales,
  3         AVG(Total_Amount) AS Average_Order_Value,
  4         MIN(Total_Amount) AS Minimum_Order,
  5         MAX(Total_Amount) AS Maximum_Order
  6  FROM BookswagonOrders;

TOTAL_ORDERS TOTAL_SALES AVERAGE_ORDER_VALUE MINIMUM_ORDER MAXIMUM_ORDER
------------ ----------- ------------------- ------------- -------------
          15    11411.00              760.73        299.00       1499.00

SQL> SELECT c.Customer_ID,
  2         c.Customer_Name,
  3         SUM(o.Total_Amount) AS Total_Purchase
  4  FROM BookswagonCustomer c
  5  INNER JOIN BookswagonOrders o
  6      ON c.Customer_ID = o.Customer_ID
  7  GROUP BY c.Customer_ID, c.Customer_Name
  8  ORDER BY Total_Purchase DESC;

CUSTOMER_ID CUSTOMER_NAME             TOTAL_PURCHASE
----------- ------------------------- --------------
          1 Priya                            1949.00
          5 Karthik S                        1298.00
          3 Arun Kumar                       1249.00
          2 Priya Kumar                      1248.00
          7 Rahul Kumar                      1197.00
          4 Divya Raj                        1074.00
          8 Keerthana R                       998.00
         10 Swetha Priya                      900.00
          9 Vignesh M                         749.00
          6 Harini Devi                       749.00

10 rows selected.

SQL> SELECT c.Customer_ID,
  2         c.Customer_Name,
  3         SUM(o.Total_Amount) AS Total_Purchase
  4  FROM BookswagonCustomer c
  5  INNER JOIN BookswagonOrders o
  6      ON c.Customer_ID = o.Customer_ID
  7  GROUP BY c.Customer_ID, c.Customer_Name
  8  ORDER BY Total_Purchase DESC;

CUSTOMER_ID CUSTOMER_NAME             TOTAL_PURCHASE
----------- ------------------------- --------------
          1 Priya                            1949.00
          5 Karthik S                        1298.00
          3 Arun Kumar                       1249.00
          2 Priya Kumar                      1248.00
          7 Rahul Kumar                      1197.00
          4 Divya Raj                        1074.00
          8 Keerthana R                       998.00
         10 Swetha Priya                      900.00
          9 Vignesh M                         749.00
          6 Harini Devi                       749.00

10 rows selected.

SQL> SELECT p.Product_ID,
  2         p.Product_Name,
  3         SUM(od.Quantity) AS Total_Quantity_Sold
  4  FROM BookswagonProduct p
  5  INNER JOIN BookswagonOrderDetails od
  6      ON p.Product_ID = od.Product_ID
  7  GROUP BY p.Product_ID, p.Product_Name
  8  ORDER BY Total_Quantity_Sold DESC;

PRODUCT_ID PRODUCT_NAME                        TOTAL_QUANTITY_SOLD
---------- ----------------------------------- -------------------
       101 The Alchemist                                         6
       104 Wings of Fire                                         1
       102 Atomic Habits                                         1
       103 The Psychology of Money                               1
       106 Rich Dad Poor Dad                                     1

SQL> SELECT p.Product_ID,
  2         p.Product_Name,
  3         SUM(od.Quantity) AS Total_Quantity_Sold,
  4         SUM(od.Subtotal) AS Total_Sales
  5  FROM BookswagonProduct p
  6  INNER JOIN BookswagonOrderDetails od
  7      ON p.Product_ID = od.Product_ID
  8  GROUP BY p.Product_ID, p.Product_Name
  9  ORDER BY Total_Sales DESC;

PRODUCT_ID PRODUCT_NAME                        TOTAL_QUANTITY_SOLD TOTAL_SALES
---------- ----------------------------------- ------------------- -----------
       101 The Alchemist                                         6     2700.00
       102 Atomic Habits                                         1      499.00
       106 Rich Dad Poor Dad                                     1      399.00
       103 The Psychology of Money                               1      350.00
       104 Wings of Fire                                         1      299.00

SQL> SELECT cat.Category_ID,
  2         cat.Category_Name,
  3         SUM(od.Quantity) AS Total_Quantity_Sold,
  4         SUM(od.Subtotal) AS Total_Sales
  5  FROM BookswagonCategory cat
  6  INNER JOIN BookswagonProduct p
  7      ON cat.Category_ID = p.Category_ID
  8  INNER JOIN BookswagonOrderDetails od
  9      ON p.Product_ID = od.Product_ID
 10  GROUP BY cat.Category_ID, cat.Category_Name
 11  ORDER BY Total_Sales DESC;

CATEGORY_ID CATEGORY_NAME             TOTAL_QUANTITY_SOLD TOTAL_SALES
----------- ------------------------- ------------------- -----------
          1 Fiction                                     7     3199.00
          2 Finance                                     2      749.00
          3 Biography                                   1      299.00

SQL> SELECT c.Customer_Name,
  2         o.Order_ID,
  3         TO_CHAR(o.Order_Date, 'DD-MON-YYYY') AS Order_Date,
  4         p.Product_Name,
  5         cat.Category_Name,
  6         od.Quantity,
  7         od.Subtotal
  8  FROM BookswagonCustomer c
  9  INNER JOIN BookswagonOrders o
 10      ON c.Customer_ID = o.Customer_ID
 11  INNER JOIN BookswagonOrderDetails od
 12      ON o.Order_ID = od.Order_ID
 13  INNER JOIN BookswagonProduct p
 14      ON od.Product_ID = p.Product_ID
 15  INNER JOIN BookswagonCategory cat
 16      ON p.Category_ID = cat.Category_ID
 17  ORDER BY o.Order_ID;

CUSTOMER_NAME          ORDER_ID ORDER_DATE   PRODUCT_NAME                   CATEGORY_NAME        QUANTITY   SUBTOTAL
-------------------- ---------- ------------ ------------------------------ -------------------- -------- ----------
Priya                      1001 18-OCT-2026  The Alchemist                  Fiction                     1     450.00
Priya Kumar                1002 19-OCT-2026  The Alchemist                  Fiction                     1     450.00
Priya Kumar                1002 19-OCT-2026  Atomic Habits                  Fiction                     1     499.00
Arun Kumar                 1003 20-OCT-2026  The Psychology of Money        Finance                     1     350.00
Arun Kumar                 1003 20-OCT-2026  The Alchemist                  Fiction                     1     450.00
Divya Raj                  1004 21-OCT-2026  Wings of Fire                  Biography                   1     299.00
Divya Raj                  1004 21-OCT-2026  The Alchemist                  Fiction                     1     450.00
Karthik S                  1005 22-OCT-2026  Rich Dad Poor Dad              Finance                     1     399.00
Karthik S                  1005 22-OCT-2026  The Alchemist                  Fiction                     1     450.00
Priya                      5001 18-SEP-2026  The Alchemist                  Fiction                     1     450.00

10 rows selected.

