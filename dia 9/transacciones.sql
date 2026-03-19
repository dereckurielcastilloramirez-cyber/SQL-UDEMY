-- Active: 1773805578137@@127.0.0.1@3306@empresadb
-- transacciones.sql

-- Una transacción es un conjunto de operaciones SQL que se ejecutan como una unidad atómica. 
-- O se ejecutan todas correctamente, o se revierte (deshace) completamente si ocurre un error. 
--Esto garantiza la consistencia de los datos.

-- PRINCIPIOS DE LAS TRANSACCIONES: ACID
-- Atomicidad: Todas las operaciones dentro de la transacción se completan o ninguna se completa.
-- Consistencia: La transacción lleva a la base de datos de un estado válido a otro estado válido.
-- Aislamiento: Las transacciones concurrentes no interfieren entre sí.         
-- Durabilidad: Una vez que una transacción se ha comprometido, sus cambios son permanentes, incluso en caso de fallos del sistema.

-- BEGIN TRANSACTION inicia una nueva transacción.
-- COMMIT TRANSACTION confirma los cambios realizados por la transacción.   
-- ROLLBACK TRANSACTION revierte los cambios realizados por la transacción, deshaciendo todas las operaciones realizadas desde el BEGIN TRANSACTION.

-- Asignar a varios empleados a un proyecto específico utilizando una transacción para garantizar que todos los empleados se asignen correctamente o ninguno lo haga en caso de error.
BEGIN;
SAVEPOINT PreValidacion; -- Establece un punto de guardado para poder volver a este estado si es necesario.
INSERT INTO asignacionesdeproyectos (proyecto_id, empleado_id, horas_asignadas) VALUES (5, 1, 10);
INSERT INTO asignacionesdeproyectos (proyecto_id, empleado_id, horas_asignadas) VALUES (5, 2, 15);

COMMIT;

ROLLBACK TO PreValidacion; -- Si ocurre un error en alguna de las inserciones, se puede usar ROLLBACK para deshacer todas las operaciones realizadas desde el BEGIN TRANSACTION.