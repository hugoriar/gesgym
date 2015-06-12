package org.control.ventas

import org.control.User

class Venta {
    Date dateCreated
    Integer subTotal
    Integer descuento
    Integer donacion
    Integer total
    EstadoVenta estadoVenta
    User vendedor
    String descripcion

    static hasMany = [detalles : DetalleProducto]

    static constraints = {
//        date (nullable: false)
        subTotal (nullable: false)
        descuento (nullable: false)
        donacion(nullable: false)
        total (nullable: false)
        estadoVenta (nullable: false)
        vendedor(nullable: true)
        descripcion blank: true, nullable: true, maxSize: 1500
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${vendedor} (${total})"
    }
}
