package org.control

class Plan {
    String nombre
    Long diasMembresia
    Long diasCongelacion
    Date fechaInicioVigencia
    Date fechaTerminoVigencia
    Long valor
    String descripcion
    boolean vigente // false: obsoleto

    Date dateCreated //fecha de creación
    Date lastUpdated //ultima actualización

    static constraints = {
        nombre blank: false
        diasMembresia blank: false
        diasCongelacion blank: false
        fechaInicioVigencia blank: false
        fechaTerminoVigencia blank: false
        valor       blank: false, nullable: false
        descripcion blank: false, maxSize: 1000
        lastUpdated display: false
        dateCreated display: false
        vigente     blank: false, nullable: false
    }

    String toString() {
        /*if (vigente){
            return nombre + " (Plan vigente)"
        } else return nombre + " (Plan obsoleto)"*/
        return nombre
    }
}
