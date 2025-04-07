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
