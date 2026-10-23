SQL> SELECT *
  2  FROM Book;

BOOK_ID TITLE                          AUTHOR               CATEGORY_ID      PRICE      STOCK
------- ------------------------------ -------------------- ----------- ---------- ----------
    101 The Alchemist                  Paulo Coelho                   1     299.00         50
    102 Atomic Habits                  James Clear                    2     499.00         35
    103 Database System Concepts       Silberschatz                   3     850.00         25
    104 Panchatantra Stories           Vishnu Sharma                  4     199.00         40
    106 The Kite Runner                Khaled Hosseini                1     350.00         30
    107 Think and Grow Rich            Napoleon Hill                  2     275.00         45
    108 Let Us C                       Yashavant Kanetkar             3     450.00         20
    109 Wings of Fire                  APJ Abdul Kalam                2     325.00         55
    110 Harry Potter Stone             J.K. Rowling                   1     599.00         30
    112 Fundamentals of DBMS           Elmasri Navathe                3     950.00         28
    113 The Jungle Book                Rudyard Kipling                4     225.00         22
    114 Ponniyin Selvan                Kalki                          1     699.00         40

12 rows selected.

SQL> SELECT Book_ID, Title, Price
  2  FROM Book;

BOOK_ID TITLE                               PRICE
------- ------------------------------ ----------
    101 The Alchemist                      299.00
    102 Atomic Habits                      499.00
    103 Database System Concepts           850.00
    104 Panchatantra Stories               199.00
    106 The Kite Runner                    350.00
    107 Think and Grow Rich                275.00
    108 Let Us C                           450.00
    109 Wings of Fire                      325.00
    110 Harry Potter Stone                 599.00
    112 Fundamentals of DBMS               950.00
    113 The Jungle Book                    225.00
    114 Ponniyin Selvan                    699.00

12 rows selected.

SQL> SELECT Book_ID, Title, Price
  2  FROM Book
  3  WHERE Price < 1000;

BOOK_ID TITLE                               PRICE
------- ------------------------------ ----------
    101 The Alchemist                      299.00
    102 Atomic Habits                      499.00
    103 Database System Concepts           850.00
    104 Panchatantra Stories               199.00
    106 The Kite Runner                    350.00
    107 Think and Grow Rich                275.00
    108 Let Us C                           450.00
    109 Wings of Fire                      325.00
    110 Harry Potter Stone                 599.00
    112 Fundamentals of DBMS               950.00
    113 The Jungle Book                    225.00
    114 Ponniyin Selvan                    699.00

12 rows selected.

SQL> SELECT Book_ID, Title, Price
  2  FROM Book
  3  WHERE Price > 100;

BOOK_ID TITLE                               PRICE
------- ------------------------------ ----------
    101 The Alchemist                      299.00
    102 Atomic Habits                      499.00
    103 Database System Concepts           850.00
    104 Panchatantra Stories               199.00
    106 The Kite Runner                    350.00
    107 Think and Grow Rich                275.00
    108 Let Us C                           450.00
    109 Wings of Fire                      325.00
    110 Harry Potter Stone                 599.00
    112 Fundamentals of DBMS               950.00
    113 The Jungle Book                    225.00
    114 Ponniyin Selvan                    699.00

12 rows selected.

SQL> SELECT Book_ID, Title, Price
  2  FROM Book
  3  ORDER BY Price ASC;

BOOK_ID TITLE                               PRICE
------- ------------------------------ ----------
    104 Panchatantra Stories               199.00
    113 The Jungle Book                    225.00
    107 Think and Grow Rich                275.00
    101 The Alchemist                      299.00
    109 Wings of Fire                      325.00
    106 The Kite Runner                    350.00
    108 Let Us C                           450.00
    102 Atomic Habits                      499.00
    110 Harry Potter Stone                 599.00
    114 Ponniyin Selvan                    699.00
    103 Database System Concepts           850.00
    112 Fundamentals of DBMS               950.00

12 rows selected.

SQL> SELECT Book_ID, Title, Price
  2  FROM Book
  3  ORDER BY Price DESC;

BOOK_ID TITLE                               PRICE
------- ------------------------------ ----------
    112 Fundamentals of DBMS               950.00
    103 Database System Concepts           850.00
    114 Ponniyin Selvan                    699.00
    110 Harry Potter Stone                 599.00
    102 Atomic Habits                      499.00
    108 Let Us C                           450.00
    106 The Kite Runner                    350.00
    109 Wings of Fire                      325.00
    101 The Alchemist                      299.00
    107 Think and Grow Rich                275.00
    113 The Jungle Book                    225.00
    104 Panchatantra Stories               199.00

12 rows selected.

SQL> SELECT DISTINCT
  2      c.Category_ID,
  3      c.Category_Name
  4  FROM Book b
  5  JOIN Category c
  6      ON b.Category_ID = c.Category_ID
  7  ORDER BY c.Category_ID;

CATEGORY_ID CATEGORY_NAME
----------- --------------------------------------------------
          1 Fiction
          2 Self-Help
          3 Academic
          4 Children

