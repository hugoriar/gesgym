package org.gym.ubicacion

class Sector {
    String nombre

    static belongsTo = [ciudad: Ciudad]

    static constraints = {
        nombre blank: false
    }

    String toString() { return nombre }

}
