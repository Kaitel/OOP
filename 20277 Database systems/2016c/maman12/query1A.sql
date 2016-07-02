--Maman 12 Question 1.A

select client.cname, client.tel from file 
natural  join client
where file.status is null
