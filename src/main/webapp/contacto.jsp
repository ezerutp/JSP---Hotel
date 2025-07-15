<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contáctanos - Hotel Cusco</title>
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
            background-image: url('imagenes/cuzco.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            min-height: 100vh;
            position: relative;
        }
        
        .gradient-bg::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(139, 69, 19, 0.3);
            backdrop-filter: blur(3px);
            z-index: 1;
        }
        
        .gradient-bg > * {
            position: relative;
            z-index: 2;
        }
        
        .custom-input {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 2px solid rgba(139, 69, 19, 0.1);
            transition: all 0.3s ease;
        }
        
        .custom-input:focus {
            border-color: rgb(139, 69, 19);
            box-shadow: 0 0 0 3px rgba(139, 69, 19, 0.1);
            transform: translateY(-2px);
        }
        
        .custom-label {
            color: rgb(139, 69, 19);
            font-weight: 600;
        }
        
        .custom-icon {
            color: rgb(212, 165, 116);
        }
        
        .blur-background {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .form-shadow {
            box-shadow: 0 25px 50px -12px rgba(139, 69, 19, 0.25);
        }
    </style>
</head>
<body class="gradient-bg min-h-screen py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-2xl mx-auto">
        <c:if test="${not empty success}">
            <div class="mb-6 bg-green-100 border-l-4 border-green-500 p-4 rounded-lg shadow-md blur-background">
                <div class="flex items-center">
                    <div class="flex-shrink-0">
                        <i class="bi bi-check-circle text-green-500 text-xl"></i>
                    </div>
                    <div class="ml-3">
                        <p class="text-green-700 font-medium">${success}</p>
                    </div>
                    <div class="ml-auto">
                        <button onclick="this.parentElement.parentElement.parentElement.style.display='none'" 
                                class="text-green-500 hover:text-green-700 focus:outline-none">
                            <i class="bi bi-x-lg"></i>
                        </button>
                    </div>
                </div>
            </div>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="mb-6 bg-red-100 border-l-4 border-red-500 p-4 rounded-lg shadow-md blur-background">
                <div class="flex items-center">
                    <div class="flex-shrink-0">
                        <i class="bi bi-exclamation-triangle text-red-500 text-xl"></i>
                    </div>
                    <div class="ml-3">
                        <p class="text-red-700 font-medium">${error}</p>
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
                    <i class="bi bi-envelope-heart mr-3 text-4xl"></i> 
                    Contáctanos
                </h2>
                <p class="text-amber-100 text-center mt-2">Estamos aquí para ayudarte</p>
            </div>

            <!-- Formulario -->
            <div class="p-8">
                <form action="contacto" method="post" class="space-y-6">
                    <!-- Nombre completo -->
                    <div class="space-y-2">
                        <label for="nombre" class="block text-sm font-semibold custom-label">
                            <i class="bi bi-person mr-2 custom-icon"></i>Nombres Completos
                        </label>
                        <input type="text" 
                               class="custom-input w-full px-4 py-3 border border-gray-300 rounded-xl transition-all duration-300 shadow-sm bg-white" 
                               id="nombre" 
                               name="nombre" 
                               placeholder="Ingrese su nombre completo"
                               pattern="[A-Za-záéíóúÁÉÍÓÚñÑ\s]+" 
                               title="Solo letras y espacios"
                               required>
                    </div>
                    
                    <!-- Correo electrónico -->
                    <div class="space-y-2">
                        <label for="correo" class="block text-sm font-semibold custom-label">
                            <i class="bi bi-envelope mr-2 custom-icon"></i>Correo Electrónico
                        </label>
                        <input type="email" 
                               class="custom-input w-full px-4 py-3 border border-gray-300 rounded-xl transition-all duration-300 shadow-sm bg-white" 
                               id="correo" 
                               name="correo" 
                               placeholder="ejemplo@correo.com"
                               required>
                    </div>
                    
                    <!-- Teléfono -->
                    <div class="space-y-2">
                        <label for="telefono" class="block text-sm font-semibold custom-label">
                            <i class="bi bi-telephone mr-2 custom-icon"></i>Teléfono/Celular
                        </label>
                        <input type="tel" 
                               class="custom-input w-full px-4 py-3 border border-gray-300 rounded-xl transition-all duration-300 shadow-sm bg-white" 
                               id="telefono" 
                               name="telefono" 
                               placeholder="987654321"
                               pattern="[0-9]{9}" 
                               title="9 dígitos numéricos"
                               required>
                    </div>
                    
                    <!-- Mensaje -->
                    <div class="space-y-2">
                        <label for="mensaje" class="block text-sm font-semibold custom-label">
                            <i class="bi bi-chat-text mr-2 custom-icon"></i>Mensaje
                        </label>
                        <textarea class="custom-input w-full px-4 py-3 border border-gray-300 rounded-xl transition-all duration-300 shadow-sm bg-white resize-none" 
                                  id="mensaje" 
                                  name="mensaje" 
                                  rows="5" 
                                  placeholder="Escribe tu mensaje aquí..."
                                  required></textarea>
                    </div>
                    
                    <!-- Botones de acción -->
                    <div class="flex flex-col sm:flex-row justify-between items-center gap-4 pt-6 border-t border-gray-200">
                        <a href="/Proceso1/" 
                           class="w-full sm:w-auto inline-flex items-center justify-center px-6 py-3 border-2 border-gray-300 text-gray-700 font-medium rounded-xl hover:bg-gray-50 hover:border-gray-400 transition-all duration-300 focus:outline-none focus:ring-2 focus:ring-gray-500 bg-white">
                            <i class="bi bi-arrow-left mr-2"></i> Regresar al Inicio
                        </a>
                        <button type="submit" 
                                class="w-full sm:w-auto inline-flex items-center justify-center px-8 py-3 text-white font-semibold rounded-xl transform hover:scale-105 transition-all duration-300 focus:outline-none focus:ring-2 focus:ring-offset-2 shadow-lg"
                                style="background: linear-gradient(135deg, rgb(139, 69, 19) 0%, rgb(212, 165, 116) 100%);">
                            <i class="bi bi-send mr-2"></i> Enviar Mensaje
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Animaciones de entrada para los elementos del formulario
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('input, textarea');
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
    </script>
</body>
</html>
