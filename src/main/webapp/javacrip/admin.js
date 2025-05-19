$(document).ready(function() {
    // Controlador de Login
    $('#loginForm').submit(function(e) {
        e.preventDefault();
        
        const user = $('#adminUser').val();
        const pass = $('#adminPassword').val();
        
        // Validación simple (en producción usar autenticación real)
        if(user === 'admin' && pass === 'admin123') {
            $('#loginSection').fadeOut(300, function() {
                $('#adminContent').fadeIn();
                loadMessages();
            });
        } else {
            $('#loginMessage').text('Usuario o contraseña incorrectos');
        }
    });
    
    // Controlador de Logout (debes implementar el botón en tu HTML)
    $(document).on('click', '#logoutButton', function() {
        $('#adminContent').fadeOut(300, function() {
            $('#loginSection').fadeIn();
            $('#loginForm')[0].reset();
            $('#loginMessage').text('');
        });
    });
    
    // Cargar mensajes de ejemplo
    function loadMessages() {
        const mensajes = [
            { id: 1, nombre: "Juan Pérez", correo: "juan@example.com", mensaje: "Consulta sobre disponibilidad", fecha: "2023-06-10" },
            { id: 2, nombre: "María Gómez", correo: "maria@example.com", mensaje: "Problema con mi reserva", fecha: "2023-06-09" }
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
    
    // Controlador de Tabs
    $('a[data-bs-toggle="tab"]').on('shown.bs.tab', function(e) {
        const target = $(e.target).attr("href");
        
        if(target === '#reservas') {
            // Aquí puedes cargar datos de reservas si es necesario
            console.log("Cargando reservas...");
        }
    });
});