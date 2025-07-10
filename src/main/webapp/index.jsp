<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Cusco - Experiencias Únicas en el Corazón del Perú</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="css/base.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'peru-gold': '#D4A574',
                        'peru-brown': '#8B4513',
                        'peru-green': '#2D5016'
                    }
                }
            }
        }
    </script>
</head>
<body class="font-sans bg-gray-50">
    <!-- Barra de Navegación -->
    <%@ include file="components/navbar.jsp" %>

    <!-- Carrusel Hero -->
    <%@ include file="components/herocarrusel.jsp" %>

    <!-- Sección de Lugares a Visitar -->
    <section id="lugares" class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-16">
                <h2 class="text-4xl md:text-5xl font-bold text-gray-900 mb-4">Lugares Increíbles</h2>
                <p class="text-xl text-gray-600 max-w-3xl mx-auto">Descubre los destinos más fascinantes del Perú, desde ruinas ancestrales hasta paisajes naturales únicos</p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <!-- Lugar 1 -->
                <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                    <img src="imagenes/sacsa.jpg" alt="Sacsayhuamán" class="w-full h-64 object-cover">
                    <div class="p-6">
                        <h3 class="text-xl font-semibold text-gray-900 mb-2">Sacsayhuamán</h3>
                        <p class="text-gray-600 mb-4">Fortaleza ceremonial con impresionantes muros de piedra que muestran la maestría arquitectónica inca.</p>
                        <div class="flex items-center justify-between">
                            <span class="text-peru-brown font-semibold">Desde $25</span>
                            <button class="bg-peru-gold text-white px-4 py-2 rounded-lg hover:bg-peru-brown transition-colors">
                                Ver Más
                            </button>
                        </div>
                    </div>
                </div>
                <!-- Lugar 2 -->
                <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                    <img src="imagenes/Plaza-de-Armas-Cusco.jpg" alt="Plaza de Armas" class="w-full h-64 object-cover">
                    <div class="p-6">
                        <h3 class="text-xl font-semibold text-gray-900 mb-2">Plaza de Armas</h3>
                        <p class="text-gray-600 mb-4">El corazón histórico de Cusco, rodeado de arquitectura colonial y restaurantes tradicionales.</p>
                        <div class="flex items-center justify-between">
                            <span class="text-peru-brown font-semibold">Gratis</span>
                            <button class="bg-peru-gold text-white px-4 py-2 rounded-lg hover:bg-peru-brown transition-colors">
                                Ver Más
                            </button>
                        </div>
                    </div>
                </div>
                <!-- Lugar 3 -->
                <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                    <img src="imagenes/montaña7colores.jpg" alt="Montaña 7 Colores" class="w-full h-64 object-cover">
                    <div class="p-6">
                        <h3 class="text-xl font-semibold text-gray-900 mb-2">Montaña 7 Colores</h3>
                        <p class="text-gray-600 mb-4">Paisaje natural único con franjas de colores vibrantes creadas por minerales naturales.</p>
                        <div class="flex items-center justify-between">
                            <span class="text-peru-brown font-semibold">Desde $45</span>
                            <button class="bg-peru-gold text-white px-4 py-2 rounded-lg hover:bg-peru-brown transition-colors">
                                Ver Más
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Sección de Servicios -->
    <%@ include file="components/servicios.jsp" %>

    <!-- Sección de Habitaciones -->
    <section id="habitaciones" class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-16">
                <h2 class="text-4xl md:text-5xl font-bold text-gray-900 mb-4">Nuestras Habitaciones</h2>
                <p class="text-xl text-gray-600 max-w-3xl mx-auto">Habitaciones cómodas y elegantes diseñadas para tu descanso perfecto</p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <!-- Habitación 1 -->
                <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                    <img src="imagenes/cuzco1.jpg" alt="Habitación Simple" class="w-full h-64 object-cover">
                    <div class="p-6">
                        <h3 class="text-xl font-semibold text-gray-900 mb-2">Habitación Simple</h3>
                        <p class="text-gray-600 mb-4">Perfecta para viajeros solos. Incluye cama individual, baño privado y vista a la ciudad.</p>
                        <div class="flex items-center justify-between">
                            <span class="text-2xl font-bold text-peru-brown">S/ 120/noche</span>
                            <button class="bg-peru-gold text-white px-4 py-2 rounded-lg hover:bg-peru-brown transition-colors">
                                Reservar
                            </button>
                        </div>
                    </div>
                </div>
                <!-- Habitación 2 -->
                <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                    <img src="imagenes/cuzco2.jpg" alt="Habitación Doble" class="w-full h-64 object-cover">
                    <div class="p-6">
                        <h3 class="text-xl font-semibold text-gray-900 mb-2">Habitación Doble</h3>
                        <p class="text-gray-600 mb-4">Ideal para parejas. Cama matrimonial, baño privado y balcón con vista panorámica.</p>
                        <div class="flex items-center justify-between">
                            <span class="text-2xl font-bold text-peru-brown">S/ 160/noche</span>
                            <button class="bg-peru-gold text-white px-4 py-2 rounded-lg hover:bg-peru-brown transition-colors">
                                Reservar
                            </button>
                        </div>
                    </div>
                </div>
                <!-- Habitación 3 -->
                <div class="bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
                    <img src="imagenes/valle_sagrado.jpg" alt="Suite Familiar" class="w-full h-64 object-cover">
                    <div class="p-6">
                        <h3 class="text-xl font-semibold text-gray-900 mb-2">Suite Familiar</h3>
                        <p class="text-gray-600 mb-4">Espaciosa suite para familias. Dos habitaciones, sala de estar y vista espectacular.</p>
                        <div class="flex items-center justify-between">
                            <span class="text-2xl font-bold text-peru-brown">S/ 240/noche</span>
                            <button class="bg-peru-gold text-white px-4 py-2 rounded-lg hover:bg-peru-brown transition-colors">
                                Reservar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Sección de Testimonios -->
    <%@ include file="components/testimonios.jsp" %>

    <!-- Sección de Reservas -->
    <section class="py-20 bg-gray-100">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <h2 class="text-4xl md:text-5xl font-bold text-gray-900 mb-4">¿Listo para tu aventura?</h2>
            <p class="text-xl text-gray-600 mb-8">Reserva ahora y vive una experiencia única en el corazón del Perú</p>
            <div class="flex flex-col sm:flex-row gap-4 justify-center">
                <button onclick="window.location.href='registrarReserva.jsp'" class="bg-peru-gold text-white px-8 py-3 rounded-full text-lg font-semibold hover:bg-peru-brown transition-colors">
                    Hacer Reserva
                </button>
                <button class="border-2 border-peru-brown text-peru-brown px-8 py-3 rounded-full text-lg font-semibold hover:bg-peru-brown hover:text-white transition-colors">
                    Ver Disponibilidad
                </button>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <%@ include file="components/footer.jsp" %>

    <!-- JavaScript -->
    <script src="components/ScriptCarrusel.js"></script>
    
</body>
</html>