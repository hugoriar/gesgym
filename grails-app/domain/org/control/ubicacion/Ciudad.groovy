package org.control.ubicacion

import org.control.ubicacion.Sector

class Ciudad {
    String nombre
//    String descripcion
//    static searchable = true


    static hasMany = [sectores: Sector]
    static belongsTo = [comuna: Comuna]
    static constraints = {
        nombre blank: false
    }

    String toString() { return nombre }

}
