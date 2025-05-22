<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contáctanos - Hotel Cuzco</title>
    <link rel="stylesheet" href="css/carpetas_adicionales/contacto.css"/>
</head>
<body>
<div class="form-container">
    <form action="ContactoServlet" method="post">
        <h2>CONTÁCTANOS</h2>
        <input type="text" name="nombre" placeholder="Nombres completos" required 
               pattern="[A-Za-záéíóúÁÉÍÓÚñÑ\s]+" 
               title="Solo letras y espacios">
        
        <input type="email" name="correo" placeholder="Correo electrónico" required>
        
        <input type="tel" name="telefono" placeholder="Celular (ej. 987654321)" required
               pattern="[0-9]{9}" title="9 dígitos numéricos">
        
        <textarea name="mensaje" placeholder="Escribe tu mensaje aquí..." rows="5" required></textarea>
        
        <div class="button-group">
            <button type="submit">Enviar Mensaje</button>
            <a href="index.jsp" class="btn-back">Regresar al Inicio</a>
        </div>
        
        <c:if test="${not empty msg}">
            <div class="msg" style="color: ${msg.contains('correctamente') ? 'green' : 'red'}">
                ${msg}
            </div>
        </c:if>
    </form>
</div>
</body>
</html>