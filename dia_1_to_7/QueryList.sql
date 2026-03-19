--crear un schema-----------------------------------------------------------------------------------

create schema schema_1;

CREATE DATABASE IF NOT EXISTS NetflixDB;
USE NetflixDB;

-- Creación de la tabla Series----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Series (
    serie_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    año_lanzamiento INT,
    genero VARCHAR(255)
);

-- Creación de la tabla Episodios--------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Episodios (
    episodio_id INT AUTO_INCREMENT PRIMARY KEY,
    serie_id INT,
    titulo VARCHAR(255) NOT NULL,
    duracion INT,
    rating_imdb DECIMAL(3,1),
    temporada INT,
    descripcion TEXT,
    fecha_estreno DATE,
    FOREIGN KEY (serie_id) REFERENCES Series(serie_id)
);

-- Creación de la tabla Actores----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Actores (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE
);

-- Creación de la tabla Actuaciones (relación muchos a muchos entre Actores y Series)------------------------------------------------

CREATE TABLE IF NOT EXISTS Actuaciones (
    actor_id INT,
    serie_id INT,
    personaje VARCHAR(255),
    FOREIGN KEY (actor_id) REFERENCES Actores(actor_id),
    FOREIGN KEY (serie_id) REFERENCES Series(serie_id),
    PRIMARY KEY (actor_id, serie_id)
);

--insertar datos a la tabla -------------------------------------------------------------------------

INSERT INTO Series (titulo, descripcion, año_lanzamiento, genero) VALUES 
('Suits', 'Un joven se convierte en abogado ficticio', 2010, 'Drama');


-- Selecciona todos los elementos de la tabla actores------------------------------------------------

select * from actores; 
select * from series;

-- Corre valores unicos de una lista SIN REPETIR-----------------------------------------------------

select distinct genero from series;

--Ordenar datos en una consulta----------------------------------------------------------------------
--asc de menor a mayor
--desc de mayor a menor

select titulo, duracion from episodios order by duracion desc;


-- ------------------------------combinacion de consultas---------------------------------------------

select distinct año_lanzamiento from series order by año_lanzamiento desc;

-- limitar el numero de resultados en una consulta----------------------------------------------------

select * from episodios limit 10;

-- ------------------------------combinacion de consultas---------------------------------------------

select distinct año_lanzamiento from series order by año_lanzamiento desc limit 5;

-- filtrar resultados por una condicion --------------------------------------------------------------

select * from series where genero = "Drama";

-- ///////////////////////////// OPERADORES DE COMPARACION CON WHERE /////////////////////////////////
--         =    IGUALDAD
--         <>   DESIGUALDAD
--         <    MENOR QUE
--         >    MAYOR QUE
--         <=   MENOR O IGUAL QUE
--         >=   MAYOR O IGUAL QUE

select * from series where año_lanzamiento > 2015 and año_lanzamiento < 2018

// ----------------------------------- OPERADORES LOGICOS ----------------------------------------------

select titulo, duracion, rating_imdb from episodios where duracion > 45 and rating_imdb >= 9;

select * from series where (genero = 'Comedia' or genero = 'Animación');

select * from series where genero <> 'Comedia'; // que no sean comedia


// ---------------------------------- CLAUSULAS IN Y NOT IN ---------------------------------------------

select * from Series where genero not in('Animación');
select * from Series where genero in('Animación');

// ---------------------------------- CLAUSULA LIKE ------------------------------------------------------

select * from series where titulo like '%The%';
select * from series where titulo  not like '%The%';

// ---------------------------------- FUNCIONES DE AGREGACION --------------------------------------------

select SUM(duracion) as duracionTotal from episodios where serie_id =5;

select COUNT(*) as filasTotales from episodios;

select MAX(duracion) from episodios;

select MIN(duracion) from episodios;

select AVG(duracion) from episodios;

select AVG(duracion) from episodios where serie_id in (1,2);

// ---------------------------------- GROUP BY ------------------------------------------------------

select serie_id, AVG(duracion) as promedio, SUM(duracion) as sumaDuracion from episodios where serie_id in (1,2) group by serie_id;

select serie_id, count(episodio_id) as countEpisodios from episodios group by serie_id;

select serie_id, MAX(duracion) from episodios group by 1;


// --------------------------------- HAVING ----------------------------------------------------------
// --- WHERE = APLICA FILTROS ANTES DE AGRUPARLOS CON O SIN GROUP BY 
// --- HAVING = APLICA FILTRO DESPUES DE AGRUPARLOS CON GROUP BY

select serie_id, COUNT(episodio_id) as numero_episodios 
from episodios
group by serie_id
having COUNT(episodio_id) > 11 



select temporada, SUM(duracion) as duracion_total from Episodios where serie_id=2 group by temporada having (duracion_total) > 400;


// ------------------------------ PROYECTO DIA 3 -------------------------------------------------------
// Actor o actriz que ha participado en la mayor cantidad de series

select actor_id, count(serie_id) as participaciones from actuaciones group by actor_id order by participaciones DESC

//Serie con rating de imdb promedio mas alto

