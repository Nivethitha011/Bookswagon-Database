SQL> CREATE TABLE BookswagonProduct (
  2      Product_ID NUMBER PRIMARY KEY,
  3      Product_Name VARCHAR2(100),
  4      Category_ID NUMBER,
  5      Price NUMBER(10,2),
  6      Stock NUMBER,
  7      CONSTRAINT fk2_product_category
  8          FOREIGN KEY (Category_ID)
  9          REFERENCES BookswagonCategory(Category_ID)
 10  );

Table created.

SQL> INSERT INTO BookswagonProduct VALUES (101, 'The Alchemist', 1, 399.00, 50);

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (102, 'Atomic Habits', 1, 499.00, 35);

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (103, 'The Psychology of Money', 2, 350.00, 25);

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (104, 'Wings of Fire', 3, 299.00, 40);

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (105, 'Harry Potter and the Philosopher Stone', 4, 450.00, 60);

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (106, 'Rich Dad Poor Dad', 2, 399.00, 30);

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (107, 'Ikigai', 5, 299.00, 45);

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (108, 'Think and Grow Rich', 2, 250.00, 20);

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (109, 'The Power of Your Subconscious Mind', 2, 275.00, 55);

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (110, 'Pride and Prejudice', 4, 325.00, 30);

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (111, 'The Hobbit', 4, 499.00, 70);

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (112, 'The Monk Who Sold His Ferrari', 5, 350.00, 28); 

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (113, 'The Secret', 5, 399.00, 22);

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (114, 'Do Epic Shit', 5, 299.00, 40);

1 row created.

SQL> INSERT INTO BookswagonProduct VALUES (115, 'The 5 AM Club', 5, 399.00, 18);

1 row created.

SQL> DELETE FROM BookswagonProduct
  2  WHERE Category_ID = 5;

5 rows deleted.

SQL> SELECT
  2      c.Category_ID,
  3      c.Category_Name,
  4      p.Product_ID,
  5      p.Product_Name,
  6      p.Price,
  7      p.Stock
  8  FROM BookswagonCategory c
  9  JOIN BookswagonProduct p
 10  ON c.Category_ID = p.Category_ID
 11  ORDER BY c.Category_Name, p.Product_Name;

CATEGORY_ID CATEGORY_NAME                                      PRODUCT_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------
          3 Biography                                                 104
Wings of Fire
       299         40

          4 Children                                                  105
Harry Potter and the Philosopher Stone
       450         60

CATEGORY_ID CATEGORY_NAME                                      PRODUCT_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------

          4 Children                                                  110
Pride and Prejudice
       325         30

          4 Children                                                  111
The Hobbit

CATEGORY_ID CATEGORY_NAME                                      PRODUCT_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------
       499         70

          2 Personal Finance                                          106
Rich Dad Poor Dad
       399         30

          2 Personal Finance                                          109

CATEGORY_ID CATEGORY_NAME                                      PRODUCT_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------
The Power of Your Subconscious Mind
       275         55

          2 Personal Finance                                          103
The Psychology of Money
       350         25


CATEGORY_ID CATEGORY_NAME                                      PRODUCT_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------
          2 Personal Finance                                          108
Think and Grow Rich
       250         20

          1 Popular Fiction                                           102
Atomic Habits
       499         35

CATEGORY_ID CATEGORY_NAME                                      PRODUCT_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------

          1 Popular Fiction                                           101
The Alchemist
       399         50


10 rows selected.

SQL> SELECT
  2      c.Category_ID,
  3      c.Category_Name,
  4      COUNT(p.Product_ID) AS Total_Products
  5  FROM BookswagonCategory c
  6  LEFT JOIN BookswagonProduct p
  7  ON c.Category_ID = p.Category_ID
  8  GROUP BY c.Category_ID, c.Category_Name
  9  ORDER BY c.Category_ID;

CATEGORY_ID CATEGORY_NAME                                      TOTAL_PRODUCTS
----------- -------------------------------------------------- --------------
          1 Popular Fiction                                                 2
          2 Personal Finance                                                4
          3 Biography                                                       1
          4 Children                                                        3

