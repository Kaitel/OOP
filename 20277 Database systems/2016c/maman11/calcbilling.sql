

select Billing.fid, Billing.lname, sum(Billing.hours) as totalHours , sum(Billing.hours*lawyer.hbilling) as price from Billing   
inner join lawyer 
on Billing.lname = lawyer.lname
where Extract(month from Billing.bdate) >= 1 and Extract(year from Billing.bdate) = 2015
group by Billing.fid , Billing.lname



CREATE OR REPLACE FUNCTION calcbilling (month INTEGER, year INTEGER)
RETURNS  TABLE(fid INTEGER , lname text, totalHours INTEGER, price INTEGER)
AS 
$$
BEGIN
select Billing.fid, Billing.lname, sum(Billing.hours) as totalHours , sum(Billing.hours*lawyer.hbilling) as price from Billing   
inner join lawyer 
on Billing.lname = lawyer.lname
where Extract(month from Billing.bdate) >= month and Extract(year from Billing.bdate) = year
group by Billing.fid , Billing.lname;

END
$$
LANGUAGE plpgsql;

 
create type some_type1 as (
    fid     int, 
    lname   varchar,
    totalHours int,
    price int
);

-- helper function to drop table when i change input types
DROP FUNCTION calcbilling(integer,integer)


-- this is the function that we need to insert into the database
create or replace function calcbilling(month int , year int) 
returns table(fid int, lname varchar, totalHours bigint , price bigint) as
$$
BEGIN
	RETURN QUERY
	select Billing.fid, Billing.lname, sum(Billing.hours) as totalHours , sum(Billing.hours*lawyer.hbilling) as price from Billing   
	inner join lawyer 
	on Billing.lname = lawyer.lname
	where Extract(month from Billing.bdate) >= month and Extract(year from Billing.bdate) = year
	group by Billing.fid , Billing.lname;
 
END 
$$
LANGUAGE plpgsql;

-- execute the function to reterive results
SELECT * from calcbilling(1, 2015)  


-- this is a sql type of the function
create or replace function calcbilling1(month int , year int) 
returns table(fid int, lname varchar, totalHours bigint , price bigint) as
$$

	select Billing.fid, Billing.lname, sum(Billing.hours) as totalHours , sum(Billing.hours*lawyer.hbilling) as price from Billing   
	inner join lawyer 
	on Billing.lname = lawyer.lname
	where Extract(month from Billing.bdate) >= month and Extract(year from Billing.bdate) = year
	group by Billing.fid , Billing.lname;

$$
LANGUAGE sql;

SELECT * FROM calcbilling1(1, 2015);
-- calling like that will results all attributes in one column divided by commas.
SELECT calcbilling1(1, 2015)  



select * from Billing

truncate Billing 



INSERT INTO Billing VALUES(110323, '1-3-2016', 'Eli', 1 , 'reading the avidance');  
INSERT INTO Billing VALUES(120343, '2-3-2016', 'Amir', 1 , 'reading the avidance');  
INSERT INTO Billing VALUES(120333, '3-4-2016', 'Eli', 1 , 'reading the avidance');  
INSERT INTO Billing VALUES(120220, '4-4-2016', 'Shely', 1 , 'reading the avidance');  
INSERT INTO Billing VALUES(113210, '5-3-2016', 'Ben', 1 , 'reading the avidance');  
INSERT INTO Billing VALUES(113210, '5-4-2016', 'Ben', 2 , 'reading the avidance');  
INSERT INTO Billing VALUES(113210, '5-5-2015', 'Ben', 2 , 'reading the avidance');  


INSERT INTO Billing VALUES(914323, '6-3-2016', 'Dana', 1 , 'reading the avidance');  
INSERT INTO Billing VALUES(112229, '7-3-2016', 'Karin', 1 , 'reading the avidance');

INSERT INTO Billing VALUES(110323, '1-5-2016', 'Eli', 3 , 'reading the avidance');  
INSERT INTO Billing VALUES(110323, '8-5-2016', 'Eli', 2 , 'reading the avidance');  
INSERT INTO Billing VALUES(110323, '12-7-2016', 'Eli', 4 , 'reading the avidance');   

