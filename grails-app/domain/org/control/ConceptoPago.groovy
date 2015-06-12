package org.control

/**
 * ConceptoPago
 * A domain class describes the data object and it's mapping to the database
 */
class ConceptoPago {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String nombre
    String descripcion

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

	static belongsTo	= [CategoriaConceptoPago]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [pagos: Pago]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        nombre      nullable: false, blank: false, maxSize: 5000
        descripcion nullable: true, blank: true, maxSize: 5000
        pagos       nullable: true, blank: true
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
