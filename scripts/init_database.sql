-- Checks whether the database already exists, and if it exists, deletes it and creates a new one
if exists (select 1 from sys.databases where name='Datawarehouse')
BEGIN
	ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE Datawarehouse;
END;

-- It is like a separator. It tells SQL to execute the first batch completely before going to the next one
GO

USE master;
CREATE DATABASE Datawarehouse;
USE Datawarehouse;

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO 
CREATE SCHEMA gold;
GO 

--It is used to view the schemas created 
SELECT * FROM sys.schemas;
