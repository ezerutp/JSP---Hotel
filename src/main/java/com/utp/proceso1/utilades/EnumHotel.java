package com.utp.proceso1.utilades;

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
}
