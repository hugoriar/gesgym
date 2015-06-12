package org.control.ventas

class DetalleProducto {
    Producto producto
    Float cantidad
    Float precioUnitario
    String descripcion

    static belongsTo = [venta: Venta]

    static constraints = {
        cantidad (nullable: false)
        precioUnitario (nullable: false)
        producto(nullable: false)
        descripcion blank: true, nullable: true, maxSize: 1500
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${producto} (${cantidad})"
    }
}
