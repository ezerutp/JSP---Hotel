<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Reserva - Hotel Cusco</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/carpetas_adicionales/RegistrarReserva.css"/>
    <style>
        .form-container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            padding: 2rem;
        }
        .form-label {
            font-weight: 500;
        }
        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container py-5">
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger alert-dismissible fade show">
                ${param.error}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>
        
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="form-container">
                    <h2 class="text-center mb-4">
                        <i class="bi bi-calendar-plus"></i> Reserva con Nosotros
                    </h2>
                    
                    <form id="reservaForm" action="ReservaServlet" method="post" novalidate>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="nombre_huesped" class="form-label">Nombre del Huésped</label>
                                <input type="text" class="form-control" id="nombre_huesped" 
                                       name="nombre_huesped" required>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="correo_huesped" class="form-label">Correo Electrónico</label>
                                <input type="email" class="form-control" id="correo_huesped" 
                                       name="correo_huesped" required>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="telefono_huesped" class="form-label">Teléfono/Celular</label>
                                <input type="tel" class="form-control" id="telefono_huesped" 
                                       name="telefono_huesped" pattern="[0-9]{9}" 
                                       title="Ingrese un número de 9 dígitos" required>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="id_habitacion" class="form-label">Habitación</label>
                                <select class="form-select" id="id_habitacion" name="id_habitacion" required>
                                    <option value="" selected disabled>Seleccione una habitación</option>
                                    <c:forEach var="habitacion" items="${tiposHabitacion}">
                                        <option value="${habitacion.id}">${habitacion.nombre} -  (S/${habitacion.precioNoche})</option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="fecha_checkin" class="form-label">Fecha de Llegada</label>
                                <input type="date" class="form-control" id="fecha_checkin" 
                                       name="fecha_checkin" required>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="fecha_checkout" class="form-label">Fecha de Salida</label>
                                <input type="date" class="form-control" id="fecha_checkout" 
                                       name="fecha_checkout" required>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="cantidad_personas" class="form-label">N° de Personas</label>
                                <input type="number" class="form-control" id="cantidad_personas" 
                                       name="cantidad_personas" min="1" max="6" required>
                            </div>
                            
                            <div class="col-12 mt-4">
                                <div class="d-flex justify-content-between">
                                    <a href="index.jsp" class="btn btn-outline-secondary">
                                        <i class="bi bi-arrow-left"></i> Cancelar
                                    </a>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="bi bi-save"></i> Confirmar Reserva
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Validación de fechas
        document.getElementById('reservaForm').addEventListener('submit', function(e) {
            const checkin = new Date(document.getElementById('fecha_checkin').value);
            const checkout = new Date(document.getElementById('fecha_checkout').value);
            const hoy = new Date();
            hoy.setHours(0, 0, 0, 0);
            
            if (checkin < hoy) {
                alert('La fecha de llegada no puede ser anterior a hoy');
                e.preventDefault();
            }
            
            if (checkout <= checkin) {
                alert('La fecha de salida debe ser posterior a la de llegada');
                e.preventDefault();
            }
        });
        
        // Actualizar mínimo de fecha de salida
        document.getElementById('fecha_checkin').addEventListener('change', function() {
            const checkin = this.value;
            document.getElementById('fecha_checkout').min = checkin;
        });
    </script>
</body>
</html>