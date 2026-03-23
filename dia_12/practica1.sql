-- Active: 1773805578137@@127.0.0.1@3306@empresadb
-- Mostrar nombre y apellido de empleado, nombre del proyecto y horas asignadas.
-- Ordenar por empleado (apellido, nombre) y luego por horas asignadas DESC.
SELECT
  e.nombre AS 'Nombre Empleado',
  e.apellido AS 'Apellido Empleado',
  p.nombre AS 'Nombre Proyecto',
  a.horas_asignadas AS 'Horas Asignadas'
FROM empleados e
JOIN asignacionesdeproyectos a
  ON e.empleado_id = a.empleado_id
JOIN proyectos p
  ON a.proyecto_id = p.proyecto_id
ORDER BY
  e.nombre,
  e.apellido,
  a.horas_asignadas DESC;