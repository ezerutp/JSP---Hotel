<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Destino - Cusco Mágico</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="css/componentes/botones.css">
    <link rel="stylesheet" href="css/componentes/tarjetas.css">
    <link rel="stylesheet" href="css/carpetas_adicionales/destino.css">
    <style>
        /* ESTILO MÍNIMO PARA LA IMAGEN DE FONDO */
        .hero-destino {
            background: url('imagenes/cuzco2.jpg') center/cover no-repeat;
            min-height: 400px; /* Altura mínima ajustable */
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>
    
    <header class="hero-destino text-white text-center py-5">
        <div class="container">
            <h1 class="display-4 fw-bold">Descubre Cusco</h1>
            <p class="lead">Una experiencia inolvidable en el corazón del Imperio Inca</p>
        </div>
    </header>
    <section class="container my-5">
        <div class="destino-info bg-light p-4 rounded shadow-sm mb-5">
            <h2 class="text-primary">La ciudad mágica</h2>
            <p class="fs-5">
                Cusco, la antigua capital del Imperio Inca, es un destino turístico de primer nivel. 
                Desde su impresionante arquitectura colonial hasta sus vibrantes calles llenas de historia, 
                es el punto de partida para aventuras como Machu Picchu, Valle Sagrado, Sacsayhuamán y más.
            </p>
        </div>

        <h2 class="text-center mb-4">Principales Atractivos</h2>
        <div class="destinos-contenedor">
            <!-- Tarjeta 1 -->
            <div class="tarjeta">
                <img src="imagenes/Machu_Picchu_maravilla_del_mundo.jpg" alt="Machu Picchu" class="tarjeta-imagen">
                <div class="tarjeta-cuerpo">
                    <h3>Machu Picchu</h3>
                    <p>Una de las maravillas del mundo moderno. Imperdible si visitas Cusco.</p>
                </div>
            </div>

            <!-- Tarjeta 2 -->
            <div class="tarjeta">
                <img src="imagenes/Sacsayhuamán.JPG" alt="Sacsayhuamán" class="tarjeta-imagen">
                <div class="tarjeta-cuerpo">
                    <h3>Sacsayhuamán</h3>
                    <p>Fortaleza inca ubicada al norte de Cusco con vistas panorámicas increíbles.</p>
                </div>
            </div>

            <!-- Tarjeta 3 -->
            <div class="tarjeta">
                <img src="imagenes/valle_sagrado.jpg" alt="Valle Sagrado" class="tarjeta-imagen">
                <div class="tarjeta-cuerpo">
                    <h3>Valle Sagrado</h3>
                    <p>Rodeado de naturaleza, pueblos tradicionales y sitios arqueológicos incas.</p>
                </div>
            </div>

            <!-- Tarjeta 4 -->
            <div class="tarjeta">
                <img src="imagenes/montaña7colores.jpg" alt="Montaña 7 Colores" class="tarjeta-imagen">
                <div class="tarjeta-cuerpo">
                    <h3>Montaña de 7 Colores</h3>
                    <p>Una formación geológica natural única por su variedad de colores minerales.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Botón flotante -->
    <a href="index.jsp" class="btn-flotante btn-primario" title="Volver al inicio">
        <i class="bi bi-house"></i>
    </a>

    <%@ include file="includes/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
