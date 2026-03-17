-- Active: 1772945225937@@127.0.0.1@3306@empresadb
-- COMANDOS DDL

select * from empleados;

-- COMANDOS DML Y CRUD

INSERT INTO empleados (empleado_id,nombre, apellido, email, depto_id) VALUES (10,'Dereck', 'Castillo', 'dereck.castillo@multimediacorp.net', 10);

UPDATE empleados SET nombre='Dereck', apellido='Castillo', email='dereck.castillo@multimediacorp.net', depto_id=1 WHERE empleado_id=10;

DELETE FROM empleados WHERE empleado_id=10;

CREATE TABLE Equipos (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    departamento_id INT,
    empleado_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(depto_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

INSERT INTO equipos (nombre, departamento_id, empleado_id) VALUES
('Equipo Reclutamiento', 1, 5),
('Equipo Desarrollo Backend', 2, 2),
('Equipo Desarrollo Frontend', 2, 3),
('Equipo Contabilidad', 3, 6),
('Equipo Publicidad', 4, 4),
('Equipo Redes Sociales', 4, 7),
('Equipo Almacen', 5,9),
('Equipo Distribucion', 5,1);

SELECT* FROM equipos;
