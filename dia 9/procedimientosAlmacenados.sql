-- Active: 1773805578137@@127.0.0.1@3306@empresadb

 -- PROCEDIMIENTOS ALMACENADOS - STORED PROCEDURES

 DELIMITER //
 CREATE PROCEDURE AgregarEmpleado(
     IN _nombre VARCHAR(255),
     IN _apellido VARCHAR(255),
     IN _email VARCHAR(255),
     IN _depto_id INT
 )
 BEGIN
     INSERT INTO Empleados (nombre, apellido, email, depto_id)
     VALUES (_nombre, _apellido, _email, _depto_id);
 END //
 DELIMITER ;

 -- BEGIN y END delimitan el bloque de código del procedimiento almacenado.
 -- IN indica que los parámetros son de entrada, es decir, se pasan al procedimiento cuando se llama.
 -- El procedimiento AgregarEmpleado inserta un nuevo registro en la tabla Empleados con los valores proporcionados.

 --CREATE PROCEDURE es la creación del procedimiento almacenado, seguido del nombre del procedimiento y los parámetros que acepta.
 --DELIMITER // cambia el delimitador de comandos para permitir el uso de ; dentro del procedimiento sin finalizar la declaración del procedimiento.
 --DELIMITER ; restablece el delimitador de comandos a su valor predeterminado después de la definición del procedimiento.


 -- llamar al procedimiento almacenado para agregar un nuevo empleado
 CALL AgregarEmpleado('Uriel', 'Ramirez', 'uriel.ramirez@multimediacorp.net', 1);

 SELECT * FROM Empleados;