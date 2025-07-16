<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Mensajes - Sistema Hotelero</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/base.css">
    <style>
        .sidebar {
            transition: transform 0.3s ease;
        }
        .sidebar.collapsed {
            transform: translateX(-100%);
        }
        .main-content {
            transition: margin-left 0.3s ease;
        }
        .main-content.expanded {
            margin-left: 0;
        }
        .message-row {
            transition: all 0.3s ease;
        }
        .message-row:hover {
            background-color: #f8fafc;
        }
        .message-row.unread {
            background-color: #eff6ff;
            border-left: 4px solid #3b82f6;
        }
    </style>
</head>
<body class="bg-gray-100">
    <!-- Sidebar -->
    <div id="sidebar" class="fixed inset-y-0 left-0 z-50 w-64 bg-white shadow-lg">
        <div class="flex items-center justify-between h-16 px-4 border-b">
            <h1 class="text-xl font-bold text-gray-800">Hotel Admin</h1>
            <button id="sidebarToggle" class="md:hidden">
                <i class="fas fa-times text-gray-600"></i>
            </button>
        </div>
        
        <nav class="mt-8">
            <div class="px-4 space-y-2">
                <a href="index.jsp" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                    <i class="fas fa-tachometer-alt w-5 h-5 mr-3"></i>
                    Dashboard
                </a>
                <a href="empleados.jsp" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                    <i class="fas fa-users w-5 h-5 mr-3"></i>
                    Empleados
                </a>
                <a href="habitaciones.jsp" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                    <i class="fas fa-bed w-5 h-5 mr-3"></i>
                    Habitaciones
                </a>
                <a href="reservas.jsp" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                    <i class="fas fa-calendar-check w-5 h-5 mr-3"></i>
                    Reservas
                </a>
                <a href="#" class="flex items-center px-4 py-2 text-gray-700 bg-blue-50 rounded-lg">
                    <i class="fas fa-envelope w-5 h-5 mr-3"></i>
                    Mensajes
                </a>
                <a href="reportes.jsp" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                    <i class="fas fa-chart-bar w-5 h-5 mr-3"></i>
                    Reportes
                </a>
            </div>
            
            <div class="absolute bottom-0 w-full p-4 border-t">
                <a href="../logout" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                    <i class="fas fa-sign-out-alt w-5 h-5 mr-3"></i>
                    Cerrar Sesión
                </a>
            </div>
        </nav>
    </div>

    <!-- Main Content -->
    <div id="mainContent" class="ml-64 main-content">
        <!-- Top Bar -->
        <div class="bg-white shadow-sm border-b">
            <div class="flex items-center justify-between px-6 py-4">
                <div class="flex items-center">
                    <button id="menuToggle" class="md:hidden mr-3">
                        <i class="fas fa-bars text-gray-600"></i>
                    </button>
                    <h2 class="text-2xl font-semibold text-gray-800">Gestión de Mensajes</h2>
                </div>
                <div class="flex items-center space-x-3">
                    <button id="markAllReadBtn" class="text-blue-600 hover:text-blue-800 text-sm font-medium">
                        <i class="fas fa-check-double mr-1"></i>
                        Marcar todos como leídos
                    </button>
                    <button id="composeBtn" style="display: none !important" class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors">
                        <i class="fas fa-plus mr-2"></i>
                        Nuevo Mensaje
                    </button>
                </div>
            </div>
        </div>

        <!-- Messages Content -->
        <div class="p-6">
            <!-- Stats Summary -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
                <div class="bg-white p-4 rounded-lg shadow-md">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-600">Total Mensajes</p>
                            <p class="text-2xl font-bold text-gray-800">${empty contactosList ? 0 : fn:length(contactosList)}</p>
                        </div>
                        <div class="bg-blue-100 p-3 rounded-full">
                            <i class="fas fa-envelope text-blue-600"></i>
                        </div>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-lg shadow-md">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-600">No Leídos</p>
                            <p class="text-2xl font-bold text-red-600">4</p>
                        </div>
                        <div class="bg-red-100 p-3 rounded-full">
                            <i class="fas fa-envelope-open text-red-600"></i>
                        </div>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-lg shadow-md">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-600">Hoy</p>
                            <p class="text-2xl font-bold text-purple-600">2</p>
                        </div>
                        <div class="bg-purple-100 p-3 rounded-full">
                            <i class="fas fa-clock text-purple-600"></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Search and Filter -->
            <div class="bg-white p-6 rounded-lg shadow-md mb-6">
                <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                    <div class="flex-1">
                        <div class="relative">
                            <input type="text" id="searchInput" placeholder="Buscar mensajes..." 
                                   class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                            <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                        </div>
                    </div>
                    <div class="flex gap-2">
                        <select id="statusFilter" class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                            <option value="">Todos</option>
                            <option value="no-leido">No leídos</option>
                            <option value="leido">Leídos</option>
                            <option value="respondido">Respondidos</option>
                        </select>
                        <select id="typeFilter" class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                            <option value="">Todos los tipos</option>
                            <option value="consulta">Consulta</option>
                            <option value="reserva">Reserva</option>
                            <option value="queja">Queja</option>
                            <option value="sugerencia">Sugerencia</option>
                        </select>
                        <input type="date" id="dateFilter" class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                    </div>
                </div>
            </div>

            <!-- Messages Table -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    <input type="checkbox" id="selectAll" class="rounded text-blue-600 focus:ring-blue-500">
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Remitente
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Asunto
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Tipo
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Fecha
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Estado
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Acciones
                                </th>
                            </tr>
                        </thead>
                        <tbody id="messagesTableBody" class="bg-white divide-y divide-gray-200">
                            <c:forEach var="c" items="${contactosList}">
                                <tr class="message-row unread" data-status="no-leido">
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <input type="checkbox" class="message-checkbox rounded text-blue-600 focus:ring-blue-500">
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex items-center">
                                            <div class="w-10 h-10 bg-blue-500 rounded-full flex items-center justify-center">
                                                <span class="text-white font-bold text-sm">
                                                <%-- Asignamos el valor de c.nombreCompleto a una variable de ámbito de página
                                                    para que el scriptlet pueda acceder a ella. --%>
                                                <c:set var="currentNombreCompleto" value="${c.nombreCompleto}" scope="page" />
                                                <%
                                                    // Ahora 'currentNombreCompleto' está disponible en el pageContext
                                                    String nombreCompleto = (String) pageContext.getAttribute("currentNombreCompleto");

                                                    if (nombreCompleto == null) {
                                                        nombreCompleto = ""; // Asegurarse de que no sea nulo
                                                    }
                                                    String[] palabras = nombreCompleto.split("\\s+"); // Dividir por uno o más espacios
                                                    String iniciales = "";
                                                    if (palabras.length > 0) {
                                                        iniciales += palabras[0].charAt(0); // Primera inicial de la primera palabra
                                                        if (palabras.length > 1) {
                                                            // Busca la última palabra no vacía si hay más de una
                                                            String ultimaPalabraValida = "";
                                                            for (int i = palabras.length - 1; i >= 0; i--) {
                                                                if (!palabras[i].trim().isEmpty()) {
                                                                    ultimaPalabraValida = palabras[i];
                                                                    break;
                                                                }
                                                            }
                                                            if (!ultimaPalabraValida.isEmpty()) {
                                                                iniciales += ultimaPalabraValida.charAt(0); // Primera inicial de la última palabra
                                                            }
                                                        }
                                                    }
                                                    out.print(iniciales.toUpperCase());
                                                %>
                                            </span>
                                            </div>
                                            <div class="ml-4">
                                                <div class="text-sm font-medium text-gray-900"><c:out value="${c.nombreCompleto}" /></div>
                                                <div class="text-sm text-gray-500"><c:out value="${c.correo}" /></div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="text-sm text-gray-500"><c:out value="${c.mensaje}" /></div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 text-xs font-medium bg-blue-100 text-blue-800 rounded-full">
                                            Consulta
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="text-sm text-gray-900"><fmt:formatDate value="${c.fechaEnvio}" pattern="yyyy-MM-dd HH:mm" /></div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 text-xs font-medium bg-red-100 text-red-800 rounded-full">
                                            No leído
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                        <div class="flex items-center space-x-2">
                                            <button class="text-blue-600 hover:text-blue-900 view-btn" 
                                                    data-id="${c.id}"
                                                    data-nombre="${c.nombreCompleto}"
                                                    data-correo="${c.correo}"
                                                    data-fecha="${c.fechaEnvio}"
                                                    data-mensaje="${c.mensaje}">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="text-green-600 hover:text-green-900 reply-btn" data-id="${c.id}" data-correo="${c.correo}" data-nombre="${c.nombreCompleto}">
                                                <i class="fas fa-reply"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty contactosList}">
                              <tr>
                                <td colspan="6" class="text-center">No hay mensajes registrados.</td>
                              </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- View Message Modal -->
    <div id="viewMessageModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50">
        <div class="flex items-center justify-center min-h-screen p-4">
            <div class="bg-white rounded-lg shadow-xl max-w-2xl w-full max-h-screen overflow-y-auto">
                <div class="flex items-center justify-between p-6 border-b">
                    <h3 class="text-lg font-semibold text-gray-900">Detalles del Mensaje</h3>
                    <button id="closeViewModal" class="text-gray-400 hover:text-gray-600">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                
                <div class="p-6 space-y-4">
                    <div class="flex items-center justify-between">
                        <div class="flex items-center space-x-3">
                            <div class="w-12 h-12 bg-blue-500 rounded-full flex items-center justify-center">
                                <span class="text-white font-bold" id="iniciales"></span>
                            </div>
                            <div>
                                <div class="font-medium text-gray-900" id="nombreCompleto"></div>
                                <div class="text-sm text-gray-500" id="correoText"></div>
                            </div>
                        </div>
                        <div class="text-sm text-gray-500">
                            <div id="fecha"></div>
                        </div>
                    </div>
                    
                    <div class="border-t pt-4">
                        <div class="flex items-center justify-between mb-2">
                            <h4 class="font-medium text-gray-900">Consulta sobre disponibilidad</h4>
                            <span class="px-2 py-1 text-xs font-medium bg-blue-100 text-blue-800 rounded-full">
                                Consulta
                            </span>
                        </div>
                        
                        <div class="bg-gray-50 p-4 rounded-lg">
                            <p class="text-gray-700" id="mensaje"></p>
                        </div>
                    </div>
                    
                    <div class="flex justify-end space-x-3 pt-4">
                        <button id="markAsReadBtn" class="px-4 py-2 text-blue-600 border border-blue-300 rounded-lg hover:bg-blue-50">
                            Marcar como leído
                        </button>
                        <button id="replyFromViewBtn" class="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">
                            Responder
                        </button>
                        <button id="closeViewBtn" class="px-4 py-2 text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50">
                            Cerrar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Reply Message Modal -->
    <div id="replyModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50">
        <div class="flex items-center justify-center min-h-screen p-4">
            <div class="bg-white rounded-lg shadow-xl max-w-2xl w-full max-h-screen overflow-y-auto">
                <div class="flex items-center justify-between p-6 border-b">
                    <h3 class="text-lg font-semibold text-gray-900">Responder Mensaje</h3>
                    <button id="closeReplyModal" class="text-gray-400 hover:text-gray-600">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                
                <form id="replyForm" action="contacto" method="post" class="p-6 space-y-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Para:</label>
                        <input type="email" id="correo" class="w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-50" readonly>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Asunto:</label>
                        <input type="text" id="asunto" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Mensaje:</label>
                        <textarea id="replyMessage" rows="8" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Escriba su respuesta aquí..."></textarea>
                    </div>
                    
                    <div class="flex justify-end space-x-3 pt-4">
                        <button type="button" id="cancelReplyBtn" class="px-4 py-2 text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50">
                            Cancelar
                        </button>
                        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                            Enviar Respuesta
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Compose Message Modal -->
    <div id="composeModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50">
        <div class="flex items-center justify-center min-h-screen p-4">
            <div class="bg-white rounded-lg shadow-xl max-w-2xl w-full max-h-screen overflow-y-auto">
                <div class="flex items-center justify-between p-6 border-b">
                    <h3 class="text-lg font-semibold text-gray-900">Nuevo Mensaje</h3>
                    <button id="closeComposeModal" class="text-gray-400 hover:text-gray-600">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                
                <form id="composeForm" class="p-6 space-y-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Para:</label>
                        <input type="email" id="composeTo" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="destinatario@email.com" required>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Asunto:</label>
                        <input type="text" id="composeSubject" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Asunto del mensaje" required>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Tipo:</label>
                        <select id="composeType" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                            <option value="consulta">Consulta</option>
                            <option value="reserva">Reserva</option>
                            <option value="informacion">Información</option>
                            <option value="promocion">Promoción</option>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Mensaje:</label>
                        <textarea id="composeMessage" rows="8" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Escriba su mensaje aquí..." required></textarea>
                    </div>
                    
                    <div class="flex justify-end space-x-3 pt-4">
                        <button type="button" id="cancelComposeBtn" class="px-4 py-2 text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50">
                            Cancelar
                        </button>
                        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                            Enviar Mensaje
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Sidebar functionality
        const sidebar = document.getElementById('sidebar');
        const mainContent = document.getElementById('mainContent');
        const menuToggle = document.getElementById('menuToggle');
        const sidebarToggle = document.getElementById('sidebarToggle');

        menuToggle?.addEventListener('click', function() {
            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');
        });

        sidebarToggle?.addEventListener('click', function() {
            sidebar.classList.add('collapsed');
            mainContent.classList.add('expanded');
        });

        // Modal functionality
        const viewMessageModal = document.getElementById('viewMessageModal');
        const replyModal = document.getElementById('replyModal');
        const composeModal = document.getElementById('composeModal');
        
        const closeViewModal = document.getElementById('closeViewModal');
        const closeReplyModal = document.getElementById('closeReplyModal');
        const closeComposeModal = document.getElementById('closeComposeModal');
        const closeViewBtn = document.getElementById('closeViewBtn');
        const cancelReplyBtn = document.getElementById('cancelReplyBtn');
        const cancelComposeBtn = document.getElementById('cancelComposeBtn');
        
        const composeBtn = document.getElementById('composeBtn');
        const replyForm = document.getElementById('replyForm');
        const composeForm = document.getElementById('composeForm');

        // Open modals
        composeBtn.addEventListener('click', function() {
            composeForm.reset();
            composeModal.classList.remove('hidden');
        });

        // Close modals
        closeViewModal.addEventListener('click', () => viewMessageModal.classList.add('hidden'));
        closeReplyModal.addEventListener('click', () => replyModal.classList.add('hidden'));
        closeComposeModal.addEventListener('click', () => composeModal.classList.add('hidden'));
        closeViewBtn.addEventListener('click', () => viewMessageModal.classList.add('hidden'));
        cancelReplyBtn.addEventListener('click', () => replyModal.classList.add('hidden'));
        cancelComposeBtn.addEventListener('click', () => composeModal.classList.add('hidden'));

        // View message functionality
        document.querySelectorAll('.view-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                document.getElementById('nombreCompleto').textContent  = this.dataset.nombre;
                document.getElementById('correoText').textContent  = this.dataset.correo;
                document.getElementById('fecha').textContent   = this.dataset.fecha;
                document.getElementById('mensaje').textContent = this.dataset.mensaje;
                
                const nombreCompleto = this.dataset.nombre;
                const palabras = nombreCompleto.split(' ');
                let iniciales = '';
                if (palabras.length > 0) {
                    iniciales += palabras[0].charAt(0);
                    if (palabras.length > 1) {
                        iniciales += palabras[palabras.length - 1].charAt(0);
                    }
                }
                document.getElementById('iniciales').textContent = iniciales.toUpperCase();
                
                replyForm.dataset.nombre  = document.getElementById('nombreCompleto').textContent;
                replyForm.dataset.correo  = document.getElementById('correoText').textContent;
                replyForm.dataset.fecha   = document.getElementById('fecha').textContent;
                replyForm.dataset.mensaje = document.getElementById('mensaje').textContent;

                viewMessageModal.classList.remove('hidden');

                const row = this.closest('tr');
                if (row.classList.contains('unread')) {
                    row.classList.remove('unread');
                    row.dataset.status = 'leido';
                    const statusSpan = row.querySelector('td:nth-child(6) span');
                    statusSpan.textContent = 'Leído';
                    statusSpan.className = 'px-2 py-1 text-xs font-medium bg-gray-100 text-gray-800 rounded-full';
                }
            });
        });

        // Reply functionality
        document.querySelectorAll('.reply-btn').forEach(btn => {
            btn.addEventListener('click', function(e) {
                replyModal.classList.remove('hidden');
                const button = e.currentTarget;
                
                const correo = button.dataset.correo;
                const nombre = button.dataset.nombre;
                document.getElementById('correo').value = correo;
                document.getElementById('asunto').value = 'RE: Consulta ' + nombre ;
            });
        });

        document.getElementById('replyFromViewBtn').addEventListener('click', function() {
            const nombre  = replyForm.dataset.nombre;
            const correo  = replyForm.dataset.correo;

            document.getElementById('correo').value  = correo;
            document.getElementById('asunto').value = "RE: Consulta " + nombre;
  
            viewMessageModal.classList.add('hidden');
            replyModal.classList.remove('hidden');
        });

        // Delete functionality
        document.querySelectorAll('.delete-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                if (confirm('¿Estás seguro de que quieres eliminar este mensaje?')) {
                    const row = this.closest('tr');
                    row.remove();
                }
            });
        });

        // Mark as read functionality
        document.getElementById('markAsReadBtn').addEventListener('click', function() {
            alert('Mensaje marcado como leído');
            viewMessageModal.classList.add('hidden');
        });

        // Mark all as read functionality
        document.getElementById('markAllReadBtn').addEventListener('click', function() {
            const unreadRows = document.querySelectorAll('.message-row.unread');
            unreadRows.forEach(row => {
                row.classList.remove('unread');
                row.dataset.status = 'leido';
                const statusSpan = row.querySelector('td:nth-child(6) span');
                statusSpan.textContent = 'Leído';
                statusSpan.className = 'px-2 py-1 text-xs font-medium bg-gray-100 text-gray-800 rounded-full';
            });
            alert('Todos los mensajes marcados como leídos');
        });

        // Form submissions
        replyForm.addEventListener('submit', function(e) {
            e.preventDefault();
            alert('Respuesta enviada exitosamente');
            replyModal.classList.add('hidden');
        });

        composeForm.addEventListener('submit', function(e) {
            e.preventDefault();
            alert('Mensaje enviado exitosamente');
            composeModal.classList.add('hidden');
        });

        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const rows = document.querySelectorAll('.message-row');
            
            rows.forEach(row => {
                const sender = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                const subject = row.querySelector('td:nth-child(3)').textContent.toLowerCase();
                
                if (sender.includes(searchTerm) || subject.includes(searchTerm)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });

        // Filter functionality
        document.getElementById('statusFilter').addEventListener('change', function() {
            const filter = this.value;
            const rows = document.querySelectorAll('.message-row');
            
            rows.forEach(row => {
                if (filter === '' || row.dataset.status === filter) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });

        // Select all functionality
        document.getElementById('selectAll').addEventListener('change', function() {
            const checkboxes = document.querySelectorAll('.message-checkbox');
            checkboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
        });

        // Responsive sidebar
        function handleResize() {
            if (window.innerWidth >= 768) {
                sidebar.classList.remove('collapsed');
                mainContent.classList.remove('expanded');
            } else {
                sidebar.classList.add('collapsed');
                mainContent.classList.add('expanded');
            }
        }

        window.addEventListener('resize', handleResize);
        handleResize();
    </script>
</body>
</html>