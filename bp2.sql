CREATE DATABASE if not EXISTS sklad_mj;

use sklad_mj;

CREATE TABLE radnici(
id INT(11) NOT NULL AUTO_INCREMENT,
ime VARCHAR(200) NOT NULL,
prezime VARCHAR(200) NOT NULL,
skladisno_mjesto int(11) NOT NULL UNIQUE, 
primary key(id, skladisno_mjesto));

ALTER table radnici add column voditelj_skladista VARCHAR(200) NOT NULL;

ALTER table radnici add column sifra_skladista int(11) not null after prezime;
DESC radnici;

CREATE table skladisno_mjesto(
sifra_skladista int(11) not null auto_increment PRIMARY KEY, 
naziv varchar(200) NOT NULL);


ALTER TABLE proizvod CHANGE COLUMN
skladisno_mjesto sifra_skladista int(11);

DESC radnici;
DESC skladisno_mjesto;
DESC proizvod;
DESC voditelji;

create table proizvod(
id_proizvoda int(11) not null auto_increment,
skladisno_mjesto int(11) not null,
primary key (id_proizvoda, skladisno_mjesto));

ALTER table proizvod ADD COLUMN naziv varchar(200) not null after id_proizvoda;
desc proizvod;


create table voditelj(
id int(11) not null auto_increment, 
skladisno_mjesto int(11) not null,
primary key (id, skladisno_mjesto));



CREATE TABLE voditelji
(id int(11) not null auto_increment,
sifra_skladista int(11) not null,
primary key (id, sifra_skladista));

ALTER TABLE `proizvod`
  DROP PRIMARY KEY,
   ADD PRIMARY KEY(
     `sifra_skladista`);
ALTER TABLE proizvod drop primary key;

DESC proizvod;

ALTER table proizvod MODIFY sifra_proizvoda ADD primary key int(11) not null Auto_increment;

ALTER TABLE `proizvod` ADD PRIMARY KEY(`sifra_proizvoda`);

ALTER table proizvod MODIFY sifra_proizvoda int(11) AUTO_INCREMENT;


INSERT INTO radnici VALUES
(NULL, 'Slavoje', 'Bertovic', 2),
(NULL, 'Minero', 'Hostic', 1),
(NULL, 'Amir', 'Pehic', 1),
(NULL, 'Kresimir', 'Lopic', 3),
(NULL, 'Martin', 'Kosic', 1),
(NULL, 'Patrik', 'Jotep', 2),
(NULL, 'Bozidar', 'Tepic', 3),
(NULL, 'Antenis', 'Vusic', 2);


INSERT INTO skladisno_mjesto VALUES
(NULL, 'Auto dijelovi'),
(NULL, 'Avionski dijelovi'),
(NULL, 'Dijelovi vatrenog oruzija');

INSERT INTO voditelji VALUES
 
(4, 3),
(6, 1);

SELECT * FROM radnici;
SELECT * FROM skladisno_mjesto;
SELECT * FROM proizvod;
SELECT * FROM voditelji;

INSERT INTO proizvod VALUES
(NULL, 'Vrata automobila zadnja lijeva', 1),
(NULL, 'Vrata automobila zadnja desna', 1),
(NULL, 'Vrata automobila prednja lijeva', 1),
(NULL, 'Vrata automobila prednja desna', 1), 
(NULL, 'Hauba plava', 1),
(NULL, 'Hauba smeda', 1),
(NULL, 'Blatobran prednji lijevi', 1),
(NULL, 'Blatobran prednji desni', 1),
(NULL, 'Branik prednji plavi', 1),
(NULL, 'Branik zadnji zuti', 1),
(NULL, 'Branik zadnji bijeli', 1),
(NULL, 'Ogledalo prednje lijevo', 1),
(NULL, 'Ogledalo prednje desno', 1),
(NULL, 'Far desni', 1),
(NULL, 'Far lijevi', 1),
(NULL, 'Hladnjak', 1),
(NULL, 'Mijenjac 4 stupnja prijenosa', 1),
(NULL, 'Brisaci prednji', 1),
(NULL, 'Brisaci zadnji', 1),
(NULL, 'Kotac prednji desni', 1),
(NULL, 'Kotac prednji lijevi', 1),
(NULL, 'Kotac zadnji desni', 1),
(NULL, 'Kotac zadnji lijevi', 1),
(NULL, 'Poklopac motora', 1),
(NULL, 'Prednji kotac desni', 2),
(NULL, 'Prednji kotac lijevi', 2),
(NULL, 'Zadnji kotac desni', 2),
(NULL, 'Zadnji kotac lijevi', 2),
(NULL, 'Hidraulicki prednji dio', 2),
(NULL, 'Hidraulicki zadnji dio', 2),
(NULL, 'Farovi prednji', 2),
(NULL, 'Farovi zadnji', 2),
(NULL, 'Zastitno staklo', 2),
(NULL, 'Sjedalo', 2),
(NULL, 'Ogledalo prednje desno', 2),
(NULL, 'Ogledalo prednje lijevi', 2),
(NULL, 'Rezerni kotac', 2),
(NULL, 'Kabina vozaca', 3),
(NULL, 'Hladnjak', 3),
(NULL, 'Krevet', 3),
(NULL, 'Sjedalo desno', 3),
(NULL, 'Sjedalo lijevo', 3),
(NULL, 'Ogledalo desno', 3),
(NULL, 'Ogledalo lijevo', 3),
(NULL, 'Far desni', 3),
(NULL, 'Far lijevi', 3),
(NULL, 'Pokazivaci smijera desni', 3),
(NULL, 'Pokazivaci smijera lijevi', 3),
(NULL, 'Kocnice', 3),
(NULL, 'Mijenjac', 3),
(NULL, 'Lamela', 3),
(NULL, 'Kontrolna ploca', 3);


SELECT CONCAT(radnici.ime, ' ', radnici.prezime) AS 'Voditelji skladista' FROM radnici INNER JOIN voditelji
ON voditelji.id = radnici.id;

SELECT sifra_proizvoda FROM proizvod left join skladisno_mjesto 
ON skladisno_mjesto.sifra_skladista = proizvod.sifra_skladista;
