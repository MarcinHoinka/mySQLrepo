create database baza_sprzetowa;
use baza_sprzetowa;


create table klubowicze(
id_user int primary key auto_increment unique,
imie varchar(30) not null,
nazwisko varchar(30), 
ksywka varchar(15),
plec char(1) not null,
data_ur date,
waga smallint,
email varchar(30) not null unique,
telefon varchar(9),
uprawnienia varchar(1) default '1' 
);


create table logowanie(
log_id int primary key auto_increment unique,
haslo varchar(30) not null,
email varchar(30) not null unique,
foreign key (email) references klubowicze(email)
);

/* PL: id_kajaka_db dla bazy danych, id_kajaka dla użytkowników (sprzet jest fizycznie opisany danym id) 
Pozostaly sprzet tez jest analogicznie opisany dwoma id wg. pow. zasady 
ANG: id_kajaka_db for database use, id_kajaka is a reference for users (gear is marked with this id's) */

create table kajaki (
id_kajaka_db int primary key auto_increment unique,
id_kajaka varchar(6) not null unique,
marka varchar(20),
model varchar(20),
typ text,
wyporność smallint,
kolor varchar(20)
);

/*PL: widoki pomocnicze do tabeli kajaki, 
ANG: table views for filtering by type: 
kajaki_gorskie - whitewater  
kajaki_morskie - sea kayaks*/

create view kajaki_gorskie as select id_kajaka, marka, model, wyporność, kolor from kajaki where id_kajaka LIKE 'KG%'; 
create view kajaki_morskie as select id_kajaka, marka, model, kolor from kajaki where id_kajaka LIKE 'KM%';


create table wiosla (
id_wiosla_db int primary key auto_increment unique,
id_wiosla varchar(6) not null unique,
marka varchar(20),
model varchar(20),
typ text,
kat tinyint
);


create table kamizelki (
id_kamizelki_db int primary key auto_increment unique,
id_kamizelki varchar(7) not null unique,
marka varchar (20),
model varchar(20),
rozmiar varchar(4),
kolor varchar(20)
);


create table kaski (
id_kasku_db int primary key auto_increment unique,
id_kasku varchar(6) not null unique,
marka varchar (20),
model varchar(20),
rozmiar varchar(4),
kolor varchar(20),
garda ENUM('T', 'N') not null
);


create table fartuchy(
id_fartucha_db int primary key auto_increment unique,
id_fartucha varchar(6) not null unique,
marka varchar (20),
model varchar (20),
rozmiar varchar(4),
rozmiar_kokpitu varchar(8)
); 


create table asekuracja(
id_rzutki_db int primary key auto_increment unique,
id_rzutki varchar(6) not null unique,
marka varchar(20),
model varchar(20),
długosc tinyint
); 

create table rezerwacje(
id_rezerwacje int auto_increment unique,
data_rez_start date,
data_rez_end date,
id_user INT NOT NULL,
id_kajaka_db INT NOT NULL,
id_wiosla_db INT NOT NULL,
id_kamizelki_db INT NOT NULL,
id_kasku_db INT NOT NULL,
id_fartucha_db INT NOT NULL,
id_rzutki_db INT NOT NULL,
primary key (id_rezerwacje),
foreign key (id_user) references klubowicze(id_user),
foreign key (id_kajaka_db) references kajaki(id_kajaka_db),
foreign key (id_wiosla_db) references wiosla(id_wiosla_db),
foreign key (id_kamizelki_db) references kamizelki(id_kamizelki_db),
foreign key (id_kasku_db) references kaski(id_kasku_db),
foreign key (id_fartucha_db) references fartuchy(id_fartucha_db),
foreign key (id_rzutki_db) references asekuracja(id_rzutki_db)
); 





#ZAPYTANIA DO BAZY 

# Zapytanie o dostępność kajaka w bazie 
SELECT 
    id_kajaka_db, id_kajaka, marka, model,
    CASE
        WHEN
            (rez_start <= '2017-11-15'
                AND rez_end >= '2017-11-10')
                OR (rez_start >= '2017-11-10'
                AND rez_end <= '2017-11-15')
        THEN
            'Zajety'
        ELSE 'Wolny'
    END AS rezerwacja
FROM
    kajaki;

