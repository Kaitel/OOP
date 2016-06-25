 

CREATE TRIGGER update_lawyer_name
    BEFORE INSERT OR UPDATE ON Billing
    FOR EACH ROW
    EXECUTE PROCEDURE trigf();

  

CREATE OR REPLACE FUNCTION  trigf() RETURNS TRIGGER AS $$
        BEGIN
 
	
	PERFORM 1 FROM File WHERE File.lname = NEW.lname LIMIT 1 ;
	IF FOUND THEN
	BEGIN
	    RAISE NOTICE 'new raw inserted';  
        END;		
	ELSE
	BEGIN
	IF EXISTS (SELECT 1 FROM Lonfile WHERE Lonfile.lname = NEW.lname)   THEN
	     BEGIN
	      RAISE NOTICE 'update can continue';  
	    END;
	  ELSE 
	    RAISE EXCEPTION 'Lawyer name does not exists';  
	END IF;
	 END;        
	 
	END IF;
	return NEW;
        END;
$$ LANGUAGE plpgsql;

TRUNCATE Billing
INSERT INTO Billing VALUES(110323, '2-3-2016', 'Eli', 1 , 'reading the avidance');  
UPDATE Billing SET  lname = 'Amit'  WHERE fid = 110323 AND bdate = '6-25-2016'
SELECT * FROM BIlling
SELECT * FROM File
SELECT * FROM Lonfile
SELECT * FROM Client
SELECT * FROM Lawyer



