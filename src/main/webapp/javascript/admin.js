$(document).ready(function () {
    // Controlador de Login
    $('#loginForm').submit(function (e) {
        e.preventDefault();

        const user = $('#adminUser').val();
        const pass = $('#adminPassword').val();

        // Validación simple (en producción usar autenticación real)
        if (user === 'admin' && pass === 'admin123') {
            $('#loginSection').fadeOut(300, function () {
                $('#adminContent').fadeIn();
                loadMessages();
                cargarReservas();
            });
        } else {
            $('#loginMessage').text('Usuario o contraseña incorrectos');
        }
    });

    // Controlador de Logout (debes implementar el botón en tu HTML)
    $(document).on('click', '#logoutButton', function () {
        $('#adminContent').fadeOut(300, function () {
            $('#loginSection').fadeIn();
            $('#loginForm')[0].reset();
            $('#loginMessage').text('');
        });
    });

    // Cargar mensajes de ejemplo
    function loadMessages() {
        const mensajes = [
            {id: 1, nombre: "Juan Pérez", correo: "juan@example.com", mensaje: "Consulta sobre disponibilidad", fecha: "2023-06-10"},
            {id: 2, nombre: "María Gómez", correo: "maria@example.com", mensaje: "Problema con mi reserva", fecha: "2023-06-09"}
        ];

        let html = '';
        mensajes.forEach(msg => {
            html += `
                <tr>
                    <td>${msg.id}</td>
                    <td>${msg.nombre}</td>
                    <td>${msg.correo}</td>
                    <td>${msg.mensaje}</td>
                    <td>${msg.fecha}</td>
                </tr>
            `;
        });

        $('#tablaMensajes').html(html);
    }
    /////

    function cargarReservas() {
        console.log("Intentando cargar reservas...");

        $.ajax({
            url: 'ReservasDataServlet',
            method: 'GET',
            dataType: 'json',
            success: function (response) {
                console.log("Datos recibidos:", response);
                const reservas = response.reservas;
                let html = '';

                // Para gráfico: Contar cantidad de reservas por habitación
                const reservasPorHabitacion = {};

                reservas.forEach(reserva => {
                    html += `
                        <tr>
                            <td>${reserva.nombreHuesped}</td>
                            <td>${reserva.habitacion}</td>
                            <td>${reserva.checkin}</td>
                            <td>${reserva.checkout}</td>
                            <td>${reserva.personas}</td>
                        </tr>
                    `;

                    // Contar reservas por habitación
                    if (reservasPorHabitacion[reserva.habitacion]) {
                        reservasPorHabitacion[reserva.habitacion]++;
                    } else {
                        reservasPorHabitacion[reserva.habitacion] = 1;
                    }

                });



                $('#tablaReservas').html(html);

                // Preparar datos para Chart.js
                const habitaciones = Object.keys(reservasPorHabitacion);
                const cantidades = Object.values(reservasPorHabitacion);

                // ==== GRÁFICO DE BARRAS ====
                if (window.reservasChartInstance) {
                    window.reservasChartInstance.data.labels = habitaciones;
                    window.reservasChartInstance.data.datasets[0].data = cantidades;
                    window.reservasChartInstance.update();
                } else {
                    const ctx = document.getElementById('reservasChart').getContext('2d');
                    window.reservasChartInstance = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: habitaciones,
                            datasets: [{
                                    label: 'Cantidad de Reservas por Habitación',
                                    data: cantidades,
                                    backgroundColor: 'rgba(54, 162, 235, 0.7)',
                                    borderColor: 'rgba(54, 162, 235, 1)',
                                    borderWidth: 1
                                }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true,
                                    precision: 0
                                }
                            }
                        }
                    });
                }

                // ==== GRÁFICO DE PASTEL ====
                if (window.reservasPieChartInstance) {
                    window.reservasPieChartInstance.data.labels = habitaciones;
                    window.reservasPieChartInstance.data.datasets[0].data = cantidades;
                    window.reservasPieChartInstance.update();
                } else {
                    const ctxPie = document.getElementById('reservasPieChart').getContext('2d');
                    window.reservasPieChartInstance = new Chart(ctxPie, {
                        type: 'pie',
                        data: {
                            labels: habitaciones,
                            datasets: [{
                                    label: 'Distribución de Reservas',
                                    data: cantidades,
                                    backgroundColor: [
                                        '#FF6384',
                                        '#36A2EB',
                                        '#FFCE56',
                                        '#4BC0C0',
                                        '#9966FF',
                                        '#FF9F40'
                                    ]
                                }]
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                legend: {
                                    position: 'right'
                                }
                            }
                        }
                    });
                }
                

            },
            error: function () {
                $('#tablaReservas').html('<tr><td colspan="5">Error al cargar reservas</td></tr>');
            }
        });
    }


    // Controlador de Tabs
    $('a[data-bs-toggle="tab"]').on('shown.bs.tab', function (e) {
        const target = $(e.target).attr("href");

        if (target === '#reservas') {
            // Aquí puedes cargar datos de reservas si es necesario
            console.log("Cargando reservas...");
            cargarReservas();
        }
    });
});