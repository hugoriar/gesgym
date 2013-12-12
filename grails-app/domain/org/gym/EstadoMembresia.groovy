package org.gym

class EstadoMembresia {
    String estado // Congelado, Activo, Inactivo, No vigente
    String descripcion

    static constraints = {
        estado blank: false
    }

    String toString() { return estado }
}