4 rows selected.

SQL> SELECT Book_ID, Title, Price
  2  FROM Book
  3  WHERE Price BETWEEN 100 AND 400
  4  ORDER BY Price ASC;

BOOK_ID TITLE                               PRICE
------- ------------------------------ ----------
    104 Panchatantra Stories               199.00
    113 The Jungle Book                    225.00
    107 Think and Grow Rich                275.00
    101 The Alchemist                      299.00
    109 Wings of Fire                      325.00
    106 The Kite Runner                    350.00

6 rows selected.

SQL> SELECT
  2      b.Book_ID,
  3      b.Title,
  4      c.Category_Name,
  5      b.Price
  6  FROM Book b
  7  JOIN Category c
  8      ON b.Category_ID = c.Category_ID
  9  WHERE c.Category_ID = 1;

BOOK_ID TITLE                          CATEGORY_NAME                                            PRICE
------- ------------------------------ -------------------------------------------------- -----------
    101 The Alchemist                  Fiction                                                299.00
    106 The Kite Runner                Fiction                                                350.00
    110 Harry Potter Stone             Fiction                                                599.00
    114 Ponniyin Selvan                Fiction                                                699.00

4 rows selected.

SQL> SELECT *
  2  FROM Customer;

CUSTOMER_ID CUSTOMER_NAME                  EMAIL                            PHONE_NO ADDRESS
----------- ------------------------------ ------------------------------ ---------- --------------------------------------------------
          1 Nivethitha                     nivethitha@gmail.com           9876543210 Chennai
          2 Hema                           hema@gmail.com                 9876501234 Chennai
          3 Ravi                           ravi@gmail.com                 9987654321 Chengalpattu
          4 Karthik                        karthik@gmail.com              9876543211 Coimbatore
          5 Priya                          priya@gmail.com                8765432109 Salem
          6 Divya                          divya@gmail.com                7654321098 Trichy
          7 Arun                           arun@gmail.com                 6543210987 Vellore
          8 Meena                          meena@gmail.com                9432109876 Tirunelveli
          9 Nisha                          nisha@gmail.com                9210987654 Madurai

9 rows selected.

SQL> SELECT *
  2  FROM Customer
  3  WHERE Customer_ID = 1;

CUSTOMER_ID CUSTOMER_NAME                  EMAIL                            PHONE_NO ADDRESS
----------- ------------------------------ ------------------------------ ---------- --------------------------------------------------
          1 Nivethitha                     nivethitha@gmail.com           9876543210 Chennai

1 row selected.

SQL> SELECT Book_ID, Title, Price, Stock
  2  FROM Book
  3  WHERE Price < 500
  4  AND Stock > 30;

BOOK_ID TITLE                               PRICE      STOCK
------- ------------------------------ ---------- ----------
    101 The Alchemist                      299.00         50
    102 Atomic Habits                      499.00         35
    104 Panchatantra Stories               199.00         40
    107 Think and Grow Rich                275.00         45
    109 Wings of Fire                      325.00         55

5 rows selected.

SQL> SELECT
  2      b.Book_ID,
  3      b.Title,
  4      c.Category_Name,
  5      b.Price
  6  FROM Book b
  7  JOIN Category c
  8      ON b.Category_ID = c.Category_ID
  9  WHERE b.Category_ID = 1
 10     OR b.Category_ID = 4;

BOOK_ID TITLE                          CATEGORY_NAME                                            PRICE
------- ------------------------------ -------------------------------------------------- -----------
    101 The Alchemist                  Fiction                                                299.00
    106 The Kite Runner                Fiction                                                350.00
    110 Harry Potter Stone             Fiction                                                599.00
    114 Ponniyin Selvan                Fiction                                                699.00
    104 Panchatantra Stories           Children                                               199.00
    113 The Jungle Book                Children                                               225.00

6 rows selected.

SQL> SELECT
  2      b.Book_ID,
  3      b.Title,
  4      c.Category_Name,
  5      b.Price
  6  FROM Book b
  7  JOIN Category c
  8      ON b.Category_ID = c.Category_ID
  9  WHERE b.Category_ID IN (2, 3);

BOOK_ID TITLE                          CATEGORY_NAME                                            PRICE
------- ------------------------------ -------------------------------------------------- -----------
    102 Atomic Habits                  Self-Help                                              499.00
    107 Think and Grow Rich            Self-Help                                              275.00
    109 Wings of Fire                  Self-Help                                              325.00
    103 Database System Concepts       Academic                                               850.00
    108 Let Us C                       Academic                                               450.00
    112 Fundamentals of DBMS           Academic                                               950.00

6 rows selected.

SQL> SELECT Book_ID, Title, Price
  2  FROM Book
  3  WHERE Price BETWEEN 100 AND 400
  4  ORDER BY Price ASC;

BOOK_ID TITLE                               PRICE
------- ------------------------------ ----------
    104 Panchatantra Stories               199.00
    113 The Jungle Book                    225.00
    107 Think and Grow Rich                275.00
    101 The Alchemist                      299.00
    109 Wings of Fire                      325.00
    106 The Kite Runner                    350.00

