package org.gym.ventas

class DescuentoCategoria {

    Categoria categoria
    Descuento descuento
    String descripcion

    static constraints = {
        descripcion blank: true, nullable: true, maxSize: 1500
    }

    static DescuentoCategoria link(category, discount) {
        def cd = DescuentoCategoria.findByCategoriaAndDescuento(category, discount)
        if (!cd)
        {
            cd = new DescuentoCategoria()
            cd.categoria = category
            cd.descuento = discount
            cd.save()
        }
        return cd
    }

    static void unlink(category, discount) {
        def cd = DescuentoCategoria.findByCategoriaAndDescuento(category, discount)
        if (cd)
        {
            cd.delete(flush: true)
        }
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${categoria} (${descuento})"
    }
}
