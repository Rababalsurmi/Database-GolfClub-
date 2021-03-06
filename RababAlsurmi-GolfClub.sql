drop database RababAlsurmi;
create database RababAlsurmi;
use RababAlsurmi;

create table spelare(
		personNr char(13) NOT NULL default '',
        namn varchar(35) NOT NULL default '',
        ålder char(13)NOT NULL default '18',
        primary key (personNr)
	)engine=innodb;
    
create table jacka(
		material varchar(20) NOT NULL default '',
        storlek char(13) NOT NULL default '',
        initialer char(13) NOT NULL default '',
        personNr char(13) NOT NULL default '',
        primary key (personNr, initialer),
        foreign key (personNr) references spelare(personNr)
        ON DELETE CASCADE
	)engine=innodb;
    

    
create table konstruktion(
		hårdhet varchar(20) NOT NULL default '',
        serialNr char(13) NOT NULL default '',
        primary key (serialNr)
        
	)engine=innodb;
    
create table klubba(
		material varchar(20) NOT NULL default '',
        Nr char(13) NOT NULL default '',
        personNr char(13) NOT NULL default '',
        serialNr char(13) NOT NULL default '',
        primary key (personNr, Nr, serialNr),
        foreign key (personNr) references spelare(personNr) ON DELETE CASCADE,
        foreign key (serialNr) references konstruktion(serialNr)
        ON DELETE CASCADE
	)engine=innodb;    
    
    
create table tävling(
		tävlingNamn varchar(35) NOT NULL default '',
        datum date,
        primary key (tävlingNamn)
        
	)engine=innodb;
    
create table delta(
		tävlingNamn varchar(20) NOT NULL default '',
        personNr char(13) NOT NULL default '',
        primary key (tävlingNamn, personNr),
        foreign key (personNr) references spelare(personNr) ON DELETE CASCADE,
        foreign key (tävlingNamn) references tävling(tävlingNamn)
        ON DELETE CASCADE
        
	)engine=innodb;
    
create table regn(
		typ varchar(20),
        vindStyrka char(13),
        primary key (typ)
        
	)engine=innodb;
    
create table har(
		tidPunkt time,
		tävlingNamn varchar(20),
        typ varchar(20),
        primary key (tävlingNamn, typ),
        foreign key (typ) references regn(typ) ON DELETE CASCADE,
        foreign key (tävlingNamn) references tävling(tävlingNamn)
        ON DELETE CASCADE
        
	)engine=innodb;
    
INSERT INTO spelare (personNr, namn, ålder)
VALUES ('202112172388', 'Johan Andersson', '25');
INSERT INTO spelare (personNr, namn, ålder)
VALUES ('202112182395', 'Nicklas Jansson','27');
INSERT INTO spelare (personNr, namn, ålder)
VALUES ('202112192386', 'Annika Persson','28');

INSERT INTO tävling (tävlingNamn, datum)
VALUES ('Big Golf Cup Skövde', '2021-06-10');

INSERT INTO delta (tävlingNamn, personNr)
VALUES ('Big Golf Cup Skövde', '202112172388');
INSERT INTO delta (tävlingNamn, personNr)
VALUES ('Big Golf Cup Skövde', '202112182395');
INSERT INTO delta (tävlingNamn, personNr)
VALUES ('Big Golf Cup Skövde', '202112192386');

INSERT INTO regn (typ, vindStyrka)
VALUES ('hagel', '10m/s');

INSERT INTO har (tidPunkt, tävlingNamn, typ)
VALUES ('12:00', 'Big Golf Cup Skövde','hagel');

INSERT INTO jacka (material, storlek, initialer, personNr)
VALUES ('Fleece', 'L','F', '202112172388');
INSERT INTO jacka (material, storlek, initialer, personNr)
VALUES ('Goretex', 'L','G', '202112172388');

INSERT INTO konstruktion (hårdhet, serialNr)
VALUES ('5', '87394756');
INSERT INTO konstruktion (hårdhet, serialNr)
VALUES ('10', '87394757');


INSERT INTO klubba (material, Nr, personNr, serialNr)
VALUES ('trä', '01','202112182395', '87394757');
INSERT INTO klubba (material, Nr, personNr, serialNr)
VALUES ('trä', '01','202112192386', '87394756');

SELECT ålder FROM spelare
WHERE namn='Johan Andersson';

SELECT datum FROM tävling
WHERE tävlingNamn='Big Golf Cup Skövde';

SELECT material FROM klubba
WHERE personNr='202112172388';

SELECT * FROM jacka
WHERE personNr='202112172388';

SELECT personNr FROM delta
WHERE tävlingNamn='Big Golf Cup Skövde';

SELECT vindStyrka
FROM regn
INNER JOIN har
ON regn.typ = har.typ;

SELECT * FROM spelare
WHERE ålder < '30';

DELETE FROM jacka WHERE personNr='202112172388';

DELETE FROM spelare WHERE namn='Nicklas Jansson';

SELECT AVG(ålder)
FROM spelare;





    
        
        
