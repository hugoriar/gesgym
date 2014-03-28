package org.gym.ventas

class Producto {
//    String  sku
    String  nombre
    Integer precioBase
    Integer precioMayorista
    Float   peso
//    String  codigoBarras
    String  descripcionBreve
    String  descripcion
    Boolean gestionarStock = false
    Boolean venderConStockCero = true
    Boolean publicado = true
    Boolean destacado = false
//    Categoria categoria

    static hasMany = [descuentosProducto: DescuentoProducto, detallesBoleta: Detalle, proveedores: Proveedor, variantes: Variante, fotosProducto: FotoProducto, categorias: Categoria]
    static mappedBy = [descuentosProducto:"producto"]

    static belongsTo = [Categoria, Marca, Proveedor]

    static constraints = {
//        sku             blank: true, nullable: true, unique: true
        nombre          blank: false, nullable: false, size: 5..50
//        marca           blank: true, nullable: true
        precioBase      blank: false, nullable: false, min: 0, max: 9999999
        precioMayorista blank: true, nullable: true, min: 0, max: 9999999
        peso            blank: true, nullable: true
//        codigoBarras    blank: true, nullable: true, unique: true
        descripcionBreve blank: true, nullable: true, maxSize: 1500
        descripcion     blank: true, nullable: true, maxSize: 1500
        gestionarStock  blank: false, nullable: false
        venderConStockCero blank: false, nullable: false
        publicado       blank: false, nullable: false
        destacado       blank: false, nullable: false
    }


/*
    List discounts() {
        return descuentosProducto.collect {it.descuento}
    }

    List addToDiscounts(Descuento discount) {
        DescuentoProducto.link(this, discount)
        return discounts()
    }

    List removeFromDiscounts(Descuento discount) {
        DescuentoProducto.unlink(this, discount)
        return discounts()
    }
*/

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${nombre}"
    }
}
