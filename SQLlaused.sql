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

create table elukoht(
elukohtID int primary key identity(1,1),
elukoht varchar(50) unique,
maakond varchar(50)
);

select * from elukoht;
SELECT * FROM inimene;

insert into elukoht(elukoht, maakond)
values ('tartu', 'tartumaa'),
('parnu', 'parnumaa');


alter table inimene add elukohtID int;
alter table inimene 
add constraint fk_elukoht
foreign key (elukohtID) 
references elukoht(elukohtID);

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID)
VALUES ('ssl', '2001-12-30', '091236543', 10.00, 0, 1)

select i.nimi, i.synniaeg, e.elukoht
from inimene i join elukoht e
on i.elukohtID=e.elukohtID;






create table auto(
autoID int primary key identity(1,1),
autonr varchar(7) unique,
mudell varchar(50),
mark varchar(50),
vaast char(10)
);

alter table inimene add autoID int;
alter table inimene 
add constraint fk_auto
foreign key (autoID) 
references auto(autoID);

select * from auto;

INSERT INTO auto
(autonr, mudell, mark, vaast)
VALUES ('aaa111', 'corolla', 'toyota', '2008-1-1')

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID, autoID)
VALUES ('ssl', '2001-12-30', '091236543', 10.00, 0, 1, 1)

select i.nimi, a.vaast, a.mark, a.mudell
from inimene i join auto a
on i.elukohtID=a.autoID;
