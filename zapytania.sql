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
    id_fartucha_db, id_fartucha, marka, model,
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
    