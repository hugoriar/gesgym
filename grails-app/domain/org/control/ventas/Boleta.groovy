package org.control.ventas

import org.control.Pago
import org.control.Pago
import org.control.User

/**
 * Boleta
 * A domain class describes the data object and it's mapping to the database
 */
class Boleta {

	/* Default (injected) attributes of GORM */
	Long	id
	Long	version
	Long	numeroDeBoleta

	/* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated
	
	static belongsTo	= [usuario: User]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [detalles: Detalle, pagos: Pago]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 
	
    static mapping = {
        dateCreated column: 'fecha_emision'
    }
    
	static constraints = {
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
