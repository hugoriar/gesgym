package org.gym.ventas

class SubCategoria {

    String nombre
    String descripcion

    static belongsTo = [categoria: Categoria]
    static hasMany = [productos: Producto, descuentosSubCategoria: DescuentoSubCategoria]
    static mappedBy = [descuentosSubCategoria:"subCategoria"]

    static constraints = {
        descripcion blank: true, nullable: true, maxSize: 1500
    }

    List discounts() {
        return descuentosSubCategoria.collect {it.descuento}
    }

    List addToDiscounts(Descuento discount) {
        DescuentoSubCategoria.link(this, discount)
        return discounts()
    }

    List removeFromDiscounts(Descuento discount) {
        DescuentoSubCategoria.unlink(this, discount)
        return discounts()
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${nombre} (${codigo})"
    }
}
