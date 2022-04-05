# Stored Procedures

The following sections show how to perform various aspects of data definition. We can run up a working SQL server instance on which contains a ScratchDb database by using the command 

```
docker-compose up --build
```
from the folder ../docker

Once running connect to localhost from Microsoft SQL Server Management Studio using the login **sa** and the password **DatabasePassw0rd**


## In and out params
```sql
CREATE OR ALTER PROC SHOW_ALL
    @MY_IN_PARAM INT,
    @MY_OUT_PARAM INT OUTPUT
AS
SET @MY_OUT_PARAM = 10 * @MY_IN_PARAM
GO

DECLARE @MY_OUT INT;

EXEC SHOW_ALL @MY_IN_PARAM = 3, @MY_OUT_PARAM = @MY_OUT OUTPUT
SELECT @MY_OUT
```

The output of this is then 
```
30
```
## Return result sets
We can get a proc to return multiple result sets. 

```sql
CREATE TABLE MY_INTS (VAL INT NOT NULL);
INSERT INTO MY_INTS VALUES (1), (3), (5);

CREATE OR ALTER PROC GET_RESULT_SETS
AS
SELECT * FROM MY_INTS;	
GO

CREATE TABLE #TEMP_TAB (VAL INT NOT NULL);
INSERT INTO #TEMP_TAB EXEC GET_RESULT_SETS;
SELECT * FROM #TEMP_TAB;
```