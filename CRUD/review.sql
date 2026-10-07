SQL> CREATE TABLE BookswagonReview (
  2      Review_ID NUMBER PRIMARY KEY,
  3      Customer_ID NUMBER REFERENCES BookswagonCustomer(Customer_ID),
  4      Product_ID NUMBER REFERENCES BookswagonProduct(Product_ID),
  5      Review_Text VARCHAR2(500),
  6      Review_Date DATE
  7  );

Table created.

SQL> DESC BookswagonReview;
 Name                                                                                                  Null?    Type
 ----------------------------------------------------------------------------------------------------- -------- --------------------------------------------------------------------
 REVIEW_ID                                                                                             NOT NULL NUMBER
 CUSTOMER_ID                                                                                                    NUMBER
 PRODUCT_ID                                                                                                     NUMBER
 REVIEW_TEXT                                                                                                    VARCHAR2(500)
 REVIEW_DATE                                                                                                    DATE

SQL> INSERT INTO BookswagonReview VALUES
  2  (1, 1, 101, 'Excellent book and very inspiring.', TO_DATE('25-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonReview VALUES
  2  (2, 2, 102, 'Very useful book for building good habits.', TO_DATE('24-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonReview VALUES
  2  (3, 3, 103, 'Good book about personal finance.', TO_DATE('24-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonReview VALUES
  2  (4, 4, 104, 'Very inspiring and interesting biography.', TO_DATE('25-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonReview VALUES
  2  (5, 5, 108, 'A useful book for motivation.', TO_DATE('26-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonReview VALUES
  2  (6, 6, 107, 'Simple and meaningful book.', TO_DATE('26-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonReview VALUES
  2  (7, 7, 109, 'Interesting and helpful content.', TO_DATE('27-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonReview VALUES
  2  (8, 8, 111, 'Amazing story and enjoyable to read.', TO_DATE('27-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonReview VALUES
  2  (9, 9, 112, 'Good motivational book.', TO_DATE('28-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> INSERT INTO BookswagonReview VALUES
  2  (10, 10, 113, 'Very interesting and informative.', TO_DATE('28-09-2026','DD-MM-YYYY'));

1 row created.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM BookswagonReview;

REVIEW_ID CUSTOMER_ID PRODUCT_ID REVIEW_TEXT                                        REVIEW_DATE
--------- ----------- ---------- -------------------------------------------------- ------------
        1           1        101 Excellent book and very inspiring.                 25-SEP-26
        2           2        102 Very useful book for building good habits.         24-SEP-26
        3           3        103 Good book about personal finance.                  24-SEP-26
        4           4        104 Very inspiring and interesting biography.          25-SEP-26
        5           5        108 A useful book for motivation.                      26-SEP-26
        6           6        107 Simple and meaningful book.                        26-SEP-26
        7           7        109 Interesting and helpful content.                   27-SEP-26
        8           8        111 Amazing story and enjoyable to read.               27-SEP-26
        9           9        112 Good motivational book.                            28-SEP-26
       10          10        113 Very interesting and informative.                  28-SEP-26

10 rows selected.

