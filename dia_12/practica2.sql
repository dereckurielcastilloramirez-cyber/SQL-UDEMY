SELECT d.nombre AS 'Departamento', SUM(a.horas_asignadas) AS 'Total Horas Asignadas'
FROM departamentos d
JOIN empleados e ON d.depto_id = e.depto_id
JOIN asignacionesdeproyectos a ON e.empleado_id = a.empleado_id
GROUP BY d.nombre
ORDER BY SUM(a.horas_asignadas)  DESC;;