SQL> CREATE TABLE BookswagonOrders (
  2      Order_ID NUMBER PRIMARY KEY,
  3      Customer_ID NUMBER,
  4      Order_Date DATE NOT NULL,
  5      Total_Amount NUMBER(10,2),
  6      Order_Status VARCHAR2(20)
  7  );

Table created.

SQL> DESC BookswagonOrders;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ORDER_ID                                  NOT NULL NUMBER
 CUSTOMER_ID                                        NUMBER
 ORDER_DATE                                NOT NULL DATE
 TOTAL_AMOUNT                                       NUMBER(10,2)
 ORDER_STATUS                                       VARCHAR2(20)

SQL> INSERT INTO BookswagonOrders VALUES
  2  (5001, 1, TO_DATE('18-09-2026','DD-MM-YYYY'), 1399.00, 'Delivered');

1 row created.

SQL> 
SQL> INSERT INTO BookswagonOrders VALUES
  2  (5002, 2, TO_DATE('18-09-2026','DD-MM-YYYY'), 749.00, 'Shipped');

1 row created.

SQL> 
SQL> INSERT INTO BookswagonOrders VALUES
  2  (5003, 3, TO_DATE('19-09-2026','DD-MM-YYYY'), 848.00, 'Processing');

1 row created.

SQL> 
SQL> INSERT INTO BookswagonOrders VALUES
  2  (5004, 4, TO_DATE('19-09-2026','DD-MM-YYYY'), 775.00, 'Delivered');

1 row created.

SQL> 
SQL> INSERT INTO BookswagonOrders VALUES
  2  (5005, 5, TO_DATE('20-09-2026','DD-MM-YYYY'), 899.00, 'Shipped');

1 row created.

SQL> 
SQL> INSERT INTO BookswagonOrders VALUES
  2  (5006, 6, TO_DATE('20-09-2026','DD-MM-YYYY'), 749.00, 'Processing');

1 row created.

SQL> 
SQL> INSERT INTO BookswagonOrders VALUES
  2  (5007, 7, TO_DATE('20-09-2026','DD-MM-YYYY'), 1197.00, 'Delivered');

1 row created.

SQL> 
SQL> INSERT INTO BookswagonOrders VALUES
  2  (5008, 8, TO_DATE('21-09-2026','DD-MM-YYYY'), 998.00, 'Processing');

1 row created.

SQL> 
SQL> INSERT INTO BookswagonOrders VALUES
  2  (5009, 9, TO_DATE('21-09-2026','DD-MM-YYYY'), 749.00, 'Shipped');

1 row created.

SQL> 
SQL> INSERT INTO BookswagonOrders VALUES
  2  (5010, 10, TO_DATE('21-09-2026','DD-MM-YYYY'), 900.00, 'Processing');

1 row created.

SQL> UPDATE BookswagonOrders
  2  SET Total_Amount = 1499.00
  3  WHERE Order_ID = 5001;

1 row updated.

SQL> SELECT *
  2  FROM BookswagonOrders
  3  WHERE Order_ID = 5001;

  ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
---------- ----------- --------- ------------ --------------------
      5001           1 18-SEP-26         1499 Delivered

SQL> UPDATE BookswagonOrders
  2  SET Order_Date = TO_DATE('22-09-2026','DD-MM-YYYY')
  3  WHERE Order_ID = 5002;

1 row updated.

SQL> SELECT *
  2  FROM BookswagonOrders
  3  WHERE Order_ID = 5002;

  ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
---------- ----------- --------- ------------ --------------------
      5002           2 22-SEP-26          749 Shipped

SQL> UPDATE BookswagonOrders
  2  SET Total_Amount = 899.00
  3  WHERE Order_ID = 5003;

1 row updated.

SQL> SELECT
  2      c.Customer_ID,
  3      c.Customer_Name,
  4      o.Order_ID,
  5      o.Order_Date,
  6      oi.Product_ID,
  7      p.Product_Name,
  8      oi.Quantity,
  9      oi.Unit_Price AS Price,
 10      oi.Total_Amount
 11  FROM BookswagonCustomer c
 12  JOIN BookswagonOrders o
 13  ON c.Customer_ID = o.Customer_ID
 14  JOIN BookswagonOrder_Item oi
 15  ON o.Order_ID = oi.Order_ID
 16  JOIN BookswagonProduct p
 17  ON oi.Product_ID = p.Product_ID
 18  ORDER BY c.Customer_ID, o.Order_Date;
 19  JOIN BookswagonProduct p
 20  ON oi.Product_ID = p.Product_ID
 21  ORDER BY c.Customer_ID, o.Order_Date;
  
  CUSTOMER_ID CUSTOMER_NAME       ORDER_ID ORDER_DAT PRODUCT_ID
----------- -------------------- -------- --------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT
---------- ---------- ------------

          1 Nandhini Sri          5001 18-SEP-26        101
The Alchemist
         2        450          900

          1 Nandhini Sri          5001 18-SEP-26        102
Atomic Habits
         1        499          499


          2 Priya Kumar           5002 22-SEP-26        103
The Psychology of Money
         1        350          350

          2 Priya Kumar           5002 22-SEP-26        106
Rich Dad Poor Dad
         1        399          399


          3 Arun Kumar            5003 19-SEP-26        104
Wings of Fire
         1        299          299

          3 Arun Kumar            5003 19-SEP-26        108
Think and Grow Rich
         1        250          250

          3 Arun Kumar            5003 19-SEP-26        107
Ikigai
         1        299          299


          4 Divya Raj             5004 21-SEP-26        105
Harry Potter and the Philosopher Stone
         1        450          450

          4 Divya Raj             5004 21-SEP-26        110
Pride and Prejudice
         1        325          325


          5 Karthik S             5005 20-SEP-26        107
Ikigai
         1        299          299

          5 Karthik S             5005 20-SEP-26        108
Think and Grow Rich
         1        250          250

          5 Karthik S             5005 20-SEP-26        103
The Psychology of Money
         1        350          350


SQL> SELECT
  2      c.Customer_ID,
  3      c.Customer_Name,
  4      COUNT(o.Order_ID) AS Total_Orders,
  5      SUM(o.Total_Amount) AS Total_Amount
  6  FROM BookswagonCustomer c
  7  JOIN BookswagonOrders o
  8  ON c.Customer_ID = o.Customer_ID
  9  GROUP BY c.Customer_ID, c.Customer_Name
 10  ORDER BY c.Customer_ID;

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
TOTAL_ORDERS TOTAL_AMOUNT
------------ ------------
          1
Nandhini Sri
           1         1499

          2
Priya Kumar
           1          749

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
TOTAL_ORDERS TOTAL_AMOUNT
------------ ------------

          3
Arun Kumar
           1          899

          4
Divya Raj

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
TOTAL_ORDERS TOTAL_AMOUNT
------------ ------------
           1          775

          5
Karthik S
           1          899

          6

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
TOTAL_ORDERS TOTAL_AMOUNT
------------ ------------
Harini Devi
           1          749

          7
Rahul Kumar
           1         1197


CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
TOTAL_ORDERS TOTAL_AMOUNT
------------ ------------
          8
Keerthana R
           1          998

          9
Vignesh M
           1          749

CUSTOMER_ID
-----------
CUSTOMER_NAME
--------------------------------------------------------------------------------
TOTAL_ORDERS TOTAL_AMOUNT
------------ ------------

         10
Swetha Priya
           1          900


10 rows selected.


