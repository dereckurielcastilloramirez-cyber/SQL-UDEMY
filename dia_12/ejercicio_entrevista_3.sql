-- Ejercicio 3
SELECT 
    E.nombre AS 'Nombre',
    E.apellido AS 'Apellido',
    SUM(AP.horas_asignadas) AS 'Total Horas Trabajadas',
    RANK() OVER (PARTITION BY E.depto_id ORDER BY SUM(AP.horas_asignadas) DESC) AS 'Ranking Departamental'
FROM 
    Empleados E
JOIN 
    AsignacionesDeProyectos AP ON E.empleado_id = AP.empleado_id
GROUP BY 
    E.empleado_id, E.nombre, E.apellido, E.depto_id
ORDER BY 
    E.depto_id, 'Ranking Departamental';