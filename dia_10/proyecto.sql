-- Active: 1773805578137@@127.0.0.1@3306@empresadb

-- crear una vista llamada VistaEmpleadosProyectos que muestre el nombre, apellido del empleado junto con el proyecto en el que esta asignado
-- usar las tablas empleados, AsignacionesdeProyectos y proyectos

CREATE VIEW VistaEmpleadosProyectos AS
SELECT e.nombre AS NombreEmpleado, e.apellido AS ApellidoEmpleado, p.nombre AS NombreProyecto
FROM empleados e
JOIN AsignacionesdeProyectos ap ON e.empleado_id = ap.empleado_id
JOIN proyectos p ON ap.proyecto_id = p.proyecto_id;
-- consultar la vista para verificar su contenido
SELECT * FROM VistaEmpleadosProyectos;
