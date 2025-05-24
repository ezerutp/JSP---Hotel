USE db_hotelreservas;

CREATE TABLE tipo_habitacion (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    capacidad INT NOT NULL
);

CREATE TABLE habitacion (
    id_habitacion INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL,
    id_tipo INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado ENUM('disponible', 'reservada', 'ocupada', 'mantenimiento') DEFAULT 'disponible',
    FOREIGN KEY (id_tipo) REFERENCES tipo_habitacion(id_tipo)
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(15) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    nombreHuesped VARCHAR(100) NOT NULL,
    habitacion VARCHAR(10) NOT NULL,
    checkin DATE NOT NULL,
    checkout DATE NOT NULL,
    personas INT NOT NULL
);


CREATE TABLE pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago DATE NOT NULL,
    metodo_pago ENUM('efectivo', 'tarjeta', 'transferencia'),
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva)
);
CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    clave VARCHAR(100) NOT NULL,
    nombre VARCHAR(100),
    rol ENUM('admin', 'recepcionista') DEFAULT 'recepcionista'
);
CREATE TABLE factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_pago INT NOT NULL,
    fecha_emision DATE NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_pago) REFERENCES pago(id_pago)
);