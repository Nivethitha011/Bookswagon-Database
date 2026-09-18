SQL> CREATE TABLE BookswagonInventory (
  2      Inventory_ID NUMBER PRIMARY KEY,
  3      Product_ID NUMBER REFERENCES BookswagonProduct(Product_ID),
  4      Seller_ID NUMBER REFERENCES BookswagonSeller(Seller_ID),
  5      Stock_Quantity NUMBER NOT NULL,
  6      Stock_Status VARCHAR2(20) NOT NULL,
  7      Last_Updated DATE NOT NULL
  8  );

Table created.

SQL> INSERT INTO BookswagonInventory VALUES
  2  (1, 101, 1, 50, 'Available', TO_DATE('18-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonInventory VALUES
  2  (2, 102, 2, 80, 'Available', TO_DATE('18-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonInventory VALUES
  2  (3, 103, 3, 25, 'Available', TO_DATE('18-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonInventory VALUES
  2  (4, 104, 4, 40, 'Available', TO_DATE('18-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonInventory VALUES
  2  (5, 105, 5, 60, 'Available', TO_DATE('18-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonInventory VALUES
  2  (6, 106, 6, 30, 'Available', TO_DATE('18-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonInventory VALUES
  2  (8, 108, 8, 20, 'Available', TO_DATE('18-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonInventory VALUES
  2  (9, 109, 1, 55, 'Available', TO_DATE('18-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonInventory VALUES
  2  (10, 110, 2, 0, 'Unavailable', TO_DATE('18-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> SELECT
  2      s.Seller_ID,
  3      s.Seller_Name,
  4      p.Product_ID,
  5      p.Product_Name,
  6      p.Price,
  7      i.Stock_Quantity,
  8      i.Stock_Status
  9  FROM BookswagonSeller s
 10  JOIN BookswagonInventory i
 11  ON s.Seller_ID = i.Seller_ID
 12  JOIN BookswagonProduct p
 13  ON i.Product_ID = p.Product_ID
 14  ORDER BY s.Seller_ID;

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         1
Book World
       101

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
The Alchemist
       450             50 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         1
Book World
       109

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
The Power of Your Subconscious Mind
       275             55 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         2
Readers Hub
       102

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Atomic Habits
       499             80 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         2
Readers Hub
       110

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Pride and Prejudice
       325              0 Unavailable


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         3
Novel House
       103

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
The Psychology of Money
       350             25 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         4
Book Paradise
       104

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Wings of Fire
       299             40 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         5
Readers Point
       105

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Harry Potter and the Philosopher Stone
       450             60 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         6
Classic Books Store
       106

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Rich Dad Poor Dad
       399             30 Available


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
         8
Book Basket
       108

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE STOCK_QUANTITY STOCK_STATUS
---------- -------------- --------------------
Think and Grow Rich
       250             20 Available


9 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      s.Seller_Name,
  5      i.Stock_Quantity,
  6      i.Stock_Status
  7  FROM BookswagonInventory i
  8  JOIN BookswagonProduct p
  9  ON i.Product_ID = p.Product_ID
 10  JOIN BookswagonSeller s
 11  ON i.Seller_ID = s.Seller_ID
 12  WHERE i.Stock_Status = 'Available';

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       101
The Alchemist
Book World
            50 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       102
Atomic Habits
Readers Hub
            80 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       103
The Psychology of Money
Novel House
            25 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       104
Wings of Fire
Book Paradise
            40 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       105
Harry Potter and the Philosopher Stone
Readers Point
            60 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       106
Rich Dad Poor Dad
Classic Books Store
            30 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       108
Think and Grow Rich
Book Basket
            20 Available


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       109
The Power of Your Subconscious Mind
Book World
            55 Available


8 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      s.Seller_Name,
  5      i.Stock_Quantity,
  6      i.Stock_Status
  7  FROM BookswagonInventory i
  8  JOIN BookswagonProduct p
  9  ON i.Product_ID = p.Product_ID
 10  JOIN BookswagonSeller s
 11  ON i.Seller_ID = s.Seller_ID
 12  WHERE i.Stock_Status = 'Unavailable';

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
SELLER_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
       110
Pride and Prejudice
Readers Hub
             0 Unavailable


SQL> SELECT
  2      Stock_Status,
  3      COUNT(*) AS Total_Products
  4  FROM BookswagonInventory
  5  GROUP BY Stock_Status
  6  ORDER BY Stock_Status;

STOCK_STATUS         TOTAL_PRODUCTS
-------------------- --------------
Available                         8
Unavailable                       1

SQL> SELECT
  2      s.Seller_ID,
  3      s.Seller_Name,
  4      SUM(i.Stock_Quantity) AS Total_Stock
  5  FROM BookswagonSeller s
  6  JOIN BookswagonInventory i
  7  ON s.Seller_ID = i.Seller_ID
  8  GROUP BY s.Seller_ID, s.Seller_Name
  9  ORDER BY s.Seller_ID;

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
TOTAL_STOCK
-----------
         1
Book World
        105

         2
Readers Hub
         80

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
TOTAL_STOCK
-----------

         3
Novel House
         25

         4
Book Paradise

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
TOTAL_STOCK
-----------
         40

         5
Readers Point
         60

         6

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
TOTAL_STOCK
-----------
Classic Books Store
         30

         8
Book Basket
         20


7 rows selected.

SQL> SELECT
  2      COUNT(*) AS Total_Inventory,
  3      SUM(CASE
  4          WHEN Stock_Status = 'Available' THEN 1
  5          ELSE 0
  6      END) AS Available_Products,
  7      SUM(CASE
  8          WHEN Stock_Status = 'Unavailable' THEN 1
  9          ELSE 0
 10      END) AS Unavailable_Products,
 11      SUM(Stock_Quantity) AS Total_Stock
 12  FROM BookswagonInventory;

TOTAL_INVENTORY AVAILABLE_PRODUCTS UNAVAILABLE_PRODUCTS TOTAL_STOCK
--------------- ------------------ -------------------- -----------
              9                  8                    1         360

