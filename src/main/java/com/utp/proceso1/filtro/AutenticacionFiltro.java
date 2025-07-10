package com.utp.proceso1.filtro;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Filtro que verifica si el usuario está autenticado antes de acceder al dashboard
 */
@WebFilter("/dashboard/*")
public class AutenticacionFiltro implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inicialización del filtro (si es necesaria)
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        // Obtener la sesión actual
        HttpSession session = httpRequest.getSession(false);
       
        // Verificar si existe una sesión y si el administrador está logueado
        boolean isLoggedIn = (session != null) && (session.getAttribute("administrador") != null);
        
        if (isLoggedIn) {
            chain.doFilter(request, response);
        } else {
            String originalURL = httpRequest.getRequestURL().toString();
            String queryString = httpRequest.getQueryString();
            
            if (queryString != null) {
                originalURL += "?" + queryString;
            }
            
            HttpSession newSession = httpRequest.getSession(true);
            newSession.setAttribute("originalURL", originalURL);
            
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/administrador?error=auth");
        }
    }

    @Override
    public void destroy() {
        // Limpieza del filtro (si es necesaria)
    }
}
