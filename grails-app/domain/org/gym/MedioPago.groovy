package org.gym

class MedioPago {
    String nombre
    String descripcion

    static constraints = {
        nombre blank: false
    }

    String toString() { return nombre }

}
