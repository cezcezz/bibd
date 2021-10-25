CREATE DATABASE L3;
USE L3;
CREATE TABLE `manuf` (
`IDM` int PRIMARY KEY,  
`Name` varchar(20),  
`city` varchar(20));
		INSERT INTO `manuf` VALUES 
		(1,'Intel','Santa Clara'),
		(2,'AMD','Santa Clara'),
		(3,'WD','San Jose'),
		(4,'seagete','Cupertino'),
		(5,'Asus','Taipei'),
		(6,'Dell','Round Rock');
        
        
CREATE TABLE `cpu` (
`IDC` int PRIMARY KEY ,
`IDM` int,
`Name` varchar(20),
`clock` decimal(5,2));
		INSERT INTO `cpu` VALUES 
		(1,1,'i5',3.20),
		(2,1,'i7',4.70),
		(3,2,'Ryzen 5',3.20),
		(4,2,'Ryzen 7',4.70),
		(5,NULL,'Power9',3.50);
        
        
CREATE TABLE `hdisk` (
`IDD` int PRIMARY KEY,
`IDM` int,
`Name` varchar(20),
`type` varchar(20),
`size` int);
		INSERT INTO `hdisk` VALUES 
		(1,3,'Green','hdd',1000),
		(2,3,'Black','ssd',256),
		(3,1,'6000p','ssd',256),
		(4,1,'Optane','ssd',16);


CREATE TABLE `nb` (
`IDN` int PRIMARY KEY,
`IDM` int,
`Name` varchar(20),
`IDC` int,
`IDD` int);
		INSERT INTO `nb` VALUES 
		(1,5,'Zenbook',2,2),
		(2,6,'XPS',2,2),
		(3,9,'Pavilion',2,2),
		(4,6,'Inspiron',3,4),
		(5,5,'Vivobook',1,1),
		(6,6,'XPS',4,1);

SELECT * FROM `manuf`,`cpu`;

SELECT * FROM `manuf`,`cpu`
WHERE `cpu`.`IDM`=`manuf`.`IDM`;

SELECT * FROM `manuf`
INNER JOIN `cpu` ON `manuf`.`IDM` = `cpu`.`IDM`;

SELECT *
FROM `manuf` LEFT JOIN `cpu` 
ON `manuf`.`IDM` = `cpu`.`IDM`;

SELECT *
FROM `manuf` RIGHT JOIN `cpu` 
ON `manuf`.`IDM` = `cpu`.`IDM`;
'where `cpu`.`IDM` is null;'

SELECT * FROM `manuf`  CROSS JOIN `cpu`;

select `manuf`.`Name`, `hdisk`.`Name`
from `manuf`, `hdisk`
where `manuf`.`Name` is not null and
			`hdisk`.`Name` is not null and
			`hdisk`.`IDM`=`manuf`.`IDM`;
            
SELECT `manuf`.`Name`, `cpu`.`Name`
FROM `manuf` RIGHT JOIN `cpu` 
ON `manuf`.`IDM` = `cpu`.`IDM`;

-- 11--
SELECT `nb`.`Name`
from `nb` left join `manuf`
on `manuf`.`IDM`=`nb`.`IDM`
where `manuf`.`Name` is null;
-- --
-- 12--
SELECT  `manuf`.`Name`, `nb`.`Name`,  `cpu`.`Name`, `hdisk`.`Name` 
FROM  `manuf`
			right join `nb` on `manuf`.`IDM`=`nb`.`IDM`
            join `cpu`on `nb`.`IDC`= `cpu`.`IDC`
            join `hdisk` on `nb`.`IDD`= `hdisk`.`IDD`;
            
-- 13--
SELECT `nb`.`name`, `manuf`.`name`, `cpu`.`name`, `cpu`.`name`, `hdisk`.`name`, `hdisk`.`name`
FROM `nb`
	LEFT JOIN `manuf` ON `nb`.`IDM` = `manuf`.`IDM`
	JOIN cpu ON `nb`.`IDC` = `cpu`.`IDC`
    JOIN `manuf` as `mcpu` ON `cpu`.`IDM` = `mcpu`.`IDM`
    JOIN `hdisk` ON `nb`.`IDD` = `hdisk`.`IDD`
    JOIN `manuf` AS `mdisk` ON `hdisk`.`IDM` = `mdisk`.`IDM`;
    
  -- 14--
  
SELECT `manuf`.`name`, `cpu`.`name` 
from `manuf` left join `cpu` ON `manuf`.`IDM`= `cpu`.`IDM`
union all
select `manuf`.`Name`, `cpu`.`Name`
from `manuf`
		right join `cpu` on `manuf`.`IDM`= `cpu`.`IDM`
        where `manuf`.`Name` is null;
        
-- 15--
Select `Name` from `manuf`
where `name` IN ( select `manuf`.`Name` from `manuf` left join `nb`
																						on `manuf`.`IDM` = `nb`.`IDM`
																						join `cpu` 
                                                                                        ON `manuf`.`IDM` = `cpu`.`IDM`
                                                                                        join `hdisk` 
                                                                                        ON `manuf`.`IDM` = `hdisk`.`IDM`)
								