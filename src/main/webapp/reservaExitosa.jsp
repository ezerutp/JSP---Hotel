<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reserva Exitosa - Hotel Cusco</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        .success-card {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .btn-outline-light:hover {
            color: #28a745 !important;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="success-card text-white p-5 text-center">
                    <div class="mb-4">
                        <i class="bi bi-check-circle-fill display-1"></i>
                    </div>
                    <h1 class="display-5 fw-bold mb-3">¡Reserva Confirmada!</h1>
                    <p class="lead mb-4">Su reserva ha sido registrada exitosamente en nuestro sistema.</p>
                    
                    <div class="d-flex justify-content-center gap-3 flex-wrap">
                        <a href="reservar" class="btn btn-light btn-lg px-4 py-2">
                            <i class="bi bi-plus-circle me-2"></i>Nueva Reserva
                        </a>
                        <a href="/Proceso1/" class="btn btn-outline-light btn-lg px-4 py-2">
                            <i class="bi bi-house me-2"></i>Inicio
                        </a>
                    </div>
                    
                    <div class="mt-5 pt-3 border-top border-light">
                        <p class="small mb-1">¿Necesitas ayuda?</p>
                        <p class="mb-0">
                            <i class="bi bi-telephone me-2"></i>+51 123 456 789
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>