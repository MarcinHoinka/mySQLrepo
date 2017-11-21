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
FROM    kajaki;
    
    
SELECT 
    id_wiosla_db, id_wiosla, marka, model,
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
FROM    wiosla;


SELECT 
    id_kamizelki_db, id_kamizelki, marka, model,
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
FROM     kamizelki;


SELECT 
    id_kasku_db, id_kasku, marka, model,
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
FROM    kaski;
    
    
    
SELECT 
    id_fartucha_db, id_fartucha, marka,
    model,
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
FROM    fartuchy; 
    
    
    
SELECT 
    id_rzutki_db, id_rzutki, marka, model,
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
FROM    asekuracja;

#Logowanie - sprawwdzenie czy zgadza sie email i hasło
SELECT 
k.imie, k.nazwisko, k.uprawnienia, k.email as email
FROM
    klubowicze as k
    JOIN
    logowanie as l
    where l.haslo COLLATE utf8_bin = 'rooB_Rumor' and (k.email = l.email);

#Historia zamówień
SELECT 
    r.data_rez_start, r.data_rez_end,
    k.imie, k.nazwisko, r.id_kajaka, r.id_wiosla, r.id_kamizelki, r.id_kasku, r.id_fartucha, r.id_rzutki
FROM
    rezerwacje AS r
        NATURAL JOIN
    klubowicze AS k
ORDER BY r.data_rez_start DESC;


#HISTORIA zamowień dla kajaków górskich
SELECT 
    r.data_rez_start, r.data_rez_end,
    k.imie, k.nazwisko, r.id_kajaka, r.id_wiosla, r.id_kamizelki, r.id_kasku, r.id_fartucha, r.id_rzutki
FROM
    rezerwacje AS r
        NATURAL JOIN
    klubowicze AS k
WHERE
    id_kajaka LIKE 'KG%'
ORDER BY r.data_rez_start DESC;

#HISTORIA zamowień dla kajaków morskich
SELECT 
    r.data_rez_start, r.data_rez_end,
    k.imie, k.nazwisko, r.id_kajaka, r.id_wiosla, r.id_kamizelki, r.id_kasku, r.id_fartucha, r.id_rzutki
FROM
    rezerwacje AS r
        NATURAL JOIN
    klubowicze AS k
WHERE
    id_kajaka LIKE 'KM%'
ORDER BY r.data_rez_start DESC;

#HISTORIA zamowień dla kanadyjek
SELECT 
    r.data_rez_start, r.data_rez_end,
    k.imie, k.nazwisko, r.id_kajaka, r.id_wiosla, r.id_kamizelki, r.id_kasku, r.id_fartucha, r.id_rzutki
FROM
    rezerwacje AS r
        NATURAL JOIN
    klubowicze AS k
WHERE
    id_kajaka LIKE 'KK%'
ORDER BY r.data_rez_start DESC;

  



#czy sprzęt jest zarezerwowowany
