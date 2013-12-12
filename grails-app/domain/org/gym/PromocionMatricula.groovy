package org.gym

/**
 * PromocionMatricula
 * A domain class describes the data object and it's mapping to the database
 */
class PromocionMatricula {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String nombre
    String descripcion
    Date fechaInicioVigencia
    Date fechaTerminoVigencia
//    EstadoPromocionMatricula estado
    boolean vigente // false: obsoleto

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        nombre               blank: false, nullable: false
        fechaInicioVigencia  blank: false, nullable: false
        fechaTerminoVigencia blank: false, nullable: false
        descripcion          blank: true, nullable: true, maxSize: 1000
        lastUpdated          display: true
        dateCreated          display: true
        vigente              blank: false, nullable: false
    }

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
        if (vigente){
            return nombre + " (Promoción vigente del " +fechaInicioVigencia+" al " + fechaTerminoVigencia+")"
        } else return nombre + " (Promoción finalizada)"
    }
}
