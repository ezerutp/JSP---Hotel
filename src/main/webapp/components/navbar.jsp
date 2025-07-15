<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<nav class="bg-white shadow-lg fixed w-full top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
            <div class="flex items-center">
                <div class="flex-shrink-0">
                    <h1 class="text-2xl font-bold text-peru-brown">Hotel Cusco</h1>
                </div>
            </div>
            <div class="hidden md:block">
                <div class="ml-10 flex items-baseline space-x-4">
                    <a href="#inicio"
                        class="text-gray-700 hover:text-peru-brown px-3 py-2 rounded-md text-sm font-medium transition-colors">Inicio</a>
                    <a href="#lugares"
                        class="text-gray-700 hover:text-peru-brown px-3 py-2 rounded-md text-sm font-medium transition-colors">Lugares</a>
                    <a href="#servicios"
                        class="text-gray-700 hover:text-peru-brown px-3 py-2 rounded-md text-sm font-medium transition-colors">Servicios</a>
                    <a href="#habitaciones"
                        class="text-gray-700 hover:text-peru-brown px-3 py-2 rounded-md text-sm font-medium transition-colors">Habitaciones</a>
                    <a href="contacto"
                        class="text-gray-700 hover:text-peru-brown px-3 py-2 rounded-md text-sm font-medium transition-colors">Contacto</a>
                    <a href="administrador"
                        class="bg-peru-brown text-white px-4 py-2 rounded-md text-sm font-medium hover:bg-peru-gold transition-colors">Iniciar
                        Sesión</a>
                </div>
            </div>
            <div class="md:hidden">
                <button id="mobile-menu-button" class="text-gray-700 hover:text-peru-brown p-2">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
        </div>
    </div>
    <!-- Menú móvil -->
    <div id="mobile-menu" class="md:hidden hidden">
        <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3 bg-white border-t">
            <a href="#inicio"
                class="block text-gray-700 hover:text-peru-brown px-3 py-2 rounded-md text-base font-medium">Inicio</a>
            <a href="#lugares"
                class="block text-gray-700 hover:text-peru-brown px-3 py-2 rounded-md text-base font-medium">Lugares</a>
            <a href="#servicios"
                class="block text-gray-700 hover:text-peru-brown px-3 py-2 rounded-md text-base font-medium">Servicios</a>
            <a href="#habitaciones"
                class="block text-gray-700 hover:text-peru-brown px-3 py-2 rounded-md text-base font-medium">Habitaciones</a>
            <a href="#contacto"
                class="block text-gray-700 hover:text-peru-brown px-3 py-2 rounded-md text-base font-medium">Contacto</a>
            <a href="login.jsp"
                class="block bg-peru-brown text-white px-3 py-2 rounded-md text-base font-medium">Iniciar Sesión</a>
        </div>
    </div>
</nav>