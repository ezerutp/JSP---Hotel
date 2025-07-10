<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reportes - Sistema Hotelero</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                <a href="mensajes.jsp" class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                    <i class="fas fa-envelope w-5 h-5 mr-3"></i>
                    Mensajes
                </a>
                <a href="#" class="flex items-center px-4 py-2 text-gray-700 bg-blue-50 rounded-lg">
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
                    <h2 class="text-2xl font-semibold text-gray-800">Reportes y Análisis</h2>
                </div>
                <div class="flex items-center space-x-3">
                    <button id="exportBtn" class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition-colors">
                        <i class="fas fa-download mr-2"></i>
                        Exportar
                    </button>
                    <button id="printBtn" class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors">
                        <i class="fas fa-print mr-2"></i>
                        Imprimir
                    </button>
                </div>
            </div>
        </div>

        <!-- Reports Content -->
        <div class="p-6">
            <!-- Date Range Filter -->
            <div class="bg-white p-6 rounded-lg shadow-md mb-6">
                <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                    <h3 class="text-lg font-semibold text-gray-800">Filtros de Período</h3>
                    <div class="flex flex-col md:flex-row gap-4">
                        <div class="flex items-center space-x-2">
                            <label class="text-sm font-medium text-gray-700">Desde:</label>
                            <input type="date" id="dateFrom" class="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div class="flex items-center space-x-2">
                            <label class="text-sm font-medium text-gray-700">Hasta:</label>
                            <input type="date" id="dateTo" class="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500">
                        </div>
                        <button id="applyFilters" class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors">
                            Aplicar
                        </button>
                    </div>
                </div>
            </div>

            <!-- Key Metrics Cards -->
            <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-600">Ingresos Totales</p>
                            <p class="text-2xl font-bold text-green-600">$45,280</p>
                            <p class="text-sm text-green-500">+12% vs mes anterior</p>
                        </div>
                        <div class="bg-green-100 p-3 rounded-full">
                            <i class="fas fa-dollar-sign text-green-600 text-xl"></i>
                        </div>
                    </div>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-600">Ocupación Promedio</p>
                            <p class="text-2xl font-bold text-blue-600">78%</p>
                            <p class="text-sm text-blue-500">+5% vs mes anterior</p>
                        </div>
                        <div class="bg-blue-100 p-3 rounded-full">
                            <i class="fas fa-bed text-blue-600 text-xl"></i>
                        </div>
                    </div>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-600">Satisfacción Cliente</p>
                            <p class="text-2xl font-bold text-purple-600">4.6/5</p>
                            <p class="text-sm text-purple-500">+0.2 vs mes anterior</p>
                        </div>
                        <div class="bg-purple-100 p-3 rounded-full">
                            <i class="fas fa-star text-purple-600 text-xl"></i>
                        </div>
                    </div>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm text-gray-600">Reservas Totales</p>
                            <p class="text-2xl font-bold text-orange-600">284</p>
                            <p class="text-sm text-orange-500">+18% vs mes anterior</p>
                        </div>
                        <div class="bg-orange-100 p-3 rounded-full">
                            <i class="fas fa-calendar-check text-orange-600 text-xl"></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Charts Section -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
                <!-- Revenue Chart -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">Ingresos por Mes</h3>
                    <canvas id="revenueChart" width="400" height="200"></canvas>
                </div>

                <!-- Occupancy Chart -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">Tasa de Ocupación</h3>
                    <canvas id="occupancyChart" width="400" height="200"></canvas>
                </div>
            </div>

            <!-- More Charts -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
                <!-- Room Type Distribution -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">Distribución por Tipo de Habitación</h3>
                    <canvas id="roomTypeChart" width="400" height="200"></canvas>
                </div>

                <!-- Booking Source -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">Fuente de Reservas</h3>
                    <canvas id="bookingSourceChart" width="400" height="200"></canvas>
                </div>
            </div>

            <!-- Detailed Tables -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <!-- Top Rooms Report -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">Habitaciones Más Reservadas</h3>
                    <div class="overflow-x-auto">
                        <table class="w-full text-sm">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-4 py-2 text-left">Habitación</th>
                                    <th class="px-4 py-2 text-left">Tipo</th>
                                    <th class="px-4 py-2 text-left">Reservas</th>
                                    <th class="px-4 py-2 text-left">Ingresos</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="border-b">
                                    <td class="px-4 py-2">101</td>
                                    <td class="px-4 py-2">Suite</td>
                                    <td class="px-4 py-2">24</td>
                                    <td class="px-4 py-2">$3,600</td>
                                </tr>
                                <tr class="border-b">
                                    <td class="px-4 py-2">205</td>
                                    <td class="px-4 py-2">Doble</td>
                                    <td class="px-4 py-2">22</td>
                                    <td class="px-4 py-2">$1,760</td>
                                </tr>
                                <tr class="border-b">
                                    <td class="px-4 py-2">304</td>
                                    <td class="px-4 py-2">Presidencial</td>
                                    <td class="px-4 py-2">18</td>
                                    <td class="px-4 py-2">$5,400</td>
                                </tr>
                                <tr class="border-b">
                                    <td class="px-4 py-2">102</td>
                                    <td class="px-4 py-2">Simple</td>
                                    <td class="px-4 py-2">16</td>
                                    <td class="px-4 py-2">$960</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Customer Satisfaction -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">Satisfacción del Cliente</h3>
                    <div class="space-y-4">
                        <div class="flex items-center justify-between">
                            <span class="text-sm text-gray-600">Limpieza</span>
                            <div class="flex items-center space-x-2">
                                <div class="w-24 bg-gray-200 rounded-full h-2">
                                    <div class="bg-green-600 h-2 rounded-full" style="width: 92%"></div>
                                </div>
                                <span class="text-sm font-medium">4.6</span>
                            </div>
                        </div>
                        <div class="flex items-center justify-between">
                            <span class="text-sm text-gray-600">Servicio</span>
                            <div class="flex items-center space-x-2">
                                <div class="w-24 bg-gray-200 rounded-full h-2">
                                    <div class="bg-green-600 h-2 rounded-full" style="width: 88%"></div>
                                </div>
                                <span class="text-sm font-medium">4.4</span>
                            </div>
                        </div>
                        <div class="flex items-center justify-between">
                            <span class="text-sm text-gray-600">Instalaciones</span>
                            <div class="flex items-center space-x-2">
                                <div class="w-24 bg-gray-200 rounded-full h-2">
                                    <div class="bg-blue-600 h-2 rounded-full" style="width: 84%"></div>
                                </div>
                                <span class="text-sm font-medium">4.2</span>
                            </div>
                        </div>
                        <div class="flex items-center justify-between">
                            <span class="text-sm text-gray-600">Ubicación</span>
                            <div class="flex items-center space-x-2">
                                <div class="w-24 bg-gray-200 rounded-full h-2">
                                    <div class="bg-purple-600 h-2 rounded-full" style="width: 96%"></div>
                                </div>
                                <span class="text-sm font-medium">4.8</span>
                            </div>
                        </div>
                        <div class="flex items-center justify-between">
                            <span class="text-sm text-gray-600">Precio</span>
                            <div class="flex items-center space-x-2">
                                <div class="w-24 bg-gray-200 rounded-full h-2">
                                    <div class="bg-yellow-600 h-2 rounded-full" style="width: 78%"></div>
                                </div>
                                <span class="text-sm font-medium">3.9</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Report Generation Section -->
            <div class="bg-white p-6 rounded-lg shadow-md mt-6">
                <h3 class="text-lg font-semibold text-gray-800 mb-4">Generar Reportes Personalizados</h3>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div class="space-y-3">
                        <h4 class="font-medium text-gray-700">Reportes Financieros</h4>
                        <button class="w-full bg-green-600 text-white py-2 px-4 rounded-lg hover:bg-green-700 transition-colors">
                            Reporte de Ingresos
                        </button>
                        <button class="w-full bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700 transition-colors">
                            Estado de Cuentas
                        </button>
                        <button class="w-full bg-purple-600 text-white py-2 px-4 rounded-lg hover:bg-purple-700 transition-colors">
                            Análisis de Rentabilidad
                        </button>
                    </div>
                    <div class="space-y-3">
                        <h4 class="font-medium text-gray-700">Reportes Operativos</h4>
                        <button class="w-full bg-orange-600 text-white py-2 px-4 rounded-lg hover:bg-orange-700 transition-colors">
                            Ocupación por Período
                        </button>
                        <button class="w-full bg-red-600 text-white py-2 px-4 rounded-lg hover:bg-red-700 transition-colors">
                            Reporte de Reservas
                        </button>
                        <button class="w-full bg-indigo-600 text-white py-2 px-4 rounded-lg hover:bg-indigo-700 transition-colors">
                            Estadísticas de Huéspedes
                        </button>
                    </div>
                    <div class="space-y-3">
                        <h4 class="font-medium text-gray-700">Reportes de Personal</h4>
                        <button class="w-full bg-teal-600 text-white py-2 px-4 rounded-lg hover:bg-teal-700 transition-colors">
                            Rendimiento Empleados
                        </button>
                        <button class="w-full bg-pink-600 text-white py-2 px-4 rounded-lg hover:bg-pink-700 transition-colors">
                            Horarios y Turnos
                        </button>
                        <button class="w-full bg-gray-600 text-white py-2 px-4 rounded-lg hover:bg-gray-700 transition-colors">
                            Capacitación y Desarrollo
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

        // Set default date range (last 30 days)
        const today = new Date();
        const thirtyDaysAgo = new Date(today);
        thirtyDaysAgo.setDate(today.getDate() - 30);

        document.getElementById('dateFrom').value = thirtyDaysAgo.toISOString().split('T')[0];
        document.getElementById('dateTo').value = today.toISOString().split('T')[0];

        // Apply filters functionality
        document.getElementById('applyFilters').addEventListener('click', function() {
            const dateFrom = document.getElementById('dateFrom').value;
            const dateTo = document.getElementById('dateTo').value;
            
            if (dateFrom && dateTo) {
                // Here you would typically fetch new data based on the date range
                console.log('Filtering data from', dateFrom, 'to', dateTo);
                alert('Filtros aplicados: ' + dateFrom + ' a ' + dateTo);
            } else {
                alert('Por favor seleccione ambas fechas');
            }
        });

        // Export functionality
        document.getElementById('exportBtn').addEventListener('click', function() {
            alert('Exportando reporte...');
        });

        // Print functionality
        document.getElementById('printBtn').addEventListener('click', function() {
            window.print();
        });

        // Initialize Charts
        function initializeCharts() {
            // Revenue Chart
            const revenueCtx = document.getElementById('revenueChart').getContext('2d');
            new Chart(revenueCtx, {
                type: 'line',
                data: {
                    labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio'],
                    datasets: [{
                        label: 'Ingresos ($)',
                        data: [35000, 42000, 38000, 45000, 49000, 52000],
                        borderColor: 'rgb(34, 197, 94)',
                        backgroundColor: 'rgba(34, 197, 94, 0.1)',
                        tension: 0.1
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            // Occupancy Chart
            const occupancyCtx = document.getElementById('occupancyChart').getContext('2d');
            new Chart(occupancyCtx, {
                type: 'bar',
                data: {
                    labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio'],
                    datasets: [{
                        label: 'Ocupación (%)',
                        data: [65, 72, 68, 75, 82, 78],
                        backgroundColor: 'rgba(59, 130, 246, 0.8)',
                        borderColor: 'rgb(59, 130, 246)',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: 100
                        }
                    }
                }
            });

            // Room Type Chart
            const roomTypeCtx = document.getElementById('roomTypeChart').getContext('2d');
            new Chart(roomTypeCtx, {
                type: 'doughnut',
                data: {
                    labels: ['Suite', 'Doble', 'Simple', 'Presidencial'],
                    datasets: [{
                        data: [35, 40, 20, 5],
                        backgroundColor: [
                            'rgba(168, 85, 247, 0.8)',
                            'rgba(34, 197, 94, 0.8)',
                            'rgba(59, 130, 246, 0.8)',
                            'rgba(249, 115, 22, 0.8)'
                        ]
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });

            // Booking Source Chart
            const bookingSourceCtx = document.getElementById('bookingSourceChart').getContext('2d');
            new Chart(bookingSourceCtx, {
                type: 'pie',
                data: {
                    labels: ['Sitio Web', 'Booking.com', 'Expedia', 'Directo', 'Otros'],
                    datasets: [{
                        data: [45, 25, 15, 10, 5],
                        backgroundColor: [
                            'rgba(59, 130, 246, 0.8)',
                            'rgba(34, 197, 94, 0.8)',
                            'rgba(249, 115, 22, 0.8)',
                            'rgba(168, 85, 247, 0.8)',
                            'rgba(107, 114, 128, 0.8)'
                        ]
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });
        }

        // Initialize charts when page loads
        window.addEventListener('load', initializeCharts);

        // Report generation buttons
        document.querySelectorAll('button[class*="bg-"]').forEach(button => {
            if (button.textContent.includes('Reporte') || button.textContent.includes('Análisis') || button.textContent.includes('Estado') || button.textContent.includes('Ocupación') || button.textContent.includes('Estadísticas') || button.textContent.includes('Rendimiento') || button.textContent.includes('Horarios') || button.textContent.includes('Capacitación')) {
                button.addEventListener('click', function() {
                    const reportType = this.textContent.trim();
                    alert(`Generando ${reportType}...`);
                });
            }
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
