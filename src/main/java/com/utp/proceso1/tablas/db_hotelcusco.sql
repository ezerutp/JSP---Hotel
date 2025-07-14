USE  db_hotelcusco;

-- Volcando estructura para tabla db_hotelcusco.administradores
CREATE TABLE IF NOT EXISTS `administradores` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 0,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_hotelcusco.habitaciones
CREATE TABLE IF NOT EXISTS `habitaciones` (
  `id_habitacion` int(11) NOT NULL AUTO_INCREMENT,
  `numero_habitacion` varchar(255) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `estado` enum('DISPONIBLE','OCUPADA') DEFAULT 'DISPONIBLE',
  PRIMARY KEY (`id_habitacion`),
  UNIQUE KEY `numero_habitacion` (`numero_habitacion`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `habitaciones_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_habitacion` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_hotelcusco.mensajes_contacto
CREATE TABLE IF NOT EXISTS `mensajes_contacto` (
  `id_mensaje` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_envio` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('nuevo','leido') DEFAULT 'nuevo',
  PRIMARY KEY (`id_mensaje`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_hotelcusco.reserva
CREATE TABLE IF NOT EXISTS `reserva` (
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_habitacion` int(11) NOT NULL,
  `nombre_huesped` varchar(100) NOT NULL,
  `correo_huesped` varchar(100) NOT NULL DEFAULT 'no-definido@hotel.com',
  `telefono_huesped` varchar(15) NOT NULL DEFAULT '000000000',
  `fecha_checkin` date NOT NULL,
  `fecha_checkout` date NOT NULL,
  `cantidad_personas` int(11) NOT NULL,
  `precio_noche` decimal(10,2) DEFAULT 0.00,
  `total_pagar` decimal(10,2) DEFAULT 0.00,
  `estado_reserva` enum('pendiente','confirmada','cancelada','completada') DEFAULT 'pendiente',
  `fecha_reserva` timestamp NOT NULL DEFAULT current_timestamp(),
  `notas` text DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `id_habitacion` (`id_habitacion`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`id_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla db_hotelcusco.tipos_habitacion
CREATE TABLE IF NOT EXISTS `tipos_habitacion` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio_noche` double NOT NULL,
  `capacidad` int(11) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;