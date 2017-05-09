-- 1. create a table named student_info(id primary key set auto increment, name)

CREATE database latpaytest;

USE latpaytest;

CREATE TABLE student_info(
   ID INT NOT NULL AUTO_INCREMENT,
   NAME VARCHAR (20) NOT NULL,
   PRIMARY KEY (ID)
);

/*  SHOW TABLES;
  
	+----------------------+
	| Tables_in_latpaytest |
	+----------------------+
	| student_info         |
	+----------------------+
	1 row in set (0.00 sec)
*/

-- 2. insert into 3 rows (peter), (bob), (peter)

INSERT INTO student_info(name) values ('peter');
INSERT INTO student_info(name) values ('bob');
INSERT INTO student_info(name) values ('peter'); 

/*
	SELECT * FROM student_info;
	
	+----+-------+
	| ID | NAME  |
	+----+-------+
	|  1 | peter |
	|  2 | bob   |
	|  3 | peter |
	+----+-------+
	3 rows in set (0.00 sec) 
*/

-- 3. write a sql query to delete all duplicate name entries in student_info, keeping only unique names based on its smallest id

DELETE FROM student_info 
WHERE id NOT IN (SELECT * 
				FROM (SELECT MIN(id) 
					  FROM student_info 
					  GROUP BY name) 
				AS rowsToKeep);

/*
	SELECT * FROM student_info;
	
	+----+-------+
	| ID | NAME  |
	+----+-------+
	|  1 | peter |
	|  2 | bob   |
	+----+-------+
	2 rows in set (0.00 sec)

*/