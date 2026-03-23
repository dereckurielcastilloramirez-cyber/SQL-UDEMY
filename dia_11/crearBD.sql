-- 1) Crear BD
CREATE DATABASE IF NOT EXISTS ReservasDB;

USE ReservasDB;

-- 2) Clientes
CREATE TABLE IF NOT EXISTS clientes (
    cliente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 3) Habitaciones
CREATE TABLE IF NOT EXISTS habitaciones (
    habitacion_id INT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,            -- e.g. 'individual', 'doble', 'suite'
    descripcion VARCHAR(255),
    piso INT,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estado ENUM('libre','ocupada','mantenimiento') NOT NULL DEFAULT 'libre',
    PRIMARY KEY (habitacion_id)
) ENGINE=InnoDB;

-- 4) Reservas
CREATE TABLE IF NOT EXISTS reservas (
    reserva_id INT NOT NULL AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    habitacion_id INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estado ENUM('pendiente','confirmada','cancelada','finalizada') NOT NULL DEFAULT 'pendiente',
    fecha_reserva DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (reserva_id),
    CONSTRAINT fk_reserva_cliente
      FOREIGN KEY (cliente_id)
      REFERENCES clientes(cliente_id)
      ON UPDATE CASCADE
      ON DELETE RESTRICT,
    CONSTRAINT fk_reserva_habitacion
      FOREIGN KEY (habitacion_id)
      REFERENCES habitaciones(habitacion_id)
      ON UPDATE CASCADE
      ON DELETE RESTRICT
) ENGINE=InnoDB;