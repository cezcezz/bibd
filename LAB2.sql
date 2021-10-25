CREATE DATABASE GalaxyDB;
USE GalaxyDB;

Create TABLE Stars
(
	starName VARCHAR(15) NOT NULL,
    sozvezdieName VARCHAR(15) NOT NULL,
    spectrClass VARCHAR(1) NOT NULL,
    temp INT default 0,
    massInSuns int default 0,
    radiusInSuns int default 0,
    distance INT default 0,
    absValue INT default 0,
    visStarValue INT default 0
);

INSERT Stars(Stars, sozvezdieName, spectrClass, temp,massInSuns,radiusInSuns,distance,absValue,visStarValue)
VALUES ('Альдебаран', 'Телец', 'M', 3500,5,45,68,-0.63,0.85);

SELECT * FROM Stars;

INSERT Stars(Stars, sozvezdieName, spectrClass, temp,massInSuns,radiusInSuns,distance,absValue,visStarValue)
VALUES 
					('Гакрукс', 'Южный крест', 'M', 3400,3,113,88,-0.56,1.59),
					('Полярная', 'Малая медведица', 'F', 7000,6,30,430,-3.6,1.97),
                    ('Беллатрикс', 'Орион', 'B', 22000,8.4,6,240,-2.8,1.64),
                    ('Арктур', 'Волопас', 'K', 4300,1,25,26,37,-0.28,-0.05),
                    ('Альтаир', 'Орел', 'A', 8000,1.7,1.7,360,2.22,0.77),
                    ('Антарес', 'Скорпион', 'K', 4000,10,880,600,-5.28,0.96),
                    ('Ригель', 'Орион', 'B', 11000,18,75,864,-7.84,0.12),
                    ('Бетельгейзе', 'орион', 'M', 3100,20,900,650,-5.14,1.51),
                    ('Сириус', 'ольшой Пес', 'A', 9900,2,1.7,650);

alter table Stars