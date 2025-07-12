<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Reserva - Hotel Cusco</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: 'rgb(139, 69, 19)',
                        secondary: 'rgb(212, 165, 116)',
                        accent: '#F3F4F6',
                        dark: '#1F2937'
                    },
                    fontFamily: {
                        'sans': ['Inter', 'system-ui', 'sans-serif']
                    }
                }
            }
        }
    </script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        .gradient-bg {
            position: relative;
            overflow: hidden;
            min-height: 100vh;
            background-color: #f8fafc;
        }
        
        .background-slideshow {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -2;
        }
        
        .bg-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            opacity: 0;
            transition: opacity 2s ease-in-out;
            filter: blur(10px);
        }
        
        .bg-image.active {
            opacity: 0.9;
        }
        
        .bg-image:nth-child(1) { background-image: url('imagenes/Machu_Picchu_maravilla_del_mundo.jpg'); }
        .bg-image:nth-child(2) { background-image: url('imagenes/Plaza-de-Armas-Cusco.jpg'); }
        .bg-image:nth-child(3) { background-image: url('imagenes/valle_sagrado.jpg'); }
        .bg-image:nth-child(4) { background-image: url('imagenes/montaña7colores.jpg'); }
        .bg-image:nth-child(5) { background-image: url('imagenes/cuzco1.jpg'); }
        .bg-image:nth-child(6) { background-image: url('imagenes/sacsa.jpg'); }
        
        .form-shadow {
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        
        .input-focus:focus {
            transform: translateY(-2px);
            transition: all 0.3s ease;
            box-shadow: 0 8px 20px rgba(139, 69, 19, 0.2);
            border-color: rgb(139, 69, 19) !important;
            ring-color: rgb(139, 69, 19) !important;
        }
        
        .custom-input:focus {
            outline: none;
            border-color: rgb(139, 69, 19);
            box-shadow: 0 0 0 3px rgba(139, 69, 19, 0.1);
        }
        
        .custom-label {
            color: rgb(139, 69, 19);
        }
        
        .custom-icon {
            color: rgb(139, 69, 19);
        }
        
        .blur-background {
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        
        .content-container {
            position: relative;
            z-index: 10;
        }
        
        /* Indicadores del slideshow */
        .slideshow-indicators {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 10px;
            z-index: 15;
        }
        
        .indicator {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.6);
            cursor: pointer;
            transition: all 0.3s ease;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.8);
        }
        
        .indicator.active {
            background: rgba(139, 69, 19, 0.8);
            transform: scale(1.2);
        }
    </style>
