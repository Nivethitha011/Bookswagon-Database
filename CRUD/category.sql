SQL> CREATE TABLE BookswagonCategory (
  2      Category_ID NUMBER PRIMARY KEY,
  3      Category_Name VARCHAR2(50)
  4  );

Table created.

SQL> INSERT INTO BookswagonCategory VALUES (1, 'Fiction');

1 row created.

SQL> INSERT INTO BookswagonCategory VALUES (2, 'Finance');

1 row created.

SQL> INSERT INTO BookswagonCategory VALUES (3, 'Biography');

1 row created.

SQL> INSERT INTO BookswagonCategory VALUES (4, 'Children');

1 row created.

SQL> INSERT INTO BookswagonCategory VALUES (5, 'Self Help');

1 row created.

SQL> SELECT * FROM BookswagonCategory;

CATEGORY_ID CATEGORY_NAME
----------- --------------------------------------------------
          1 Fiction
          2 Finance
          3 Biography
          4 Children
          5 Self Help

SQL> UPDATE BookswagonCategory
  2  SET Category_Name = 'Popular Fiction'
  3  WHERE Category_ID = 1;

1 row updated.

SQL> UPDATE BookswagonCategory
  2  SET Category_Name = 'Personal Finance'
  3  WHERE Category_ID = 2;

1 row updated.

SQL> DELETE FROM BookswagonCategory
  2  WHERE Category_ID = 5;

1 row deleted.

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

