<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                <a href="/Proceso1/dashboard/" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
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
                <a href="#" class="flex items-center px-4 py-2 text-gray-700 bg-blue-50 rounded-lg">
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
                    <h2 class="text-2xl font-semibold text-gray-800">Gestión de Reservas</h2>
                </div>
                <button id="addReservationBtn" class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors">
                    <i class="fas fa-plus mr-2"></i>
                    Nueva Reserva
                </button>
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
                            <p class="text-2xl font-bold text-gray-800">128</p>
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
                            <p class="text-2xl font-bold text-green-600">95</p>
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
                            <p class="text-2xl font-bold text-yellow-600">18</p>
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
                            <p class="text-2xl font-bold text-purple-600">7</p>
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
                            <input type="text" id="searchInput" placeholder="Buscar por cliente, habitación o código..." 
                                   class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                            <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                        </div>
                    </div>
                    <div class="flex gap-2">
                        <input type="date" id="dateFilter" class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                        <select id="statusFilter" class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
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
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Código
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Cliente
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Habitación
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Fechas
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Total
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Estado
                                </th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Acciones
                                </th>
                            </tr>
                        </thead>
                        <tbody id="reservationsTableBody" class="bg-white divide-y divide-gray-200">
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-medium text-gray-900">#RES-001</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10 bg-blue-500 rounded-full flex items-center justify-center">
                                            <span class="text-white font-bold text-sm">MG</span>
                                        </div>
                                        <div class="ml-4">
                                            <div class="text-sm font-medium text-gray-900">María González</div>
                                            <div class="text-sm text-gray-500">maria.gonzalez@email.com</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">Habitación 101</div>
                                    <div class="text-sm text-gray-500">Suite Ejecutiva</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">15/07/2025 - 18/07/2025</div>
                                    <div class="text-sm text-gray-500">3 noches</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-medium text-gray-900">$450.00</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 py-1 text-xs font-medium bg-green-100 text-green-800 rounded-full">
                                        Confirmada
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    <div class="flex items-center space-x-2">
                                        <button class="text-blue-600 hover:text-blue-900 view-btn" data-id="1">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="text-green-600 hover:text-green-900 edit-btn" data-id="1">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="text-red-600 hover:text-red-900 delete-btn" data-id="1">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-medium text-gray-900">#RES-002</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10 bg-green-500 rounded-full flex items-center justify-center">
                                            <span class="text-white font-bold text-sm">CR</span>
                                        </div>
                                        <div class="ml-4">
                                            <div class="text-sm font-medium text-gray-900">Carlos Ruiz</div>
                                            <div class="text-sm text-gray-500">carlos.ruiz@email.com</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">Habitación 205</div>
                                    <div class="text-sm text-gray-500">Habitación Doble</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">16/07/2025 - 20/07/2025</div>
                                    <div class="text-sm text-gray-500">4 noches</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-medium text-gray-900">$320.00</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 py-1 text-xs font-medium bg-yellow-100 text-yellow-800 rounded-full">
                                        Pendiente
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    <div class="flex items-center space-x-2">
                                        <button class="text-blue-600 hover:text-blue-900 view-btn" data-id="2">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="text-green-600 hover:text-green-900 edit-btn" data-id="2">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="text-red-600 hover:text-red-900 delete-btn" data-id="2">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-medium text-gray-900">#RES-003</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10 bg-purple-500 rounded-full flex items-center justify-center">
                                            <span class="text-white font-bold text-sm">AL</span>
                                        </div>
                                        <div class="ml-4">
                                            <div class="text-sm font-medium text-gray-900">Ana López</div>
                                            <div class="text-sm text-gray-500">ana.lopez@email.com</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">Habitación 304</div>
                                    <div class="text-sm text-gray-500">Suite Presidencial</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">18/07/2025 - 22/07/2025</div>
                                    <div class="text-sm text-gray-500">4 noches</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-medium text-gray-900">$1,200.00</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 py-1 text-xs font-medium bg-blue-100 text-blue-800 rounded-full">
                                        Check-in
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    <div class="flex items-center space-x-2">
                                        <button class="text-blue-600 hover:text-blue-900 view-btn" data-id="3">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="text-green-600 hover:text-green-900 edit-btn" data-id="3">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="text-red-600 hover:text-red-900 delete-btn" data-id="3">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Add/Edit Reservation Modal -->
    <div id="reservationModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50">
        <div class="flex items-center justify-center min-h-screen p-4">
            <div class="bg-white rounded-lg shadow-xl max-w-2xl w-full max-h-screen overflow-y-auto">
                <div class="flex items-center justify-between p-6 border-b">
                    <h3 id="modalTitle" class="text-lg font-semibold text-gray-900">Nueva Reserva</h3>
                    <button id="closeModal" class="text-gray-400 hover:text-gray-600">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                
                <form id="reservationForm" class="p-6 space-y-4">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Nombre del Cliente</label>
                            <input type="text" id="clientName" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Email</label>
                            <input type="email" id="clientEmail" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" required>
                        </div>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Teléfono</label>
                            <input type="tel" id="clientPhone" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Documento de Identidad</label>
                            <input type="text" id="clientDocument" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" required>
                        </div>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Habitación</label>
                            <select id="roomSelection" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" required>
                                <option value="">Seleccionar habitación</option>
                                <option value="101">Habitación 101 - Suite Ejecutiva</option>
                                <option value="102">Habitación 102 - Habitación Simple</option>
                                <option value="205">Habitación 205 - Habitación Doble</option>
                                <option value="304">Habitación 304 - Suite Presidencial</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Número de Huéspedes</label>
                            <input type="number" id="guestCount" min="1" max="10" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" required>
                        </div>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Fecha de Entrada</label>
                            <input type="date" id="checkinDate" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Fecha de Salida</label>
                            <input type="date" id="checkoutDate" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" required>
                        </div>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Estado</label>
                            <select id="reservationStatus" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                <option value="pendiente">Pendiente</option>
                                <option value="confirmada">Confirmada</option>
                                <option value="checkin">Check-in</option>
                                <option value="checkout">Check-out</option>
                                <option value="cancelada">Cancelada</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Precio Total</label>
                            <input type="number" id="totalPrice" step="0.01" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" required>
                        </div>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Observaciones</label>
                        <textarea id="reservationNotes" rows="3" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent" placeholder="Observaciones adicionales..."></textarea>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Servicios Adicionales</label>
                        <div class="grid grid-cols-2 gap-2">
                            <label class="flex items-center">
                                <input type="checkbox" id="breakfast" class="rounded text-blue-600 focus:ring-blue-500">
                                <span class="ml-2 text-sm text-gray-700">Desayuno incluido</span>
                            </label>
                            <label class="flex items-center">
                                <input type="checkbox" id="transport" class="rounded text-blue-600 focus:ring-blue-500">
                                <span class="ml-2 text-sm text-gray-700">Transporte</span>
                            </label>
                            <label class="flex items-center">
                                <input type="checkbox" id="tours" class="rounded text-blue-600 focus:ring-blue-500">
                                <span class="ml-2 text-sm text-gray-700">Tours</span>
                            </label>
                            <label class="flex items-center">
                                <input type="checkbox" id="laundry" class="rounded text-blue-600 focus:ring-blue-500">
                                <span class="ml-2 text-sm text-gray-700">Lavandería</span>
                            </label>
                        </div>
                    </div>
                    
                    <div class="flex justify-end space-x-3 pt-4">
                        <button type="button" id="cancelBtn" class="px-4 py-2 text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50">
                            Cancelar
                        </button>
                        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                            Guardar Reserva
                        </button>
                    </div>
                </form>
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
                            <span class="px-2 py-1 text-xs font-medium bg-green-100 text-green-800 rounded-full">
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
                        <button id="closeViewBtn" class="px-4 py-2 text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50">
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

        menuToggle?.addEventListener('click', function() {
            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');
        });

        sidebarToggle?.addEventListener('click', function() {
            sidebar.classList.add('collapsed');
            mainContent.classList.add('expanded');
        });

        // Modal functionality
        const modal = document.getElementById('reservationModal');
        const viewModal = document.getElementById('viewModal');
        const addReservationBtn = document.getElementById('addReservationBtn');
        const closeModal = document.getElementById('closeModal');
        const closeViewModal = document.getElementById('closeViewModal');
        const closeViewBtn = document.getElementById('closeViewBtn');
        const cancelBtn = document.getElementById('cancelBtn');
        const reservationForm = document.getElementById('reservationForm');
        const modalTitle = document.getElementById('modalTitle');

        addReservationBtn.addEventListener('click', function() {
            modalTitle.textContent = 'Nueva Reserva';
            reservationForm.reset();
            modal.classList.remove('hidden');
        });

        closeModal.addEventListener('click', function() {
            modal.classList.add('hidden');
        });

        closeViewModal.addEventListener('click', function() {
            viewModal.classList.add('hidden');
        });

        closeViewBtn.addEventListener('click', function() {
            viewModal.classList.add('hidden');
        });

        cancelBtn.addEventListener('click', function() {
            modal.classList.add('hidden');
        });

        // View reservation functionality
        document.querySelectorAll('.view-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                viewModal.classList.remove('hidden');
            });
        });

        // Edit reservation functionality
        document.querySelectorAll('.edit-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                modalTitle.textContent = 'Editar Reserva';
                modal.classList.remove('hidden');
                // Here you would populate the form with reservation data
            });
        });

        // Delete reservation functionality
        document.querySelectorAll('.delete-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                if (confirm('¿Estás seguro de que quieres eliminar esta reserva?')) {
                    console.log('Deleting reservation with ID:', this.dataset.id);
                }
            });
        });

        // Form submission
        reservationForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const reservationData = {
                clientName: document.getElementById('clientName').value,
                clientEmail: document.getElementById('clientEmail').value,
                clientPhone: document.getElementById('clientPhone').value,
                clientDocument: document.getElementById('clientDocument').value,
                roomSelection: document.getElementById('roomSelection').value,
                guestCount: document.getElementById('guestCount').value,
                checkinDate: document.getElementById('checkinDate').value,
                checkoutDate: document.getElementById('checkoutDate').value,
                status: document.getElementById('reservationStatus').value,
                totalPrice: document.getElementById('totalPrice').value,
                notes: document.getElementById('reservationNotes').value,
                services: {
                    breakfast: document.getElementById('breakfast').checked,
                    transport: document.getElementById('transport').checked,
                    tours: document.getElementById('tours').checked,
                    laundry: document.getElementById('laundry').checked
                }
            };
            
            console.log('Reservation data:', reservationData);
            modal.classList.add('hidden');
            alert('Reserva guardada exitosamente');
        });

        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function() {
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

        // Calculate total price based on dates and room selection
        document.getElementById('checkinDate').addEventListener('change', calculateTotal);
        document.getElementById('checkoutDate').addEventListener('change', calculateTotal);
        document.getElementById('roomSelection').addEventListener('change', calculateTotal);

        function calculateTotal() {
            const checkinDate = document.getElementById('checkinDate').value;
            const checkoutDate = document.getElementById('checkoutDate').value;
            const roomSelection = document.getElementById('roomSelection').value;
            
            if (checkinDate && checkoutDate && roomSelection) {
                const checkin = new Date(checkinDate);
                const checkout = new Date(checkoutDate);
                const nights = (checkout - checkin) / (1000 * 60 * 60 * 24);
                
                // Room prices (this would normally come from a database)
                const roomPrices = {
                    '101': 150,
                    '102': 60,
                    '205': 80,
                    '304': 300
                };
                
                const pricePerNight = roomPrices[roomSelection] || 0;
                const total = nights * pricePerNight;
                
                document.getElementById('totalPrice').value = total.toFixed(2);
            }
        }

        // Set minimum date to today
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('checkinDate').min = today;
        document.getElementById('checkoutDate').min = today;

        // Update checkout minimum date when checkin changes
        document.getElementById('checkinDate').addEventListener('change', function() {
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
