-- Active: 1773805578137@@127.0.0.1@3306@empresadb
WITH HorasEmpleado AS (
    SELECT 
        empleado_id, SUM(horas_asignadas) AS TotalHoras
    FROM  
        AsignacionesDeProyectos
    GROUP BY 
        empleado_id
)
SELECT E.nombre, E.apellido, H.TotalHoras
FROM Empleados E
JOIN HorasEmpleado H ON E.empleado_id = H.empleado_id
ORDER BY H.TotalHoras DESC

