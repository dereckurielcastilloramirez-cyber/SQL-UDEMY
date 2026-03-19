-- Active: 1773805578137@@127.0.0.1@3306@empresadb
-- Active: 1773805578137@@127.0.0.1@3306@empresadb-- Active: 1773805578137@@127.0.0.1@3306@empresadb
-- crear un prodedimiento almacenado llamado "AgregarDepartamento"

-- Debe aceptar de entrada dos parámetros (nonbre y ubicacion del departamento) 

DELIMITER //
CREATE PROCEDURE AgregarDepartamento(IN nombre VARCHAR(250), IN ubicacion VARCHAR(250))
BEGIN
    INSERT INTO Departamentos (nombre, ubicacion) VALUES (nombre, ubicacion);
END //
DELIMITER ;

CALL `AgregarDepartamento`('CEO', 'Edificio Central'); -- Ejemplo de llamada al procedimiento almacenado