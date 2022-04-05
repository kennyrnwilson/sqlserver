# Data Definition

The following sections show how to perform various aspects of data definition. We can run up a working SQL server instance on which contains a ScratchDb database by using the command 

```
docker-compose up --build
```

from the folder ../docker

Once running connect to localhost from Microsoft SQL Server Management Studio using the login **sa** and the password **DatabasePassw0rd**

## Create Table (If it does not exist)
The following creates a simple table    

```sql
DROP TABLE IF EXISTS Person

CREATE TABLE Person2
(
    FirstName VARCHAR(32),
    SecondName VARCHAR(32)
)
```

## Primary Key Constraints
A table can have only one primary key constraint and all columns which form part of the primary key must be non-null. When one creates a primary key on the table SQL Server will create a unique clustered index on the table unless we explicitly specify a non-clustered index. 

```sql
DROP TABLE IF EXISTS EMPLOYEE;

CREATE TABLE EMPLOYEE
(
    FIRSTNAME varchar(25) NOT NULL,
    SURNAME varchar(25) NOT NULL,
    CONSTRAINT PK_EMPLOYEE_SURNAME_FIRSTNAME PRIMARY KEY CLUSTERED (SURNAME, FIRSTNAME)
);
```

We can then insert names legally as follows. 

```sql
DELETE EMPLOYEE
INSERT INTO EMPLOYEE 
    (FIRSTNAME, SURNAME)
VALUES
    ('Kenny', 'Wilson' ),
    ('Kenny', 'Smith' );
```

But the following is a problem
```sql
DELETE EMPLOYEE
INSERT INTO EMPLOYEE 
    (FIRSTNAME, SURNAME)
VALUES
    ('Kenny', 'Wilson' ),
    ('Kenny', 'Wilson' );
```

and the database tells us

```
 Cannot insert duplicate key in object 'dbo.EMPLOYEE'. The duplicate key value is (Wilson, Kenny).
```

## Unique Constraints
[See](./unique-constraint-example.sql)

A unique constraint allows us to specify alternate keys as we can have multiple unique constraints on the same table. Unique constraints can be on columns that are not restricted to NON NULL but SQL servers implements unique constraints such that only one row can be null on that column. 

```sql
DROP TABLE IF EXISTS EMPLOYEE;

CREATE TABLE EMPLOYEE
(
    FIRSTNAME VARCHAR(32) NOT NULL,
    SURNAME VARCHAR(32) NOT NULL,
    SSID VARCHAR(32) NOT NULL,
    CONSTRAINT PK_EMPLOYEE_SURNAME_FIRSTNAME
        PRIMARY KEY CLUSTERED
        (
            SURNAME,
            FIRSTNAME
        ),
    CONSTRAINT UNQ_EMPLOYEE_SSID
        UNIQUE (SSID)
);
```

The following is ok 
```sql
INSERT INTO EMPLOYEE
(
    FIRSTNAME,
    SURNAME,
    SSID
)
VALUES
('Kenny', 'Wilson', 'SS123'),
('Kenny', 'Smith', 'SS456');

```

But this fails

```sql
INSERT INTO EMPLOYEE
(
    FIRSTNAME,
    SURNAME,
    SSID
)
VALUES
('John', 'Wilson', 'SS123');
```

with the error

```
Violation of UNIQUE KEY constraint 'UNQ_EMPLOYEE_SSID'. Cannot insert duplicate key in object 'dbo.EMPLOYEE'. The duplicate key value is (SS123).
```
