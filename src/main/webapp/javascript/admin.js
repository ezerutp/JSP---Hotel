$(document).ready(function () {
    // Variables globales para las instancias de gráficos
    let reservasChartInstance = null;
    let reservasPieChartInstance = null;

    // Controlador de Login
    $('#loginForm').submit(function (e) {
        e.preventDefault();
        handleLogin();
    });

    // Controlador de Logout
    $(document).on('click', '#logoutButton', handleLogout);

    // Controlador de Tabs
    $('a[data-bs-toggle="tab"]').on('shown.bs.tab', function (e) {
        const target = $(e.target).attr("href");
        if (target === '#reservas') {
            cargarReservas();
        } else if (target === '#mensajes') {
            cargarMensajes();
        }
    });

    // Funciones principales
    function handleLogin() {
        const user = $('#adminUser').val();
        const pass = $('#adminPassword').val();

        if (user === 'admin' && pass === 'admin123') {
            $('#loginSection').fadeOut(300, function () {
                $('#adminContent').fadeIn();
                cargarMensajes();
                cargarReservas();
            });
        } else {
            $('#loginMessage').text('Usuario o contraseña incorrectos');
        }
    }

    function handleLogout() {
        $('#adminContent').fadeOut(300, function () {
            $('#loginSection').fadeIn();
            $('#loginForm')[0].reset();
            $('#loginMessage').text('');
        });
    }

    function cargarMensajes() {
        $.ajax({
            url: 'MensajesDataServlet',
            method: 'GET',
            dataType: 'json',
            success: function(response) {
                let html = '';
                response.mensajes.forEach(msg => {
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
            },
            error: function() {
                $('#tablaMensajes').html('<tr><td colspan="5">Error al cargar mensajes</td></tr>');
            }
        });
    }

    function cargarReservas() {
        console.log("Intentando cargar reservas...");

        $.ajax({
            url: 'ReservasDataServlet',
            method: 'GET',
            dataType: 'json',
            success: function (response) {
                console.log("Datos recibidos:", response);
                actualizarTablaReservas(response.reservas);
                actualizarGraficos(response.reservas);
            },
            error: function () {
                $('#tablaReservas').html('<tr><td colspan="5">Error al cargar reservas</td></tr>');
            }
        });
    }

    function actualizarTablaReservas(reservas) {
        let html = '';
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
        });
        $('#tablaReservas').html(html);
    }

    function actualizarGraficos(reservas) {
        const reservasPorHabitacion = {};
        
        reservas.forEach(reserva => {
            reservasPorHabitacion[reserva.habitacion] = 
                (reservasPorHabitacion[reserva.habitacion] || 0) + 1;
        });

        const habitaciones = Object.keys(reservasPorHabitacion);
        const cantidades = Object.values(reservasPorHabitacion);

        actualizarGraficoBarras(habitaciones, cantidades);
        actualizarGraficoPastel(habitaciones, cantidades);
    }

    function actualizarGraficoBarras(labels, data) {
        const ctx = document.getElementById('reservasChart').getContext('2d');
        
        if (reservasChartInstance) {
            reservasChartInstance.data.labels = labels;
            reservasChartInstance.data.datasets[0].data = data;
            reservasChartInstance.update();
        } else {
            reservasChartInstance = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Cantidad de Reservas por Habitación',
                        data: data,
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
    }

    function actualizarGraficoPastel(labels, data) {
        const ctxPie = document.getElementById('reservasPieChart').getContext('2d');
        
        if (reservasPieChartInstance) {
            reservasPieChartInstance.data.labels = labels;
            reservasPieChartInstance.data.datasets[0].data = data;
            reservasPieChartInstance.update();
        } else {
            reservasPieChartInstance = new Chart(ctxPie, {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Distribución de Reservas',
                        data: data,
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
    }
});