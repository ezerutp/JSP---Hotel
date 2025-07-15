<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Habitaciones - Sistema Hotelero</title>
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

            .room-card {
                transition: all 0.3s ease;
            }

            .room-card:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
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
                    <a href="/Proceso1/dashboard/" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                        <i class="fas fa-tachometer-alt w-5 h-5 mr-3"></i>
                        Dashboard
                    </a>
                    <a href="empleados" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                        <i class="fas fa-users w-5 h-5 mr-3"></i>
                        Empleados
                    </a>
                    <a href="#" class="flex items-center px-4 py-2 text-gray-700 bg-blue-50 rounded-lg">
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
                    <a href="reportes" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
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
                        <h2 class="text-2xl font-semibold text-gray-800">Gestión de Habitaciones</h2>
                    </div>
                    <div class="flex items-center space-x-3">
                        <div class="flex items-center space-x-2">
                            <button id="viewToggle"
                                class="bg-gray-200 p-2 rounded-lg hover:bg-gray-300 transition-colors">
                                <i id="viewIcon" class="fas fa-th-large text-gray-600"></i>
                            </button>
                            <button id="addRoomBtn"
                                class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors">
                                <i class="fas fa-plus mr-2"></i>
                                Nueva Habitación
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Room Status Summary -->
            <div class="p-6">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
                    <div class="bg-white p-4 rounded-lg shadow-md">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm text-gray-600">Total Habitaciones</p>
                                <p class="text-2xl font-bold text-gray-800">${totalHabitaciones}</p>
                            </div>
                            <div class="bg-blue-100 p-3 rounded-full">
                                <i class="fas fa-bed text-blue-600"></i>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white p-4 rounded-lg shadow-md">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm text-gray-600">Disponibles</p>
                                <p class="text-2xl font-bold text-green-600">${totalHabitacionesActivas}</p>
                            </div>
                            <div class="bg-green-100 p-3 rounded-full">
                                <i class="fas fa-check-circle text-green-600"></i>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white p-4 rounded-lg shadow-md">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm text-gray-600">Ocupadas</p>
                                <p class="text-2xl font-bold text-red-600">${totalHabitacionesOcupadas}</p>
                            </div>
                            <div class="bg-red-100 p-3 rounded-full">
                                <i class="fas fa-times-circle text-red-600"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Search and Filter -->
                <div class="bg-white p-6 rounded-lg shadow-md mb-6">
                    <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                        <div class="flex-1">
                            <div class="relative">
                                <input type="text" id="searchInput" placeholder="Buscar habitaciones..."
                                    class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                <i
                                    class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                            </div>
                        </div>
                        <div class="flex gap-2">
                            <select id="statusFilter"
                                class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                                <option value="">Todos los estados</option>
                                <option value="disponible">Disponible</option>
                                <option value="ocupada">Ocupada</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Rooms Grid View -->
                <div id="roomsGrid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                    <!-- Room Cards -->
                    <c:choose>
                        <c:when test="${empty habitaciones}">
                            <div class="col-span-4 text-center text-gray-500">
                                No hay habitaciones registradas.
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="habitacion" items="${habitaciones}">
                                <div class="bg-white rounded-lg shadow-md overflow-hidden room-card">
                                    <div class="relative">
                                        <img src="https://picsum.photos/400/300?random=${habitacion.id}" alt="Habitación"
                                            class="w-full h-48 object-cover">
                                        <div class="absolute top-2 right-2">
                                            <span
                                                class="px-2 py-1 text-xs font-medium rounded-full
                                                <c:choose>
                                                    <c:when test='${habitacion.estado == "DISPONIBLE"}'>bg-green-100 text-green-800</c:when>
                                                    <c:when test='${habitacion.estado == "OCUPADA"}'>bg-red-100 text-red-800</c:when>
                                                    <c:otherwise>bg-gray-100 text-gray-800</c:otherwise>
                                                </c:choose>">
                                                <c:choose>
                                                    <c:when test="${habitacion.estado == 'DISPONIBLE'}">Disponible</c:when>
                                                    <c:when test="${habitacion.estado == 'OCUPADA'}">Ocupada</c:when>
                                                    <c:otherwise>${habitacion.estado}</c:otherwise>
                                                </c:choose>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="p-4">
                                        <div class="flex items-center justify-between mb-2">
                                            <h3 class="text-lg font-semibold text-gray-800">Habitación ${habitacion.numeroHabitacion}</h3>
                                        </div>
                                        <p class="text-sm text-gray-600 mb-2">Habitación ${habitacion.tipoHabitacion.nombre}</p>
                                        <div class="flex items-center justify-between mb-3">
                                            <div class="flex items-center text-sm text-gray-500">
                                                <i class="fas fa-user mr-1"></i>
                                                <span>${habitacion.tipoHabitacion.capacidad} persona</span>
                                            </div>
                                            <div class="text-lg font-bold text-blue-600">$ ${habitacion.tipoHabitacion.precioNoche}/noche</div>
                                        </div>
                                        <div class="flex items-center justify-between">
                                            <button
                                                class="text-blue-600 hover:text-blue-800 text-sm font-medium edit-room-btn"
                                                data-id="${habitacion.id}"
                                                data-estado="${habitacion.estado}"
                                                data-numero="${habitacion.numeroHabitacion}""
                                                data-tipo="${habitacion.tipoHabitacion.id}"
                                                data-tipoNombre="${habitacion.tipoHabitacion.nombre}"
                                                data-tipoCapacidad="${habitacion.tipoHabitacion.capacidad}"
                                                data-tipoDescripcion="${habitacion.tipoHabitacion.descripcion}"
                                                data-tipoPrecio="${habitacion.tipoHabitacion.precioNoche}"
                                                >
                                                <i class="fas fa-edit mr-1"></i>
                                                Editar
                                            </button>
                                            <button
                                                class="text-red-600 hover:text-red-800 text-sm font-medium delete-room-btn"
                                                data-id="${habitacion.id}">
                                                <i class="fas fa-trash mr-1"></i>
                                                Eliminar
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <!-- Add/Edit Room Modal -->
        <div id="roomModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50">
            <div class="flex items-center justify-center min-h-screen p-4">
                <div class="bg-white rounded-lg shadow-xl max-w-lg w-full max-h-screen overflow-y-auto">
                    <div class="flex items-center justify-between p-6 border-b">
                        <h3 id="modalTitle" class="text-lg font-semibold text-gray-900">Nueva Habitación</h3>
                        <button id="closeModal" class="text-gray-400 hover:text-gray-600">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>

                    <form id="roomForm" class="p-6 space-y-4" method="post" action="habitaciones">
                        <input type="hidden" name="id" id="id" value="">
                        <input type="hidden" name="opt" id="opt" value="2">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Número de Habitación</label>
                                <input type="text" id="numeroHabitacion" name="numeroHabitacion"
                                    class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                            </div>                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Tipo de Habitación</label>
                            <select id="tipoHabitacion" name="tipoHabitacion"
                                class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                <option value="">Seleccionar tipo</option>
                                <c:forEach var="tipo" items="${tipos}">
                                    <option value="${tipo.id}" 
                                            data-precio="${tipo.precioNoche}"
                                            data-capacidad="${tipo.capacidad}"
                                            data-descripcion="${tipo.descripcion}">${tipo.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Precio por Noche</label>
                                <input type="number" id="precioNoche" name="precioNoche" min="0" step="0.01" readonly
                                    class="w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-100 text-gray-600 cursor-default focus:ring-0 focus:border-gray-300">
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Capacidad</label>
                                <input type="number" id="capacidad" name="capacidad" min="1" max="10" readonly
                                    class="w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-100 text-gray-600 cursor-default focus:ring-0 focus:border-gray-300">
                            </div>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Descripción</label>
                            <textarea id="descripcion" name="descripcion" rows="3" readonly
                                class="w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-100 text-gray-600 cursor-default focus:ring-0 focus:border-gray-300"></textarea>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Servicios</label>
                            <div class="grid grid-cols-2 gap-2">
                                <label class="flex items-center">
                                    <input type="checkbox" id="wifi" class="rounded text-blue-600 focus:ring-blue-500">
                                    <span class="ml-2 text-sm text-gray-700">Wi-Fi</span>
                                </label>
                                <label class="flex items-center">
                                    <input type="checkbox" id="tv" class="rounded text-blue-600 focus:ring-blue-500">
                                    <span class="ml-2 text-sm text-gray-700">TV</span>
                                </label>
                                <label class="flex items-center">
                                    <input type="checkbox" id="minibar"
                                        class="rounded text-blue-600 focus:ring-blue-500">
                                    <span class="ml-2 text-sm text-gray-700">Minibar</span>
                                </label>
                                <label class="flex items-center">
                                    <input type="checkbox" id="aircon"
                                        class="rounded text-blue-600 focus:ring-blue-500">
                                    <span class="ml-2 text-sm text-gray-700">Aire Acondicionado</span>
                                </label>
                                <label class="flex items-center">
                                    <input type="checkbox" id="balcony"
                                        class="rounded text-blue-600 focus:ring-blue-500">
                                    <span class="ml-2 text-sm text-gray-700">Balcón</span>
                                </label>
                                <label class="flex items-center">
                                    <input type="checkbox" id="breakfast"
                                        class="rounded text-blue-600 focus:ring-blue-500">
                                    <span class="ml-2 text-sm text-gray-700">Desayuno</span>
                                </label>
                            </div>
                        </div>

                        <div class="flex justify-end space-x-3 pt-4">
                            <button type="button" id="cancelBtn"
                                class="px-4 py-2 text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50">
                                Cancelar
                            </button>
                            <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                                Guardar
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

            menuToggle?.addEventListener('click', function () {
                sidebar.classList.toggle('collapsed');
                mainContent.classList.toggle('expanded');
            });

            sidebarToggle?.addEventListener('click', function () {
                sidebar.classList.add('collapsed');
                mainContent.classList.add('expanded');
            });

            // Modal functionality
            const modal = document.getElementById('roomModal');
            const addRoomBtn = document.getElementById('addRoomBtn');
            const closeModal = document.getElementById('closeModal');
            const cancelBtn = document.getElementById('cancelBtn');
            const roomForm = document.getElementById('roomForm');
            const modalTitle = document.getElementById('modalTitle');
            const optValue = document.getElementById('opt');
            const roomIdInput = document.getElementById('id');

            // Funcion para abrir el modal de nueva habitación
            addRoomBtn.addEventListener('click', function () {
                modalTitle.textContent = 'Nueva Habitación';
                roomForm.reset();
                optValue.value = '2';
                modal.classList.remove('hidden');
            });

            // Función para actualizar campos cuando cambia el tipo de habitación
            document.getElementById('tipoHabitacion').addEventListener('change', function() {
                const selectedOption = this.options[this.selectedIndex];
                
                if (selectedOption.value) {
                    // Obtener los datos del tipo seleccionado
                    const precio = selectedOption.dataset.precio;
                    const capacidad = selectedOption.dataset.capacidad;
                    const descripcion = selectedOption.dataset.descripcion;
                    
                    // Actualizar los campos
                    document.getElementById('precioNoche').value = precio;
                    document.getElementById('capacidad').value = capacidad;
                    document.getElementById('descripcion').value = descripcion;
                } else {
                    // Limpiar los campos si no hay selección
                    document.getElementById('precioNoche').value = '';
                    document.getElementById('capacidad').value = '';
                    document.getElementById('descripcion').value = '';
                }
            });

            closeModal.addEventListener('click', function () {
                modal.classList.add('hidden');
            });

            cancelBtn.addEventListener('click', function () {
                modal.classList.add('hidden');
            });

            // Edit room functionality
            document.querySelectorAll('.edit-room-btn').forEach(btn => {
                btn.addEventListener('click', function (e) {
                    const button = e.currentTarget;

                    //Obtener datos de la habitación
                    const id = button.dataset.id;
                    const estado = button.dataset.estado;
                    const numero = button.dataset.numero;
                    const tipo = button.dataset.tipo;
                    const capacidad = button.dataset.tipocapacidad;
                    const descripcion = button.dataset.tipodescripcion;
                    const precio = button.dataset.tipoprecio;

                    // Llenar el formulario con los datos de la habitación
                    document.getElementById('numeroHabitacion').value = numero;
                    document.getElementById('tipoHabitacion').value = tipo;
                    document.getElementById('precioNoche').value = precio;
                    document.getElementById('capacidad').value = capacidad;
                    document.getElementById('descripcion').value = descripcion;
                    roomIdInput.value = id;

                    modalTitle.textContent = 'Editar Habitación';
                    optValue.value = '3';
                    modal.classList.remove('hidden');
                    // Here you would populate the form with room data
                });
            });

            // Delete room functionality
            document.querySelectorAll('.delete-room-btn').forEach(btn => {
                btn.addEventListener('click', function () {
                    if (confirm('¿Estás seguro de que quieres eliminar esta habitación?')) {
                        window.location.href = 'habitaciones?opt=4&id=' + this.dataset.id;
                    }
                });
            });

            // Search functionality
            document.getElementById('searchInput').addEventListener('input', function () {
                const searchTerm = this.value.toLowerCase();
                const roomCards = document.querySelectorAll('.room-card');

                roomCards.forEach(card => {
                    const roomNumber = card.querySelector('h3').textContent.toLowerCase();
                    const roomType = card.querySelector('p').textContent.toLowerCase();

                    if (roomNumber.includes(searchTerm) || roomType.includes(searchTerm)) {
                        card.style.display = '';
                    } else {
                        card.style.display = 'none';
                    }
                });
            });

            // Filter functionality
            document.getElementById('statusFilter').addEventListener('change', function () {
                filterRooms();
            });

            document.getElementById('typeFilter').addEventListener('change', function () {
                filterRooms();
            });

            document.getElementById('floorFilter').addEventListener('change', function () {
                filterRooms();
            });

            function filterRooms() {
                const statusFilter = document.getElementById('statusFilter').value;
                const typeFilter = document.getElementById('typeFilter').value;
                const floorFilter = document.getElementById('floorFilter').value;

                const roomCards = document.querySelectorAll('.room-card');

                roomCards.forEach(card => {
                    let show = true;

                    if (statusFilter) {
                        const status = card.querySelector('.absolute span').textContent.toLowerCase();
                        if (!status.includes(statusFilter)) show = false;
                    }

                    if (typeFilter && show) {
                        const type = card.querySelector('p').textContent.toLowerCase();
                        if (!type.includes(typeFilter)) show = false;
                    }

                    if (floorFilter && show) {
                        const floor = card.querySelector('.text-sm.text-gray-500').textContent;
                        if (!floor.includes(floorFilter)) show = false;
                    }

                    card.style.display = show ? '' : 'none';
                });
            }

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