ALTER TABLE Lawyer(
   lname varchar (100) PRIMARY KEY    NOT NULL,
   sdate      Date      NOT NULL,
   hbilling   INTEGER    NOT NULL,
   partner      Date    
);


CREATE TABLE File(
	fid INT PRIMARY KEY                 NOT NULL,
	fname      varchar (150)            NOT NULL,
	description      varchar (500)      NOT NULL,   
	status      Date     ,   
	cname       varchar (150)      NOT NULL references Client(cname ) ,   
	lname       varchar (150)      NOT NULL  references Lawyer(lname) 
);



CREATE TABLE Client(
	cname varchar (150) PRIMARY KEY    NOT NULL,
	tel      varchar (100)            NOT NULL,
	address      varchar (500)      NOT NULL
);



CREATE TABLE Lonfile(
	fid INT      NOT NULL  references File(fid ),
	lname      varchar (100)         NOT NULL  references Lawyer(lname),
	responsibility      varchar (500)    NOT NULL,
	PRIMARY KEY(fid,lname),
	 
);

ALTER TABLE Lonfile ADD CONSTRAINT Lonfile_fid_lname_unique UNIQUE (fid, lname)



Billing (fid, bdate, lname, hours, descr) 


CREATE TABLE Billing(
	fid INT    NOT NULL  references File(fid ),
	bdate	   Date    NOT NULL,
	lname      varchar (500)    NOT NULL  references Lawyer(lname),   
	hours      INT        NOT NULL ,   
	descr       varchar (500)   NOT NULL  ,
	PRIMARY KEY(fid, bdate, lname),
	CONSTRAINT Billing_fid_bdate_lname_unique UNIQUE (fid, bdate, lname)
);



