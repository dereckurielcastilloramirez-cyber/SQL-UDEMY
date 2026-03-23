-- Ejercicio 1
SELECT 
    E.nombre AS 'Nombre Empleado', 
    E.apellido AS 'Apellido Empleado', 
    P.nombre AS 'Nombre Proyecto', 
    A.horas_asignadas AS 'Horas Asignadas'
FROM 
    Empleados E
JOIN 
    AsignacionesDeProyectos A ON E.empleado_id = A.empleado_id
JOIN 
    Proyectos P ON A.proyecto_id = P.proyecto_id
ORDER BY 
    E.nombre, E.apellido, A.horas_asignadas DESC;