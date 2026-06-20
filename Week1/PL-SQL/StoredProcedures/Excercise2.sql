CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Balance NUMBER,
    AccountType VARCHAR2(20)
);


INSERT INTO Accounts VALUES (101,'Swathi',10000,'SAVINGS');
INSERT INTO Accounts VALUES (102,'Priya',15000,'SAVINGS');
INSERT INTO Accounts VALUES (103,'Anu',20000,'CURRENT');

COMMIT;

//scenario 1

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'SAVINGS';

    COMMIT;
END;
/

EXEC ProcessMonthlyInterest;

SELECT * FROM Accounts;

//scenario 2

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(50),
    Department VARCHAR2(30),
    Salary NUMBER
);

INSERT INTO Employees VALUES(1,'Ram','IT',50000);
INSERT INTO Employees VALUES(2,'Priya','IT',60000);
INSERT INTO Employees VALUES(3,'Anu','HR',45000);

COMMIT;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department IN VARCHAR2,
    p_bonus_percent IN NUMBER
)
IS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus_percent / 100)
    WHERE Department = p_department;

    COMMIT;
END;
/

EXEC UpdateEmployeeBonus('IT',10);
SELECT * FROM Employees;


//scenario 3
CREATE OR REPLACE PROCEDURE TransferFunds(
    p_fromAccount IN NUMBER,
    p_toAccount IN NUMBER,
    p_amount IN NUMBER
)
IS
    v_balance NUMBER;
BEGIN
    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_fromAccount;

    IF v_balance >= p_amount THEN

        UPDATE Accounts
        SET Balance = Balance - p_amount
        WHERE AccountID = p_fromAccount;

        UPDATE Accounts
        SET Balance = Balance + p_amount
        WHERE AccountID = p_toAccount;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer Successful');

    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
    END IF;
END;
/

SET SERVEROUTPUT ON;

EXEC TransferFunds(101,102,2000);

SELECT * FROM Accounts;




