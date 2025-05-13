<%-- 
    Document   : servicios
    Created on : 18 abr 2025, 23:41:15
    Author     : josue
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Servicios - Hotel Cusco Mágico</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="css/componentes/tarjetas.css">
    <link rel="stylesheet" href="css/carpetas_adicionales/servicios.css">
</head>
<body>

<%@ include file="includes/navbar.jsp" %>

<section class="container my-5">
    <h2 class="text-center mb-4">Nuestros Servicios</h2>
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <img src="../imagenes_java/desayuno.jpg" class="card-img-top" alt="Desayuno incluido">
                <div class="card-body">
                    <h5 class="card-title">Desayuno Incluido</h5>
                    <p class="card-text">Disfruta de un delicioso desayuno continental todas las mañanas sin costo adicional.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <img src="../imagenes_java/wifi.png" class="card-img-top" alt="Wifi gratis">
                <div class="card-body">
                    <h5 class="card-title">Wi-Fi Gratis</h5>
                    <p class="card-text">Mantente conectado durante tu estadía con acceso a internet de alta velocidad en todo el hotel.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <img src="img/transporte.jpg" class="card-img-top" alt="Transporte al aeropuerto">
                <div class="card-body">
                    <h5 class="card-title">Transporte al Aeropuerto</h5>
                    <p class="card-text">Ofrecemos servicio de traslado desde y hacia el aeropuerto para mayor comodidad.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Segunda fila de servicios -->
    <div class="row mt-3">
        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <img src="img/recepcion.jpg" class="card-img-top" alt="Recepción 24/7">
                <div class="card-body">
                    <h5 class="card-title">Recepción 24/7</h5>
                    <p class="card-text">Nuestro personal está disponible las 24 horas del día para asistirte en todo momento.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <img src="img/tours.jpg" class="card-img-top" alt="Tours turísticos">
                <div class="card-body">
                    <h5 class="card-title">Tours Turísticos</h5>
                    <p class="card-text">Organizamos tours a Machu Picchu, Valle Sagrado y otras atracciones de Cusco.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <img src="img/limpieza.jpg" class="card-img-top" alt="Limpieza diaria">
                <div class="card-body">
                    <h5 class="card-title">Limpieza Diaria</h5>
                    <p class="card-text">Tu habitación siempre impecable con nuestro servicio de limpieza diario.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
