package org.gym.ventas

import org.gym.Empresa
import org.gym.User

/**
 * Proveedor
 * A domain class describes the data object and it's mapping to the database
 */
class Proveedor extends Empresa{

    /* Default (injected) attributes of GORM */
    String  descripcion
    Integer rut
    Character dv
    byte[]  logo
    String  email
    Date	dateCreated
    Date	lastUpdated
    User    contacto

	static hasMany		= [productos: Producto, variantesProductos: Variante]	// tells GORM to associate other domain objects for a 1-n or n-m mapping

    static mapping = {
    }

    static constraints = {
        descripcion blank: true, nullable: true, maxSize: 1500
        id          display: true, editable: false
        version     display: true, editable: false
        rut         blank: false, nullable: false, unique: true, size: 7..8
        dv          blank: false, nullable: false
        logo        blank: false, nullable: true, maxSize: 1638400 /* 1600K */
        email       blank: true, nullable: true, email: true
        contacto    blank: false, nullable: false
        lastUpdated display: true, editable: false
        dateCreated display: true, editable: false
    }

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${nombreEmpresa}";
	}
}
