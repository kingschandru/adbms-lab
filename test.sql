CREATE TABLE salesman (
  salesman_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  city VARCHAR(30),
  commission decimal(10,2),
  yr int(20)
);

INSERT INTO salesman VALUES(5001,'James Hoog','New York',0.15,2023);
INSERT INTO salesman VALUES(5002,'Nail Knite','Paris',0.13,2022);
INSERT INTO salesman VALUES(5005,'Pit Alex','London',0.11,2023);
INSERT INTO salesman VALUES(5006,'Mc Lyon','Paris',0.14,2022);
INSERT INTO salesman VALUES(5003,'Lauson Hen','',0.12,2022);
INSERT INTO salesman VALUES(5007,'Paul Adam','Rome',0.13,2023);
SELECT * FROM salesman;


CREATE TABLE customer1 (
  customer_id INTEGER PRIMARY KEY,
  customer_name TEXT NOT NULL,
  city VARCHAR(30),
  grade INTEGER,
  salesman_id INTEGER,
  CONSTRAINT FK_sales FOREIGN KEY (salesman_id)
  REFERENCES salesman(salesman_id)
);

INSERT INTO customer1 VALUES(3002,'Nick Rimando','New York',100,5001);
INSERT INTO customer1 VALUES(3005,'Graham Zusi','California',200,5002);
INSERT INTO customer1 VALUES(3001,'Brad Guzan','London',NULL,NULL);

SELECT * FROM customer1;


CREATE TABLE order1(
  order_no INTEGER PRIMARY KEY,
  purch_amt float,
  order_date DATE NOT NULL,
  customer_id INTEGER,
  salesman_id INTEGER,
  CONSTRAINT FK_cus FOREIGN KEY (customer_id)
  REFERENCES customer1(customer_id),
  CONSTRAINT FK_sale FOREIGN KEY (salesman_id)
  REFERENCES salesman(salesman_id)
);

INSERT INTO order1 VALUES(70001,150.5,'2016-10-05',3005,5002);
INSERT INTO order1 VALUES(70009,270.65,'2016-09-10',3001,NULL);
INSERT INTO order1 VALUES(70002,65.26,'2016-10-05',3002,5001);
SELECT * FROM order1;

SELECT name,commission
FROM salesman;

SELECT DISTINCT salesman_id
FROM order1;

SELECT name,city
FROM salesman
WHERE city='Paris';

SELECT*
FROM customer1
WHERE grade=200;

SELECT order_no,order_date,purch_amt
FROM order1
WHERE salesman_id=5001;

SELECT city
FROM salesman
WHERE salesman_id=5005
AND commission = 0.11;

SELECT *
FROM salesman
WHERE city like 'Paris%';

SELECT *
FROM salesman
WHERE(name='Mc Lyon'AND city='Paris')
UNION
(SELECT*
    FROM salesman
    WHERE(name='Pit Alex' AND city ='London')
    );

SELECT*FROM salesman WHERE yr=2023 AND city not in ('Paris');


CREATE TABLE CUSTOMERS 
(
   ID INT NOT NULL,
   NAME VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);

INSERT INTO CUSTOMERS VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );
INSERT INTO CUSTOMERS VALUES(2, 'Khilan', 25, 'Delhi', 1500.00 );
INSERT INTO CUSTOMERS VALUE( 3,  'Kaushik',  23, 'Kota', 2000.00 );
INSERT INTO CUSTOMERS VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00);

SELECT * FROM CUSTOMERS;

CREATE TABLE CUSTOMERS_BACKUP 
(
   ID INT NOT NULL,
   NAME VARCHAR (20) NOT NULL,
   PRIMARY KEY (ID)
);

DELIMITER //
CREATE PROCEDURE FetchCustomers()
BEGIN
   DECLARE done INT DEFAULT FALSE;
   DECLARE customer_id INT;
   DECLARE customer_name VARCHAR(255);
   DECLARE auto_id INT; 

   
   DECLARE MY_CURSOR CURSOR FOR
   SELECT id, name FROM CUSTOMERS;

  
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

   
   OPEN MY_CURSOR;

   
   read_loop: LOOP
      FETCH MY_CURSOR INTO customer_id, customer_name;
      IF done = 1 THEN
         LEAVE read_loop;
      END IF;

      
      INSERT INTO customers_backup VALUES
      (
        customer_id, 
        customer_name
      );
		        
     
      SET auto_id = LAST_INSERT_ID();

   END LOOP;
	
    
    CLOSE MY_CURSOR;
END //
DELIMITER ;

CALL FetchCustomers();

SELECT * FROM CUSTOMERS_BACKUP;