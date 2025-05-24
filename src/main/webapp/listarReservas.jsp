<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Listado de Reservas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container my-4">
    <h1>Reservas del Hotel</h1>
    <button id="btnCargar" class="btn btn-primary mb-3">Cargar Reservas</button>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>Nombre Huesped</th>
            <th>Habitación</th>
            <th>Check-in</th>
            <th>Check-out</th>
            <th>Personas</th>
        </tr>
        </thead>
        <tbody id="tablaReservas">
        <tr><td colspan="5" class="text-center">No hay datos cargados.</td></tr>
        </tbody>
    </table>
</div>

<script>
    async function cargarReservas() {
        try {
            const response = await fetch('ReservasDataServlet');
            if (!response.ok)
                throw new Error('Error HTTP ' + response.status);

            const data = await response.json();
            const tbody = document.getElementById('tablaReservas');
            tbody.innerHTML = ''; // Limpiar tabla

            if (!data.reservas || data.reservas.length === 0) {
                tbody.innerHTML = '<tr><td colspan="5" class="text-center">No hay reservas.</td></tr>';
                return;
            }

            data.reservas.forEach(reserva => {
                // Crear fila y celdas con textContent
                const fila = document.createElement('tr');

                const c1 = document.createElement('td');
                c1.textContent = reserva.nombreHuesped;

                const c2 = document.createElement('td');
                c2.textContent = reserva.habitacion;

                const c3 = document.createElement('td');
                c3.textContent = reserva.checkin;

                const c4 = document.createElement('td');
                c4.textContent = reserva.checkout;

                const c5 = document.createElement('td');
                c5.textContent = reserva.personas;

                fila.appendChild(c1);
                fila.appendChild(c2);
                fila.appendChild(c3);
                fila.appendChild(c4);
                fila.appendChild(c5);

                tbody.appendChild(fila);
            });
        } catch (error) {
            console.error('Error al cargar reservas:', error);
            const tbody = document.getElementById('tablaReservas');
            tbody.innerHTML = `<tr><td colspan="5" class="text-danger text-center">Error al cargar reservas: ${error.message}</td></tr>`;
        }
    }

    document.getElementById('btnCargar').addEventListener('click', cargarReservas);
</script>

</body>
</html>
