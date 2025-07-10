<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <section id="inicio" class="relative h-screen overflow-hidden mt-16">
        <div class="carousel-container relative h-full">
            <!-- Slide 1 -->
            <div
                class="carousel-slide absolute inset-0 bg-gradient-to-r from-black/50 to-black/30 flex items-center justify-center active">
                <img src="imagenes/banner.jpg" alt="Cusco" class="absolute inset-0 w-full h-full object-cover -z-10">
                <div class="text-center text-white max-w-4xl mx-auto px-4">
                    <h2 class="text-5xl md:text-7xl font-bold mb-6">Descubre Cusco</h2>
                    <p class="text-xl md:text-2xl mb-8">Vive una experiencia única en el corazón del Imperio Inca</p>
                    <button
                        class="bg-peru-gold text-white px-8 py-3 rounded-full text-lg font-semibold hover:bg-peru-brown transition-colors">
                        Reservar Ahora
                    </button>
                </div>
            </div>
            <!-- Slide 2 -->
            <div
                class="carousel-slide absolute inset-0 bg-gradient-to-r from-black/50 to-black/30 flex items-center justify-center">
                <img src="imagenes/Machu_Picchu_maravilla_del_mundo.jpg" alt="Machu Picchu"
                    class="absolute inset-0 w-full h-full object-cover -z-10">
                <div class="text-center text-white max-w-4xl mx-auto px-4">
                    <h2 class="text-5xl md:text-7xl font-bold mb-6">Machu Picchu</h2>
                    <p class="text-xl md:text-2xl mb-8">Explora una de las maravillas del mundo moderno</p>
                    <button
                        class="bg-peru-gold text-white px-8 py-3 rounded-full text-lg font-semibold hover:bg-peru-brown transition-colors">
                        Ver Tours
                    </button>
                </div>
            </div>
            <!-- Slide 3 -->
            <div
                class="carousel-slide absolute inset-0 bg-gradient-to-r from-black/50 to-black/30 flex items-center justify-center">
                <img src="imagenes/valle_sagrado.jpg" alt="Valle Sagrado"
                    class="absolute inset-0 w-full h-full object-cover -z-10">
                <div class="text-center text-white max-w-4xl mx-auto px-4">
                    <h2 class="text-5xl md:text-7xl font-bold mb-6">Valle Sagrado</h2>
                    <p class="text-xl md:text-2xl mb-8">Conéctate con la naturaleza y la historia ancestral</p>
                    <button
                        class="bg-peru-gold text-white px-8 py-3 rounded-full text-lg font-semibold hover:bg-peru-brown transition-colors">
                        Explorar
                    </button>
                </div>
            </div>
        </div>
        <!-- Controles del carrusel -->
        <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2 flex space-x-2">
            <button
                class="carousel-dot w-3 h-3 rounded-full bg-white/50 hover:bg-white transition-colors active"></button>
            <button class="carousel-dot w-3 h-3 rounded-full bg-white/50 hover:bg-white transition-colors"></button>
            <button class="carousel-dot w-3 h-3 rounded-full bg-white/50 hover:bg-white transition-colors"></button>
        </div>
    </section>