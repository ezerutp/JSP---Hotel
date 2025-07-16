<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Gestión de Reservas - Sistema Hotelero</title>
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
                        <a href="/Proceso1/dashboard/"
                            class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                            <i class="fas fa-tachometer-alt w-5 h-5 mr-3"></i>
                            Dashboard
                        </a>
                        <a href="empleados"
                            class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                            <i class="fas fa-users w-5 h-5 mr-3"></i>
                            Empleados
                        </a>
                        <a href="habitaciones"
                            class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                            <i class="fas fa-bed w-5 h-5 mr-3"></i>
                            Habitaciones
                        </a>
                        <a href="#" class="flex items-center px-4 py-2 text-gray-700 bg-blue-50 rounded-lg">
                            <i class="fas fa-calendar-check w-5 h-5 mr-3"></i>
                            Reservas
                        </a>
                        <a href="mensajes"
                            class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                            <i class="fas fa-envelope w-5 h-5 mr-3"></i>
                            Mensajes
                        </a>
                        <a href="reportes"
                            class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                            <i class="fas fa-chart-bar w-5 h-5 mr-3"></i>
                            Reportes
                        </a>
                    </div>

                    <div class="absolute bottom-0 w-full p-4 border-t">
                        <a href="../logout"
                            class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
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
                            <h2 class="text-2xl font-semibold text-gray-800">Gestión de Reservas</h2>
                        </div>
                        <a href="/Proceso1/reservar"
                            class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors flex items-center">
                            <i class="fas fa-plus mr-2"></i>
                            Nueva Reserva
                        </a>
                    </div>
                </div>

                <!-- Reservations Content -->
                <div class="p-6">
                    <!-- Stats Summary -->
                    <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
                        <div class="bg-white p-4 rounded-lg shadow-md">
                            <div class="flex items-center justify-between">
                                <div>
                                    <p class="text-sm text-gray-600">Total Reservas</p>
                                    <p class="text-2xl font-bold text-gray-800">${totalReservas}</p>
                                </div>
                                <div class="bg-blue-100 p-3 rounded-full">
                                    <i class="fas fa-calendar-check text-blue-600"></i>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white p-4 rounded-lg shadow-md">
                            <div class="flex items-center justify-between">
                                <div>
                                    <p class="text-sm text-gray-600">Confirmadas</p>
                                    <p class="text-2xl font-bold text-green-600">${totalReservasActivas}</p>
                                </div>
                                <div class="bg-green-100 p-3 rounded-full">
                                    <i class="fas fa-check-circle text-green-600"></i>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white p-4 rounded-lg shadow-md">
                            <div class="flex items-center justify-between">
                                <div>
                                    <p class="text-sm text-gray-600">Pendientes</p>
                                    <p class="text-2xl font-bold text-yellow-600">${totalReservasPendientes}</p>
                                </div>
                                <div class="bg-yellow-100 p-3 rounded-full">
                                    <i class="fas fa-clock text-yellow-600"></i>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white p-4 rounded-lg shadow-md">
                            <div class="flex items-center justify-between">
                                <div>
                                    <p class="text-sm text-gray-600">Check-in Hoy</p>
                                    <p class="text-2xl font-bold text-purple-600">${totalReservasCheckedIn}</p>
                                </div>
                                <div class="bg-purple-100 p-3 rounded-full">
                                    <i class="fas fa-sign-in-alt text-purple-600"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Search and Filter -->
                    <div class="bg-white p-6 rounded-lg shadow-md mb-6">
                        <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                            <div class="flex-1">
                                <div class="relative">
                                    <input type="text" id="searchInput"
                                        placeholder="Buscar por cliente, habitación o código..."
                                        class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                    <i
                                        class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                                </div>
                            </div>
                            <div class="flex gap-2">
                                <input type="date" id="dateFilter"
                                    class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                                <select id="statusFilter"
                                    class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                                    <option value="">Todos los estados</option>
                                    <option value="pendiente">Pendiente</option>
                                    <option value="confirmada">Confirmada</option>
                                    <option value="checkin">Check-in</option>
                                    <option value="checkout">Check-out</option>
                                    <option value="cancelada">Cancelada</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Reservations Table -->
                    <div class="bg-white rounded-lg shadow-md overflow-hidden">
                        <div class="overflow-x-auto">
                            <table class="w-full">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Código
                                        </th>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Cliente
                                        </th>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Habitación
                                        </th>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Fechas
                                        </th>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Total
                                        </th>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Estado
                                        </th>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Acciones
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="reservationsTableBody" class="bg-white divide-y divide-gray-200">
                                    <c:choose>
                                        <c:when test="${empty reservas}">
                                            <tr>
                                                <td colspan="7" class="px-6 py-4 text-center text-gray-500">
                                                    No hay reservas registradas.
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="reserva" items="${reservas}">
                                                <tr>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="text-sm font-medium text-gray-900">${reserva.codigo}
                                                        </div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="flex items-center">
                                                            <div
                                                                class="w-10 h-10 bg-blue-500 rounded-full flex items-center justify-center">
                                                                <span class="text-white font-bold text-sm">MG</span>
                                                            </div>
                                                            <div class="ml-4">
                                                                <div class="text-sm font-medium text-gray-900">
                                                                    ${reserva.nombreHuesped}</div>
                                                                <div class="text-sm text-gray-500">
                                                                    ${reserva.correoHuesped}</div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="text-sm text-gray-900">Habitación
                                                            ${reserva.idHabitacion.numeroHabitacion}</div>
                                                        <div class="text-sm text-gray-500">
                                                            ${reserva.idHabitacion.tipoHabitacion.nombre}</div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="text-sm text-gray-900">
                                                            <c:choose>
                                                                <c:when test="${reserva.fechaCheckin != null and reserva.fechaCheckout != null}">
                                                                    <fmt:formatDate value="${reserva.fechaCheckin}" pattern="dd/MM/yyyy"/> - 
                                                                    <fmt:formatDate value="${reserva.fechaCheckout}" pattern="dd/MM/yyyy"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    Fechas no definidas
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div class="text-sm text-gray-500">${reserva.diasHospedaje}
                                                            noches</div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="text-sm font-medium text-gray-900">$
                                                            ${reserva.totalPagar}</div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <c:choose>
                                                            <c:when test="${reserva.estadoReserva == 'PENDIENTE'}">
                                                                <span class="px-2 py-1 text-xs font-medium bg-yellow-100 text-yellow-800 rounded-full">
                                                                    Pendiente
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${reserva.estadoReserva == 'CONFIRMADA'}">
                                                                <span class="px-2 py-1 text-xs font-medium bg-green-100 text-green-800 rounded-full">
                                                                    Confirmada
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${reserva.estadoReserva == 'CANCELADA'}">
                                                                <span class="px-2 py-1 text-xs font-medium bg-blue-100 text-blue-800 rounded-full">
                                                                    Cancelada
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="px-2 py-1 text-xs font-medium bg-gray-100 text-gray-800 rounded-full">
                                                                    ${reserva.estadoReserva}
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                                        <div class="flex items-center space-x-2">
                                                            <button class="text-blue-600 hover:text-blue-900 view-btn"
                                                                data-id="${reserva.id}">
                                                                <i class="fas fa-eye"></i>
                                                            </button>
                                                            <button class="text-red-600 hover:text-red-900 delete-btn"
                                                                data-id="${reserva.id}">
                                                                <i class="fas fa-trash"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- View Reservation Modal -->
            <div id="viewModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50">
                <div class="flex items-center justify-center min-h-screen p-4">
                    <div class="bg-white rounded-lg shadow-xl max-w-lg w-full">
                        <div class="flex items-center justify-between p-6 border-b">
                            <h3 class="text-lg font-semibold text-gray-900">Detalles de la Reserva</h3>
                            <button id="closeViewModal" class="text-gray-400 hover:text-gray-600">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>

                        <div class="p-6 space-y-4">
                            <div class="grid grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700">Código</label>
                                    <p class="text-sm text-gray-900">#RES-001</p>
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700">Estado</label>
                                    <span
                                        class="px-2 py-1 text-xs font-medium bg-green-100 text-green-800 rounded-full">
                                        Confirmada
                                    </span>
                                </div>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Cliente</label>
                                <p class="text-sm text-gray-900">María González</p>
                                <p class="text-sm text-gray-500">maria.gonzalez@email.com</p>
                            </div>

                            <div class="grid grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700">Habitación</label>
                                    <p class="text-sm text-gray-900">Habitación 101</p>
                                    <p class="text-sm text-gray-500">Suite Ejecutiva</p>
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700">Huéspedes</label>
                                    <p class="text-sm text-gray-900">2 personas</p>
                                </div>
                            </div>

                            <div class="grid grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700">Check-in</label>
                                    <p class="text-sm text-gray-900">15/07/2025</p>
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700">Check-out</label>
                                    <p class="text-sm text-gray-900">18/07/2025</p>
                                </div>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Total</label>
                                <p class="text-lg font-bold text-gray-900">$450.00</p>
                                <p class="text-sm text-gray-500">3 noches</p>
                            </div>

                            <div class="flex justify-end space-x-3 pt-4">
                                <button id="closeViewBtn"
                                    class="px-4 py-2 text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50">
                                    Cerrar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                // Sidebar functionality
                const sidebar = document.getElementById('sidebar');
                const mainContent = document.getElementById('mainContent');
                const menuToggle = document.getElementById('menuToggle');
                const sidebarToggle = document.getElementById('sidebarToggle');

                menuToggle?.addEventListener('click', function () {
                    sidebar.classList.toggle('collapsed');
                    mainContent.classList.toggle('expanded');
                });

                sidebarToggle?.addEventListener('click', function () {
                    sidebar.classList.add('collapsed');
                    mainContent.classList.add('expanded');
                });

                // Modal functionality
                const viewModal = document.getElementById('viewModal');
                const closeModal = document.getElementById('closeModal');
                const closeViewModal = document.getElementById('closeViewModal');
                const closeViewBtn = document.getElementById('closeViewBtn');
                const cancelBtn = document.getElementById('cancelBtn');
                const reservationForm = document.getElementById('reservationForm');
                const modalTitle = document.getElementById('modalTitle');

                closeViewModal.addEventListener('click', function () {
                    viewModal.classList.add('hidden');
                });

                closeViewBtn.addEventListener('click', function () {
                    viewModal.classList.add('hidden');
                });

                // View reservation functionality
                document.querySelectorAll('.view-btn').forEach(btn => {
                    btn.addEventListener('click', function () {
                        viewModal.classList.remove('hidden');
                    });
                });

                // Delete reservation functionality
                document.querySelectorAll('.delete-btn').forEach(btn => {
                    btn.addEventListener('click', function () {
                        if (confirm('¿Estás seguro de que quieres eliminar esta reserva?')) {
                            window.location.href = `reservas?opt=2&id=` + this.dataset.id;
                        }
                    });
                });

                // Search functionality
                document.getElementById('searchInput').addEventListener('input', function () {
                    const searchTerm = this.value.toLowerCase();
                    const rows = document.querySelectorAll('#reservationsTableBody tr');

                    rows.forEach(row => {
                        const code = row.cells[0].textContent.toLowerCase();
                        const client = row.cells[1].textContent.toLowerCase();
                        const room = row.cells[2].textContent.toLowerCase();

                        if (code.includes(searchTerm) || client.includes(searchTerm) || room.includes(searchTerm)) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                });

                // Set minimum date to today
                const today = new Date().toISOString().split('T')[0];
                document.getElementById('checkinDate').min = today;
                document.getElementById('checkoutDate').min = today;

                // Update checkout minimum date when checkin changes
                document.getElementById('checkinDate').addEventListener('change', function () {
                    document.getElementById('checkoutDate').min = this.value;
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