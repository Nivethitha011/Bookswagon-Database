SQL> SELECT c.Customer_ID,
  2         c.Customer_Name,
  3         o.Order_ID,
  4         o.Total_Amount
  5  FROM BookswagonCustomer c
  6  INNER JOIN BookswagonOrders o
  7      ON c.Customer_ID = o.Customer_ID
  8  ORDER BY c.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME             ORDER_ID TOTAL_AMOUNT
----------- ------------------------- -------- ------------
          1 Priya                         1001       450.00
          1 Priya                         5001      1499.00
          2 Priya Kumar                   5002       749.00
          2 Priya Kumar                   1002       499.00
          3 Arun Kumar                    5003       899.00
          3 Arun Kumar                    1003       350.00
          4 Divya Raj                     5004       775.00
          4 Divya Raj                     1004       299.00
          5 Karthik S                     5005       899.00
          5 Karthik S                     1005       399.00
          6 Harini Devi                   5006       749.00
          7 Rahul Kumar                   5007      1197.00
          8 Keerthana R                   5008       998.00
          9 Vignesh M                     5009       749.00
         10 Swetha Priya                  5010       900.00

15 rows selected.

  SQL> SELECT o.Order_ID,
  2         TO_CHAR(o.Order_Date, 'DD-MON-YY') AS Order_Date,
  3         o.Total_Amount,
  4         p.Payment_Method,
  5         p.Payment_Amount,
  6         p.Payment_Status
  7  FROM BookswagonOrders o
  8  INNER JOIN BookswagonPayment p
  9      ON o.Order_ID = p.Order_ID
 10  ORDER BY o.Order_Date DESC;

ORDER_ID ORDER_DATE   TOTAL_AMOUNT PAYMENT_METHOD  PAYMENT_AMOUNT PAYMENT_STATUS
-------- ------------ ------------ --------------- -------------- ---------------
    5002 22-SEP-26          749.00 Credit Card             898.00 Paid
    5009 21-SEP-26          749.00 UPI                     550.00 Paid
    5008 21-SEP-26          998.00 Credit Card             998.00 Paid
    5010 21-SEP-26          900.00 Cash on Deliver         700.00 Failed
    5005 20-SEP-26          899.00 Cash on Deliver        1025.00 Paid
    5007 20-SEP-26         1197.00 Net Banking             897.00 Paid
    5006 20-SEP-26          749.00 UPI                     450.00 Paid
    5003 19-SEP-26          899.00 Debit Card             1196.00 Paid
    5004 19-SEP-26          775.00 UPI                     775.00 Paid
    5001 18-SEP-26         1499.00 UPI                    1250.00 Paid

10 rows selected.

  SQL> SELECT p.Product_ID,
  2         p.Product_Name,
  3         od.Order_ID,
  4         od.Quantity,
  5         od.Unit_Price,
  6         od.Subtotal
  7  FROM BookswagonProduct p
  8  INNER JOIN BookswagonOrderDetails od
  9      ON p.Product_ID = od.Product_ID
 10  ORDER BY p.Product_ID;
PRODUCT_ID PRODUCT_NAME                   ORDER_ID QUANTITY UNIT_PRICE  SUBTOTAL
---------- ------------------------------ -------- -------- ---------- ---------
       101 The Alchemist                      1001        1     450.00    450.00
       101 The Alchemist                      5001        1     450.00    450.00
       101 The Alchemist                      1004        1     450.00    450.00
       101 The Alchemist                      1003        1     450.00    450.00
       101 The Alchemist                      1005        1     450.00    450.00
       101 The Alchemist                      1002        1     450.00    450.00
       102 Atomic Habits                      1002        1     499.00    499.00
       103 The Psychology of Money            1003        1     350.00    350.00
       104 Wings of Fire                      1004        1     299.00    299.00
       106 Rich Dad Poor Dad                  1005        1     399.00    399.00

10 rows selected.

SQL> SELECT c.Customer_ID,
       c.Customer_Name,
       o.Order_ID,
       o.Order_Date,
       o.Total_Amount
FROM BookswagonCustomer c
LEFT JOIN BookswagonOrders o
  ON c.Customer_ID = o.Customer_ID
