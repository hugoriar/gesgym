package org.gym.ventas

class Categoria {

    String nombre
    String descripcion

    static hasMany   = [productos: Producto, descuentosCategoria: DescuentoCategoria, subCategorias: Categoria]
    static belongsTo = [categoriaPadre: Categoria]
    static mappedBy  = [descuentosCategoria:"categoria"]

    static constraints = {
        nombre              blank: false, nullable: false
        descripcion         blank: true, nullable: true, maxSize: 5000
        descuentosCategoria blank: true, nullable: true
        subCategorias       blank: true, nullable: true
        categoriaPadre      blank: true, nullable: true
    }

    List discounts() {
        return descuentosCategoria.collect {it.descuento}
    }

    List addToDiscounts(Descuento discount) {
        DescuentoCategoria.link(this, discount)
        return discounts()
    }

    List removeFromDiscounts(Descuento discount) {
        DescuentoCategoria.unlink(this, discount)
        return discounts()
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${nombre}"
    }
}
