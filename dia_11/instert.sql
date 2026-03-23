USE hoteldb;

-- Clientes: 10 registros
INSERT INTO clientes (nombre, contacto) VALUES
('Ana Perez','ana.perez@mail.com'),
('Luis Gonzalez','luis.gonzalez@mail.com'),
('Mariana Diaz','mariana.diaz@mail.com'),
('Carlos Ramirez','carlos.ramirez@mail.com'),
('Sofia Torres','sofia.torres@mail.com'),
('Javier Soto','javier.soto@mail.com'),
('Paola Rojas','paola.rojas@mail.com'),
('Marco Jimenez','marco.jimenez@mail.com'),
('Cecilia Soto','cecilia.soto@mail.com'),
('Juan Castillo','juan.castillo@mail.com');

-- Habitaciones: 8 registros
INSERT INTO habitaciones (tipo, descripcion, piso, precio, estado) VALUES
('individual','Habitación sencilla con cama single',1,50.00,'libre'),
('doble','Habitación doble estandar',2,75.00,'libre'),
('suite','Suite con sala y vistas',5,150.00,'libre'),
('individual','Individual con baño privado',1,55.00,'ocupada'),
('doble','Doble con terraza',3,85.00,'mantenimiento'),
('suite','Suite premium con jacuzzi',6,200.00,'libre'),
('doble','Doble económica',2,70.00,'libre'),
('individual','Individual básico',1,45.00,'libre');

-- Reservas: 12 registros
INSERT INTO reservas (cliente_id, habitacion_id, fecha_ingreso, fecha_salida, total, estado) VALUES
(1,1,'2026-04-01','2026-04-04',150.00,'confirmada'),
(2,2,'2026-04-10','2026-04-12',150.00,'pendiente'),
(3,3,'2026-05-03','2026-05-07',600.00,'confirmada'),
(4,4,'2026-03-15','2026-03-18',165.00,'finalizada'),
(1,5,'2026-06-01','2026-06-05',340.00,'pendiente'),
(5,6,'2026-04-20','2026-04-23',600.00,'confirmada'),
(6,2,'2026-07-11','2026-07-13',150.00,'cancelada'),
(7,7,'2026-05-09','2026-05-11',140.00,'confirmada'),
(8,8,'2026-06-02','2026-06-03',45.00,'pendiente'),
(9,3,'2026-06-10','2026-06-14',600.00,'confirmada'),
(10,1,'2026-07-01','2026-07-02',50.00,'pendiente'),
(4,6,'2026-08-01','2026-08-04',600.00,'pendiente');
