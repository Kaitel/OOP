 

-- helper query to see the data
select * from File 
left join lonfile 
on lonfile.fid = file.fid
where file.status is null
 
 

-- the result query
select  file.lname, lonfile.fid, (count(lonfile.fid) + 1)  as total_lawyers from File 
left join lonfile 
on lonfile.fid = file.fid 
where file.status is null  
group by lonfile.fid, file.lname
having (count(lonfile.fid) + 1) > 1