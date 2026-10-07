SQL> CREATE TABLE BookswagonRating (
  2      Rating_ID NUMBER PRIMARY KEY,
  3      Customer_ID NUMBER REFERENCES BookswagonCustomer(Customer_ID),
  4      Product_ID NUMBER REFERENCES BookswagonProduct(Product_ID),
  5      Rating NUMBER(1) CHECK (Rating BETWEEN 1 AND 5),
  6      Rating_Date DATE
  7  );

Table created.

SQL> INSERT INTO BookswagonRating VALUES
  2  (1, 1, 101, 5, TO_DATE('25-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonRating VALUES
  2  (2, 2, 102, 5, TO_DATE('24-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonRating VALUES
  2  (3, 3, 103, 4, TO_DATE('24-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonRating VALUES
  2  (4, 4, 104, 5, TO_DATE('25-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonRating VALUES
  2  (5, 5, 108, 4, TO_DATE('26-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonRating VALUES
  2  (6, 6, 107, 5, TO_DATE('26-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonRating VALUES
  2  (7, 7, 109, 4, TO_DATE('27-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonRating VALUES
  2  (8, 8, 111, 5, TO_DATE('27-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonRating VALUES
  2  (9, 9, 112, 4, TO_DATE('28-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonRating VALUES
  2  (10, 10, 113, 5, TO_DATE('28-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      ROUND(AVG(r.Rating), 2) AS Average_Rating
  5  FROM BookswagonRating r
  6  JOIN BookswagonProduct p
  7  ON r.Product_ID = p.Product_ID
  8  GROUP BY p.Product_ID, p.Product_Name
  9  ORDER BY Average_Rating DESC;

PRODUCT_ID PRODUCT_NAME                             AVERAGE_RATING
---------- ---------------------------------------- --------------
       107 Ikigai                                                5
       104 Wings of Fire                                         5
       102 Atomic Habits                                         5
       113 The Secret                                            5
       101 The Alchemist                                         5
       111 The Hobbit                                            5
       108 Think and Grow Rich                                   4
       112 The Monk Who Sold His Ferrari                         4
       109 The Power of Your Subconscious Mind                   4
       103 The Psychology of Money                               4

10 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      ROUND(AVG(r.Rating), 2) AS Average_Rating
  5  FROM BookswagonRating r
  6  JOIN BookswagonProduct p
  7  ON r.Product_ID = p.Product_ID
  8  GROUP BY p.Product_ID, p.Product_Name
  9  HAVING AVG(r.Rating) >= 4
 10  ORDER BY Average_Rating DESC;

PRODUCT_ID PRODUCT_NAME                             AVERAGE_RATING
---------- ---------------------------------------- --------------
       107 Ikigai                                                5
       104 Wings of Fire                                         5
       102 Atomic Habits                                         5
       113 The Secret                                            5
       101 The Alchemist                                         5
       111 The Hobbit                                            5
       108 Think and Grow Rich                                   4
       112 The Monk Who Sold His Ferrari                         4
       109 The Power of Your Subconscious Mind                   4
       103 The Psychology of Money                               4

10 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      COUNT(r.Rating_ID) AS Total_Ratings,
  5      ROUND(AVG(r.Rating), 2) AS Average_Rating,
  6      MAX(r.Rating) AS Highest_Rating,
  7      MIN(r.Rating) AS Lowest_Rating
  8  FROM BookswagonProduct p
  9  JOIN BookswagonRating r
 10  ON p.Product_ID = r.Product_ID
 11  GROUP BY p.Product_ID, p.Product_Name
 12  ORDER BY Average_Rating DESC;

PRODUCT_ID PRODUCT_NAME                             TOTAL_RATINGS AVERAGE_RATING HIGHEST_RATING LOWEST_RATING
---------- ---------------------------------------- ------------- -------------- -------------- -------------
       107 Ikigai                                               1              5              5             5
       104 Wings of Fire                                        1              5              5             5
       102 Atomic Habits                                        1              5              5             5
       113 The Secret                                           1              5              5             5
       101 The Alchemist                                        1              5              5             5
       111 The Hobbit                                           1              5              5             5
       108 Think and Grow Rich                                  1              4              4             4
       112 The Monk Who Sold His Ferrari                        1              4              4             4
       109 The Power of Your Subconscious Mind                  1              4              4             4
       103 The Psychology of Money                              1              4              4             4

10 rows selected.

SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      COUNT(r.Rating_ID) AS Total_Ratings,
  5      ROUND(AVG(r.Rating), 2) AS Average_Rating,
  6      MAX(r.Rating) AS Highest_Rating,
  7      MIN(r.Rating) AS Lowest_Rating
  8  FROM BookswagonProduct p
  9  JOIN BookswagonRating r
 10  ON p.Product_ID = r.Product_ID
 11  GROUP BY p.Product_ID, p.Product_Name
 12  ORDER BY Average_Rating DESC;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_RATINGS AVERAGE_RATING HIGHEST_RATING LOWEST_RATING
------------- -------------- -------------- -------------
       107
Ikigai
            1              5              5             5

       104
Wings of Fire
            1              5              5             5

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_RATINGS AVERAGE_RATING HIGHEST_RATING LOWEST_RATING
------------- -------------- -------------- -------------

       102
Atomic Habits
            1              5              5             5

       113
The Secret

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_RATINGS AVERAGE_RATING HIGHEST_RATING LOWEST_RATING
------------- -------------- -------------- -------------
            1              5              5             5

       101
The Alchemist
            1              5              5             5

       111

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_RATINGS AVERAGE_RATING HIGHEST_RATING LOWEST_RATING
------------- -------------- -------------- -------------
The Hobbit
            1              5              5             5

       108
Think and Grow Rich
            1              4              4             4


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_RATINGS AVERAGE_RATING HIGHEST_RATING LOWEST_RATING
------------- -------------- -------------- -------------
       112
The Monk Who Sold His Ferrari
            1              4              4             4

       109
The Power of Your Subconscious Mind
            1              4              4             4

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_RATINGS AVERAGE_RATING HIGHEST_RATING LOWEST_RATING
------------- -------------- -------------- -------------

       103
The Psychology of Money
            1              4              4             4


10 rows selected.

