package org.control.tag

import org.control.User

/**
 * Tag
 * A domain class describes the data object and it's mapping to the database
 */
class Tag {

    /* Default (injected) attributes of GORM */
//	Long	id
//    String      tagId
//    Long	    version
    String      codigoTag
    String      epc
    String      memoriaUsuario
    String      descripcion
    EstadoTag   estado

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

	static belongsTo	= [modelo: ModeloTag, usuario: User]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        modelo          blank: false, nullable: false
        epc             blank: false, nullable: false
        codigoTag       blank: true, nullable: true, unique: true
        memoriaUsuario  blank: true, nullable: true, maxSize: 10000
        estado          blank: false, nullable: false
        descripcion     blank: true, nullable: true, maxSize: 10000
        usuario         blank: true, nullable: true
        lastUpdated     display: true, editable: false
        dateCreated     display: true, editable: false
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${modelo.nombre+' - '+epc}";
	}
}
