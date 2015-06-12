package org.control

class EstadoMembresia {
    String estado // Congelado, Activo, Inactivo, No vigente
    String descripcion
    String color
    byte[] sonido

    static constraints = {
        estado      blank: false
        descripcion blank: false
        color       blank: true
        sonido      blank: true, nullable: true, maxSize: 1638400 /* 1600K */
    }

    String toString() { return estado }
}
