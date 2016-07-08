 

-- This is the first part of the query. which finds a lawyer which is not associate and earn more 
-- for an hour then a lawyer which he is an associate.
select distinct l1.lname from lawyer as l1 , lawyer as l2
where l1.lname != l2.lname  and l1.partner is null and l2.partner is not null and l1.hbilling > l2.hbilling
intersect
select cname from file
where status is null



-- this is the seconds part of the query , the above lowyer need to handle two active cases and he himself, a client in some kind
-- of case
select * from client where cname = (select distinct l1.lname from lawyer as l1 , lawyer as l2
where l1.lname != l2.lname  and l1.partner is null and l2.partner is not null and l1.hbilling > l2.hbilling
intersect
select cname from file
where status is null) 


select  count(lname) from file where status is null and lname = (select distinct l1.lname from lawyer as l1 , lawyer as l2
where l1.lname != l2.lname  and l1.partner is null and l2.partner is not null and l1.hbilling > l2.hbilling
intersect
select cname from file
where status is null)
having count(lname) = 2

-- this is the final query - without CTE or functions - just copy paste from the above
select * from client where cname = (select distinct l1.lname from lawyer as l1 , lawyer as l2
where l1.lname != l2.lname  and l1.partner is null and l2.partner is not null and l1.hbilling > l2.hbilling
intersect
select cname from file
where status is null) and  (select  count(lname) from file where status is null and lname = (select distinct l1.lname from lawyer as l1 , lawyer as l2
where l1.lname != l2.lname  and l1.partner is null and l2.partner is not null and l1.hbilling > l2.hbilling
intersect
select cname from file
where status is null)
having count(lname) = 2) = 2


select distinct l1.lname from lawyer as l1 , lawyer as l2
where l1.lname != l2.lname  and l1.partner is null and l2.partner is not null and l1.hbilling > l2.hbilling
intersect
select cname from File
where status is null




-- insert new data that will cause Amir to have two open cases:
INSERT INTO Client VALUES('david', '0504223110', 'Ramat-gan'); 
INSERT INTO File VALUES(120823, 'Stolen', 'Stolen bag from old lady' , NULL , 'david' , 'Amir');




-- IN RA the query will be   ( the <--  was replace by = because it is a comment here)

Firstpart =  π lname ( σ l1.lname ≠ l2.lname ∧ l1.partner = null and l2.partner ≠ null ∧ l1.hbilling > l2.hbilling (ρ l1 (lawyer) ⨯ ρ l2 (lawyer))
 ∩
 π cname (σ status = null (File))
  
secondpart = Gcount(lname)(σ status = null ∧ lname = firstpart(File))

--The result query will be:
π lname (σ cname = firstpart (File))
∧
secondpart = 2


