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

  <div class="bg-white/90 backdrop-blur-md p-8 rounded-2xl shadow-2xl w-full max-w-md border border-[rgb(212,165,116)]">
    <h2 class="text-2xl font-bold text-center text-[rgb(139,69,19)] mb-6">Ingreso de empleados</h2>
    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
      <div class="mb-4 flex items-start rounded-lg bg-red-100 p-4 text-sm text-red-700 border border-red-300 space-x-2">
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
        <form action="administrador" method="POST" class="space-y-5">
          <div>
            <label for="usuario" class="block text-sm font-medium text-gray-700">Usuario</label>
            <input type="text" id="usuario" name="usuario" required
              class="w-full mt-1 p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[rgb(139,69,19)]" />
          </div>

          <div>
            <label for="contrasena" class="block text-sm font-medium text-gray-700">Contraseña</label>
            <input type="password" id="contrasena" name="contrasena" required
              class="w-full mt-1 p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[rgb(139,69,19)]" />
          </div>

          <!-- Botones -->
          <div class="flex gap-3">
            <a href="/Proceso1/" 
               class="flex-1 bg-gray-600 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded-lg transition duration-200 text-center inline-flex items-center justify-center">
              <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
              </svg>
              Regresar
            </a>
            <button type="submit"
                    class="flex-1 bg-[rgb(139,69,19)] hover:bg-[rgb(212,165,116)] text-white font-bold py-2 px-4 rounded-lg transition duration-200">
              Ingresar
            </button>
          </div>
        </form>

        <p class="mt-4 text-sm text-center text-gray-500">Solo personal autorizado del hotel</p>
  </div>

</body>

</html>