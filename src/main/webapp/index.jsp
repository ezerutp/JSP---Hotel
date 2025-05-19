<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Cusco Mágico</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- CSS Personalizado -->
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="css/componentes/botones.css">
    <link rel="stylesheet" href="css/componentes/tarjetas.css">
    <link rel="stylesheet" href="css/carpetas_adicionales/index.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <!-- Banner Principal -->
    <!-- Banner Principal con imagen transparente -->
     <section class="hero-banner text-white d-flex align-items-center position-relative">
    <!-- Imagen de fondo con transparencia -->
    <div class="banner-overlay"></div>
    <div class="container text-center position-relative z-index-1">
        <h1 class="display-3 fw-bold mb-4">Hotel Cusco Mágico</h1>
        <p class="lead fs-3 mb-5">Descubre la belleza de Cusco mientras disfrutas de una experiencia de hospedaje inolvidable</p>
        <a href="reservas.jsp" class="btn btn-primario btn-lg">
            <i class="bi bi-calendar-check me-2"></i> Reservar Ahora
        </a>
    </div>
    </section>

    <!-- Sobre Nosotros -->
    <section class="py-5 bg-light sobre-nosotros">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <img src="imagenes/Plaza-de-Armas-Cusco.jpg" alt="Plaza de Armas del Cusco" 
                         class="img-fluid rounded shadow">
                </div>
                <div class="col-lg-6">
                    <h2 class="display-5 mb-4">Sobre Nosotros</h2>
                    <p class="lead">
                        <i class="bi bi-geo-alt-fill text-primary me-2"></i> Ubicados en el corazón de Cusco, a minutos de la Plaza de Armas.
                    </p>
                    <p class="fs-5">
                        Ofrecemos cómodas habitaciones, atención personalizada y experiencias únicas para nuestros huéspedes. 
                        Ya sea que vengas a explorar Machu Picchu o disfrutar de la gastronomía local, Hotel Cusco Mágico es tu mejor opción.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Nuestros Servicios - Tarjetas completas -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center display-5 mb-5">Explora Nuestro Mundo</h2>
            <div class="row g-4">
                <!-- Tarjeta 1 - Servicios -->
                <div class="col-md-3 text-center">
                    <div class="tarjeta h-100">
                        <div class="feature-icon">
                            <i class="bi bi-building"></i>
                        </div>
                        <div class="tarjeta-cuerpo">
                            <h4>Servicios</h4>
                            <p>Descubre nuestras comodidades y servicios exclusivos</p>
                            <a href="servicios.jsp" class="btn btn-outline-primary w-100">Ver más</a>
                        </div>
                    </div>
                </div>
                
                <!-- Tarjeta 2 - Destino Turístico -->
                <div class="col-md-3 text-center">
                    <div class="tarjeta h-100">
                        <div class="feature-icon">
                            <i class="bi bi-map"></i>
                        </div>
                        <div class="tarjeta-cuerpo">
                            <h4>Destino Turístico</h4>
                            <p>Conoce la magia de Cusco y sus atracciones</p>
                            <a href="destino.jsp" class="btn btn-outline-primary w-100">Explorar</a>
                        </div>
                    </div>
                </div>
                
                <!-- Tarjeta 3 - Reservas -->
                <div class="col-md-3 text-center">
                    <div class="tarjeta h-100">
                        <div class="feature-icon">
                            <i class="bi bi-calendar-plus"></i>
                        </div>
                        <div class="tarjeta-cuerpo">
                            <h4>Reservas</h4>
                            <p>Planifica tu estadía con nosotros</p>
                            <a href="reservas.jsp" class="btn btn-outline-primary w-100">Reservar</a>
                        </div>
                    </div>
                </div>
                
                <!-- Tarjeta 4 - Contacto -->
                <div class="col-md-3 text-center">
                    <div class="tarjeta h-100">
                        <div class="feature-icon">
                            <i class="bi bi-headset"></i>
                        </div>
                        <div class="tarjeta-cuerpo">
                            <h4>Contacto</h4>
                            <p>Estamos para ayudarte</p>
                            <a href="contacto.jsp" class="btn btn-outline-primary w-100">Contactar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="includes/footer.jsp" %>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>