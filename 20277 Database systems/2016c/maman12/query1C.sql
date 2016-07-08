-- clean the database from lonfile errors
-- a file.lname with fid cannot exists as second lawyer in the same file
delete from lonfile where lonfile.fid  in (
select fid from file 
natural join lonfile
where file.fid = lonfile.fid) 

select count(*) from file where status is null
select count(*) from file where lname = 'Eli' and status is null
select count(*) from lonfile where lname = 'Eli' 


select * from (
select fid from file where lname = 'Eli'  
union 
select fid from lonfile  where lname = 'Eli'  ) as xxx
order by fid


 


INSERT INTO LonFile VALUES(120220, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(113210, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(914323, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(431222, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(312441, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(112229, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(114555, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(120220, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(610321, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(120220, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(412312, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(120823, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(810327, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(810322, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(610324, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(810327, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(813212, 'Eli', 'adviser');  
INSERT INTO LonFile VALUES(412121, 'Eli', 'adviser');  




INSERT INTO LonFile VALUES(113210, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(914323, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(431222, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(312441, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(114555, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(610321, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(120220, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(412312, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(120823, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(810322, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(610324, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(810327, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(813212, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(412121, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(120333, 'Ben', 'adviser');  
INSERT INTO LonFile VALUES(114555, 'Ben', 'adviser');  


select count(*) from file where status is null
select count(*) from file where lname = 'Ben' and status is null
select count(*) from lonfile where lname = 'Ben' 
 
 

--  THIS IS THE FINAL SQL THAT WE NEED TO TRANSLATE TO Relational algebra
select * from lawyer  where 
(select (select count(*) as val1 from file where status is null) - (select count(*) as val2 from file where lname = lawyer.lname and status is null)  - (select count(*) as val3 from lonfile where lname = lawyer.lname) as total_count)  = 1
---------------------------------------------------------------------

-- THE RA solution for this query
res = Gcount(*) (σ status = null(File)) - Gcount(σ file.lname = lawyer.lname ∧ status = null(lawyer ⨝ File)) - 
Gcount(*) (σ lonfile.lname = lawyer.lname(lawyer ⨝ File))
σ (res = 1(Lawyer))




select * from file order by fid


select * from (
select fid from file where lname = 'Ben'  
union 
select fid from lonfile  where lname = 'Ben'  ) as xxx
order by fid

