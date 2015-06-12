package org.control.tag

/**
 * EstadoTag
 * A domain class describes the data object and it's mapping to the database
 */
class EstadoTag {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String nombreEstado
    boolean   habilitado
    String descripcionEstado

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        nombreEstado        blank: false, nullable: false
        habilitado          blank: false, nullable: false
        descripcionEstado   blank: false, nullable: false, maxSize: 10000
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${nombreEstado +" ("+(habilitado?"habilitado":"inhabilitado")+")"}";
	}
}