</head>
<body class="gradient-bg min-h-screen py-12 px-4 sm:px-6 lg:px-8">
    <!-- Slideshow de imágenes de fondo con blur -->
    <div class="background-slideshow">
        <div class="bg-image active"></div>
        <div class="bg-image"></div>
        <div class="bg-image"></div>
        <div class="bg-image"></div>
        <div class="bg-image"></div>
        <div class="bg-image"></div>
    </div>

    <!-- Indicadores del slideshow -->
    <div class="slideshow-indicators">
        <div class="indicator active" data-slide="0"></div>
        <div class="indicator" data-slide="1"></div>
        <div class="indicator" data-slide="2"></div>
        <div class="indicator" data-slide="3"></div>
        <div class="indicator" data-slide="4"></div>
        <div class="indicator" data-slide="5"></div>
    </div>

    <div class="content-container max-w-4xl mx-auto">
        <c:if test="${not empty param.error}">
            <div class="mb-6 bg-red-100 border-l-4 border-red-500 p-4 rounded-lg shadow-md blur-background">
                <div class="flex items-center">
                    <div class="flex-shrink-0">
                        <i class="bi bi-exclamation-triangle text-red-500 text-xl"></i>
                    </div>
                    <div class="ml-3">
                        <p class="text-red-700 font-medium">${param.error}</p>
                    </div>
                    <div class="ml-auto">
                        <button onclick="this.parentElement.parentElement.parentElement.style.display='none'" 
                                class="text-red-500 hover:text-red-700 focus:outline-none">
                            <i class="bi bi-x-lg"></i>
                        </button>
                    </div>
                </div>
            </div>
        </c:if>
        
        <div class="blur-background rounded-2xl form-shadow overflow-hidden">
            <!-- Header del formulario -->
            <div class="px-8 py-6" style="background: linear-gradient(135deg, rgb(139, 69, 19) 0%, rgb(212, 165, 116) 100%);">
                <h2 class="text-3xl font-bold text-white text-center flex items-center justify-center">
                    <i class="bi bi-calendar-plus mr-3 text-4xl"></i> 
                    Reserva con Nosotros
                </h2>
                <p class="text-amber-100 text-center mt-2">Complete los datos para realizar su reserva</p>
            </div>

            <!-- Formulario -->
            <div class="p-8">
                <form id="reservaForm" action="reservar" method="post" novalidate class="space-y-6">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <!-- Nombre del Huésped -->
                        <div class="space-y-2">
                            <label for="nombre_huesped" class="block text-sm font-semibold custom-label">
                                <i class="bi bi-person mr-2 custom-icon"></i>Nombre del Huésped
                            </label>
                            <input type="text" 
                                   class="custom-input w-full px-4 py-3 border border-gray-300 rounded-xl transition-all duration-300 shadow-sm bg-white" 
                                   id="nombre_huesped" 
                                   name="nombre_huesped" 
                                   placeholder="Ingrese su nombre completo"
                                   required>
                        </div>
                        
                        <!-- Correo Electrónico -->
                        <div class="space-y-2">
                            <label for="correo_huesped" class="block text-sm font-semibold custom-label">
                                <i class="bi bi-envelope mr-2 custom-icon"></i>Correo Electrónico
                            </label>
                            <input type="email" 
                                   class="custom-input w-full px-4 py-3 border border-gray-300 rounded-xl transition-all duration-300 shadow-sm bg-white" 
                                   id="correo_huesped" 
                                   name="correo_huesped" 
                                   placeholder="ejemplo@correo.com"
                                   required>
                        </div>
                        
                        <!-- Teléfono -->
                        <div class="space-y-2">
                            <label for="telefono_huesped" class="block text-sm font-semibold custom-label">
                                <i class="bi bi-telephone mr-2 custom-icon"></i>Teléfono/Celular
                            </label>
                            <input type="tel" 
                                   class="custom-input w-full px-4 py-3 border border-gray-300 rounded-xl transition-all duration-300 shadow-sm bg-white" 
                                   id="telefono_huesped" 
                                   name="telefono_huesped" 
                                   pattern="[0-9]{9}" 
                                   placeholder="987654321"
                                   title="Ingrese un número de 9 dígitos" 
                                   required>
                        </div>
                        
                        <!-- Habitación -->
                        <div class="space-y-2">
                            <label for="id_habitacion" class="block text-sm font-semibold custom-label">
                                <i class="bi bi-house-door mr-2 custom-icon"></i>Habitación
                            </label>
                            <select class="custom-input w-full px-4 py-3 border border-gray-300 rounded-xl transition-all duration-300 shadow-sm bg-white" 
                                    id="id_habitacion" 
                                    name="id_habitacion" 
                                    required>
                                <option value="" selected disabled>Seleccione una habitación</option>
                                <c:forEach var="habitacion" items="${habitaciones}">
                                    <option value="${habitacion.id}">${habitacion.numeroHabitacion} - ${habitacion.tipoHabitacion.nombre} - (S/${habitacion.tipoHabitacion.precioNoche})</option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <!-- Fecha de Llegada -->
                        <div class="space-y-2">
                            <label for="fecha_checkin" class="block text-sm font-semibold custom-label">
                                <i class="bi bi-calendar-check mr-2 custom-icon"></i>Fecha de Llegada
                            </label>
                            <input type="date" 
                                   class="custom-input w-full px-4 py-3 border border-gray-300 rounded-xl transition-all duration-300 shadow-sm bg-white" 
                                   id="fecha_checkin" 
                                   name="fecha_checkin" 
                                   required>
                        </div>
                        
                        <!-- Fecha de Salida -->
                        <div class="space-y-2">
                            <label for="fecha_checkout" class="block text-sm font-semibold custom-label">
                                <i class="bi bi-calendar-x mr-2 custom-icon"></i>Fecha de Salida
                            </label>
                            <input type="date" 
                                   class="custom-input w-full px-4 py-3 border border-gray-300 rounded-xl transition-all duration-300 shadow-sm bg-white" 
                                   id="fecha_checkout" 
                                   name="fecha_checkout" 
                                   required>
                        </div>
                        
                        <!-- Número de Personas -->
                        <div class="space-y-2 md:col-span-2">
                            <label for="cantidad_personas" class="block text-sm font-semibold custom-label">
                                <i class="bi bi-people mr-2 custom-icon"></i>Número de Personas
                            </label>
                            <input type="number" 
                                   class="custom-input w-full md:w-1/3 px-4 py-3 border border-gray-300 rounded-xl transition-all duration-300 shadow-sm bg-white" 
                                   id="cantidad_personas" 
                                   name="cantidad_personas" 
                                   min="1" 
                                   max="6" 
                                   placeholder="1"
                                   required>
                        </div>
                    </div>
                    
                    <!-- Botones de acción -->
                    <div class="flex flex-col sm:flex-row justify-between items-center gap-4 pt-6 border-t border-gray-200">
                        <a href="index.jsp" 
                           class="w-full sm:w-auto inline-flex items-center justify-center px-6 py-3 border-2 border-gray-300 text-gray-700 font-medium rounded-xl hover:bg-gray-50 hover:border-gray-400 transition-all duration-300 focus:outline-none focus:ring-2 focus:ring-gray-500 bg-white">
                            <i class="bi bi-arrow-left mr-2"></i> Cancelar
                        </a>
                        <button type="submit" 
                                class="w-full sm:w-auto inline-flex items-center justify-center px-8 py-3 text-white font-semibold rounded-xl transform hover:scale-105 transition-all duration-300 focus:outline-none focus:ring-2 focus:ring-offset-2 shadow-lg"
                                style="background: linear-gradient(135deg, rgb(139, 69, 19) 0%, rgb(212, 165, 116) 100%);">
                            <i class="bi bi-save mr-2"></i> Confirmar Reserva
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Validación de fechas mejorada
        document.getElementById('reservaForm').addEventListener('submit', function(e) {
            const checkin = new Date(document.getElementById('fecha_checkin').value);
            const checkout = new Date(document.getElementById('fecha_checkout').value);
            const hoy = new Date();
            hoy.setHours(0, 0, 0, 0);
            
            if (checkin < hoy) {
                mostrarAlerta('La fecha de llegada no puede ser anterior a hoy', 'error');
                e.preventDefault();
            }
            
            if (checkout <= checkin) {
                mostrarAlerta('La fecha de salida debe ser posterior a la de llegada', 'error');
                e.preventDefault();
            }
        });
        
        // Actualizar mínimo de fecha de salida
        document.getElementById('fecha_checkin').addEventListener('change', function() {
            const checkin = this.value;
            document.getElementById('fecha_checkout').min = checkin;
        });

        // Función para mostrar alertas personalizadas
        function mostrarAlerta(mensaje, tipo) {
            const alerta = document.createElement('div');
            const estiloClase = tipo === 'error' ? 'bg-red-500 text-white' : 'bg-green-500 text-white';
            const icono = tipo === 'error' ? 'bi-exclamation-triangle' : 'bi-check-circle';
            
            alerta.className = 'fixed top-4 right-4 p-4 rounded-lg shadow-lg z-50 transform transition-all duration-300 ' + estiloClase;
            alerta.innerHTML = 
                '<div class="flex items-center">' +
                    '<i class="bi ' + icono + ' mr-2"></i>' +
                    '<span>' + mensaje + '</span>' +
                    '<button onclick="this.parentElement.parentElement.remove()" class="ml-4 text-white hover:text-gray-200">' +
                        '<i class="bi bi-x-lg"></i>' +
                    '</button>' +
                '</div>';
            
            document.body.appendChild(alerta);
            
            // Auto-eliminar después de 5 segundos
            setTimeout(function() {
                if (alerta.parentElement) {
                    alerta.remove();
                }
            }, 5000);
        }

        // Animaciones de entrada para los elementos del formulario
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('input, select');
            inputs.forEach(function(input, index) {
                input.style.opacity = '0';
                input.style.transform = 'translateY(20px)';
                setTimeout(function() {
                    input.style.transition = 'all 0.5s ease';
                    input.style.opacity = '1';
                    input.style.transform = 'translateY(0)';
                }, index * 100);
            });
        });

        // Establecer fecha mínima como hoy
        document.addEventListener('DOMContentLoaded', function() {
            const hoy = new Date().toISOString().split('T')[0];
            document.getElementById('fecha_checkin').min = hoy;
        });

        // Slideshow de imágenes de fondo
        let currentSlide = 0;
        const slides = document.querySelectorAll('.bg-image');
        const indicators = document.querySelectorAll('.indicator');
        const totalSlides = slides.length;

        function showSlide(index) {
            // Ocultar todas las imágenes
            slides.forEach(slide => slide.classList.remove('active'));
            indicators.forEach(indicator => indicator.classList.remove('active'));
            
            // Mostrar la imagen actual
            slides[index].classList.add('active');
            indicators[index].classList.add('active');
        }

        function nextSlide() {
            currentSlide = (currentSlide + 1) % totalSlides;
            showSlide(currentSlide);
        }

        // Cambiar imagen automáticamente cada 5 segundos
        setInterval(nextSlide, 5000);

        // Permitir navegación manual con los indicadores
        indicators.forEach((indicator, index) => {
            indicator.addEventListener('click', () => {
                currentSlide = index;
                showSlide(currentSlide);
            });
        });

        // Precargar imágenes para mejorar el rendimiento
        document.addEventListener('DOMContentLoaded', function() {
            const imageUrls = [
                'imagenes/Machu_Picchu_maravilla_del_mundo.jpg',
                'imagenes/Plaza-de-Armas-Cusco.jpg',
                'imagenes/valle_sagrado.jpg',
                'imagenes/montaña7colores.jpg',
                'imagenes/cuzco1.jpg',
                'imagenes/Sacsayhuamán.JPG'
            ];
            
            imageUrls.forEach(url => {
                const img = new Image();
                img.src = url;
            });
        });
    </script>
</body>
</html>