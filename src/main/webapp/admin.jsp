<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Hotel Cusco Mágico</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="css/admin.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    </head>
    <body class="admin-body">
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse">
                    <div class="position-sticky pt-3">
                        <div class="text-center mb-4">
                            <i class="fas fa-hotel fa-3x text-white"></i>
                            <h4 class="text-white mt-2">Hotel Cusco Mágico</h4>
                        </div>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="#mensajes" data-bs-toggle="tab">
                                    <i class="fas fa-envelope me-2"></i>Mensajes
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#reservas" data-bs-toggle="tab">
                                    <i class="fas fa-calendar-check me-2"></i>Reservas
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!-- Main content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <!-- Login Section -->
                    <div id="loginSection">
                        <div class="row justify-content-center mt-5">
                            <div class="col-md-6">
                                <div class="card shadow">
                                    <div class="card-header bg-primary text-white">
                                        <h3 class="card-title mb-0"><i class="fas fa-lock me-2"></i>Iniciar Sesión</h3>
                                    </div>
                                    <div class="card-body">
                                        <form id="loginForm" class="needs-validation" novalidate>
                                            <div class="mb-3">
                                                <label for="adminUser" class="form-label">Usuario:</label>
                                                <input type="text" class="form-control" id="adminUser" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="adminPassword" class="form-label">Contraseña:</label>
                                                <input type="password" class="form-control" id="adminPassword" required>
                                            </div>
                                            <button type="submit" class="btn btn-primary w-100">
                                                <i class="fas fa-sign-in-alt me-1"></i>Ingresar
                                            </button>
                                        </form>
                                        <p id="loginMessage" class="text-danger mt-3 text-center"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Admin Content -->
                    <div id="adminContent" style="display: none;">
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h1 class="h2">Panel de Administración</h1>
                            <button id="logoutButton" class="btn btn-danger">
                                <i class="fas fa-sign-out-alt me-1"></i> Cerrar Sesión
                            </button>
                        </div>

                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="mensajes">
                                <h3 class="mb-4"><i class="fas fa-envelope me-2"></i>Mensajes Recibidos</h3>
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>ID</th>
                                                <th>Nombre</th>
                                                <th>Correo</th>
                                                <th>Mensaje</th>
                                                <th>Fecha</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tablaMensajes"></tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="reservas">
                                <h3 class="mb-4"><i class="fas fa-calendar-check me-2"></i>Reservas</h3>
                                <!-- Contenido de reservas -->

                                <div style="width: 600px; height: 300px;">
                                    <canvas id="reservasChart"></canvas>
                                </div>

                                <div style="width: 600px; height: 300px;" class="mt-4">
                                    <canvas id="reservasPieChart"></canvas>
                                </div>




                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>ID</th>
                                                <th>Nombre</th>
                                                <th>Habitación</th>
                                                <th>Check-in</th>
                                                <th>Check-out</th>
                                                <th>Personas</th>
                                                <th>Precio/noche</th>
                                                <th>Pendiente</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tablaReservas"></tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="javascript/admin.js"></script>
    </body>
</html>