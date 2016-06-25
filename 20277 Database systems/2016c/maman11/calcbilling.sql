calcbilling

select Billing.fid, Billing.lname, sum(Billing.hours) as totalHours , sum(Billing.hours*lawyer.hbilling) as price from Billing   
inner join lawyer 
on Billing.lname = lawyer.lname
where Extract(month from Billing.bdate) >= 1 and Extract(year from Billing.bdate) = 2015
group by Billing.fid , Billing.lname

 


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

