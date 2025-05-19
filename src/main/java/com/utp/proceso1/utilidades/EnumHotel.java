package com.utp.proceso1.utilidades;

public class EnumHotel {
    
    public static enum estadoHabitacion {
        DISPONIBLE,
        RESERVADA,
        OCUPADA,
        MANTENIMIENTO
    }

    public static enum estadoReserva {
        PENDIENTE,
        CHECKIN,
        CHECKOUT,
        CANCELADA
    }

    public static enum metodoPago {
        EFECTIVO,
        TARJETA,
        TRANSFERENCIA
    }

    public static enum tipoRol {
        ADMIN,
        RECEPCIONISTA
    }
}
