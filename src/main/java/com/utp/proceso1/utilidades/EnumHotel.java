package com.utp.proceso1.utilidades;

public class EnumHotel {
    
    public static enum estadoHabitacion {
        DISPONIBLE,
        OCUPADA
    }

    public static enum estadoReserva {
        PENDIENTE,
        CONFIRMADA,
        CANCELADA,
        COMPLETADA
    }

    public static enum estadoMensaje {
        NUEVO,
        LEIDO
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
