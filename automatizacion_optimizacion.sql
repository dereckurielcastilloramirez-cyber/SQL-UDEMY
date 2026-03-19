-- Active: 1773805578137@@127.0.0.1@3306@empresadb
-- Optimizacion y Automatizacion de Consultas SQL

-- VISTAS Una vista es una tabla virtual cuyo contenido esta definido por una consulta.

CREATE VIEW VistaEmpleadosTecnologia AS 
SELECT nombre, apellido, email 
FROM empleados
WHERE depto_id = 1;

-- VISTAS MATERIALIZADAS 
-- Una vista materializada es una vista que almacena físicamente los datos resultantes de la consulta.

CREATE MATERIALIZED VIEW VistaMaterializadaEmpleadosTecnologia AS
SELECT nombre, apellido, email  
FROM empleados
WHERE depto_id = 1;

-- TRIGGERS Un trigger es un procedimiento almacenado que se ejecuta automáticamente en respuesta a ciertos eventos en la base de datos.
-- son acciones automaticas que se ejecutan en respuesta a eventos como inserciones, actualizaciones o eliminaciones en una tabla.

DELIMITER $$
CREATE TRIGGER RegistrarNuevoEmpleado
AFTER INSERT ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO logEmpleados (empleado_id, fecha_registro) 
    VALUES (NEW.empleado_id, NOW());
END$$
DELIMITER ;

INSERT INTO empleados (nombre, apellido, email)
VALUES ('Alejandra', 'Rocha', 'alejandra.rocha@bmw.com');

SELECT * FROM logEmpleados;

-- EJEMPLOS ADICIONALES DE TRIGGERS para empresadb

-- 1) BEFORE INSERT: valida y ajusta antes de insertar
DELIMITER $$
CREATE TRIGGER ValidarEmpleadoAntesInsert
BEFORE INSERT ON empleados
FOR EACH ROW
BEGIN
    IF NEW.email NOT LIKE '%@%.%' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email inválido';
    END IF;

    IF NEW.depto_id IS NULL THEN
        SET NEW.depto_id = 99; -- asigna valor por defecto si falta
    END IF;
END$$
DELIMITER ;

INSERT INTO empleados (nombre, apellido, email)
VALUES ('Alejandra', 'Rocha', 'alejandra.rochabmw.com');

-- 2) AFTER UPDATE: auditoría de cambios de email
-- Nota: en tu tabla logEmpleados solo existen columnas (empleado_id, fecha_registro).
-- Si quieres incluir texto en evento puedes agregar la columna con ALTER TABLE.
DELIMITER $$
CREATE TRIGGER AuditoriaEmailDespuesUpdate
AFTER UPDATE ON empleados
FOR EACH ROW
BEGIN
    IF OLD.email <> NEW.email THEN
        INSERT INTO logEmpleados (empleado_id, fecha_registro)
        VALUES (NEW.empleado_id, NOW());
        -- Para registro enriquecido (descomenta la alternativa si añades columna evento):
        -- INSERT INTO logEmpleados (empleado_id, fecha_registro, evento)
        -- VALUES (NEW.empleado_id, NOW(), CONCAT('Email cambiado: ', OLD.email, ' -> ', NEW.email));
    END IF;
END$$

DELIMITER ;
UPDATE empleados SET email ='alejandra.rocha@p3.com' WHERE empleado_id = 1;

-- 3) INSTEAD OF DELETE: ejemplo para vista (o tabla si el motor lo soporta)
-- En MySQL no hay INSTEAD OF en tablas directas; se usa en vista en otros motores.
-- Aquí se crea vista + trigger en Oracle/PostgreSQL (sintaxis varía por SGBD):
-- CREATE VIEW vista_empleados_activos AS SELECT * FROM empleados WHERE activo = 1;
-- CREATE TRIGGER BorrarEmpleadoVista
-- INSTEAD OF DELETE ON vista_empleados_activos
-- FOR EACH ROW
-- BEGIN
--   DELETE FROM empleados WHERE empleado_id = OLD.empleado_id;
-- END;

