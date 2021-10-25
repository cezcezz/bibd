CREATE DATABASE GalaxyDB;
USE GalaxyDB;

Create TABLE Stars
(

	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	starName VARCHAR(15) NOT NULL,
    sozvezdieName VARCHAR(15) NOT NULL,
    spectrClass VARCHAR(1) NOT NULL,
    temp double default 0,
    massInSuns double default 0,
    radiusInSuns double default 0,
    distance double default 0,
    absValue double default 0,
    visStarValue double default 0
);

INSERT Stars(starName, sozvezdieName, spectrClass, temp, massInSuns,radiusInSuns,distance,absValue,visStarValue)
VALUES ('Альдебаран', 'Телец', 'M', 3500,5,45,68,-0.63,0.85);

SELECT * FROM Stars;

INSERT Stars(starName, sozvezdieName, spectrClass, temp,massInSuns,radiusInSuns,distance,absValue,visStarValue)
VALUES 
					('Гакрукс',			 'Южный крест', 			'M', 		3400,		3,		113,		88,		-0.56,		1.59),
					('Полярная', 		'Малая медведица', 		'F', 		7000,		6,		30,		430,		-3.6,			1.97),
                    ('Беллатрикс', 	'Орион', 							'B', 		22000,		8.4,	6,			240,		-2.8,			1.64),
                    ('Арктур', 			'Волопас', 						'K',		 4300,		1,		25,		26,		37,			-0.28),
                    ('Альтаир', 			'Орел', 							'A', 		8000,		1.7	,1.7,		360,		2.22,		0.77),
                    ('Антарес',			 'Скорпион',					 'K',		 4000,		10,	880,		600,		-5.28,		0.96),
                    ('Ригель', 			'Орион',							 'B', 		11000,		18,	75,		864,		-7.84,		0.12),
                    ('Бетельгейзе',	 'Орион',							 'M',		 3100,		20,	900,		650,		-5.14,		1.51);
			
INSERT Stars(starName, sozvezdieName, spectrClass, temp,massInSuns,radiusInSuns)
VALUES           
              ('Сириус', 		'Большой Пес',		 'A', 		9900,		2,		1.7);
              
              
	UPDATE Stars SET
    visStarValue = 1.4
    WHERE id='10';


DELETE FROM Stars
WHERE id = '1';


UPDATE Stars SET
    absValue = -1.46,
    distance = 8.6
    WHERE starName='Сириус';
    

DELETE FROM Stars
WHERE starName='Сириус';



SELECT starName, temp from Stars
ORDER BY 
	`starName` ASC;
    

SELECT starName from Stars
WHERE sozvezdieName='Орион';

SELECT starName from Stars
WHERE sozvezdieName='Орион' AND spectrClass = 'B'; 



Select starName from Stars
where distance = (select max(distance) from Stars);

Select starName from Stars
where radiusInSuns = (select min(radiusInSuns) from Stars);


Select spectrClass,AVG(temp) from Stars
GROUP BY spectrClass;

Select count(*), spectrClass from Stars
GROUP BY spectrClass;

Select SUM(massInSuns) from Stars;

Select min(temp) from Stars
where spectrClass='K';


'Select sozvezdieName, starName from Stars
group by sozvezdieName
having count(*)=1;'

Select starName from Stars
where sozvezdieName in (Select sozvezdieName from Stars
group by sozvezdieName
having count(*)=1);






