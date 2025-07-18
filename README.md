# 🏨 Sistema de Gestión Hotelera - Hotel Cusco

[![Archived](https://img.shields.io/badge/Status-Archived-yellow)](https://github.com/ezerutp/JSP---Hotel)
[![Java](https://img.shields.io/badge/Java-1.8-orange)](https://openjdk.java.net/projects/jdk8/)
[![JSP](https://img.shields.io/badge/JSP-2.3-blue)](https://jcp.org/en/jsr/detail?id=245)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-blue)](https://www.mysql.com/)

> **Nota:** Este proyecto fue desarrollado como parte de una asignatura universitaria en la Universidad Tecnológica del Perú (UTP) y ya se encuentra finalizado. Sin embargo, puede ser mejorado en aspectos como la estructura de la base de datos y la lógica general de la aplicación.

Un sistema completo de gestión hotelera desarrollado en Java JSP que permite administrar reservas, habitaciones y empleados de un hotel ubicado en Cusco, Perú. El sistema está orientado al turismo cusqueño y ofrece una experiencia completa tanto para huéspedes como para administradores.

## 📋 Tabla de Contenidos
- [Características](#-características)
- [Tecnologías Utilizadas](#-tecnologías-utilizadas)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Instalación](#-instalación)
- [Uso](#-uso)
- [Capturas de Pantalla](#-capturas-de-pantalla)
- [Base de Datos](#-base-de-datos)
- [Funcionalidades](#-funcionalidades)
- [Contribución](#-contribución)
- [Licencia](#-licencia)

## ✨ Características

### 🏠 Para Huéspedes
- **Página principal atractiva** con información turística de Cusco
- **Sistema de reservas en línea** con validación de fechas
- **Galería de habitaciones** con diferentes tipos y precios
- **Formulario de contacto** para consultas
- **Diseño responsive** compatible con dispositivos móviles

### 👨‍💼 Para Administradores
- **Dashboard completo** con estadísticas en tiempo real
- **Gestión de empleados** (CRUD completo)
- **Gestión de habitaciones** con estados y tipos
- **Administración de reservas** con filtros y búsqueda
- **Sistema de reportes** con gráficos interactivos
- **Gestión de mensajes** de contacto

## 🛠️ Tecnologías Utilizadas

### Backend
- **Java 1.8** - Lenguaje de programación principal
- **JSP (JavaServer Pages)** - Tecnología de presentación
- **Servlets** - Lógica de controladores
- **JPA/Hibernate** - Mapeo objeto-relacional
- **MySQL 8.0** - Base de datos relacional
- **Maven** - Gestión de dependencias

### Frontend
- **HTML5** & **CSS3** - Estructura y estilos
- **JavaScript ES6** - Interactividad del cliente
- **TailwindCSS** - Framework de estilos
- **Font Awesome** - Iconografía
- **Chart.js** - Gráficos y reportes
- **Bootstrap Icons** - Iconos adicionales

### Servidor
- **Apache Tomcat** - Servidor de aplicaciones
- **Jakarta EE 8.0** - Plataforma empresarial

## 📁 Estructura del Proyecto

```
JSP---Hotel/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/utp/
│       │       ├── controlador/          # Servlets y controladores
│       │       ├── modelo/               # Entidades JPA
│       │       ├── dao/                  # Data Access Objects
│       │       └── util/                 # Utilidades y helpers
│       ├── resources/
│       │   └── META-INF/
│       │       └── persistence.xml       # Configuración JPA
│       └── webapp/
│           ├── css/                      # Hojas de estilo
│           ├── imagenes/                 # Recursos multimedia
│           ├── components/               # Componentes JSP reutilizables
│           ├── dashboard/                # Panel administrativo
│           ├── META-INF/                 # Configuración del contexto
│           ├── WEB-INF/                  # Configuración web
│           ├── *.jsp                     # Páginas principales
│           ├── contacto.jsp              # Formulario de contacto
│           ├── index.jsp                 # Página principal
│           ├── login.jsp                 # Autenticación
│           ├── reservar.jsp              # Sistema de reservas
│           └── reservaExitosa.jsp        # Confirmación de reserva
├── target/                               # Archivos compilados
├── pom.xml                              # Configuración Maven
└── README.md                            # Documentación
```

## 🚀 Instalación

### Prerrequisitos
- Java Development Kit (JDK) 1.8 o superior
- Apache Tomcat 9.x
- MySQL Server 8.0
- Maven 3.6+
- IDE compatible (NetBeans, IntelliJ IDEA, Eclipse)

### Pasos de instalación

1. **Clonar el repositorio**
```bash
git clone https://github.com/ezerutp/JSP---Hotel.git
cd JSP---Hotel
```

2. **Configurar la base de datos**
```sql
-- Crear la base de datos
CREATE DATABASE hotel_cusco;
USE hotel_cusco;

-- Ejecuta la consulta sql para la creaccion de las tablas
```

3. **Configurar la conexión a la base de datos**
Editar `src\main\java\com\utp\proceso1\servicio\conexionServicio.java`:
```java
    private static final String URL = "jdbc:mysql://localhost:3306/db_hotelcusco";
    private static final String USUARIO = "root";
    private static final String CONTRASENA = "";
```

4. **Compilar el proyecto**
```bash
mvn clean compile
```

5. **Generar el archivo WAR**
```bash
mvn package
```

6. **Desplegar en Tomcat**
- Copiar el archivo `target/Proceso1-1.war` a la carpeta `webapps` de Tomcat
- Iniciar el servidor Tomcat
- Acceder a `http://localhost:8080/Proceso1`

## 💻 Uso

### Acceso Público
- **Página Principal**: `http://localhost:8080/Proceso1/`
- **Reservas**: `http://localhost:8080/Proceso1/reservar`
- **Contacto**: `http://localhost:8080/Proceso1/contacto.jsp`

### Panel Administrativo
- **Login**: `http://localhost:8080/Proceso1/login.jsp`
- **Dashboard**: `http://localhost:8080/Proceso1/dashboard/`

## Seeders
La clase `src\main\java\com\utp\proceso1\seeder\DatabaseSeeder.java` contiene registros de prueba para la base de datos, incluyendo usuarios de ejemplo para acceder al sistema:  
- Usuario estándar: **user / user**  
- Administrador: **admin / admin**

## 📊 Capturas de Pantalla

### Página Principal
La página de inicio presenta información turística de Cusco con un carrusel de imágenes y enlaces a los principales atractivos turísticos.

![Página Principal](screenshot/ScreenShot%20Tool%20-20250718182955.png)
![Sistema de Reservas](screenshot/ScreenShot%20Tool%20-20250718183014.png)

### Sistema de Reservas
Formulario intuitivo para realizar reservas con validación de fechas, selección de habitaciones y cálculo automático de precios.

![Sistema de Reservas](screenshot/ScreenShot%20Tool%20-20250718183523.png)

### Dashboard Administrativo
Panel de control completo con estadísticas, gestión de reservas, empleados y habitaciones con interfaz moderna y responsive.

![Login](screenshot/ScreenShot%20Tool%20-20250718183031.png)
![Dashboard Administrativo](screenshot/ScreenShot%20Tool%20-20250718183108.png)

## 🗄️ Base de Datos

### Entidades principales:
- **Habitacion** - Información de habitaciones del hotel
- **TipoHabitacion** - Tipos de habitación (Simple, Doble, Suite, etc.)
- **Reserva** - Reservas realizadas por huéspedes
- **Administrador** - Usuarios del sistema administrativo
- **Mensaje** - Mensajes de contacto

### Relaciones:
- Habitacion ↔ TipoHabitacion (Many-to-One)
- Reserva ↔ Habitacion (Many-to-One)
- Reserva ↔ EstadoReserva (Enum)

## 🔧 Funcionalidades

### Módulo Público
- ✅ Visualización de habitaciones disponibles
- ✅ Sistema de reservas con validaciones
- ✅ Formulario de contacto
- ✅ Información turística de Cusco
- ✅ Diseño responsive

### Módulo Administrativo
- ✅ **Dashboard** con métricas y estadísticas
- ✅ **Gestión de Empleados**: Crear, editar, eliminar y listar
- ✅ **Gestión de Habitaciones**: CRUD completo con tipos y estados
- ✅ **Gestión de Reservas**: Ver, filtrar y eliminar reservas
- ✅ **Sistema de Reportes**: Gráficos de ocupación y ingresos
- ✅ **Gestión de Mensajes**: Visualizar mensajes de contacto

### Características Técnicas
- ✅ Patrón MVC (Model-View-Controller)
- ✅ Data Access Object (DAO) pattern
- ✅ Validación de formularios (cliente y servidor)
- ✅ Manejo de sesiones
- ✅ Responsive design con TailwindCSS
- ✅ Componentes JSP reutilizables

## 🎯 Mejoras Futuras

### Funcionalidades Pendientes
- [ ] Sistema de autenticación más robusto
- [ ] API RESTful para servicios móviles
- [ ] Sistema de notificaciones por email
- [ ] Integración con sistemas de pago
- [ ] Módulo de housekeeping
- [ ] Sistema de check-in/check-out automático
- [ ] Reportes más avanzados con filtros dinámicos
- [ ] Sistema de backup automático

### Mejoras Técnicas
- [ ] Migración a Spring Boot
- [ ] Implementación de microservicios
- [ ] Containerización con Docker
- [ ] Tests unitarios e integración
- [ ] Optimización de consultas SQL
- [ ] Implementación de cache con Redis
- [ ] Logging avanzado con Log4j2

## 🤝 Contribución

Aunque este proyecto está archivado, las contribuciones son bienvenidas para fines educativos:

1. Fork del proyecto
2. Crear una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit de los cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

## 📜 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

---

## 🧠 Autor

**Desarrollado por Ezer Vidarte**  
Ingeniero de Sistemas | UTP 🇵🇪  
[GitHub](https://github.com/ezerutp) | [LinkedIn](https://linkedin.com/in/ezervidarte)

---