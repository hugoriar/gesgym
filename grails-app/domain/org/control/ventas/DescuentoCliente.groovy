package org.control.ventas

import org.control.User

class DescuentoCliente {

    User cliente
    Descuento descuento
    String descripcion

    static DescuentoCliente link(client, discount) {
        def pd = DescuentoCliente.findByClienteAndDescuento(client, discount)
        if (!pd)
        {
            pd = new DescuentoCliente()
            pd.cliente = client
            pd.descuento = discount
            pd.save()
        }
        return pd
    }

    static void unlink(client, discount) {

        DescuentoCliente pr = null
        def pd = DescuentoCliente.findByClienteAndDescuento(client, discount)
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
        return "${cliente} (${descuento})"
    }
}
