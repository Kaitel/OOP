  

select file.fname, file.lname, billing.hours * lawyer.hbilling  as salary from File 
inner join Billing 
on file.fid = billing.fid
inner join lawyer 
on lawyer.lname = billing.lname
where Extract(month from file.status) = Extract(month from Billing.bdate)
order  by salary desc
limit 1




 
 
