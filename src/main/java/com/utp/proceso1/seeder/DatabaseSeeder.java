package com.utp.proceso1.seeder;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.utp.proceso1.dao.AdministradorDAO;
import com.utp.proceso1.dao.ContactoDAO;
import com.utp.proceso1.dao.HabitacionDAO;
import com.utp.proceso1.dao.TipoHabitacionDAO;
import com.utp.proceso1.modelo.Administrador;
import com.utp.proceso1.modelo.Contacto;
import com.utp.proceso1.modelo.Habitacion;
import com.utp.proceso1.modelo.TipoHabitacion;
import com.utp.proceso1.utilidades.EnumHotel.estadoHabitacion;
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
        crearTiposHabitacion();
        crearHabitaciones();

        System.out.println("Seeder completado");
    }

    private void crearUsuarios() {
        AdministradorDAO administradorDAO = new AdministradorDAO();

        List<Administrador> administradores = List.of(
                new Administrador("admin", "admin", "Naruto Uzumaki"),
                new Administrador("user", "user", "Sasuke Uchiha"),
                new Administrador("guest", "guest", "Sakura Haruno"));

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
                new Contacto("Juan Pérez", "juan@example.com", 123456789, "Hola, estoy interesado en sus servicios.",
                        new Date(), estadoMensaje.NUEVO),
                new Contacto("María López", "maria@example.com", 987654321,
                        "Quisiera más información sobre el producto.", new Date(), estadoMensaje.NUEVO),
                new Contacto("Carlos García", "carlos@example.com", 456789123, "Tengo una consulta sobre mi reserva.",
                        new Date(), estadoMensaje.NUEVO),
                new Contacto("Ana Torres", "ana@example.com", 321654987, "Me gustaría saber más sobre los precios.",
                        new Date(), estadoMensaje.NUEVO),
                new Contacto("Luis Fernández", "luis@example.com", 654321987, "Quiero cancelar mi reserva.", new Date(),
                        estadoMensaje.NUEVO));

        if (contactoDAO.getContactos().size() == 0) {
            for (Contacto msg : mensajes) {
                contactoDAO.create(msg);
            }
        }

    }

    private void crearTiposHabitacion() {
        TipoHabitacionDAO tipoHabitacionDAO = new TipoHabitacionDAO();

        List<TipoHabitacion> tipos = List.of(
                new TipoHabitacion("Sencilla", "Habitación individual con cama matrimonial", 100.0, 1),
                new TipoHabitacion("Doble", "Habitación para dos personas con dos camas individuales", 150.0, 2),
                new TipoHabitacion("Suite", "Habitación de lujo con sala de estar y jacuzzi", 300.0, 3),
                new TipoHabitacion("Familiar", "Habitación amplia para familias con capacidad para cuatro personas",
                        200.0, 4),
                new TipoHabitacion("Presidencial", "Suite exclusiva con vistas panorámicas y servicios premium", 500.0,
                        5));

        for (TipoHabitacion tipo : tipos) {
            TipoHabitacion existingTipo = tipoHabitacionDAO.getTipoHabitacionByName(tipo.getNombre());
            if (existingTipo == null) {
                tipoHabitacionDAO.create(tipo);
            }
        }

    }

    private void crearHabitaciones() {
        HabitacionDAO habitacionDAO = new HabitacionDAO();

        List<Habitacion> habitaciones = List.of(
                new Habitacion("101", estadoHabitacion.DISPONIBLE),
                new Habitacion("102", estadoHabitacion.DISPONIBLE),
                new Habitacion("103", estadoHabitacion.DISPONIBLE),
                new Habitacion("104", estadoHabitacion.DISPONIBLE),
                new Habitacion("105", estadoHabitacion.DISPONIBLE),
                new Habitacion("106", estadoHabitacion.DISPONIBLE),
                new Habitacion("107", estadoHabitacion.DISPONIBLE),
                new Habitacion("108", estadoHabitacion.DISPONIBLE),
                new Habitacion("109", estadoHabitacion.DISPONIBLE),
                new Habitacion("110", estadoHabitacion.DISPONIBLE),
                new Habitacion("111", estadoHabitacion.DISPONIBLE),
                new Habitacion("112", estadoHabitacion.DISPONIBLE),
                new Habitacion("113", estadoHabitacion.DISPONIBLE),
                new Habitacion("114", estadoHabitacion.DISPONIBLE),
                new Habitacion("115", estadoHabitacion.DISPONIBLE),
                new Habitacion("116", estadoHabitacion.DISPONIBLE),
                new Habitacion("117", estadoHabitacion.DISPONIBLE),
                new Habitacion("118", estadoHabitacion.DISPONIBLE),
                new Habitacion("119", estadoHabitacion.DISPONIBLE),
                new Habitacion("120", estadoHabitacion.DISPONIBLE));

        for (Habitacion hab : habitaciones) {
            Habitacion existingHabitacion = habitacionDAO.getHabitacionByNumero(hab.getNumeroHabitacion());
            if (existingHabitacion == null) {
                TipoHabitacionDAO tipoHabitacionDAO = new TipoHabitacionDAO();
                List<TipoHabitacion> tipos = tipoHabitacionDAO.getTipoHabitaciones();
                if (!tipos.isEmpty()) {
                    int randomIndex = (int) (Math.random() * tipos.size());
                    hab.setTipoHabitacion(tipos.get(randomIndex));
                }
                habitacionDAO.create(hab);
            }
        }

    }
}