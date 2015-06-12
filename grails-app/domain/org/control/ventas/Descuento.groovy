package org.control.ventas

import org.control.User

class Descuento {
    String codigo
    String tipoDescuento
    Date fechaInicio
    Date fechaFin
    String descripcion

/*    Producto product
    Client client
    Categoria category
    SubCategoria subCategory*/

    static hasMany = [descuentosProducto: DescuentoProducto, descuentosVariante: DescuentoVariante, descuentosCliente: DescuentoCliente, descuentosCategoria: DescuentoCategoria, descuentosSubCategoria: DescuentoSubCategoria]
    static mappedBy = [descuentosProducto:"descuento", descuentosVariante:"descuento", descuentosCliente:"descuento", descuentosCategoria:"descuento", descuentosSubCategoria:"descuento"]

    static constraints = {
        codigo (blank: false, nullable: false, size: 2..10, unique: true)
        tipoDescuento (blank: false, nullable: false, size: 5..50)
        descripcion blank: true, nullable: true, maxSize: 1500
        /*product(nullable: true)
        client(nullable: true)
        category(nullable: true)
        subCategory(nullable: true)*/
    }


    /*PRODUCTOS*/

    List products() {
        return descuentosProducto.collect{it.producto}
    }

    List addToProducts(Producto product) {
        DescuentoProducto.link(product, this)
        return products()
    }

    List removeFromDiscount(Producto product) {
        DescuentoProducto.unlink(product, this)
        return products()
    }


    /*VARIANTES*/

    List variantes() {
        return descuentosVariante.collect{it.variante}
    }

    List addToVariantes(Producto variante) {
        DescuentoVariante.link(variante, this)
        return variantes()
    }

    List removeFromDiscount(Variante variante) {
        DescuentoVariante.unlink(variante, this)
        return variantes()
    }


    /*CLIENTES*/

    List clients() {
        return descuentosCliente.collect{it.cliente}
    }

    List addToClient(User client) {
        DescuentoCliente.link(client, this)
        return clients()
    }

    List removeFromDiscount(User client) {
        DescuentoCliente.unlink(client, this)
        return clients()
    }


    /*CATEGORIAS*/

    List categories() {
        return descuentosCategoria.collect{it.categoria}
    }

    List addToCategory(Categoria category) {
        DescuentoCategoria.link(category, this)
        return categories()
    }

    List removeFromDiscount(Categoria category) {
        DescuentoCategoria.unlink(category, this)
        return categories()
    }


    /*SUB CATEGORIAS*/

    List subCategories() {
        return descuentosSubCategoria.collect{it.subCategoria}
    }

    List addToSubCategory(SubCategoria subCategory) {
        DescuentoSubCategoria.link(subCategory, this)
        return subCategories()
    }

    List removeFromDiscount(SubCategoria subCategory) {
        DescuentoSubCategoria.unlink(subCategory, this)
        return subCategories()
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${codigo}"
    }
}
