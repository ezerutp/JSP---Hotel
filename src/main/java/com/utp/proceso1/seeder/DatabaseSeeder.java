package com.utp.proceso1.seeder;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.utp.proceso1.dao.AdministradorDAO;
import com.utp.proceso1.dao.ContactoDAO;
import com.utp.proceso1.modelo.Administrador;
import com.utp.proceso1.modelo.Contacto;
import com.utp.proceso1.utilidades.EnumHotel.estadoMensaje;

@WebListener
public class DatabaseSeeder implements ServletContextListener {
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Iniciando seeder de datos...");
        try {
            crearDatosPrueba();
        } catch (Exception e) {
            System.err.println("Error al ejecutar seeder: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup si es necesario
    }
    
    private void crearDatosPrueba() {
        crearUsuarios();
        crearMensajesContacto();
        
        System.out.println("Seeder completado");
    }
    
    private void crearUsuarios() {
        AdministradorDAO administradorDAO = new AdministradorDAO();

        List<Administrador> administradores =  List.of(
            new Administrador("admin", "admin", "Naruto Uzumaki"),
            new Administrador("user", "user", "Sasuke Uchiha"),
            new Administrador("guest", "guest", "Sakura Haruno")
        );

        for (Administrador adm : administradores) {
            Administrador existingAdmin = administradorDAO.getAdministradorByUsuario(adm.getUsuario());
            if (existingAdmin == null) {
                administradorDAO.create(adm);
            }
        }

    }
    
    private void crearMensajesContacto() {
        ContactoDAO contactoDAO = new ContactoDAO();

        List<Contacto> mensajes = List.of(
            new Contacto("Juan Pérez", "juan@example.com", 123456789, "Hola, estoy interesado en sus servicios.", new Date(), estadoMensaje.NUEVO),
            new Contacto("María López", "maria@example.com", 987654321, "Quisiera más información sobre el producto.", new Date(), estadoMensaje.NUEVO),
            new Contacto("Carlos García", "carlos@example.com", 456789123, "Tengo una consulta sobre mi reserva.", new Date(), estadoMensaje.NUEVO),
            new Contacto("Ana Torres", "ana@example.com", 321654987, "Me gustaría saber más sobre los precios.", new Date(), estadoMensaje.NUEVO),
            new Contacto("Luis Fernández", "luis@example.com", 654321987, "Quiero cancelar mi reserva.", new Date(), estadoMensaje.NUEVO)
        );

        if (contactoDAO.getContactos().size() == 0) {
            for (Contacto msg : mensajes) {
                contactoDAO.create(msg);
            }
        }

    }
}