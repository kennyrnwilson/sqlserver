-- Create the table, dropping first if need be
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

-- Clear any rows if there are any
DELETE EMPLOYEE

-- Insert some valid rows
INSERT INTO EMPLOYEE
(
    FIRSTNAME,
    SURNAME,
    SSID
)
VALUES
('Kenny', 'Wilson', 'SS123'),
('Kenny', 'Smith', 'SS456');

-- Insert Invalid data
INSERT INTO EMPLOYEE
(
    FIRSTNAME,
    SURNAME,
    SSID
)
VALUES
('John', 'Wilson', 'SS123')
