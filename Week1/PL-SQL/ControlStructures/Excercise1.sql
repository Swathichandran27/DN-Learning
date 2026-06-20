CREATE TABLE Customers(
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Age NUMBER,
    Balance NUMBER,
    IsVIP VARCHAR2(5)
);

SELECT TABLE_NAME
FROM USER_TABLES
WHERE TABLE_NAME = 'CUSTOMERS';


CREATE TABLE Loans(
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    InterestRate NUMBER,
    DueDate DATE,
    FOREIGN KEY(CustomerID)
    REFERENCES Customers(CustomerID)
);

INSERT INTO Customers VALUES(1,'Swathi',65,15000,'FALSE');
INSERT INTO Customers VALUES(2,'Priya',45,8000,'FALSE');
INSERT INTO Customers VALUES(3,'Anu',70,20000,'FALSE');

INSERT INTO Loans VALUES(101,1,10,SYSDATE+20);
INSERT INTO Loans VALUES(102,2,12,SYSDATE+40);
INSERT INTO Loans VALUES(103,3,11,SYSDATE+10);

COMMIT;

SELECT * FROM Loans;


//scenario 1

DECLARE
    CURSOR cust_cur IS
        SELECT CustomerID
        FROM Customers
        WHERE Age > 60;
BEGIN
    FOR rec IN cust_cur LOOP
        UPDATE Loans
        SET InterestRate = InterestRate - 1
        WHERE CustomerID = rec.CustomerID;
    END LOOP;

    COMMIT;
END;
/

SELECT * FROM Loans;

//scenario 2

BEGIN
    UPDATE Customers
    SET IsVIP = 'TRUE'
    WHERE Balance > 10000;

    COMMIT;
END;
/

select * from Customers;

SET SERVEROUTPUT ON;

//scenario 3

DECLARE
BEGIN
    FOR rec IN (
        SELECT c.Name,
               l.LoanID,
               l.DueDate
        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID
        WHERE l.DueDate <= SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: '
            || rec.Name
            || ' Loan '
            || rec.LoanID
            || ' is due on '
            || TO_CHAR(rec.DueDate,'DD-MON-YYYY')
        );
    END LOOP;
END;
/


