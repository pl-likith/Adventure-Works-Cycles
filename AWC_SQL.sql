USE AWC;


#OVERALL SALES AND PROFIT---------------------
 SELECT concat(ROUND(SUM(S.SALES)/1000000,1),'M') AS SALES,
concat(ROUND(SUM(S.PROFIT)/1000000,1),'M') AS PROFIT FROM SALES S;

#YEAR-WISE SALES AND PROFIT----------------------------------
SELECT YEARR,concat(ROUND(SUM(S.SALES)/1000,1),'K') AS SALES,concat(ROUND(SUM(S.PROFIT)/1000,1),'K') AS PROFIT FROM SALES S
group by YEARR
order by YEARR ASC;

#REGION--WISE SALES & PROFIT-----------------------------
SELECT   coalesce(T.SALESTERRITORYREGION , 'GRAND TOTAL') as Region, concat(ROUND(SUM(S.SALES)/1000,1),'K') AS SALES,
concat(ROUND(SUM(S.PROFIT)/1000,1),'K') AS PROFIT
FROM SALES S JOIN ds_ter T 
ON S.SALESTERRITORYKEY = T.SalesTerritoryKey
group by SalesTerritoryRegion
with rollup;

#QUARTER-WISE SALES & PROFIT-------------------------------------------
SELECT QUARTERR,concat(ROUND(SUM(S.SALES)/1000000,1),'M') AS SALES,concat(ROUND(SUM(S.PROFIT)/1000000,1),'M') AS PROFIT FROM SALES S
group by QUARTERR
order by QUARTERR ASC;

#COUNTRY__WISE SALES & PROFIT---------------------------
SELECT   coalesce(T.SALESTERRITORYCOUNTRY , 'GRAND TOTAL') as Region, concat(ROUND(SUM(S.SALES)/1000000,1),'M') AS SALES,
concat(ROUND(SUM(S.PROFIT)/1000000,1),'M') AS PROFIT
FROM SALES S JOIN ds_ter T 
ON S.SALESTERRITORYKEY = T.SalesTerritoryKey
group by SalesTerritoryCOUNTRY
with rollup;

#TOTAL_PRODUCTS----------------------------
select distinct(count(englishproductname)) as total_product from dimproduct;

#PRODUCTS WISE AVAILABILITY-------------------
select englishproductname , count(*) as count
from dimproduct
group by englishproductname  ;

#AVGINCOME OF CUSTOMER---------------------------
select ceil(AVG(YEARLYINCOME)) AS AVG_SAL FROM dimcustomer;

#TOP-10 PRODUCTS-------------------------
SELECT   P.ENGLISHPRODUCTNAME , concat(ROUND(SUM(S.SALES)/1000000,1),'M') AS SALES
FROM SALES S JOIN dimproduct P 
ON S.PRODUCTKEY = P.PRODUCTKey
group by ENGLISHPRODUCTNAME
order by SALES DESC
limit 10;

#TOTAL-CUSTOMERS-----------------------
select count(CustomerKey) AS TOTAL_CUSTOMER  FROM dimcustomer;

#MONTHWISE-SALES &PROFIT-----------------------------
SELECT MONTHFULLNAME,concat(ROUND(SUM(S.SALES)/1000000,1),'M') AS SALES,concat(ROUND(SUM(S.PROFIT)/1000000,1),'M') AS PROFIT FROM SALES S
group by MONTHFULLNAME;


#WEEKDAYWISE SALES & PROFIT-------------------------
SELECT WEEKDAYNAME,concat(ROUND(SUM(S.SALES)/1000000,1),'M') AS SALES,concat(ROUND(SUM(S.PROFIT)/1000000,1),'M') AS PROFIT FROM SALES S
group by WEEKDAYNAME;

#GROUP-WISE SALE & PROFIT--------------------
SELECT   coalesce(T.SALESTERRITORYGROUP , 'GRAND TOTAL') as TGROUP, concat(ROUND(SUM(S.SALES)/1000000,1),'M') AS SALES,
concat(ROUND(SUM(S.PROFIT)/1000000,1),'M') AS PROFIT
FROM SALES S JOIN ds_ter T 
ON S.SALESTERRITORYKEY = T.SalesTerritoryKey
group by SalesTerritoryGROUP
with rollup;



