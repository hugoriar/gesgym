package org.gym.ventas

class DescuentoProducto {

    Descuento descuento
    Producto producto
    String descripcion


    static DescuentoProducto link(product, discount) {
        def pd = DescuentoProducto.findByProductoAndDescuento(product, discount)
        if (!pd)
        {
            pd = new DescuentoProducto()
            pd.producto = product
            pd.descuento = discount
            pd.save()
        }
        return pd
    }

    static void unlink(product, discount) {
        def pd = DescuentoProducto.findByProductoAndDescuento(product, discount)
        if (pd)
        {
            pd.delete(flush: true)
        }
    }


    static constraints = {
        descripcion blank: true, nullable: true, maxSize: 1500
    }


    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${producto} (${descuento})"
    }
}
