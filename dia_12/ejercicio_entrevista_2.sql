-- Ejercicio 2
SELECT 
    D.nombre AS 'Nombre Departamento',
    SUM(AP.horas_asignadas) AS 'Total Horas Asignadas'
FROM 
    Departamentos D
JOIN 
    Empleados E ON D.depto_id = E.depto_id
JOIN 
    AsignacionesDeProyectos AP ON E.empleado_id = AP.empleado_id
GROUP BY 
    D.nombre
ORDER BY 
    SUM(AP.horas_asignadas) DESC;