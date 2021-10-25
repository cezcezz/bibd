CREATE DATABASE Universe;

USE Universe;


CREATE TABLE Galaxy
	(
		Name varchar(20),
        Type varchar(20)
	);
    
    ALTER TABLE Galaxy
		ADD Galaxy_id INT PRIMARY KEY AUTO_INCREMENT;
        
	
    CREATE TABLE Star
		(
			Star_id INT PRIMARY KEY AUTO_INCREMENT,
            StarName VARCHAR(20),
            DateFound DATE,
            Describtion TEXT,
            Galaxy_id int references Galaxy(Galaxy_id)
		);
        
        
	CREATE TABLE Planet
		(
			Planet_id  INT PRIMARY KEY AUTO_INCREMENT,
			Star_id int references Galaxy(Galaxy_id),
            PlanetName VARCHAR(20)
		);
        
        ALTER TABLE Star
			CHANGE Describtion StarValue INT;
            
		ALTER TABLE Star
			DROP COLUMN DateFound;

DROP TABLE Planet; 
    
DROP DATABASE  Universe;