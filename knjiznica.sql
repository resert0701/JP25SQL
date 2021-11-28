drop database if exists knjiznica;
create database knjiznica character set utf8;
# otvoriti cmd i zaljepiti od znaka # do kraja - pripaziti na putanju
# C:\xampp\mysql\bin\mysql -uknjiznica -pknjiznica --default_character_set=utf8 < d:\JP25\JP25SQL\knjiznica.sql
use knjiznica



create table knjiga (
    knjiga_id int not null primary key auto_increment,
    naslov varchar(50) not null,
    autor varchar(50) not null,
    izdavac varchar(50) not null,
    kategorija varchar(50) not null,
    broj_primjeraka int not null
);

create table korisnik (
    korisnik_id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    broj_mobitela varchar(50),
    adresa varchar(50) not null,
    mijesto varchar(50),
    email varchar(50)
);

create table posudba (
    posudba_id int not null primary key auto_increment,
    knjiznicar_id int not null,
    knjiga_id int not null,
    korisnik_id int not null,
    datum_posudbe datetime,
    datum_povrata datetime
);

create table zakasnina (
    zakasnina_id int not null primary key auto_increment,
    posudba_id int not null,
    cijena decimal(18,2)
);

create table knjiznicar(
    knjiznicar_id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50)
);

create table posudba_knjiga(
    posudba_id int not null,
    knjiga_id int not null
);




alter table posudba add foreign key (korisnik_id) references korisnik(korisnik_id);
alter table zakasnina add foreign key (posudba_id) references posudba(posudba_id);
alter table posudba add foreign key(knjiznicar_id) references knjiznicar(knjiznicar_id);
alter table posudba_knjiga add foreign key(knjiga_id) references knjiga(knjiga_id);
alter table posudba_knjiga add foreign key (posudba_id) references posudba(posudba_id);

-- --korisnici 

insert into korisnik (korisnik_id,ime,prezime,oib,broj_mobitela,adresa,email)
values (null,'Rudolf','Esert','83916026127','0958811771','M.A.Reljkovica 5','rudolf.esert@gmail.com');
insert into korisnik(korisnik_id,ime,prezime,email,adresa) values
(null,'Stjepan','Groznica','stjepan.groznica@gmail.com','Osijek 1'),
(null,'Franko','Vekić','franko.vekic@gmail.com','Osijek 2'),
(null,'Ivana','Cerovski','ivana.cerovski85@gmail.com','Osijek 3'),
(null,'Aleksandar','Jergić','acojergic@gmail.com','Osijek 5'),
(null,'Mateo','Cvenić','mateo.cvenic@gmail.com','Osijek 6'),
(null,'Juraj','Mak','juraj.mak90@gmail.com','Osijek 7'),
(null,'Tea','Matasović','teamatasovic@gmail.com','Osijek 8'),
(null,'Miroslav','Ambroš','miroslav.ambros@gmail.com','Osijek 8'),
(null,'Matej','Lišćak','liscakmatej1@gmail.com','Osijek 10'),
(null,'Filip','Stamenković','stameniwow83@gmail.com','Osijek 11'),
(null,'Matej','Zovak','matejzovak031@gmail.com','Osijek 12'),
(null,'Antonio','Cukrov','anub031@gmail.com','Osijek 13'),
(null,'Ivan','Thür','ivan.thuer@gmail.com','Osijek 14'),
(null,'Mario','Kordić','mario.kordic4@gmail.com','Osijek 15'),
(null,'Igor','Davidović','igordavidovic137@gmail.com','Osijek 16'),
(null,'Patrik','Bolf','bolfpatrik0@gmail.com','Osijek 17'),
(null,'Neven','Gostić','neven.gostic@gmail.com','Osijek 18'),
(null,'Frane','Dumančić','franedumancic@icloud.com','Osijek 19'),
(null,'Filip','Janković','filip.vno.jankovic@gmail.com','Osijek 20'),
(null,'Nikolina','Bradarić','nina.bradaric@gmail.com','Osijek 21'),
(null,'Josip','Balog','jbalooog@gmail.com','Osijek 22'),
(null,'Matija','Skrletović','skrlama@gmail.com','Osijek 23');

-- ----knjige

insert into knjiga(knjiga_id,naslov,autor,izdavac,kategorija,broj_primjeraka)
values (null,'Tajne njegovih inovacija','Carmine Gallo','Algoritam','Autobiografija',10);