ORDER BY c.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME      ORDER_ID ORDER_DATE   TOTAL_AMOUNT
----------- ------------------ -------- ------------ ------------
          1 Priya                  1001 18-OCT-26          450.00
          1 Priya                  5001 18-SEP-26         1499.00
          2 Priya Kumar            5002 22-SEP-26          749.00
          2 Priya Kumar            1002 19-OCT-26          499.00
          3 Arun Kumar             5003 19-SEP-26          899.00
          3 Arun Kumar             1003 20-OCT-26          350.00
          4 Divya Raj              5004 19-SEP-26          775.00
          4 Divya Raj              1004 21-OCT-26          299.00
          5 Karthik S              5005 20-SEP-26          899.00
          5 Karthik S              1005 22-OCT-26          399.00
          6 Harini Devi            5006 20-SEP-26          749.00
          7 Rahul Kumar            5007 20-SEP-26         1197.00
          8 Keerthana R            5008 21-SEP-26          998.00
          9 Vignesh M              5009 21-SEP-26          749.00
         10 Swetha Priya           5010 21-SEP-26          900.00
         11 Sanjay Kumar
         12 Aishwarya S
         13 Dinesh Raj
         14 Meena Lakshmi
         15 Adithya K

20 rows selected.

  SQL> SELECT c.Customer_ID,
  2         c.Customer_Name,
  3         o.Order_ID,
  4         o.Order_Date,
  5         o.Total_Amount
  6  FROM BookswagonCustomer c
  7  INNER JOIN BookswagonOrders o
  8  ON c.Customer_ID = o.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME          ORDER_ID ORDER_DATE   TOTAL_AMOUNT
----------- -------------------- ---------- ------------ ------------
          1 Priya                      5001 18-SEP-26            1499
          2 Priya Kumar                5002 22-SEP-26             749
          3 Arun Kumar                 5003 19-SEP-26             899
          4 Divya Raj                  5004 19-SEP-26             775
          5 Karthik S                  5005 20-SEP-26             899
          6 Harini Devi                5006 20-SEP-26             749
          7 Rahul Kumar                5007 20-SEP-26            1197
          8 Keerthana R                5008 21-SEP-26             998
          9 Vignesh M                  5009 21-SEP-26             749
         10 Swetha Priya               5010 21-SEP-26             900
          1 Priya                      1001 18-OCT-26             450
          2 Priya Kumar                1002 19-OCT-26             499
          3 Arun Kumar                 1003 20-OCT-26             350
          4 Divya Raj                  1004 21-OCT-26             299
          5 Karthik S                  1005 22-OCT-26             399

15 rows selected.

  SQL> SELECT c.Customer_Name,
  2         o.Order_ID,
  3         TO_CHAR(o.Order_Date, 'DD-MON-YY') AS Order_Date,
  4         p.Product_ID,
  5         p.Product_Name,
  6         od.Quantity,
  7         od.Unit_Price,
  8         od.Subtotal,
  9         py.Payment_Method,
 10         py.Payment_Amount,
 11         py.Payment_Status
 12  FROM BookswagonCustomer c
 13  JOIN BookswagonOrders o
 14    ON c.Customer_ID = o.Customer_ID
 15  JOIN BookswagonOrderDetails od
 16    ON o.Order_ID = od.Order_ID
 17  JOIN BookswagonProduct p
 18    ON od.Product_ID = p.Product_ID
 19  JOIN BookswagonPayment py
 20    ON o.Order_ID = py.Order_ID
 21  ORDER BY o.Order_Date DESC;

CUSTOMER_NAME   ORDER_ID ORDER_DATE PRODUCT_ID PRODUCT_NAME              QUANTITY UNIT_PRICE  SUBTOTAL PAYMENT_METHOD  PAYMENT_AMOUNT PAYMENT_STATUS
--------------- -------- ---------- ---------- ------------------------- -------- ---------- --------- --------------- -------------- ---------------
Nandhini Sri        5001 18-SEP-26         101 The Alchemist                    1     450.00    450.00 UPI                    1250.00 Paid

SQL> SELECT o.Order_ID,
  2         o.Order_Date,
  3         o.Total_Amount,
  4         o.Order_Status,
  5         c.Customer_ID,
  6         c.Customer_Name
  7  FROM BookswagonCustomer c
  8  RIGHT JOIN BookswagonOrders o
  9  ON c.Customer_ID = o.Customer_ID
 10  ORDER BY o.Order_ID;

 ORDER_ID ORDER_DATE   TOTAL_AMOUNT ORDER_STATUS         CUSTOMER_ID CUSTOMER_NAME
