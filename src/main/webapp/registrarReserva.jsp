<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Reserva</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/carpetas_adicionales/RegistrarReserva.css"/>
</head>
<body>

    <div class="container">
        <div class="form-container">
            <h2>RESERVA CON NOSOTROS</h2>
            <form action="ReservaServlet" method="post">
                
                <div class="mb-3">
                    <label class="form-label">Nombre del Huésped</label>
                    <input type="text" name="nombreHuesped" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Nombre de Habitación</label>
                    <select name="habitacion" class="form-select" required>
                        <option value="">-- Selecciona una habitación --</option>
                        <option value="101">101 - Simple</option>
                        <option value="102">102 - Doble</option>
                        <option value="201">201 - Suite</option>
                        <option value="202">202 - Matrimonial</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Fecha de Check-in</label>
                    <input type="date" name="checkin" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Fecha de Check-out</label>
                    <input type="date" name="checkout" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Cantidad de Personas</label>
                    <input type="number" name="personas" class="form-control" min="1" max="10" required>
                </div>

                <div class="button-group">
                    <a href="index.jsp" class="btn btn-return btn-lg">
                        <i class="bi bi-arrow-left-circle"></i> Regresar al Inicio
                    </a>
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="bi bi-save"></i> Grabar Reserva
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>