insert into knjiga(knjiga_id,naslov,autor,izdavac,kategorija,broj_primjeraka)
values (null,'Igra Prestolja','G.R.R.Martin','Školska knjiga','Fantasy',4);

insert into knjiga(knjiga_id,naslov,autor,izdavac,kategorija,broj_primjeraka)
values (null,'Hyperion Cantos','Dan Simmons','Školska knjiga','SF',5);

insert into knjiga(knjiga_id,naslov,autor,izdavac,kategorija,broj_primjeraka)
values (null,'Dina','Frank Herbert','Sfera','SF',20);

insert into knjiga(knjiga_id,naslov,autor,izdavac,kategorija,broj_primjeraka)
values (null,'Druga fondacija','Isaac Asimov','Sfera','Školska knjiga',8);

insert into knjiga(knjiga_id,naslov,autor,izdavac,kategorija,broj_primjeraka)
values (null,'Fondacija i carstvo','Isaac Asimov','Sfera','SF',5);

insert into knjiga(knjiga_id,naslov,autor,izdavac,kategorija,broj_primjeraka)
values (null,'Peti val','Yancey Rick','Sfera','SF',9);

insert into knjiga(knjiga_id,naslov,autor,izdavac,kategorija,broj_primjeraka)
values (null,'Hobit','John Ronald Reuel Tolkien','Alogoritam','SF',3);

insert into knjiga(knjiga_id,naslov,autor,izdavac,kategorija,broj_primjeraka)
values (null,'Ono','Stephen King','Algoritam','Horror',12);

insert into knjiga(knjiga_id,naslov,autor,izdavac,kategorija,broj_primjeraka)
values (null,'Fahrenheit 451','Ray Bradbury','Algoritam','SF',7);

-- --knjiznicari

insert into knjiznicar (knjiznicar_id,ime,prezime)
values (null,'Josip','Horvat');

insert into knjiznicar (knjiznicar_id,ime,prezime)
values (null,'Marija','Dir');

insert into knjiznicar (knjiznicar_id,ime,prezime)
values (null,'Kristijan','Petričević');

-- ---posudba

insert into posudba (posudba_id,knjiznicar_id,knjiga_id,korisnik_id,datum_posudbe)
values (null,2,3,1,'2021-11-18');

insert into posudba (posudba_id,knjiznicar_id,knjiga_id,korisnik_id,datum_posudbe)
values (null,1,4,22,'2021-11-19');

insert into posudba (posudba_id,knjiznicar_id,knjiga_id,korisnik_id,datum_posudbe)
values (null,2,2,12,'2021-11-19');

insert into posudba (posudba_id,knjiznicar_id,knjiga_id,korisnik_id,datum_posudbe)
values (null,1,1,15,'2021-11-19');

insert into posudba (posudba_id,knjiznicar_id,knjiga_id,korisnik_id,datum_posudbe)
values (null,3,2,1,'2021-11-25');

insert into posudba (posudba_id,knjiznicar_id,knjiga_id,korisnik_id,datum_posudbe)
values (null,3,4,9,'2021-11-25');

insert into posudba (posudba_id,knjiznicar_id,knjiga_id,korisnik_id,datum_posudbe)
values (null,1,9,13,'2021-11-27');

--- posudba_knjiga
insert into posudba_knjiga(posudba_id,knjiga_id)values 
(1,3),
(2,4),
(3,2),
(4,1),
(5,2),
(6,4),
(7,9);

---zakasnina

insert into zakasnina (zakasnina_id,posudba_id,cijena)values
(null,1,30),
(null,2,null),
(null,3,6),
(null,4,null),
(null,5,null),
(null,6,null),
(null,7,null);

--view

CREATE OR REPLACE VIEW podatci AS select k.ime ,k.prezime,k.adresa ,k.mijesto ,k.broj_mobitela ,k2.naslov "knjiga",k2.autor ,p.datum_posudbe,p.datum_povrata,k3.ime "djelatnik ime",k3.prezime "djelatnik prezime",z.cijena
from korisnik k inner join posudba p on k.korisnik_id = p.korisnik_id  
inner join posudba_knjiga pk on p.posudba_id = pk.posudba_id  
inner join knjiga k2 on k2.knjiga_id =pk.knjiga_id  
inner join knjiznicar k3 on k3.knjiznicar_id = p.knjiznicar_id  
inner join zakasnina z on p.posudba_id=z.posudba_id ; 
