<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Gestión de Empleados - Sistema Hotelero</title>
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
                        <a href="index.jsp"
                            class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                            <i class="fas fa-tachometer-alt w-5 h-5 mr-3"></i>
                            Dashboard
                        </a>
                        <a href="#" class="flex items-center px-4 py-2 text-gray-700 bg-blue-50 rounded-lg">
                            <i class="fas fa-users w-5 h-5 mr-3"></i>
                            Empleados
                        </a>
                        <a href="habitaciones.jsp"
                            class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                            <i class="fas fa-bed w-5 h-5 mr-3"></i>
                            Habitaciones
                        </a>
                        <a href="reservas.jsp"
                            class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                            <i class="fas fa-calendar-check w-5 h-5 mr-3"></i>
                            Reservas
                        </a>
                        <a href="mensajes.jsp"
                            class="flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100 rounded-lg">
                            <i class="fas fa-envelope w-5 h-5 mr-3"></i>
                            Mensajes
                        </a>
                        <a href="reportes.jsp"
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
                            <h2 class="text-2xl font-semibold text-gray-800">Gestión de Empleados</h2>
                        </div>
                        <button id="addEmployeeBtn"
                            class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors">
                            <i class="fas fa-plus mr-2"></i>
                            Nuevo Empleado
                        </button>
                    </div>
                </div>

                <!-- Employees Content -->
                <div class="p-6">
                    <!-- Search and Filter -->
                    <div class="bg-white p-6 rounded-lg shadow-md mb-6">
                        <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                            <div class="flex-1">
                                <div class="relative">
                                    <input type="text" id="searchInput" placeholder="Buscar empleados..."
                                        class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                    <i
                                        class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Employees Table -->
                    <div class="bg-white rounded-lg shadow-md overflow-hidden">
                        <div class="overflow-x-auto">
                            <table class="w-full">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Empleado
                                        </th>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Usuario
                                        </th>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Correo
                                        </th>
                                        <th
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Teléfono
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
                                <tbody id="employeesTableBody" class="bg-white divide-y divide-gray-200">
                                    <c:choose>
                                        <c:when test="${empty administradores}">
                                            <tr>
                                                <td colspan="6" class="px-6 py-4 text-center text-gray-500">
                                                    No hay empleados registrados
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="admin" items="${administradores}">
                                                <tr>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="flex items-center">
                                                            <div
                                                                class="w-10 h-10 bg-blue-500 rounded-full flex items-center justify-center">
                                                                <span
                                                                    class="text-white font-bold">${admin.iniciales}</span>
                                                            </div>
                                                            <div class="ml-4">
                                                                <div class="text-sm font-medium text-gray-900">
                                                                    ${admin.nombreCompleto}</div>
                                                                <div class="text-sm text-gray-500">${admin.correo}</div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <span
                                                            class="px-2 py-1 text-xs font-medium bg-blue-100 text-blue-800 rounded-full">
                                                            ${admin.usuario}
                                                        </span>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                        ${admin.correo}
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                        ${admin.telefono}
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <span
                                                            class="px-2 py-1 text-xs font-medium ${admin.estado ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'} rounded-full">
                                                            ${admin.estado ? 'Activo' : 'Inactivo'}
                                                        </span>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                                        <button class="text-blue-600 hover:text-blue-900 mr-3 edit-btn"
                                                            data-id="${admin.id}">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button class="text-red-600 hover:text-red-900 delete-btn"
                                                            data-id="${admin.id}">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Add/Edit Employee Modal -->
            <div id="employeeModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50">
                <div class="flex items-center justify-center min-h-screen p-4">
                    <div class="bg-white rounded-lg shadow-xl max-w-md w-full">
                        <div class="flex items-center justify-between p-6 border-b">
                            <h3 id="modalTitle" class="text-lg font-semibold text-gray-900">Nuevo Empleado</h3>
                            <button id="closeModal" class="text-gray-400 hover:text-gray-600">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>

                        <form id="employeeForm" class="p-6 space-y-4" method="post" action="empleados">
                            <input type="hidden" name="opt" id="opt" value="2">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Nombre Completo</label>
                                <input type="text" id="nombreCompleto" name="nombreCompleto"
                                    class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Correo</label>
                                <input type="email" id="correo" name="correo"
                                    class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Teléfono</label>
                                <input type="tel" id="telefono" name="telefono"
                                    class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Usuario</label>
                                <input type="text" id="usuario" name="usuario"
                                    class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Contraseña</label>
                                <input type="password" id="contrasena" name="contrasena"
                                    class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Estado</label>
                                <select id="estado" name="estado"
                                    class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                    <option value="activo">Activo</option>
                                    <option value="inactivo">Inactivo</option>
                                </select>
                            </div>

                            <div class="flex justify-end space-x-3 pt-4">
                                <button type="button" id="cancelBtn"
                                    class="px-4 py-2 text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50">
                                    Cancelar
                                </button>
                                <button type="submit"
                                    class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
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
                const modal = document.getElementById('employeeModal');
                const addEmployeeBtn = document.getElementById('addEmployeeBtn');
                const closeModal = document.getElementById('closeModal');
                const cancelBtn = document.getElementById('cancelBtn');
                const employeeForm = document.getElementById('employeeForm');
                const modalTitle = document.getElementById('modalTitle');
                const optValue = document.getElementById('opt');

                addEmployeeBtn.addEventListener('click', function () {
                    modalTitle.textContent = 'Nuevo Empleado';
                    employeeForm.reset();
                    
                    // Remover campo de ID si existe (para asegurar que es un nuevo empleado)
                    const employeeIdInput = document.getElementById('employeeId');
                    if (employeeIdInput) {
                        employeeIdInput.remove();
                    }
                    
                    optValue.value = '2'; // Set option for adding new employee
                    modal.classList.remove('hidden');
                });

                closeModal.addEventListener('click', function () {
                    modal.classList.add('hidden');
                });

                cancelBtn.addEventListener('click', function () {
                    modal.classList.add('hidden');
                });

                // Edit employee functionality
                document.querySelectorAll('.edit-btn').forEach(btn => {
                    btn.addEventListener('click', function (e) {
                        const button = e.currentTarget;
                        const row = button.closest('tr');
                        
                        // Obtener datos de la fila
                        const employeeId = button.dataset.id;
                        const nombreCompleto = row.querySelector('.text-sm.font-medium').textContent.trim();
                        const correo = row.querySelector('.text-sm.text-gray-500').textContent.trim();
                        const usuario = row.querySelector('.bg-blue-100').textContent.trim();
                        const telefono = row.querySelectorAll('td')[3].textContent.trim();
                        const estadoElement = row.querySelector('.bg-green-100, .bg-red-100');
                        const estado = estadoElement ? (estadoElement.textContent.trim() === 'Activo' ? 'activo' : 'inactivo') : 'activo';
                        
                        // Llenar el formulario
                        document.getElementById('nombreCompleto').value = nombreCompleto;
                        document.getElementById('correo').value = correo;
                        document.getElementById('usuario').value = usuario;
                        document.getElementById('telefono').value = telefono;
                        document.getElementById('estado').value = estado;
                        
                        // Agregar campo oculto para el ID del empleado
                        let employeeIdInput = document.getElementById('employeeId');
                        if (!employeeIdInput) {
                            employeeIdInput = document.createElement('input');
                            employeeIdInput.type = 'hidden';
                            employeeIdInput.name = 'id';
                            employeeIdInput.id = 'employeeId';
                            employeeForm.appendChild(employeeIdInput);
                        }
                        employeeIdInput.value = employeeId;
                        
                        modalTitle.textContent = 'Editar Empleado';
                        optValue.value = '3'; // Set option for editing employee
                        modal.classList.remove('hidden');
                    });
                });

                // Delete employee functionality
                document.querySelectorAll('.delete-btn').forEach(btn => {
                    btn.addEventListener('click', function (e) {
                        const button = e.currentTarget;
                        const employeeId = button.dataset.id;
                        if (employeeId && confirm('¿Estás seguro de que quieres eliminar este empleado?')) {
                            window.location.href = `empleados?opt=4&id=` + employeeId; // Ojo aqui, es concatenar con + para que funcione
                        } else {
                            alert("Error: No se pudo obtener el ID del empleado.");
                        }
                    });
                });


                // Search functionality
                document.getElementById('searchInput').addEventListener('input', function () {
                    const searchTerm = this.value.toLowerCase();
                    const rows = document.querySelectorAll('#employeesTableBody tr');

                    rows.forEach(row => {
                        const name = row.querySelector('.text-sm.font-medium').textContent.toLowerCase();
                        const email = row.querySelector('.text-sm.text-gray-500').textContent.toLowerCase();

                        if (name.includes(searchTerm) || email.includes(searchTerm)) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
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