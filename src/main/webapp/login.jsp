<!DOCTYPE html>
<html lang="es">

<head>
  <%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - Hotel Cusco Mágico</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="min-h-screen flex items-center justify-center bg-[url('imagenes/fondoLogin.jpg')] bg-cover bg-center">

  <div class="bg-white/90 backdrop-blur-md p-8 rounded-2xl shadow-2xl w-full max-w-md border border-purple-400">
    <h2 class="text-2xl font-bold text-center text-purple-800 mb-6">Ingreso de empleados</h2>
    <% String error=(String) request.getAttribute("error"); %>
      <% String success=(String) request.getAttribute("success"); %>
        <% if (error !=null) { %>
          <div
            class="mb-4 flex items-start rounded-lg bg-red-100 p-4 text-sm text-red-700 border border-red-300 space-x-2">
            <svg class="h-5 w-5 mt-1 text-red-600 shrink-0" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd"
                d="M10 18a8 8 0 100-16 8 8 0 000 16zm.707-4.707a1 1 0 11-1.414-1.414L10.586 10 9.293 8.707a1 1 0 011.414-1.414L12 8.586l1.293-1.293a1 1 0 011.414 1.414L13.414 10l1.293 1.293a1 1 0 01-1.414 1.414L12 11.414l-1.293 1.293z"
                clip-rule="evenodd" />
            </svg>
            <div><strong class="font-semibold">¡Error!</strong>
              <%= error %>
            </div>
          </div>
          <% } %>
            <% if (success !=null) { %>
              <div
                class="mb-4 flex items-start rounded-lg bg-green-100 p-4 text-sm text-green-700 border border-green-300 space-x-2">
                <svg class="h-5 w-5 mt-1 text-green-600 shrink-0" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd"
                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                    clip-rule="evenodd" />
                </svg>
                <div><strong class="font-semibold">¡Éxito!</strong>
                  <%= success %>
                </div>
              </div>
              <% } %>
                // ...existing code...
                <h:form styleClass="space-y-5">
                  <div>
                    <h:outputLabel for="usuario" value="Usuario" styleClass="block text-sm font-medium text-gray-700" />
                    <h:inputText id="usuario" value="#{loginBean.usuario}" required="true"
                      styleClass="w-full mt-1 p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-600" />
                  </div>

                  <div>
                    <h:outputLabel for="contrasena" value="Contraseña"
                      styleClass="block text-sm font-medium text-gray-700" />
                    <h:inputSecret id="contrasena" value="#{loginBean.contrasena}" required="true"
                      styleClass="w-full mt-1 p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-600" />
                  </div>

                  <h:commandButton value="Ingresar" action="#{loginBean.validarLogin}"
                    styleClass="w-full bg-purple-700 hover:bg-purple-800 text-white font-bold py-2 px-4 rounded-lg transition duration-200" />
                </h:form>
                // ...existing code...

                <p class="mt-4 text-sm text-center text-gray-500">Solo personal autorizado del hotel</p>
  </div>

</body>

</html>