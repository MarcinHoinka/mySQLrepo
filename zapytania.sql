#ZAPYTANIA DO BAZY 

# Zapytanie o dostępność kajaków w bazie w danym okresie. Zwraca: WOLNY/ZAJETY
SELECT 
    id_kajaka, marka, model,
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

#Zapytanie o dostępne kajaki w danym terminie.
SELECT 
    id_kajaka, marka, model,
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
FROM kajaki 
group by id_kajaka having rezerwacja = 'Wolny';


    
SELECT 
    id_wiosla, marka, model,
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
    id_kamizelki, marka, model,
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
    id_kasku, marka, model,
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
    id_fartucha, marka, model,
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
    id_rzutki, marka, model,
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



#Logowanie - sprawdzenie czy zgadza sie email i hasło
SELECT 
k.imie, k.nazwisko, k.uprawnienia, k.email as email
FROM
    klubowicze as k
    JOIN
    logowanie as l
    where l.haslo COLLATE utf8_bin = 'rooB_Rumor' and (k.email = l.email);

#Logowanie - zapytanie dla usera bez nadanych uprawnień
SELECT 
k.imie, k.nazwisko, k.uprawnienia, k.email as email
FROM
    klubowicze as k
    JOIN
    logowanie as l
    where l.haslo COLLATE utf8_bin = '1q2w3e4r' and (k.email = l.email);    



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
