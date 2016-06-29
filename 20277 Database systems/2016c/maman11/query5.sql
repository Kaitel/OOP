select * from (
select lonfile.lname as lname, count(*) as  toplawyer , lawyer.partner, lawyer.sdate  from lonfile
inner join lawyer 
on lawyer.lname = lonfile.lname
group by lonfile.lname , lawyer.sdate, lawyer.partner) as xxx where  xxx.toplawyer = get_lawyermax()

 

 CREATE OR REPLACE FUNCTION get_lawyermax()
  RETURNS integer AS
$func$
BEGIN

RETURN (select max(a) from (
select  count(lname) as a from  lonfile
group by lname) as xxx);

END
$func$ LANGUAGE plpgsql;