package org.gym.ventas

/**
 * DescuentoVariante
 * A domain class describes the data object and it's mapping to the database
 */
class DescuentoVariante {

    Descuento descuento
    Variante variante
    String descripcion


    static DescuentoVariante link(variante, discount) {
        def pd = DescuentoVariante.findByVarianteAndDescuento(variante, discount)
        if (!pd)
        {
            pd = new DescuentoVariante()
            pd.variante = variante
            pd.descuento = discount
            pd.save()
        }
        return pd
    }

    static void unlink(variante, discount) {
        def pd = DescuentoVariante.findByVarianteAndDescuento(variante, discount)
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
        return "${variante} (${descuento})"
    }
}
