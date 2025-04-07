--sql server managment stuudio
--(localdb)\MSSQLLocalDB
--Connect TO:
--Server Name: (localdb)\MSSQLLocalDB
--authentification 2 tüüpi:
--1. windows auth - localdb admini õigused
--2. sql server auth - kontrollida varem tehtud kasutajad


CREATE DATABASE polyakovLOGITpv23;
USE polyakovLOGITpv23;

--tabel loomine
--identity(1,1) - ise täidab tabeli 1,2,3...
--identity(1,1) only for primary key
CREATE TABLE inimene(
inimeneID int Primary Key identity(1,1),
nimi varchar(50) unique,
synniaeg date,
telefon char(12),
pikkus decimal(5,2), --float
opilaskodu bit
);
SELECT * FROM inimene;

--tabeli kustutamine
DROP table inimene;

--andmete lisamine
--ddl - data definition language
--dml - data manipulation language

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu)
VALUES
('amx', '2007-12-30', '09876543', 190.75, 0),
('gosha', '1999-12-30', '1234577', 170.65, 0),
('valera', '2009-12-30', '35487634', 555.55, 0),
('peter', '2000-12-30', '0284645', 123.33, 0)


SELECT * FROM inimene;

DELETE FROM inimene
WHERE inimeneID=2;
