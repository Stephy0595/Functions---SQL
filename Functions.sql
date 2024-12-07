CREATE DATABASE Assignment7;

USE Assignment7;

CREATE TABLE Country (
Id INT PRIMARY KEY, 
Country_name VARCHAR(40), 
Population INT,
    Area FLOAT);

INSERT INTO Country (
Id, 
Country_name, 
Population, 
Area)
VALUES
(1, 'Japan', 123753041, 364555),
(2, 'Australia', 26713205, 26713205),
(3, 'Switzerland', 8921981, 39516),
(4, 'Russia', 144820423, 16376870),
(5, 'Canada', 39742430, 1943950),
(6, 'Ireland', 5255017, 68890),
(7, 'UK', 69138192, 241930),
(8, 'USA',345426571, 298170),
(9, 'Germany', 84552242, 348560),
(10, 'India', 1450935791, 2973190);

SELECT * FROM Country;

CREATE TABLE Persons (
Id INT PRIMARY KEY, 
 Fname VARCHAR(60), 
 Lname VARCHAR(60),
    Population INT, 
    Rating FLOAT, 
    Country_Id INT, 
    Country_name VARCHAR(60),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id));
    
    
    INSERT INTO Persons (
    Id, 
    Fname, 
    Lname, 
    Population, 
    Rating, 
    Country_Id, 
    Country_name) VALUES
(1, 'Finny', 'Louis', 53429, 4.7,9, 'Germany'),
(2, 'Noah', 'Mathew', 1203, 4.2, 8, 'Ireland'),
(3, 'Robert', 'John', 64790, 3.3, 1,NULL),
(4, 'Lucy', 'Lawrence', 40639, 4.9, 6, 'Canada'),
(5, 'Hridya', 'Jacob', 73698, 4.2, 1, 'India'),
(6, 'Rupith', 'Mathew', 2004, 3.9, 2, 'Switzerland'),
(7, 'Rony','Varghese', 10479, 4, 3, 'Australia'),
(8, 'Emma', 'Thompson', 69804, 4.9, 5, 'UK'),
(9, 'Christy', 'Jacob', 470, 3.4, 2, NULL),
(10, 'Richard', 'Mathew', 83697, 4.6,5 ,'USA');

SELECT * FROM Persons;

ALTER TABLE Persons
ADD DOB DATE;

UPDATE Persons
SET DOB = '1989-08-24'
WHERE Id = 1;

UPDATE Persons
SET DOB = '1993-02-25'
WHERE Id = 2;

UPDATE Persons
SET DOB = '1999-10-09'
WHERE Id = 3;

UPDATE Persons
SET DOB = '1997-05-13'
WHERE Id = 4;

UPDATE Persons
SET DOB = '1988-01-07'
WHERE Id = 5;

UPDATE Persons
SET DOB = '1985-07-21'
WHERE Id = 6;

UPDATE Persons
SET DOB = '1994-03-26'
WHERE Id = 7;

UPDATE Persons
SET DOB = '1990-11-01'
WHERE Id = 8;

UPDATE Persons
SET DOB = '1991-02-13'
WHERE Id = 9;

UPDATE Persons
SET DOB = '1995-10-15'
WHERE Id = 10;

DELIMITER $$

CREATE FUNCTION Calculate_Age(DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    RETURN age;
END $$

DELIMITER ;

SELECT Fname, Lname, DOB, Calculate_Age(DOB) AS Age
FROM Persons;

SELECT Country_name, LENGTH(Country_name) AS Country_Name_Length
FROM Country;

SELECT Country_name, LEFT(Country_name, 3) AS First_Three_Chars
FROM Country;

SELECT Country_name, UPPER(Country_name) AS Uppercase_Name
FROM Country;

SELECT Country_name, LOWER(Country_name) AS Lowercase_Name
FROM Country;