SQL> CREATE TABLE BookswagonPayment (
  2      Payment_ID NUMBER PRIMARY KEY,
  3      Order_ID NUMBER REFERENCES BookswagonOrders(Order_ID),
  4      Payment_Date DATE NOT NULL,
  5      Payment_Method VARCHAR2(30),
  6      Payment_Amount NUMBER(10,2),
  7      Payment_Status VARCHAR2(20)
  8  );

Table created.

SQL> DESC BookswagonPayment;

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PAYMENT_ID                                NOT NULL NUMBER
 ORDER_ID                                           NUMBER
 PAYMENT_DATE                              NOT NULL DATE
 PAYMENT_METHOD                                     VARCHAR2(30)
 PAYMENT_AMOUNT                                     NUMBER(10,2)
 PAYMENT_STATUS                                     VARCHAR2(20)

SQL> INSERT INTO BookswagonPayment VALUES
  2  (1, 5001, TO_DATE('23-09-2026','DD-MM-YYYY'), 'UPI', 1250.00, 'Paid');

1 row created.

SQL> INSERT INTO BookswagonPayment VALUES
  2  (2, 5002, TO_DATE('19-09-2026','DD-MM-YYYY'), 'Credit Card', 898.00, 'Paid');

1 row created.

SQL> INSERT INTO BookswagonPayment VALUES
  2  (3, 5003, TO_DATE('20-09-2026','DD-MM-YYYY'), 'Debit Card', 1196.00, 'Paid');

1 row created.

SQL> INSERT INTO BookswagonPayment VALUES
  2  (4, 5004, TO_DATE('21-09-2026','DD-MM-YYYY'), 'UPI', 775.00, 'Paid');

1 row created.

SQL> INSERT INTO BookswagonPayment VALUES
  2  (5, 5005, TO_DATE('22-09-2026','DD-MM-YYYY'), 'Cash on Delivery', 1025.00, 'Pending');

1 row created.

SQL> INSERT INTO BookswagonPayment VALUES
  2  (6, 5006, TO_DATE('20-09-2026','DD-MM-YYYY'), 'UPI', 450.00, 'Paid');

1 row created.

SQL> INSERT INTO BookswagonPayment VALUES
  2  (7, 5007, TO_DATE('20-09-2026','DD-MM-YYYY'), 'Net Banking', 897.00, 'Paid');

1 row created.

SQL> INSERT INTO BookswagonPayment VALUES
  2  (8, 5008, TO_DATE('21-09-2026','DD-MM-YYYY'), 'Credit Card', 998.00, 'Paid');

1 row created.

SQL> INSERT INTO BookswagonPayment VALUES
  2  (9, 5009, TO_DATE('21-09-2026','DD-MM-YYYY'), 'UPI', 550.00, 'Paid');

1 row created.

SQL> INSERT INTO BookswagonPayment VALUES
  2  (10, 5010, TO_DATE('21-09-2026','DD-MM-YYYY'), 'Cash on Delivery', 700.00, 'Pending');

1 row created.

  SQL> SELECT *
  2  FROM BookswagonPayment
  3  WHERE Payment_Status = 'Paid';

PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
--------------------
         1       5001 23-SEP-26 UPI                                      1250
Paid

         2       5002 19-SEP-26 Credit Card                               898
Paid

         3       5003 20-SEP-26 Debit Card                               1196
Paid

         4       5004 21-SEP-26 UPI                                       775
Paid

         6       5006 20-SEP-26 UPI                                       450
Paid

         7       5007 20-SEP-26 Net Banking                               897
Paid

         8       5008 21-SEP-26 Credit Card                               998
Paid

         9       5009 21-SEP-26 UPI                                       550
Paid


8 rows selected.

  SQL> SELECT *
  2  FROM BookswagonPayment
  3  WHERE Payment_Status = 'Pending';

PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
--------------------
         5       5005 22-SEP-26 Cash on Delivery                         1025
Pending

        10       5010 21-SEP-26 Cash on Delivery                          700
Pending

SQL> UPDATE BookswagonPayment
  2  SET Payment_Status = 'Paid'
  3  WHERE Payment_ID = 5;

1 row updated.

  PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
--------------------
         5       5005 22-SEP-26 Cash on Delivery                         1025
Paid

SQL> SELECT
  2      Payment_Method,
  3      COUNT(*) AS Total_Transactions
  4  FROM BookswagonPayment
  5  GROUP BY Payment_Method
  6  ORDER BY Payment_Method;

PAYMENT_METHOD                 TOTAL_TRANSACTIONS
------------------------------ ------------------
Cash on Delivery                                2
Credit Card                                     2
Debit Card                                      1
Net Banking                                     1
UPI                                             4

SQL> SELECT
  2      Payment_Method,
  3      SUM(Payment_Amount) AS Total_Amount
  4  FROM BookswagonPayment
  5  WHERE Payment_Status = 'Paid'
  6  GROUP BY Payment_Method
  7  ORDER BY Payment_Method;

PAYMENT_METHOD                 TOTAL_AMOUNT
------------------------------ ------------
Cash on Delivery                       1025
Credit Card                            1896
Debit Card                             1196
Net Banking                             897
UPI                                    3025

SQL> SELECT
  2      p.Payment_ID,
  3      o.Order_ID,
  4      c.Customer_ID AS Customer_ID,
  5      c.Customer_Name AS Customer_Name,
  6      p.Payment_Method,
  7      p.Payment_Date,
  8      p.Payment_Amount,
  9      p.Payment_Status
 10  FROM BookswagonPayment p
 11  JOIN BookswagonOrders o
 12      ON p.Order_ID = o.Order_ID
 13  JOIN BookswagonCustomer c
 14      ON o.Customer_ID = c.Customer_ID
 15  ORDER BY p.Payment_Date DESC;

PAYMENT_ID   ORDER_ID CUSTOMER_ID CUSTOMER_NAME
---------- ---------- ----------- ------------------------------
PAYMENT_METHOD                 PAYMENT_D PAYMENT_AMOUNT PAYMENT_STATUS
------------------------------ --------- -------------- --------------------
         1       5001           1 Nandhini Sri
UPI                            23-SEP-26           1250 Paid

         5       5005           5 Karthik S
Cash on Delivery               22-SEP-26           1025 Paid

         4       5004           4 Divya Raj
UPI                            21-SEP-26            775 Paid

         8       5008           8 Keerthana R
Credit Card                    21-SEP-26            998 Paid

        10       5010          10 Swetha Priya
Cash on Delivery               21-SEP-26            700 Pending

         9       5009           9 Vignesh M
UPI                            21-SEP-26            550 Paid

         3       5003           3 Arun Kumar
Debit Card                     20-SEP-26           1196 Paid

         6       5006           6 Harini Devi
UPI                            20-SEP-26            450 Paid

         7       5007           7 Rahul Kumar
Net Banking                    20-SEP-26            897 Paid

         2       5002           2 Priya Kumar
Credit Card                    19-SEP-26            898 Paid


10 rows selected.
  

