<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.utp.proceso1.modelo.Administrador" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Sistema de Gestión Hotelera</title>
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
        .card-hover:hover {
            transform: translateY(-4px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
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
                <a href="#" class="flex items-center px-4 py-2 text-gray-700 bg-blue-50 rounded-lg">
                    <i class="fas fa-tachometer-alt w-5 h-5 mr-3"></i>
                    Dashboard
                </a>
                <a href="empleados" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                    <i class="fas fa-users w-5 h-5 mr-3"></i>
                    Empleados
                </a>
                <a href="habitaciones" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                    <i class="fas fa-bed w-5 h-5 mr-3"></i>
                    Habitaciones
                </a>
                <a href="reservas" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                    <i class="fas fa-calendar-check w-5 h-5 mr-3"></i>
                    Reservas
                </a>
                <a href="mensajes" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
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
                    <h2 class="text-2xl font-semibold text-gray-800">Dashboard</h2>
                </div>
                <div class="flex items-center space-x-4">
                    <div class="flex items-center space-x-2">
                        <span class="text-gray-700">
                            <%
                                Administrador adminName = (Administrador) session.getAttribute("administrador");
                                if (adminName != null && !adminName.getNombreCompleto().isEmpty()) {
                                    out.print("Bienvenido, " + adminName.getNombreCompleto());
                                } else {
                                    out.print("Administrador");
                                }
                            %>
                        </span>
                        <img src="../imagenes/banner.jpg" alt="Usuario" class="w-8 h-8 rounded-full">
                    </div>
                    <div class="relative">
                        <i class="fas fa-bell text-gray-600 text-xl"></i>
                        <span class="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">3</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Dashboard Content -->
        <div class="p-6">
            <!-- Stats Cards -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                <div class="bg-white p-6 rounded-lg shadow-md card-hover transition-all duration-300">
                    <div class="flex items-center justify-between">
                        <div>
                            <h3 class="text-lg font-semibold text-gray-700">Empleados</h3>
                            <p class="text-3xl font-bold text-blue-600">${empty empleadosList ? 0 : fn:length(empleadosList)}</p>
                        </div>
                        <div class="bg-blue-100 p-3 rounded-full">
                            <i class="fas fa-users text-blue-600 text-2xl"></i>
                        </div>
                    </div>
                </div>

                <div class="bg-white p-6 rounded-lg shadow-md card-hover transition-all duration-300">
                    <div class="flex items-center justify-between">
                        <div>
                            <h3 class="text-lg font-semibold text-gray-700">Habitaciones</h3>
                            <p class="text-3xl font-bold text-green-600">${empty habitacionesList ? 0 : fn:length(habitacionesList)}</p>
                        </div>
                        <div class="bg-green-100 p-3 rounded-full">
                            <i class="fas fa-bed text-green-600 text-2xl"></i>
                        </div>
                    </div>
                </div>

                <div class="bg-white p-6 rounded-lg shadow-md card-hover transition-all duration-300">
                    <div class="flex items-center justify-between">
                        <div>
                            <h3 class="text-lg font-semibold text-gray-700">Reservas</h3>
                            <p class="text-3xl font-bold text-purple-600">${empty reservaList ? 0 : fn:length(reservaList)}</p>
                        </div>
                        <div class="bg-purple-100 p-3 rounded-full">
                            <i class="fas fa-calendar-check text-purple-600 text-2xl"></i>
                        </div>
                    </div>
                </div>

                <div class="bg-white p-6 rounded-lg shadow-md card-hover transition-all duration-300">
                    <div class="flex items-center justify-between">
                        <div>
                            <h3 class="text-lg font-semibold text-gray-700">Mensajes</h3>
                            <p class="text-3xl font-bold text-orange-600">${empty mensajesList ? 0 : fn:length(mensajesList)}</p>
                        </div>
                        <div class="bg-orange-100 p-3 rounded-full">
                            <i class="fas fa-envelope text-orange-600 text-2xl"></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-lg font-semibold text-gray-700 mb-4">Acciones Rápidas</h3>
                    <div class="space-y-3">
                        <a href="empleados" class="w-full block bg-blue-600 text-white text-center py-2 px-4 rounded-lg hover:bg-blue-700 transition-colors" style="width: 100% !important;">
                            <i class="fas fa-plus mr-2"></i>
                            Nuevo Empleado
                        </a>
                        <a href="habitaciones" class="w-full block bg-green-600 text-white text-center py-2 px-4 rounded-lg hover:bg-green-700 transition-colors" style="width: 100% !important;">
                            <i class="fas fa-bed mr-2"></i>
                            Agregar Habitación
                        </a>
                        <a href="reservas" class="w-full block bg-purple-600 text-white text-center py-2 px-4 rounded-lg hover:bg-purple-700 transition-colors" style="width: 100% !important;">
                            <i class="fas fa-calendar-plus mr-2"></i>
                            Nueva Reserva
                        </a>
                    </div>
                </div>

                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-lg font-semibold text-gray-700 mb-4">Actividad Reciente</h3>
                    <div class="space-y-3">
                        <c:if test="${not empty reservaList}">
                            <c:set var="lastReserva" value="${reservaList[fn:length(reservaList) - 1]}"/>
                            <div class="flex items-center space-x-3">
                                <div class="w-2 h-2 bg-green-500 rounded-full"></div>
                                <div class="flex-1">
                                    <p class="text-sm text-gray-600">Nueva reserva para habitación <c:out value="${lastReserva.idHabitacion.numeroHabitacion}"/></p>
                                    <p class="text-xs text-gray-400">Hace un momento</p>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty empleadosList}">
                            <c:set var="lastEmpleado" value="${empleadosList[fn:length(empleadosList) - 1]}"/>
                            <div class="flex items-center space-x-3">
                                <div class="w-2 h-2 bg-blue-500 rounded-full"></div>
                                <div class="flex-1">
                                    <p class="text-sm text-gray-600">Empleado <c:out value="${lastEmpleado.nombreCompleto}"/> agregado</p>
                                    <p class="text-xs text-gray-400">Hace un momento</p>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty mensajesList}">
                            <div class="flex items-center space-x-3">
                                <div class="w-2 h-2 bg-pink-500 rounded-full"></div>
                                <div class="flex-1">
                                    <p class="text-sm text-gray-600">Hay mensajes no leidos en la bandeja</p>
                                    <p class="text-xs text-gray-400">Hace un momento</p>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Recent Data Tables -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-lg font-semibold text-gray-700 mb-4">Reservas Recientes</h3>
                    <div class="overflow-x-auto">
                        <table class="w-full text-sm">
                            <thead>
                                <tr class="border-b">
                                    <th class="text-left py-2">Cliente</th>
                                    <th class="text-left py-2">Habitación</th>
                                    <th class="text-left py-2">Fecha</th>
                                    <th class="text-left py-2">Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c"
                                            items="${reservaList}"
                                            varStatus="status">
                                   <c:if test="${status.index >= (fn:length(reservaList) > 3 ? fn:length(reservaList) - 3 : 0)}">
                                     <tr class="border-b">
                                       <td class="py-2"><c:out value="${c.nombreHuesped}"/></td>
                                       <td class="py-2">
                                         Habitación <c:out value="${c.idHabitacion.numeroHabitacion}"/>
                                       </td>
                                       <td class="py-2">
                                         <fmt:formatDate value="${c.fechaCheckin}" pattern="dd/MM/yyyy" />
                                         al
                                         <fmt:formatDate value="${c.fechaCheckout}" pattern="dd/MM/yyyy" />
                                       </td>
                                       <td class="py-2">
                                         <span class="px-2 py-1 bg-yellow-100 text-yellow-800 rounded-full text-xs">
                                           Pendiente
                                         </span>
                                       </td>
                                     </tr>
                                   </c:if>
                                 </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-lg font-semibold text-gray-700 mb-4">Mensajes Recientes</h3>
                    <div class="space-y-3">
                        <c:forEach var="c"
                            items="${mensajesList}"
                            varStatus="statusMsj">
                            <c:if test="${statusMsj.index >= (fn:length(mensajesList) > 3 ? fn:length(mensajesList) - 2 : 0)}">
                                <div class="flex items-start space-x-3">
                                    <div class="w-8 h-8 bg-blue-500 rounded-full flex items-center justify-center">
                                        <i class="fas fa-user text-white text-xs"></i>
                                    </div>
                                    <div class="flex-1">
                                        <p class="text-sm font-medium text-gray-800"><c:out value="${c.nombreCompleto}"/></p>
                                        <p class="text-xs text-gray-600"><c:out value="${c.mensaje}"/></p>
                                        <p class="text-xs text-gray-400 mt-1">Hace un momento</p>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Sidebar toggle functionality
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

        // Auto-update stats (simulated)
        setInterval(function() {
            const notifications = document.querySelector('.fa-bell').nextElementSibling;
            const currentCount = parseInt(notifications.textContent);
            if (Math.random() > 0.9) {
                notifications.textContent = currentCount + 1;
            }
        }, 30000);
    </script>
</body>
</html>
