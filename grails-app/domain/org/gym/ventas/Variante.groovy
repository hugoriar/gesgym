package org.gym.ventas

class Variante {
    String  sku
    String  nombre
    Integer precio
    Integer precioMayorista
    Float   peso
    String  codigoBarras
    String  descripcionBreve
    String  descripcion
    Boolean gestionarStock = false
    Boolean venderConStockCero = true
    Boolean publicado = true
    Boolean destacado = false

    static hasMany = [descuentosVariante: DescuentoVariante, detallesBoleta: Detalle, proveedores: Proveedor, fotosProducto: FotoProducto]
    static mappedBy = [descuentosVariante:"variante"]

    static belongsTo = [SubCategoria, Marca, Producto, Proveedor]

    static constraints = {
        sku             blank: true, nullable: true, unique: true
        nombre          blank: false, nullable: false, size: 5..50
//        marca           blank: true, nullable: true
        precio          blank: false, nullable: false, min: 0, max: 9999999
        precioMayorista blank: true, nullable: true, min: 0, max: 9999999
        peso            blank: true, nullable: true
        codigoBarras    blank: true, nullable: true, unique: true
        descripcionBreve blank: true, nullable: true, maxSize: 1500
        descripcion     blank: true, nullable: true, maxSize: 1500
        gestionarStock  blank: false, nullable: false
        venderConStockCero blank: false, nullable: false
        publicado       blank: false, nullable: false
        destacado       blank: false, nullable: false
    }


    List discounts() {
        return descuentosVariante.collect {it.descuento}
    }

    List addToDiscounts(Descuento discount) {
        DescuentoVariante.link(this, discount)
        return discounts()
    }

    List removeFromDiscounts(Descuento discount) {
        DescuentoVariante.unlink(this, discount)
        return discounts()
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${nombre} (${sku})"
    }
}
