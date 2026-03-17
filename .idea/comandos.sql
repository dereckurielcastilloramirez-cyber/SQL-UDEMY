-- Active: 1772945225937@@127.0.0.1@3306@empresadb
select * from empleados;

INSERT INTO empleados (empleado_id,nombre, apellido, email, depto_id) VALUES (10,'Dereck', 'Castillo', 'dereck.castillo@multimediacorp.net', 10);

UPDATE empleados SET nombre='Dereck', apellido='Castillo', email='dereck.castillo@multimediacorp.net', depto_id=1 WHERE empleado_id=10;