select serie_id, AVG(rating_imdb) as promIMDB from episodios group by serie_id having promimdb > 9

// episodio mas largo 

select episodio_id, MAX(duracion) as duracion from episodios group by episodio_id order by duracion desc


// ---------------------------- DIA 4 ---------------------------
// ---- JOIN --> UNIR TABLAS Y COMBINAR INFORMACION DE DIFERENTES TABLAS EN UNA MISMA CONSULTA
// -------------------------- INNER JOIN ----------------------
// --------- 1ro .- INNER JOIN solo lo que tienen en comun ambas tablas

select * from Series
inner join actuaciones 
on series.serie_id = Actuaciones.serie_id limit 5 

select * from Series
inner join actuaciones 
on series.serie_id = Actuaciones.serie_id

// --- este es lo mismo
select titulo , personaje  from Series
inner join actuaciones 
on series.serie_id = Actuaciones.serie_id 
// -----que este
select s.titulo , a.personaje  from Series as s
inner join actuaciones as a
on s.serie_id = a.serie_id 


select titulo , personaje  from Series
inner join actuaciones 
on series.serie_id = Actuaciones.serie_id 
where titulo = 'Stranger Things'

// --- QUERY EXERCISE 1
SELECT * from  Series INNER JOIN Episodios ON Series.serie_id = Episodios.serie_id limit 10

// --- QUERY EXERCISE 2

select Series.titulo as titulo_serie, Episodios.titulo as titulo_episodio, Episodios.duracion FROM Series INNER JOIN Episodios ON Series.serie_id = Episodios.serie_id WHERE Series.titulo = 'Stranger Things'


// ---------------------------- LEFT JOIN ------------------------------
// -- Todos los datos de una tabla uniendolo con algun/algunos datos de otra tabla, se pueden llegar a tener duplicados

select series.titulo as 'Titulo de la serie', episodios.titulo as 'Titulo de Episodio' 
from series left join episodios 
on series.serie_id = episodios.serie_id
order by series.titulo 

 // ----ejercicio 1
 
 SELECT series.titulo as 'Título de la Serie', episodios.titulo as 'Título del Episodio', episodios.rating_imdb as 'Rating IMDB'
FROM series LEFT JOIN episodios
on series.serie_id = episodios.serie_id
order by series.titulo ASC


// --- EJERCICIO 2

SELECT series.titulo as 'Título de la Serie', episodios.titulo as 'Título del Episodio', episodios.rating_imdb as 'Rating IMDB'
FROM Series LEFT JOIN Episodios
ON Series.serie_id = Episodios.serie_id
where series.titulo = 'Stranger Things'
order by Episodios.rating_imdb DESC


// --------------------------- RIGHT JOIN ----------------------------------
// -- Todos los datos de una tabla uniendolo con algun/algunos datos de otra tabla, se pueden llegar a tener duplicados

select series.titulo as 'Titulo de la serie', episodios.titulo as 'Titulo de Episodio' 
from episodios right join series 
on episodios.serie_id =  series.serie_id
order by series.titulo 


// --- EJERCICIO 1

select series.titulo as 'Título de la Serie', episodios.titulo as 'Título de Episodio', episodios.duracion as 'Duración'
from series right join  episodios
on series.serie_id = episodios.serie_id
where duracion > 30
order by series.titulo asc

// ----------------------------------- UNION ALL --------- SI cuenta duplicados

select * from series 
where genero  = 'Ciencia ficción'
union all 
select * from series 
where genero  = 'Drama'

// ----------------------------------- UNION ------------- NO cuenta duplicados

select * from series 
where genero  = 'Ciencia ficción'
union
select * from series 
where genero  = 'Drama'

// ---- ejercicio

select episodios.titulo from episodios 
where duracion > 20 
union
select * from episodios 
where rating_imdb > 9


select episodios.titulo from episodios 
where duracion > 20 
union
select * from episodios 
where rating_imdb > 9


select episodios.titulo from episodios 
where duracion > 20 or rating_imdb > 9 
order by titulo asc

// ------------------------ PROYECTO DEL DIA 4 ------------------------------------

// --- ¿que generos son mas prevalentes en la tabla de series? GENEROS Y CANTIDAD DE SERIES DE CADA UNO

select genero, count(*) as cantidad_de_series 
from series
group by genero 
order by cantidad_de_series DESC

// -- 3 SERIES CON MAYOR RATING IMDB Y CUANTOS EPISODIOS TIENE CADA UNA

select series.titulo, count(episodios.episodio_id) as numero_episodios, avg(episodios.rating_imdb) as promedio_imdb
from series inner join episodios on series.serie_id = episodios.serie_id 
group by series.serie_id 
order by promedio_imdb desc limit 3

// -- DURACION TOTAL DE TODOS LOS EPISODIOS DE LA SERIE STRANGER THINGS GROUP BY, COUNT

select SUM(episodios.duracion) as duracion_total
from series inner join episodios on series.serie_id = episodios.serie_id
where series.titulo = 'Stranger Things'

select sum(duracion) as duracion_total
from episodios
where serie_id = 2

















