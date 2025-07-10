<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                <a href="index.jsp" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                    <i class="fas fa-tachometer-alt w-5 h-5 mr-3"></i>
                    Dashboard
                </a>
                <a href="empleados.jsp" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                    <i class="fas fa-users w-5 h-5 mr-3"></i>
                    Empleados
                </a>
                <a href="#" class="flex items-center px-4 py-2 text-gray-700 bg-blue-50 rounded-lg">
                    <i class="fas fa-bed w-5 h-5 mr-3"></i>
                    Habitaciones
                </a>
                <a href="reservas.jsp" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                    <i class="fas fa-calendar-check w-5 h-5 mr-3"></i>
                    Reservas
                </a>
                <a href="mensajes.jsp" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
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
                    <h2 class="text-2xl font-semibold text-gray-800">Gestión de Habitaciones</h2>
                </div>
                <div class="flex items-center space-x-3">
                    <div class="flex items-center space-x-2">
                        <button id="viewToggle" class="bg-gray-200 p-2 rounded-lg hover:bg-gray-300 transition-colors">
                            <i id="viewIcon" class="fas fa-th-large text-gray-600"></i>
                        </button>
                        <button id="addRoomBtn" class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors">
                            <i class="fas fa-plus mr-2"></i>
                            Nueva Habitación
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Room Status Summary -->
        <div class="p-6">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
                <div class="bg-white p-4 rounded-lg shadow-md">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-600">Total Habitaciones</p>
                            <p class="text-2xl font-bold text-gray-800">45</p>
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
                            <p class="text-2xl font-bold text-green-600">38</p>
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
                            <p class="text-2xl font-bold text-red-600">7</p>
                        </div>
                        <div class="bg-red-100 p-3 rounded-full">
                            <i class="fas fa-times-circle text-red-600"></i>
                        </div>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-lg shadow-md">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-600">Mantenimiento</p>
                            <p class="text-2xl font-bold text-yellow-600">3</p>
                        </div>
                        <div class="bg-yellow-100 p-3 rounded-full">
                            <i class="fas fa-tools text-yellow-600"></i>
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
                            <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                        </div>
                    </div>
                    <div class="flex gap-2">
                        <select id="statusFilter" class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                            <option value="">Todos los estados</option>
                            <option value="disponible">Disponible</option>
                            <option value="ocupada">Ocupada</option>
                            <option value="mantenimiento">Mantenimiento</option>
                            <option value="limpieza">Limpieza</option>
                        </select>
                        <select id="typeFilter" class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                            <option value="">Todos los tipos</option>
                            <option value="simple">Simple</option>
                            <option value="doble">Doble</option>
                            <option value="suite">Suite</option>
                            <option value="presidencial">Presidencial</option>
                        </select>
                        <select id="floorFilter" class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                            <option value="">Todos los pisos</option>
                            <option value="1">Piso 1</option>
                            <option value="2">Piso 2</option>
                            <option value="3">Piso 3</option>
                            <option value="4">Piso 4</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Rooms Grid View -->
            <div id="roomsGrid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                <!-- Room Card 1 -->
                <div class="bg-white rounded-lg shadow-md overflow-hidden room-card">
                    <div class="relative">
                        <img src="../imagenes/cuzco1.jpg" alt="Habitación 101" class="w-full h-48 object-cover">
                        <div class="absolute top-2 right-2">
                            <span class="px-2 py-1 text-xs font-medium bg-green-100 text-green-800 rounded-full">
                                Disponible
                            </span>
                        </div>
                    </div>
                    <div class="p-4">
                        <div class="flex items-center justify-between mb-2">
                            <h3 class="text-lg font-semibold text-gray-800">Habitación 101</h3>
                            <span class="text-sm text-gray-500">Piso 1</span>
                        </div>
                        <p class="text-sm text-gray-600 mb-2">Suite Ejecutiva</p>
                        <div class="flex items-center justify-between mb-3">
                            <div class="flex items-center text-sm text-gray-500">
                                <i class="fas fa-user mr-1"></i>
                                <span>2 personas</span>
                            </div>
                            <div class="text-lg font-bold text-blue-600">$150/noche</div>
                        </div>
                        <div class="flex items-center justify-between">
                            <button class="text-blue-600 hover:text-blue-800 text-sm font-medium edit-room-btn" data-id="101">
                                <i class="fas fa-edit mr-1"></i>
                                Editar
                            </button>
                            <button class="text-red-600 hover:text-red-800 text-sm font-medium delete-room-btn" data-id="101">
                                <i class="fas fa-trash mr-1"></i>
                                Eliminar
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Room Card 2 -->
                <div class="bg-white rounded-lg shadow-md overflow-hidden room-card">
                    <div class="relative">
                        <img src="../imagenes/cuzco2.jpg" alt="Habitación 205" class="w-full h-48 object-cover">
                        <div class="absolute top-2 right-2">
                            <span class="px-2 py-1 text-xs font-medium bg-red-100 text-red-800 rounded-full">
                                Ocupada
                            </span>
                        </div>
                    </div>
                    <div class="p-4">
                        <div class="flex items-center justify-between mb-2">
                            <h3 class="text-lg font-semibold text-gray-800">Habitación 205</h3>
                            <span class="text-sm text-gray-500">Piso 2</span>
                        </div>
                        <p class="text-sm text-gray-600 mb-2">Habitación Doble</p>
                        <div class="flex items-center justify-between mb-3">
                            <div class="flex items-center text-sm text-gray-500">
                                <i class="fas fa-user mr-1"></i>
                                <span>2 personas</span>
                            </div>
                            <div class="text-lg font-bold text-blue-600">$80/noche</div>
                        </div>
                        <div class="flex items-center justify-between">
                            <button class="text-blue-600 hover:text-blue-800 text-sm font-medium edit-room-btn" data-id="205">
                                <i class="fas fa-edit mr-1"></i>
                                Editar
                            </button>
                            <button class="text-red-600 hover:text-red-800 text-sm font-medium delete-room-btn" data-id="205">
                                <i class="fas fa-trash mr-1"></i>
                                Eliminar
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Room Card 3 -->
                <div class="bg-white rounded-lg shadow-md overflow-hidden room-card">
                    <div class="relative">
                        <img src="../imagenes/valle_sagrado.jpg" alt="Habitación 304" class="w-full h-48 object-cover">
                        <div class="absolute top-2 right-2">
                            <span class="px-2 py-1 text-xs font-medium bg-yellow-100 text-yellow-800 rounded-full">
                                Mantenimiento
                            </span>
                        </div>
                    </div>
                    <div class="p-4">
                        <div class="flex items-center justify-between mb-2">
                            <h3 class="text-lg font-semibold text-gray-800">Habitación 304</h3>
                            <span class="text-sm text-gray-500">Piso 3</span>
                        </div>
                        <p class="text-sm text-gray-600 mb-2">Suite Presidencial</p>
                        <div class="flex items-center justify-between mb-3">
                            <div class="flex items-center text-sm text-gray-500">
                                <i class="fas fa-user mr-1"></i>
                                <span>4 personas</span>
                            </div>
                            <div class="text-lg font-bold text-blue-600">$300/noche</div>
                        </div>
                        <div class="flex items-center justify-between">
                            <button class="text-blue-600 hover:text-blue-800 text-sm font-medium edit-room-btn" data-id="304">
                                <i class="fas fa-edit mr-1"></i>
                                Editar
                            </button>
                            <button class="text-red-600 hover:text-red-800 text-sm font-medium delete-room-btn" data-id="304">
                                <i class="fas fa-trash mr-1"></i>
                                Eliminar
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Room Card 4 -->
                <div class="bg-white rounded-lg shadow-md overflow-hidden room-card">
                    <div class="relative">
                        <img src="../imagenes/Plaza-de-Armas-Cusco.jpg" alt="Habitación 102" class="w-full h-48 object-cover">
                        <div class="absolute top-2 right-2">
                            <span class="px-2 py-1 text-xs font-medium bg-green-100 text-green-800 rounded-full">
                                Disponible
                            </span>
                        </div>
                    </div>
                    <div class="p-4">
                        <div class="flex items-center justify-between mb-2">
                            <h3 class="text-lg font-semibold text-gray-800">Habitación 102</h3>
                            <span class="text-sm text-gray-500">Piso 1</span>
                        </div>
                        <p class="text-sm text-gray-600 mb-2">Habitación Simple</p>
                        <div class="flex items-center justify-between mb-3">
                            <div class="flex items-center text-sm text-gray-500">
                                <i class="fas fa-user mr-1"></i>
                                <span>1 persona</span>
                            </div>
                            <div class="text-lg font-bold text-blue-600">$60/noche</div>
                        </div>
                        <div class="flex items-center justify-between">
                            <button class="text-blue-600 hover:text-blue-800 text-sm font-medium edit-room-btn" data-id="102">
                                <i class="fas fa-edit mr-1"></i>
                                Editar
                            </button>
                            <button class="text-red-600 hover:text-red-800 text-sm font-medium delete-room-btn" data-id="102">
                                <i class="fas fa-trash mr-1"></i>
                                Eliminar
                            </button>
                        </div>
                    </div>
                </div>
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
                
                <form id="roomForm" class="p-6 space-y-4">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Número de Habitación</label>
                            <input type="text" id="roomNumber" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Piso</label>
                            <select id="roomFloor" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                <option value="">Seleccionar piso</option>
                                <option value="1">Piso 1</option>
                                <option value="2">Piso 2</option>
                                <option value="3">Piso 3</option>
                                <option value="4">Piso 4</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Tipo de Habitación</label>
                            <select id="roomType" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                <option value="">Seleccionar tipo</option>
                                <option value="simple">Simple</option>
                                <option value="doble">Doble</option>
                                <option value="suite">Suite</option>
                                <option value="presidencial">Presidencial</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Capacidad</label>
                            <input type="number" id="roomCapacity" min="1" max="10" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        </div>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Precio por Noche</label>
                            <input type="number" id="roomPrice" min="0" step="0.01" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Estado</label>
                            <select id="roomStatus" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                <option value="disponible">Disponible</option>
                                <option value="ocupada">Ocupada</option>
                                <option value="mantenimiento">Mantenimiento</option>
                                <option value="limpieza">Limpieza</option>
                            </select>
                        </div>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Descripción</label>
                        <textarea id="roomDescription" rows="3" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"></textarea>
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
                                <input type="checkbox" id="minibar" class="rounded text-blue-600 focus:ring-blue-500">
                                <span class="ml-2 text-sm text-gray-700">Minibar</span>
                            </label>
                            <label class="flex items-center">
                                <input type="checkbox" id="aircon" class="rounded text-blue-600 focus:ring-blue-500">
                                <span class="ml-2 text-sm text-gray-700">Aire Acondicionado</span>
                            </label>
                            <label class="flex items-center">
                                <input type="checkbox" id="balcony" class="rounded text-blue-600 focus:ring-blue-500">
                                <span class="ml-2 text-sm text-gray-700">Balcón</span>
                            </label>
                            <label class="flex items-center">
                                <input type="checkbox" id="breakfast" class="rounded text-blue-600 focus:ring-blue-500">
                                <span class="ml-2 text-sm text-gray-700">Desayuno</span>
                            </label>
                        </div>
                    </div>
                    
                    <div class="flex justify-end space-x-3 pt-4">
                        <button type="button" id="cancelBtn" class="px-4 py-2 text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50">
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

        menuToggle?.addEventListener('click', function() {
            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');
        });

        sidebarToggle?.addEventListener('click', function() {
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

        addRoomBtn.addEventListener('click', function() {
            modalTitle.textContent = 'Nueva Habitación';
            roomForm.reset();
            modal.classList.remove('hidden');
        });

        closeModal.addEventListener('click', function() {
            modal.classList.add('hidden');
        });

        cancelBtn.addEventListener('click', function() {
            modal.classList.add('hidden');
        });

        // Edit room functionality
        document.querySelectorAll('.edit-room-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                modalTitle.textContent = 'Editar Habitación';
                modal.classList.remove('hidden');
                // Here you would populate the form with room data
            });
        });

        // Delete room functionality
        document.querySelectorAll('.delete-room-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                if (confirm('¿Estás seguro de que quieres eliminar esta habitación?')) {
                    console.log('Deleting room with ID:', this.dataset.id);
                }
            });
        });

        // Form submission
        roomForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const roomData = {
                number: document.getElementById('roomNumber').value,
                floor: document.getElementById('roomFloor').value,
                type: document.getElementById('roomType').value,
                capacity: document.getElementById('roomCapacity').value,
                price: document.getElementById('roomPrice').value,
                status: document.getElementById('roomStatus').value,
                description: document.getElementById('roomDescription').value,
                services: {
                    wifi: document.getElementById('wifi').checked,
                    tv: document.getElementById('tv').checked,
                    minibar: document.getElementById('minibar').checked,
                    aircon: document.getElementById('aircon').checked,
                    balcony: document.getElementById('balcony').checked,
                    breakfast: document.getElementById('breakfast').checked
                }
            };
            
            console.log('Room data:', roomData);
            modal.classList.add('hidden');
            alert('Habitación guardada exitosamente');
        });

        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function() {
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
        document.getElementById('statusFilter').addEventListener('change', function() {
            filterRooms();
        });

        document.getElementById('typeFilter').addEventListener('change', function() {
            filterRooms();
        });

        document.getElementById('floorFilter').addEventListener('change', function() {
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
