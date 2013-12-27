package org.gym

class Pago {
    Integer monto
    MedioPago medioDePago
    Date fecha
    Integer numeroDeBoleta

    Date dateCreated //fecha de creación
    Date lastUpdated //ultima actualización

    static belongsTo = [HistorialMembresias, Matricula]
    static hasMany = [cheque: Cheque]

    static constraints = {
        monto           blank: true, nullable: true
        medioDePago     blank: true, nullable: true
        fecha           blank: true, nullable: true
        numeroDeBoleta  blank: true, nullable: true
        lastUpdated     display: false
        dateCreated     display: false
    }

    String toString() { return "\$" + monto + " ("+ medioDePago?.nombre + ", fecha: " + fecha?.dateString + ", boleta: " + numeroDeBoleta +")"}

}
