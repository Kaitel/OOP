select distinct count(q1.fid), q1.lon_lname,  q1.cname,  q1.fid from (select f1.fid as fid, l1.lname as lon_lname,  l1.responsibility,  f1.cname , f1.lname as f1lname  , f2.lname as f2lname  from file as f1 ,  file as f2, lonfile as l1
where f1.fid != f2.fid and f1.cname = f2.cname  and l1.fid = f1.fid  ) as  q1,
(select f1.fid, l1.lname as lon_lname,  l1.responsibility,  f1.cname , f1.lname as f1lname  , f2.lname as f2lname   from file as f1 ,  file as f2, lonfile as l1
where f1.fid != f2.fid and f1.cname = f2.cname  and l1.fid = f1.fid  ) as q2
where q1.fid = q2.fid and q1.responsibility = q2.responsibility and 
q1.fid = q2.fid  and q1.lon_lname = q2.lon_lname and q1.f2lname = q2.f2lname  and q1.f1lname = q2.f1lname
group by q1.fid, q1.lon_lname , q1.cname
having count(q1.fid) > 1


 
 