6 rows selected.

SQL> SELECT Book_ID, Title, Price
  2  FROM Book
  3  ORDER BY Price DESC;

BOOK_ID TITLE                               PRICE
------- ------------------------------ ----------
    112 Fundamentals of DBMS               950.00
    103 Database System Concepts           850.00
    114 Ponniyin Selvan                    699.00
    110 Harry Potter Stone                 599.00
    102 Atomic Habits                      499.00
    108 Let Us C                           450.00
    106 The Kite Runner                    350.00
    109 Wings of Fire                      325.00
    101 The Alchemist                      299.00
    107 Think and Grow Rich                275.00
    113 The Jungle Book                    225.00
    104 Panchatantra Stories               199.00

12 rows selected.

SQL> SELECT
  2      c.Customer_ID,
  3      c.Customer_Name,
  4      o.Order_ID,
  5      o.Order_Date,
  6      o.Total_Amount,
  7      o.Order_Status
  8  FROM Customer c
  9  JOIN Orders o
 10      ON c.Customer_ID = o.Customer_ID
 11  ORDER BY c.Customer_ID, o.Order_Date;

CUSTOMER_ID CUSTOMER_NAME                    ORDER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
----------- ------------------------------ ---------- --------- ------------ --------------------
          1 Nivethitha                           1001 12-OCT-26          873 Delivered
          2 Hema                                 1002 12-OCT-26         1149 Shipped
          3 Ravi                                 1003 13-OCT-26          850 Processing
          4 Karthik                              1004 13-OCT-26          947 Delivered
          5 Priya                                1005 14-OCT-26         1049 Shipped
          6 Divya                                1006 14-OCT-26          950 Processing
          7 Arun                                 1007 15-OCT-26         1149 Delivered
          8 Meena                                1008 15-OCT-26         1297 Processing
          9 Nisha                                1009 16-OCT-26          550 Processing

9 rows selected.

SQL> SELECT
  2      b.Book_ID,
  3      b.Title,
  4      o.Order_ID,
  5      oi.Quantity,
  6      oi.Price,
  7      oi.Total_Amount
  8  FROM Book b
  9  JOIN Order_Item oi
 10      ON b.Book_ID = oi.Book_ID
 11  JOIN Orders o
 12      ON oi.Order_ID = o.Order_ID
 13  ORDER BY b.Book_ID, o.Order_ID;

BOOK_ID TITLE                          ORDER_ID   QUANTITY       PRICE TOTAL_AMOUNT
------- ------------------------------ ---------- ---------- ----------- ------------
    101 The Alchemist                      1001          2      299.00          598
    101 The Alchemist                      1008          1      299.00          299
    102 Atomic Habits                      1002          1      499.00          499
    102 Atomic Habits                      1008          2      499.00          998
    103 Database System Concepts           1003          1      850.00          850
    104 Panchatantra Stories               1004          3      199.00          597
    106 The Kite Runner                    1004          1      350.00          350
    107 Think and Grow Rich                1001          1      275.00          275
    107 Think and Grow Rich                1009          2      275.00          550
    108 Let Us C                           1005          1      450.00          450
    109 Wings of Fire                      1002          2      325.00          650
    110 Harry Potter Stone                 1005          1      599.00          599
    112 Fundamentals of DBMS               1006          1      950.00          950
    113 The Jungle Book                    1007          2      225.00          450
    114 Ponniyin Selvan                    1007          1      699.00          699

15 rows selected.

SQL> SELECT
  2      c.Customer_ID,
  3      c.Customer_Name,
  4      COUNT(o.Order_ID) AS Total_Orders
  5  FROM Customer c
  6  LEFT JOIN Orders o
  7      ON c.Customer_ID = o.Customer_ID
  8  GROUP BY c.Customer_ID, c.Customer_Name
  9  ORDER BY c.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME                  TOTAL_ORDERS
----------- ------------------------------ ------------
          1 Nivethitha                                1
          2 Hema                                      1
          3 Ravi                                      1
          4 Karthik                                   1
          5 Priya                                     1
          6 Divya                                     1
          7 Arun                                      1
          8 Meena                                     1
          9 Nisha                                     1

9 rows selected.

SQL> SELECT
  2      c.Customer_ID,
  3      c.Customer_Name,
  4      SUM(o.Total_Amount) AS Total_Purchase_Amount
  5  FROM Customer c
  6  JOIN Orders o
  7      ON c.Customer_ID = o.Customer_ID
  8  GROUP BY
  9      c.Customer_ID,
 10      c.Customer_Name
 11  ORDER BY c.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME                  TOTAL_PURCHASE_AMOUNT
----------- ------------------------------ ---------------------
          1 Nivethitha                                       873
          2 Hema                                            1149
          3 Ravi                                             850
          4 Karthik                                          947
          5 Priya                                           1049
          6 Divya                                            950
          7 Arun                                            1149
          8 Meena                                           1297
          9 Nisha                                            550

9 rows selected.
