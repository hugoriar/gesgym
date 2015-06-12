package org.control.ventas

class DescuentoSubCategoria {

    SubCategoria subCategoria
    Descuento descuento
    String descripcion

    static constraints = {
        descripcion blank: true, nullable: true, maxSize: 1500
    }

    static DescuentoSubCategoria link(subCategory, discount) {
		def cd = DescuentoSubCategoria.findBySubCategoriaAndDescuento(subCategory, discount)
		if (!cd)
		{
			cd = new DescuentoSubCategoria()
            cd.subCategoria = subCategory
            cd.descuento = discount
			cd.save()
		}
		return cd
	}

    static void unlink(subCategory, discount) {
		def cd = DescuentoSubCategoria.findBySubCategoriaAndDescuento(subCategory, discount)
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
        return "${subCategoria} (${descuento})"
    }
}
