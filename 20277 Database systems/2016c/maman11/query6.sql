
with ttt as
(
with yyy as
(
with xxx as
(select  cname  ,  count(cname) as c from File
group by cname 
having count(cname) = 1) 
select xxx.*, fid as fileid from file
inner join xxx 
on xxx.cname = file.cname)
select  *     from yyy 
inner join billing
on billing.fid = yyy.fileid
inner join lawyer
on lawyer.lname = billing.lname
where extract (month from sdate ) = 1 and extract (year from sdate ) = 2016
)
select cname, ttt.fid, sum (ttt.hbilling * ttt.hours) from ttt
group by cname, ttt.fid



 
