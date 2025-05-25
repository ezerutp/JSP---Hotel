-- Tabla: cliente
CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla: empleado
CREATE TABLE empleado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    clave VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    rol VARCHAR(50) NOT NULL
);

-- Tabla: tipo_habitacion
CREATE TABLE tipo_habitacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    capacidad INT NOT NULL
);

-- Tabla: habitacion
CREATE TABLE habitacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL,
    tipo_habitacion INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (tipo_habitacion) REFERENCES tipo_habitacion(id)
);

-- Tabla: reserva
CREATE TABLE reserva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_habitacion INT NOT NULL,
    fecha_entrada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    estado VARCHAR(20) NOT NULL,
    total_pago DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_habitacion) REFERENCES habitacion(id)
);

-- Tabla: pago
CREATE TABLE pago (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago DATE NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES reserva(id)
);

-- Tabla: factura
CREATE TABLE factura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pago INT NOT NULL,
    fecha_emision DATE NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_pago) REFERENCES pago(id)
);
