SELECT
  e.empleado_id,
  e.nombre AS empleado_nombre,
  e.apellido AS empleado_apellido,
  p.proyecto_id,
  p.nombre AS proyecto_nombre,
  a.horas_asignadas
FROM empleados e
JOIN asignacionesdeproyectos a
  ON e.empleado_id = a.empleado_id
JOIN proyectos p
  ON p.proyecto_id = a.proyecto_id
ORDER BY
  e.apellido ASC,
  e.nombre ASC,
  a.horas_asignadas DESC;


  