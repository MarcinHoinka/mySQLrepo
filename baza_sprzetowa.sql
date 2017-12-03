create database baza_sprzetowa;
use baza_sprzetowa;

CREATE TABLE klubowicze (
    id_user INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    imie VARCHAR(30) NOT NULL,
    nazwisko VARCHAR(30),
    ksywka VARCHAR(15),
    plec CHAR(1) NOT NULL,
    data_ur DATE,
    waga SMALLINT,
    email varchar(30) not null unique,
    telefon VARCHAR(12),
    uprawnienia VARCHAR(1) DEFAULT '1'
);



CREATE TABLE logowanie (
    log_id INT AUTO_INCREMENT UNIQUE,
    haslo VARCHAR(30)CHARSET UTF8 COLLATE UTF8_BIN NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY (email),
    CONSTRAINT FK_email FOREIGN KEY (email)
        REFERENCES klubowicze (email)
        ON UPDATE CASCADE ON DELETE CASCADE
);



/* PL: id_kajaka_db dla bazy danych, id_kajaka dla użytkowników (sprzet jest fizycznie opisany danym id) 
Pozostaly sprzet tez jest analogicznie opisany dwoma id wg. pow. zasady 
ANG: id_kajaka_db for database use, id_kajaka is a reference for users (gear is marked with this id's) */


CREATE TABLE kajaki (
    id_kajaka_db INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    id_kajaka VARCHAR(6) NOT NULL UNIQUE,
    marka VARCHAR(20),
    model VARCHAR(20),
    typ TEXT,
    wypornosc SMALLINT,
    kolor VARCHAR(20),
    rez_start DATE,
    rez_end DATE
);


/*PL: widoki pomocnicze do tabeli kajaki, 
ANG: table views for filtering by type: 
kajaki_gorskie - whitewater  
kajaki_morskie - sea kayaks*/

CREATE VIEW kajaki_gorskie as select id_kajaka, marka, model, wypornosc, kolor from kajaki where id_kajaka LIKE 'KG%'; 
CREATE VIEW kajaki_morskie as select id_kajaka, marka, model, kolor from kajaki where id_kajaka LIKE 'KM%';
CREATE VIEW kajaki_zwalkowe as select id_kajaka, marka, model, kolor from kajaki where id_kajaka LIKE 'KZ%';
CREATE VIEW kanadyjki as select id_kajaka, marka, model, kolor from kajaki where id_kajaka LIKE 'KK%';


CREATE TABLE wiosla (
    id_wiosla_db INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    id_wiosla VARCHAR(6) NOT NULL UNIQUE,
    marka VARCHAR(20),
    model VARCHAR(20),
    typ TEXT,
    kat TINYINT,
    rez_start DATE,
    rez_end DATE
);


CREATE TABLE kamizelki (
    id_kamizelki_db INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    id_kamizelki VARCHAR(7) NOT NULL UNIQUE,
    marka VARCHAR(20),
    model VARCHAR(20),
    rozmiar VARCHAR(4),
    kolor VARCHAR(20),
    rez_start DATE,
    rez_end DATE
);


CREATE TABLE kaski (
    id_kasku_db INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    id_kasku VARCHAR(6) NOT NULL UNIQUE,
    marka VARCHAR(20),
    model VARCHAR(20),
    rozmiar VARCHAR(4),
    kolor VARCHAR(20),
    garda ENUM('T', 'N') NOT NULL,
    rez_start DATE,
    rez_end DATE
);


CREATE TABLE fartuchy (
    id_fartucha_db INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    id_fartucha VARCHAR(6) NOT NULL UNIQUE,
    marka VARCHAR(20),
    model VARCHAR(20),
    rozmiar VARCHAR(4),
    rozmiar_kokpitu VARCHAR(8),
    rez_start DATE,
    rez_end DATE
); 


CREATE TABLE asekuracja (
    id_rzutki_db INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    id_rzutki VARCHAR(6) NOT NULL UNIQUE,
    marka VARCHAR(20),
    model VARCHAR(20),
    dlugosc TINYINT,
    rez_start DATE,
    rez_end DATE
); 


CREATE TABLE rezerwacje (
    id_rezerwacje INT AUTO_INCREMENT UNIQUE,
    data_rez_start DATE NOT NULL,
    data_rez_end DATE NOT NULL,
    id_user INT NOT NULL,
    id_kajaka VARCHAR(10),
    id_wiosla VARCHAR(10),
    id_kamizelki VARCHAR(10),
    id_kasku VARCHAR(10),
    id_fartucha VARCHAR(10),
    id_rzutki VARCHAR(10),
    PRIMARY KEY (id_rezerwacje),
    FOREIGN KEY (id_user)
        REFERENCES klubowicze (id_user),
    FOREIGN KEY (id_kajaka)
        REFERENCES kajaki (id_kajaka),
    FOREIGN KEY (id_wiosla)
        REFERENCES wiosla (id_wiosla),
    FOREIGN KEY (id_kamizelki)
        REFERENCES kamizelki (id_kamizelki),
    FOREIGN KEY (id_kasku)
        REFERENCES kaski (id_kasku),
    FOREIGN KEY (id_fartucha)
        REFERENCES fartuchy (id_fartucha),
    FOREIGN KEY (id_rzutki)
        REFERENCES asekuracja (id_rzutki)
);


CREATE VIEW historia_rez AS
    SELECT id_user, data_rez_start, data_rez_end, id_kajaka, id_wiosla, id_kamizelki, id_kasku, id_fartucha, id_rzutki
    FROM rezerwacje
    GROUP BY data_rez_end DESC;
    
# WIDOK: Historia zamówień z info o klubowiczu
CREATE VIEW historia_rez2 AS
SELECT r.data_rez_start, r.data_rez_end,
    k.imie, k.nazwisko, r.id_kajaka, r.id_wiosla, r.id_kamizelki, r.id_kasku, r.id_fartucha, r.id_rzutki
FROM
    rezerwacje AS r
        NATURAL JOIN
    klubowicze AS k
ORDER BY r.data_rez_start DESC;