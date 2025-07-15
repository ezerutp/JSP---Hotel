<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contáctanos - Hotel Cuzco</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
    <c:if test="${not empty param.msg}">
        <div class="alert alert-success bg-green-100 text-green-800 border border-green-300 rounded px-4 py-3 mb-4 w-full max-w-lg mx-auto text-center">
            ${param.msg}
        </div>
    </c:if>
    <c:if test="${not empty param.error}">
        <div class="alert alert-danger bg-red-100 text-red-800 border border-red-300 rounded px-4 py-3 mb-4 w-full max-w-lg mx-auto text-center">
            ${param.error}
        </div>
    </c:if>

    <div class="form-container w-full max-w-lg bg-white shadow-lg rounded-lg p-8 mx-auto">
        <form action="ContactoServlet" method="post" class="space-y-6">
            <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">CONTÁCTANOS</h2>
            <input type="text" name="nombre" placeholder="Nombres completos" required 
                   pattern="[A-Za-záéíóúÁÉÍÓÚñÑ\s]+" 
                   title="Solo letras y espacios"
                   class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-400"/>

            <input type="email" name="correo" placeholder="Correo electrónico" required
                   class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-400"/>

            <input type="tel" name="telefono" placeholder="Celular (ej. 987654321)" required
                   pattern="[0-9]{9}" title="9 dígitos numéricos"
                   class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-400"/>

            <textarea name="mensaje" placeholder="Escribe tu mensaje aquí..." rows="5" required
                      class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-400"></textarea>

            <div class="flex items-center justify-between mt-6">
                <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 transition">Enviar Mensaje</button>
                <a href="/Proceso1/" class="text-blue-600 hover:underline px-4 py-2">Regresar al Inicio</a>
            </div>
        </form>
    </div>
</body>
</html>
