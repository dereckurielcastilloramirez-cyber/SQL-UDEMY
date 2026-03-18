-- Active: 1772945225937@@127.0.0.1@3306@bibliotecadb
CREATE INDEX idx_apellido ON empleados (apellido);

CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'password123';

-- Dar permisos sobre una base de datos:
GRANT ALL PRIVILEGES ON empresa.* TO 'app_user'@'localhost';

--Recarga los permisos.
FLUSH PRIVILEGES;

--Ver permisos
SHOW GRANTS FOR 'app_user'@'localhost';

-- Quitar permisos
REVOKE INSERT, UPDATE 
ON empresa.empleados 
FROM 'app_user'@'localhost';

-- Eliminar usuario
DROP USER 'app_user'@'localhost';