-- this is one way do do it in SQL
select file.fid, file.lname from file
left join lonfile
on file.fid = lonfile.fid
where lonfile.lname is null


-- This is the second way , which is more close to relational algebra
select fid, lname from file where 
not exists ( select fid, lname from lonfile where file.fid = lonfile.fid )


-- in RA the - operator, cannot show the lname 
π fid,lname (File) - π fid (lonfile)

--it is like that 
select lname, fid from file 
intersect 
(select lname, fid from file where 
not exists ( select fid, lname from lonfile where file.fid = lonfile.fid ))

 