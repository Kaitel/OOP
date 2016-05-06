 INSERT INTO department(dept_id,dept_name,building,budget) VALUES
    (1,'Biology', 'Watson', 90000),
    (2,'Comp. Sci.', 'Taylor', 100000),
    (3,'Elec. Eng.', 'Taylor', 90000),
    (4,'Finance', 'Painter', 120000),
    (5,'History', 'Painter', 50000),
    (6,'Music', 'Packard', 80000),
    (7,'Physics', 'Watson', 70000)

 
 INSERT INTO instructor(ID,name,dept_id,salary) VALUES
(22222 ,'Einstein', 7, 95000),
(12121 ,'Wu', 4 ,90000),
(32343 ,'El Said',  5, 60000),
(45565 ,'Katz', 2, 75000),
(98345 ,'Kim', 3 ,80000),
(76766 ,'Crick', 1 ,72000),
(10101 ,'Srinivasan', 2, 65000),
(58583 ,'Califieri', 5 ,62000),
(83821 ,'Brandt', 2 ,92000),
(15151 ,'Mozart',6 ,40000),
(33456 ,'Gold', 7 ,87000),
(76543 ,'Singh', 4 ,80000)


 INSERT INTO course(course_id, title, dept_id, credits ) VALUES
('BIO-101', 'Intro. to Biology' ,1, 4),
('BIO-301', 'Genetics', 1, 4),
('BIO-399', 'Computational Biology', 1, 3),
('CS-101', 'Intro. to Computer Science', 2, 4),
('CS-190', 'Game Design', 2, 4),
('CS-315', 'Robotics', 2, 3),
('CS-319', 'Image Processing', 2, 3),
('CS-347', 'Database System Concepts', 2, 3),
('EE-181', 'Intro. to Digital Systems', 3, 3),
('FIN-201', 'Investment Banking', 4, 3),
('HIS-351', 'World History', 5, 3),
('MU-199', 'Music Video Production', 6, 3),
('PHY-101', 'Physical Principles' ,7, 4)



INSERT INTO section(course_id, sec_id, semester, year, building,room_number,time_slot_id) VALUES
('BIO-101', 1, 'Summer', 2009 ,'Painter', 514 ,'B'),
('BIO-301', 1, 'Summer', 2010 ,'Painter', 514 ,'A'),
('CS-101', 1 ,'Fall',   2009 ,'Packard', 101 ,'H'),
('CS-101', 1 ,'Spring', 2010 ,'Packard', 101 ,'F'),
('CS-190', 1 ,'Spring', 2009 ,'Taylor', 3128 ,'E'),
('CS-190', 2 ,'Spring', 2009 ,'Taylor', 3128 ,'A'),
('CS-315', 1 ,'Spring', 2010 ,'Watson', 120 ,'D'),
('CS-319', 1 ,'Spring', 2010 ,'Watson', 100 ,'B'),
('CS-319', 2 ,'Spring', 2010 ,'Taylor' ,3128 ,'C'),
('CS-347', 1 ,'Fall', 2009 ,'Taylor',3128 ,'A'),
('EE-181', 1 ,'Spring', 2009 ,'Taylor', 3128 ,'C'),
('FIN-201', 1, 'Spring', 2010 ,'Packard', 101 ,'B'),
('HIS-351', 1, 'Spring', 2010 ,'Painter', 514 ,'C'),
('MU-199', 1 ,'Spring', 2010 ,'Packard', 101 ,'D'),
('PHY-101', 1, 'Fall', 2009 ,'Watson', 100 ,'A')



INSERT INTO teaches(ID, course_id, sec_id, semester,year) VALUES
(10101, 'CS-101' ,1, 'Fall' ,2009),
(10101, 'CS-315' ,1 ,'Spring' ,2010),
(10101, 'CS-347' ,1 ,'Fall' ,2009),
(12121, 'FIN-201' ,1 ,'Spring', 2010),
(15151, 'MU-199' ,1 ,'Spring' ,2010),
(22222, 'PHY-101', 1 ,'Fall' ,2009),
(32343, 'HIS-351', 1 ,'Spring' ,2010),
(45565, 'CS-101' ,1 ,'Spring' ,2010),
(45565, 'CS-319',1 ,'Spring' ,2010),
(76766, 'BIO-101', 1 ,'Summer' ,2009),
(76766, 'BIO-301', 1 ,'Summer' ,2010),
(83821, 'CS-190' ,1 ,'Spring' ,2009),
(83821, 'CS-190' ,2 ,'Spring' ,2009),
(83821, 'CS-319' ,2 ,'Spring' ,2010),
(98345, 'EE-181' ,1 ,'Spring' ,2009)



INSERT INTO student(ID, name, dept_id, tot_cred) VALUES
(00128, 'Zhang', 2, 102),
(12345, 'Shankar', 2, 32),
(19991, 'Brandt', 5, 80),
(23121, 'Chavez', 4, 110),
(44553, 'Peltier', 7, 56),
(45678, 'Levy', 7, 46),
(54321, 'Williams', 2, 54),
(55739, 'Sanchez', 6, 38),
(70557, 'Snow', 7, 0),
(76543, 'Brown', 2, 58),
(76653, 'Aoi', 3, 60),
(98765, 'Bourikas', 3, 98),
(98988, 'Tanaka', 1, 120)



INSERT INTO takes(ID, course_id, sec_id , semester, year , grade) VALUES
(00128, 'CS-101', 1, 'Fall', 2009 ,'A'),
(00122, 'CS-347', 1, 'Fall', 2009 ,'A-'),
(12345, 'CS-101', 1, 'Fall', 2009 ,'C'),
(12345, 'CS-190', 2, 'Spring', 2009 ,'A'),
(12345, 'CS-315', 1, 'Spring', 2010 ,'A'),
(12345, 'CS-347', 1, 'Fall', 2009 ,'A'),
(19991, 'HIS-351', 1, 'Spring', 2010 ,'B'),
(23121, 'FIN-201', 1, 'Spring', 2010 ,'C+'),
(44553, 'PHY-101', 1, 'Fall', 2009 ,'B-'),
(45678, 'CS-101' ,1, 'Fall', 2009 ,'F'),
(45678, 'CS-101' ,1, 'Spring', 2010 ,'B+'),
(45678, 'CS-319' ,1, 'Spring', 2010 ,'B'),
(54321, 'CS-101' ,1, 'Fall', 2009 ,'A-'),
(54321, 'CS-190' ,2, 'Spring', 2009 ,'B+'),
(55739, 'MU-199' ,1, 'Spring', 2010 ,'A-'),
(76543, 'CS-101' ,1, 'Fall', 2009 ,'A'),
(76543, 'CS-319' ,2, 'Spring', 2010 ,'A'),
(76653, 'EE-181' ,1, 'Spring', 2009 ,'C'),
(98765, 'CS-101' ,1, 'Fall', 2009 ,'C-'),
(98765, 'CS-315' ,1, 'Spring', 2010 ,'B'),
(98988, 'BIO-101', 1, 'Summer', 2009 ,'A'),
(98988, 'BIO-301', 1, 'Summer', 2010 ,'null')




