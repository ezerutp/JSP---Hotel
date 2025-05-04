<%-- 
    Document   : index
    Created on : 18 abr 2025, 23:39:35
    Author     : josue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Hotel Cusco Mágico</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>

<%@ include file="includes/navbar.jsp" %>

<!-- Banner principal -->
<section class="bg-dark text-white text-center p-5" style="background-image: url('img/hotel.jpg'); background-size: cover; background-position: center;">
    <div class="container">
        <h1 class="display-4 fw-bold">Hotel Cusco Mágico</h1>
        <p class="lead">Descubre la belleza de Cusco mientras disfrutas de una experiencia de hospedaje inolvidable.</p>
        <a href="reservas.jsp" class="btn btn-light btn-lg mt-3">Reservar Ahora</a>
    </div>
</section>

<!-- Descripción del hotel -->
<section class="container my-5">
    <h2 class="text-center mb-4">Sobre Nosotros</h2>
    <p class="text-center">Nuestro hotel está ubicado en el corazón de Cusco, a minutos de la Plaza de Armas. Ofrecemos cómodas habitaciones, atención personalizada y experiencias únicas para nuestros huéspedes. Ya sea que vengas a explorar Machu Picchu o disfrutar de la gastronomía local, Hotel Cusco Mágico es tu mejor opción.</p>
</section>

<!-- Secciones rápidas -->
<section class="container my-5">
    <div class="row text-center">
        <div class="col-md-3">
            <h4><a href="servicios.jsp" class="text-decoration-none">🏨 Servicios</a></h4>
        </div>
        <div class="col-md-3">
            <h4><a href="destino.jsp" class="text-decoration-none">🌄 Destino Turístico</a></h4>
        </div>
        <div class="col-md-3">
            <h4><a href="reservas.jsp" class="text-decoration-none">📆 Reservas</a></h4>
        </div>
        <div class="col-md-3">
            <h4><a href="contacto.jsp" class="text-decoration-none">📞 Contacto</a></h4>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
