SQL> CREATE TABLE BookswagonOrder_Item (
  2      Order_Item_ID NUMBER PRIMARY KEY,
  3      Order_ID NUMBER REFERENCES BookswagonOrders(Order_ID),
  4      Product_ID NUMBER REFERENCES BookswagonProduct(Product_ID),
  5      Quantity NUMBER NOT NULL,
  6      Price NUMBER(10,2),
  7      Total_Amount NUMBER(10,2)
  8  );

Table created.

  SQL> DESC BookswagonOrder_Item;

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ORDER_ITEM_ID                             NOT NULL NUMBER
 ORDER_ID                                           NUMBER
 PRODUCT_ID                                         NUMBER
 QUANTITY                                  NOT NULL NUMBER
 PRICE                                              NUMBER(10,2)
 TOTAL_AMOUNT                                       NUMBER(10,2)

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (1, 5001, 101, 2, 450.00, 900.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (2, 5001, 103, 1, 350.00, 350.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (3, 5002, 102, 1, 499.00, 499.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (4, 5002, 106, 1, 399.00, 399.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (5, 5003, 104, 2, 299.00, 598.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (6, 5003, 107, 1, 299.00, 299.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (7, 5004, 108, 2, 250.00, 500.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (8, 5004, 109, 1, 275.00, 275.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (9, 5005, 110, 1, 325.00, 325.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (10, 5005, 112, 2, 350.00, 700.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (11, 5006, 101, 1, 450.00, 450.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (12, 5007, 107, 3, 299.00, 897.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (13, 5008, 102, 2, 499.00, 998.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (14, 5009, 109, 2, 275.00, 550.00);

1 row created.

SQL> INSERT INTO BookswagonOrder_Item VALUES
  2  (15, 5010, 103, 2, 350.00, 700.00);

1 row created.

  SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM BookswagonOrder_Item;

ORDER_ITEM_ID   ORDER_ID PRODUCT_ID   QUANTITY      PRICE TOTAL_AMOUNT
------------- ---------- ---------- ---------- ---------- ------------
            1       5001        101          2        450          900
            2       5001        103          1        350          350
            3       5002        102          1        499          499
            4       5002        106          1        399          399
            5       5003        104          2        299          598
            6       5003        107          1        299          299
            7       5004        108          2        250          500
            8       5004        109          1        275          275
            9       5005        110          1        325          325
           10       5005        112          2        350          700
           11       5006        101          1        450          450
           12       5007        107          3        299          897
           13       5008        102          2        499          998
           14       5009        109          2        275          550
           15       5010        103          2        350          700

15 rows selected.

  SQL> UPDATE BookswagonOrder_Item
  2  SET Quantity = 3,
  3      Total_Amount = 897.00
  4  WHERE Order_Item_ID = 5;

1 row updated.

  SQL> SELECT *
  2  FROM BookswagonOrder_Item
  3  WHERE Order_Item_ID = 5;

ORDER_ITEM_ID   ORDER_ID PRODUCT_ID   QUANTITY      PRICE TOTAL_AMOUNT
------------- ---------- ---------- ---------- ---------- ------------
            5       5003        104          3        299          897

 SQL> SELECT
    c.Customer_ID AS Customer_ID,
    c.Customer_Name AS Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(o.Total_Amount) AS Total_Amount
FROM BookswagonCustomer c
JOIN BookswagonOrders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY c.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME                  TOTAL_ORDERS TOTAL_AMOUNT
----------- ------------------------------ ------------ ------------
          1 Nandhini Sri                            1         1250
          2 Priya Kumar                             1          898
          3 Arun Kumar                              1         1196
          4 Divya Raj                               1          775
          5 Karthik S                               1         1025
          6 Harini Devi                             1          450
          7 Rahul Kumar                             1          897
          8 Keerthana R                             1          998
          9 Vignesh M                               1          550
         10 Swetha Priya                            1          700

10 rows selected.
