<%-- 
    Document   : dashboard
    Created on : 19 may 2025, 12:58:04
    Author     : josue
--%>

<div class="admin-container">
    <header class="admin-header">
        <h1>Panel de Control</h1>
        <a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-logout">Salir</a>
    </header>

    <nav class="admin-nav">
        <ul>
            <li><a href="?section=mensajes" class="${param.section eq 'mensajes' ? 'active' : ''}">Mensajes</a></li>
            <li><a href="?section=reservas" class="${param.section eq 'reservas' ? 'active' : ''}">Reservas</a></li>
        </ul>
    </nav>

    <main class="admin-main">
        <c:choose>
            <c:when test="${param.section eq 'reservas'}">
                <jsp:include page="reservas.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="mensajes.jsp"/>
            </c:otherwise>
        </c:choose>
    </main>
</div>