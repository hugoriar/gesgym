package org.gym

/**
 * EstadoPromocionMatricula
 * A domain class describes the data object and it's mapping to the database
 */
class EstadoPromocionMatricula {
    String estado // Congelado, Activo, Inactivo, No vigente
    String descripcion

    static constraints = {
        estado      blank: false, nullable: false
        descripcion blank: true, nullable: true, maxSize: 1000
    }

    String toString() { return estado }
}
