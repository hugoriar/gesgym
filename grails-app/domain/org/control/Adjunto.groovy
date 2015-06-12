package org.control

/**
 * Adjunto
 * A domain class describes the data object and it's mapping to the database
 */
class Adjunto {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String  nombre
    String  contentType
    Long    peso
    byte[]  archivo

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

	static belongsTo	= [email: Email]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        nombre      nullable: false, blank: false
        contentType nullable: false, blank: false
        peso        nullable: false, blank: false
        archivo     nullable: false, blank: false, maxSize: 2048 * 2048 * 2
    }

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${nombre+" ("+peso+")"}";
	}
}
