with xxx as
(select cname as name,   count(*) from file
where status is NULL
group by cname  
having count(*) >=3)
select file.fid from File 
inner join xxx
on xxx.name = file.cname
where status is NULL and cname = 'alphi'



select get_customer_file_ids('alphi')


--DROP FUNCTION get_customer_file_ids(custname varchar)
CREATE OR REPLACE FUNCTION get_customer_file_ids(custname varchar)
  RETURNS TABLE(fid int)
AS 
$$

with xxx as
(select cname as customer_name,  count(*) from file
where status is NULL
group by cname  
having count(*) >=3)
select file.fid from File 
inner join xxx
on customer_name = file.cname
where status is NULL and cname = custname
$$ LANGUAGE sql;




-- this is  test before i created the function , checking it on fid of 120343
with xxx as
(
select lonfile.lname from file
right join lonfile
on file.fid = lonfile.fid
where file.fid = 120343
union 
select file.lname from file
right join lonfile
on file.fid = lonfile.fid
where file.fid = 120343)
select count(*) from xxx


-- adding the above sql into a function which returns the number of lawyers working on a specific file

CREATE OR REPLACE FUNCTION get_lnumonfid(fileid int)
  RETURNS integer AS
$func$
BEGIN

RETURN (

with xxx as
(
select lonfile.lname from file
right join lonfile
on file.fid = lonfile.fid
where file.fid = fileid
union 
select file.lname from file
right join lonfile
on file.fid = lonfile.fid
where file.fid = fileid)
select count(*) from xxx

);

END
$func$ LANGUAGE plpgsql;


select sum (get_lnumonfid(fid)) from get_customer_file_ids('alphi')
having sum (get_lnumonfid(fid))> (select count(*) from lawyer)




CREATE OR REPLACE FUNCTION get_numlawyerforcustomer(cust varchar)
  RETURNS integer AS
$func$
BEGIN


RETURN (
select sum (get_lnumonfid(fid)) from get_customer_file_ids(cust)
having sum (get_lnumonfid(fid))> (select count(*) from lawyer)
);
END
$func$ LANGUAGE plpgsql;


-- this is the final query which return the desired result 
-- if a row exist > 0 it has all lowyers for this customer
select  cname , (select get_numlawyerforcustomer(file.cname ))  from file
group by cname
having (select get_numlawyerforcustomer(file.cname )) > 0
 



 



 







