

-- Tabla de administradores 


USE  db_hotelcusco;

CREATE TABLE administradores (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    nombre_completo VARCHAR(100) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de mensajes de contacto
CREATE TABLE mensajes_contacto (
    id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    mensaje TEXT NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('nuevo', 'leido') DEFAULT 'nuevo'
);

-- Tabla de tipos de habitación 
CREATE TABLE tipos_habitacion (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255),
    precio_noche DECIMAL(10,2) NOT NULL,
    capacidad INT NOT NULL
);

-- Tabla de habitaciones 
CREATE TABLE habitaciones (
    id_habitacion INT AUTO_INCREMENT PRIMARY KEY,
    numero_habitacion VARCHAR(10) NOT NULL UNIQUE,
    id_tipo INT NOT NULL,
    estado ENUM('disponible', 'ocupada') DEFAULT 'disponible',
    FOREIGN KEY (id_tipo) REFERENCES tipos_habitacion(id_tipo)
);

-- Tabla de reserva (mejorada con todos los campos necesarios)
CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_habitacion INT NOT NULL,
    nombre_huesped VARCHAR(100) NOT NULL,
    correo_huesped VARCHAR(100) NOT NULL DEFAULT 'no-definido@hotel.com',
    telefono_huesped VARCHAR(15) NOT NULL DEFAULT '000000000',
    fecha_checkin DATE NOT NULL,
    fecha_checkout DATE NOT NULL,
    cantidad_personas INT NOT NULL,
    precio_noche DECIMAL(10,2) DEFAULT 0,
    total_pagar DECIMAL(10,2) DEFAULT 0,
    estado_reserva ENUM('pendiente', 'confirmada', 'cancelada', 'completada') DEFAULT 'pendiente',
    fecha_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    notas TEXT,
    FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id_habitacion)
);