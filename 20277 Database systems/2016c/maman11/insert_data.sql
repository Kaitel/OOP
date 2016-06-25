-- Lawyer
INSERT INTO Lawyer VALUES('Alex', '12-1-2005', 100, NULL);  
INSERT INTO Lawyer VALUES('Eli', '3-2-2010', 190, '1-1-2001');  
INSERT INTO Lawyer VALUES('Amit', '1-1-2002', 190, '1-1-2008');  
INSERT INTO Lawyer VALUES('Ronen', '1-1-2004', 190, NULL);  
INSERT INTO Lawyer VALUES('Ben', '1-1-1996', 190, '1-1-2001');  
INSERT INTO Lawyer VALUES('Shalom', '1-1-2012', 190, NULL);  
INSERT INTO Lawyer VALUES('Danny', '1-1-2015', 190, '2-2-2016');  
INSERT INTO Lawyer VALUES('Amir', '1-1-2016', 190, NULL);  
INSERT INTO Lawyer VALUES('Yonaton', '1-1-1984', 190, NULL);  
INSERT INTO Lawyer VALUES('Shely', '1-1-2002', 190, '10-2-2004');  
INSERT INTO Lawyer VALUES('Mor', '1-1-2003', 190, NULL);  
INSERT INTO Lawyer VALUES('Dana', '1-1-2005', 190, '8-5-2008');  
INSERT INTO Lawyer VALUES('Karin', '1-1-2009', 190, '2-3-2015');  


INSERT INTO Client VALUES('alphi', '0504123133', 'Ramat-gan');  
INSERT INTO Client VALUES('noam', '0534123133', 'Haifa');  
INSERT INTO Client VALUES('arkady', '0524123133', 'Jerusalem');  
INSERT INTO Client VALUES('lital', '0514123133', 'tel-aviv');  


INSERT INTO File VALUES(110323, 'Stolen', 'Stolen bag from old lady' , NULL , 'alphi' , 'Eli');  
INSERT INTO File VALUES(120343, 'Killing', 'Mardring my panda' , NULL , 'noam' , 'Amir');  
INSERT INTO File VALUES(120333, 'Stolen', 'Stolen car' , NULL , 'arkady' , 'Eli');  
INSERT INTO File VALUES(120220, 'divorce', 'ugly divorce with 10 arkady' , NULL , 'alphi' , 'Shely');  
INSERT INTO File VALUES(113210, 'Stolen', 'Stolen bag from old lady' , NULL , 'alphi' , 'Ben');  
INSERT INTO File VALUES(914323, 'Stolen', 'Stolen bag from old lady' , NULL , 'lital' , 'Dana');  
INSERT INTO File VALUES(112229, 'Pre-nuptial agreement', 'Stolen bag from old lady' , NULL , 'lital' , 'Karin');  




INSERT INTO Billing VALUES(110323, '2-3-2016', 'Eli', 1 , 'reading the avidance');  
INSERT INTO Billing VALUES(120343, '2-3-2016', 'Amir', 1 , 'reading the avidance');  
INSERT INTO Billing VALUES(120333, '2-3-2016', 'Eli', 1 , 'reading the avidance');  
INSERT INTO Billing VALUES(120220, '2-3-2016', 'Shely', 1 , 'reading the avidance');  
INSERT INTO Billing VALUES(113210, '2-3-2016', 'Ben', 1 , 'reading the avidance');  
INSERT INTO Billing VALUES(914323, '2-3-2016', 'Dana', 1 , 'reading the avidance');  
INSERT INTO Billing VALUES(112229, '2-3-2016', 'Karin', 1 , 'reading the avidance');

INSERT INTO Billing VALUES(110323, '2-5-2016', 'Eli', 3 , 'reading the avidance');  
INSERT INTO Billing VALUES(110323, '2-6-2016', 'Eli', 2 , 'reading the avidance');  
INSERT INTO Billing VALUES(110323, '2-7-2016', 'Eli', 4 , 'reading the avidance');    



INSERT INTO LonFile VALUES(120343, 'Mor', 'adviser');  
INSERT INTO LonFile VALUES(120333, 'Danny', 'must have second option');  


Select * from Billing