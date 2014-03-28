package org.gym.ventas

/**
 * Detalle
 * A domain class describes the data object and it's mapping to the database
 */
class Detalle {

    /* Default (injected) attributes of GORM */
    Integer cantidadProducto

    /* Automatic timestamping of GORM */

	static belongsTo	= [Boleta, Producto]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	static hasMany		= [productos: Producto]	// tells GORM to associate other domain objects for a 1-n or n-m mapping

    static mapping = {
    }

    static constraints = {
        cantidadProducto nullable: false, blank: false, min: 1, max: 999
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI
//	public String toString() {
//		return "${name}";
//	}
}
