<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contáctanos - Hotel Cuzco</title>
    <link rel="stylesheet" href="css/carpetas_adicionales/contacto.css"/>
    <style>
        .alert {
            padding: 15px;
            margin: 10px auto;
            max-width: 600px;
            border-radius: 4px;
            text-align: center;
        }
        .alert-success { background-color: #d4edda; color: #155724; }
        .alert-danger { background-color: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <c:if test="${not empty param.msg}">
        <div class="alert alert-success">${param.msg}</div>
    </c:if>
    <c:if test="${not empty param.error}">
        <div class="alert alert-danger">${param.error}</div>
    </c:if>

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
        </form>
    </div>
</body>
</html>