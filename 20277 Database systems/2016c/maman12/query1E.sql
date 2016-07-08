select * from file

INSERT INTO Lawyer VALUES('Yaron', '12-1-2005', 100, '12-1-2010');  
INSERT INTO Lawyer VALUES('Meir', '12-2-2015', 100, '12-1-2016');  

INSERT INTO File VALUES(610321, 'Stolen', 'Stolen bag from old lady' , NULL , 'alphi' , 'Yaron');  
INSERT INTO File VALUES(810322, 'Stolen', 'Stolen bag from old lady' , NULL , 'Eli' , 'Yaron');  

INSERT INTO File VALUES(610324, 'Stolen', 'Stolen bag from old lady' , NULL , 'alphi' , 'Meir');  
INSERT INTO File VALUES(810327, 'Stolen', 'Stolen bag from old lady' , NULL , 'Eli' , 'Meir')

 

with xxx as
(
with yyy as
(
select lname from ( 
select lname, count(lname) from file
where status is null
group by lname
having count(lname) = 2) as ddd) 
select lawyer.lname from lawyer
natural join yyy
 where lawyer.lname = yyy.lname
and lawyer.partner is not null)
select file.lname, file.fid from file, xxx where file.lname = xxx.lname
order by xxx.lname




-- In relational algebera:
-- using the assignment and rename operation i created two sub queries and 
yyy = π lname, ρc(Gcount(lname)) (σ status = null ∧ c = 2) 
xxx = π lname σ (l.lname = y.lname ∧ l.partner ≠ null)(ρl(Lawyer) ⨝ ρy(yyy)
π lname, fid (σ f.lname = x.lname) (ρf(File) ⨝ ρx(xxx))