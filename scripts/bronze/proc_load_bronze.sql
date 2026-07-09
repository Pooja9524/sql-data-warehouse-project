CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN

PRINT '==========================================================='
PRINT 'LOADING BRONZE LAYER'
PRINT '==========================================================='

PRINT'------------------------------------------------------------'
PRINT'LOADING CRM TABLE'
PRINT'------------------------------------------------------------'
--INSERTING THE DATA IN BULK FROM A CSV FILE
--Truncate the table first to remove existing data (full load approach)
PRINT'>> TRUNCATING TABLE: bronze.crm_cust_info';
TRUNCATE TABLE bronze.crm_cust_info;
--Then bulk insert fresh data from the CRM source CSV file
--FIRSTROW=2 skips the header row, FIELDTERMINATOR=',' matches the CSV format, 
--TABLOCK improves load performance
PRINT'>> INSERTING DATA INTO: bronze.crm_cust_info';
BULK INSERT  bronze.crm_cust_info
FROM 'C:\Users\Pooja.Jaisankar\Documents\Data WareHouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);

SELECT COUNT(*) FROM bronze.crm_cust_info;

PRINT'>>TRUNCATING TABLE: bronze.crm_prd_info';
TRUNCATE TABLE bronze.crm_prd_info;
PRINT'>>INSERTING DATA INTO: bronze.crm_prd_info';
BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\Pooja.Jaisankar\Documents\Data WareHouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);

SELECT COUNT(*) FROM bronze.crm_prd_info;

PRINT'>>TRUNCATING TABLE: bronze.crm_sales_details';
TRUNCATE TABLE bronze.crm_sales_details;
PRINT'>>INSERTING DATA INTO: bronze.crm_sales_details';
BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\Pooja.Jaisankar\Documents\Data WareHouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);

SELECT COUNT(*) FROM bronze.crm_sales_details;


PRINT'------------------------------------------------------------'
PRINT'LOADING ERP TABLE'
PRINT'------------------------------------------------------------'

PRINT'>> TRUNCATING TABLE: bronze.erp_cust_az12';
TRUNCATE TABLE bronze.erp_cust_az12;
PRINT'>> INSERTING DATA INTO: bronze.erp_cust_az12';
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\Pooja.Jaisankar\Documents\Data WareHouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);

SELECT COUNT(*) FROM bronze.erp_cust_az12;

PRINT'>> TRUNCATING TABLE: bronze.erp_loc_a101';
TRUNCATE TABLE bronze.erp_loc_a101;
PRINT'>> INSERTING DATA INTO: bronze.erp_loc_a101';
BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\Pooja.Jaisankar\Documents\Data WareHouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);

SELECT COUNT(*) FROM bronze.erp_loc_a101;

PRINT'>> TRUNCATING TABLE: bronze.erp_px_cat_g1v2'
TRUNCATE TABLE bronze.erp_px_cat_g1v2;
PRINT'>> INSERTING DATA INTO: bronze.erp_px_cat_g1v2'
BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\Pooja.Jaisankar\Documents\Data WareHouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
);

SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;

END

EXEC bronze.load_bronze;
