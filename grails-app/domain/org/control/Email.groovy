package org.control

/**
 * Email
 * A domain class describes the data object and it's mapping to the database
 */
class Email {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String  de
    String  para
    String  cc
    String  bcc
    String  asunto
    String  mensaje

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [adjuntos: Adjunto]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        de          nullable: false, blank: false, email: true
        para        nullable: true, blank: true
        cc          nullable: true, blank: true
        bcc         nullable: true, blank: true
        asunto      nullable: false, blank: false
        mensaje     nullable: true, blank: true, maxSize: 10000
    }

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${asunto}";
	}
}