---------- ------------ ------------ -------------------- ----------- --------------------
      1001 18-OCT-26          450.00 Delivered                      1 Nandhini Sri
      1002 19-OCT-26          499.00 Shipped                        2 Priya Kumar
      1003 20-OCT-26          350.00 Pending                        3 Arun Kumar
      1004 21-OCT-26          299.00 Delivered                      4 Divya Raj
      1005 22-OCT-26          399.00 Pending                        5 Karthik S
      5001 18-SEP-26         1499.00 Delivered                      1 Nandhini Sri
      5002 22-SEP-26          749.00 Shipped                        2 Priya Kumar
      5003 19-SEP-26          899.00 Processing                     3 Arun Kumar
      5004 19-SEP-26          775.00 Delivered                      4 Divya Raj
      5005 20-SEP-26          899.00 Shipped                        5 Karthik S
      5006 20-SEP-26          749.00 Processing                     6 Harini Devi
      5007 20-SEP-26         1197.00 Delivered                      7 Rahul Kumar
      5008 21-SEP-26          998.00 Processing                     8 Keerthana R
      5009 21-SEP-26          749.00 Shipped                        9 Vignesh M
      5010 21-SEP-26          900.00 Processing                    10 Swetha Priya

15 rows selected.

   SQL> SELECT c.Customer_ID,
  2         c.Customer_Name,
  3         o.Order_ID,
  4         TO_CHAR(o.Order_Date, 'DD-MON-YYYY') AS Order_Date,
  5         p.Product_Name,
  6         od.Quantity,
  7         od.Subtotal,
  8         py.Payment_Method,
  9         py.Payment_Status
 10  FROM BookswagonCustomer c
 11  INNER JOIN BookswagonOrders o
 12      ON c.Customer_ID = o.Customer_ID
 13  INNER JOIN BookswagonOrderDetails od
 14      ON o.Order_ID = od.Order_ID
 15  INNER JOIN BookswagonProduct p
 16      ON od.Product_ID = p.Product_ID
 17  INNER JOIN BookswagonPayment py
 18      ON o.Order_ID = py.Order_ID
 19  ORDER BY c.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME      ORDER_ID ORDER_DATE   PRODUCT_NAME                 QUANTITY  SUBTOTAL PAYMENT_METHOD  PAYMENT_STATUS
----------- ------------------ -------- ------------ ---------------------------- -------- --------- --------------- ---------------
          1 Priya                  5001 18-SEP-2026  The Alchemist                       1    450.00 UPI             Paid

SQL> SELECT c.Customer_Name,
  2         COUNT(DISTINCT o.Order_ID) AS Total_Orders,
  3         SUM(od.Subtotal) AS Total_Purchase,
  4         SUM(od.Quantity) AS Total_Products
  5  FROM BookswagonCustomer c
  6  INNER JOIN BookswagonOrders o
  7      ON c.Customer_ID = o.Customer_ID
  8  INNER JOIN BookswagonOrderDetails od
  9      ON o.Order_ID = od.Order_ID
 10  GROUP BY c.Customer_Name
 11  ORDER BY Total_Purchase DESC;

CUSTOMER_NAME        TOTAL_ORDERS TOTAL_PURCHASE TOTAL_PRODUCTS
-------------------- ------------ -------------- --------------
Priya Kumar                     1         949.00              2
Priya                           2         900.00              2
Karthik S                       1         849.00              2
Arun Kumar                      1         800.00              2
Divya Raj                       1         749.00              2
  
SQL> SELECT c.Customer_Name,
  2         o.Order_ID,
  3         TO_CHAR(o.Order_Date, 'DD-MON-YY') AS Order_Date,
  4         o.Total_Amount,
  5         py.Payment_Method,
  6         py.Payment_Amount,
  7         py.Payment_Status
  8  FROM BookswagonCustomer c
  9  INNER JOIN BookswagonOrders o
 10      ON c.Customer_ID = o.Customer_ID
 11  INNER JOIN BookswagonPayment py
 12      ON o.Order_ID = py.Order_ID
 13  ORDER BY o.Order_Date DESC;

CUSTOMER_NAME      ORDER_ID ORDER_DATE   TOTAL_AMOUNT PAYMENT_METHOD  PAYMENT_AMOUNT PAYMENT_STATUS
------------------ -------- ------------ ------------ --------------- -------------- ---------------
Priya Kumar            5002 22-SEP-26          749.00 Credit Card             898.00 Paid
Vignesh M              5009 21-SEP-26          749.00 UPI                     550.00 Paid
Keerthana R            5008 21-SEP-26          998.00 Credit Card             998.00 Paid
Swetha Priya           5010 21-SEP-26          900.00 Cash on Deliver         700.00 Failed
Karthik S              5005 20-SEP-26          899.00 Cash on Deliver        1025.00 Paid
Rahul Kumar            5007 20-SEP-26         1197.00 Net Banking             897.00 Paid
Harini Devi            5006 20-SEP-26          749.00 UPI                     450.00 Paid
Arun Kumar             5003 19-SEP-26          899.00 Debit Card             1196.00 Paid
Divya Raj              5004 19-SEP-26          775.00 UPI                     775.00 Paid
Priya                  5001 18-SEP-26         1499.00 UPI                    1250.00 Paid

10 rows selected.
